/* jQuery.evolutionLike plugin */
(function($){
	var eventName = 'ui.like',
		popupsInited = false,
		init = function(context) {
			// initial pre-templating
			var initialContent = context.settings.format;
			if(context.hasCount) {
				initialContent = initialContent.replace(/\{count\}/gi, '<span class="like-count who-likes"></span>');
			}
			if(context.hasToggle) {
				initialContent = initialContent.replace(/\{toggle\}/gi, '<span class="like-toggle"><a href="#" class="internal-link"></a></span>');
			}
			if(context.hasMessage) {
				initialContent = initialContent.replace(/\{message\}/gi, '<span class="like-message"></span>');
			}

			context.element.html(initialContent);

			// apply template and grab ui elements from templated control
			if(context.hasCount) {
				context.countWrapper = context.element.find('span.like-count');
				context.countWrapper.html(context.settings.initialCount);
			}
			if(context.hasToggle) {
				context.toggleLink = context.element.find('span.like-toggle a');
				context.toggleLink.evolutionToggleLink({
					onHtml: '<span></span>' + context.settings.unlikeText,
					offHtml: '<span></span>' + context.settings.likeText,
					onTitle: '',
					offTitle: '',
					processingHtml: '<span></span>...',
					changeState: function(val) {
						toggleLike(val, context);
					},
					onCssClass: 'internal-link like-on',
					offCssClass: 'internal-link like-off',
					processingCssClass: 'internal-link processing',
					val: (context.settings.initialState === 'true')
				});
			}
			if(context.hasMessage) {
				context.messageWrapper = context.element.find('span.like-message');
				context.messageWrapper.html(context.settings.initialMessage);
			}
		},
		updateLike = function(context, count, isNew) {
			var message = '';
			if(count.count > 0) {
				var offset = 0;
				if(isNew) {
					if(count.count === 1) {
						message = context.settings.whoLikesAccessingText;
					} else if(count.count === 2) {
						message = context.settings.whoLikesAccessingTwoText;
						offset = -1;
					} else if(count.count > 2) {
						message = context.settings.whoLikesAccessingMultipleText;
						offset = -1;
					}
				} else {
					if(count.count === 1) {
						message = context.settings.whoLikesOtherText;
					} else if(count.count === 2) {
						offset = -1;
						message = context.settings.whoLikesOtherTwoText;
					} else if(count.count > 2) {
						offset = -1;
						message = context.settings.whoLikesOtherMultipleText;
					}
				}
				message = message.replace(/\{count\}/gi, count.count + offset);
				message = message.replace(/\{user_profile_url\}/gi, count.latestLike.User.ProfileUrl);
				message = message.replace(/\{user_display_name\}/gi, count.latestLike.User.DisplayName);
			}

			$.telligent.evolution.messaging.publish(eventName, {
				contentId: context.settings.contentId,
				contentTypeId: context.settings.contentTypeId,
				typeId: context.settings.typeId,
				count: count.count,
				liked: isNew,
				message: message
			});
		},
		toggleLike = function(val, context) {
			if(val) {
				// like
				context.settings.onLike(context.settings.contentId, context.settings.contentTypeId, context.settings.typeId, function(data){
					updateLike(context, data, true);
				});
			} else {
				// unlike
				context.settings.onUnlike(context.settings.contentId, context.settings.contentTypeId, context.settings.typeId, function(data){
					updateLike(context, data, false);
				});
			}
		},
		subscribeToUpdates = function(context) {
			$.telligent.evolution.messaging.subscribe(eventName, function(data) {
				if(data.contentId === context.settings.contentId
					&& data.contentTypeId === context.settings.contentTypeId
					&& data.typeId === context.settings.typeId)
				{
					if(context.hasToggle) {
						context.toggleLink.evolutionToggleLink('val', data.liked);
					}
					if(context.hasCount) {
						context.countWrapper.html(data.count);
					}
					if(context.hasMessage) {
						context.messageWrapper.html(data.message);
					}
				}
			});
		};

	$.fn.evolutionLike = function(options) {
		var settings = $.extend({}, $.fn.evolutionLike.defaults, options || {});
		return this.each(function(){
			var context = {
				element: $(this),
				settings: settings,
				hasCount: settings.format.indexOf('{count}') >= 0,
				hasToggle: settings.format.indexOf('{toggle}') >= 0,
				hasMessage: settings.format.indexOf('{message}') >= 0
			};
			init(context);
			subscribeToUpdates(context);
		});
	};

	$.fn.evolutionLike.delegatePopups = function(options) {
		if(popupsInited) { return; }
		popupsInited = true;

		var settings = $.extend({}, $.fn.evolutionLike.defaults, options || {}),
			likersTemplate = $.telligent.evolution.template.compile(settings.likersTemplate),
			likersPopupTemplate = $.telligent.evolution.template.compile(settings.likersPopupTemplate),
			getOptions = function(elm) {
				return settings.onOptions($(elm).closest(settings.delegatedSelector));
			},
			getLikers = function(options, pageIndex, complete) {
				settings.onList(options.contentId, options.contentTypeId, options.typeId, function(data){
					complete(data);
				}, options.pageSize, pageIndex);
			},
			showPopup = function(data, elm) {
				var currentPageIndex = 0,
					likersContent = $(likersTemplate(data)),
					likersPopup = $(likersPopupTemplate({
						likers: likersContent,
						hasMorePages: data.hasMorePages,
						showMoreText: settings.modalShowMoreText
					})),
					likersList = likersPopup.find('ul'),
					showMoreLink = likersPopup.find('.show-more'),
					queryOptions = getOptions(elm);

				likersList.html(likersContent);
				showMoreLink.on('click', function(e){
					e.preventDefault();
					currentPageIndex++;
					getLikers(queryOptions, currentPageIndex, function(data){
						likersList.append(likersTemplate(data));
						if(data.hasMorePages) {
							showMoreLink.show();
						} else {
							showMoreLink.hide();
						}
						var height = likersList[0].scrollHeight;
  						likersList.scrollTop(height);
					});
				});

				$.glowModal({
					title: settings.modalTitleText,
					html: likersPopup,
					width: 450
				});
			},
			delegateEvents = function() {
				$(settings.containerSelector).on('click', settings.delegatedSelector + ' .who-likes', function(e) {
					var elm = $(this);
					var queryOptions = getOptions(elm);
					getLikers(queryOptions, 0, function(data){
						showPopup(data, elm);
					});
				});
			};

		delegateEvents();
	};
	$.fn.evolutionLike.defaults = {
		// evolutionlike defaults
		contentId: '',
		contentTypeId: '',
		typeId: '',
		initialState: false,
		initialMessage: '',
		initialCount: 0,
		format: '',
		onLike: function(contentId, contentTypeId, typeId, complete) {},
		onUnlike: function(contentId, contentTypeId, typeId, complete) {},
		likeText: 'Like',
		unlikeText: 'Unlike',
		whoLikesOtherText: '<a href="{user_profile_url}" class="internal-link view-user-profile">{user_display_name}</a> likes this',
		whoLikesOtherTwoText: '<a href="{user_profile_url}" class="internal-link view-user-profile">{user_display_name}</a> <span class="who-likes">and 1 other</span> like this.',
		whoLikesOtherMultipleText: '<a href="{user_profile_url}" class="internal-link view-user-profile">{user_display_name}</a> and <span class="who-likes">{count} others</span> like this.',
		whoLikesAccessingText: 'You like this',
		whoLikesAccessingTwoText: 'You and <span class="who-likes">1 other</span> like this',
		whoLikesAccessingMultipleText: 'You and <span class="who-likes">{count} others</span> like this',
		modalTitleText: 'People who like this',
		modalShowMoreText: 'Show more',
		// evolutionlike.delegatepopups defaults
		onList: function(contentId, contentTypeId, typeId, complete) {},
		onOptions: function(elm) {},
		containerSelector: '',
		delegatedSelector: '',
		delay: 500,
        likersTemplate: '' +
            ' <% foreach(likers, function(liker) { %> ' +
            '     <li class="content-item"> ' +
            '         <div class="full-post-header"></div> ' +
            '         <div class="full-post"> ' +
            '             <span class="avatar"> ' +
            '                 <a href="<%: liker.profileUrl %>"  class="internal-link view-user-profile"> ' +
            '                     <img src="<%: liker.avatarUrl %>" alt="" border="0" width="32" height="32" style="width:32px;height:32px" /> ' +
            '                 </a> ' +
            '             </span> ' +
            '             <span class="user-name"> ' +
            '                 <a href="<%: liker.profileUrl %>" class="internal-link view-user-profile"><%= liker.displayName %></a> ' +
            '             </span> ' +
            '         </div> ' +
            '         <div class="full-post-footer"></div> ' +
            '     </li> ' +
            ' <% }); %> ',
        likersPopupTemplate: '' +
            ' <div class="who-likes-list"> ' +
            '     <div class="content-list-header"></div> ' +
            '     <ul class="content-list"><%= likers %></ul> ' +
            '     <div class="content-list-footer"></div> ' +
            '     <% if(hasMorePages) { %> ' +
            '         <a href="#" class="show-more"><%= showMoreText %></a>' +
            '     <% } %> ' +
            ' </div> '
	};

}(jQuery));