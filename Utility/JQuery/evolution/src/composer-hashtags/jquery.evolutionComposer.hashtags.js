(function($, global){

	// hash tag composer plugin
	var hashTagComposer = (function(){
		var ignored = '-_~`!@#$%^&*()=+{[}]\\|;:\'",<.>/? ', // escapes on these characters
			ignoredRegex = null,
			ignoredCharacterCodes = {},
			isActiveKey = '_hashtag_composer_active',
			getTaggedTags = function(context) {
				var taggedTags = context.data('_tagged_tags');
				if(typeof taggedTags === 'undefined' || taggedTags === null) {
					taggedTags = [];
					context.data('_tagged_tags', taggedTags);
				}
				return taggedTags;
			},
			createAdHocTaggable = function(rawTagText) {
				return {
					decodedName: rawTagText,
					name: rawTagText,
					token: '[tag:' + rawTagText.substr(1) + ']'
				}
			},
			setCursorPosition = function (context, position) {
				var textarea = context.input.get(0);
			    if(textarea.setSelectionRange) {
			        textarea.setSelectionRange(position, position);
			    } else if(textarea.createTextRange) {
			        var range = textarea.createTextRange();
			        range.collapse(true);
			        range.moveEnd('character', pos);
			        range.moveStart('character', pos);
			        range.select();
			    }
			},
			addTag = function(context, tag, replaceCurrentWord, appendSpace, release) {
				// record what was tagged for pre-processing later
				var taggedTags = getTaggedTags(context);
				taggedTags[taggedTags.length] = tag;
				// replace #text with tag's name
				if(replaceCurrentWord) {
					var currentWord = context.currentWord();
					context.replace(currentWord.start, currentWord.stop + 1, tag.decodedName + (appendSpace ? ' ' : ''));
				}

				var newPosition = (currentWord.start + (tag.decodedName + (appendSpace ? ' ' : '')).length);
				setCursorPosition(context, newPosition);

				// highlight tags
				updateHighlights(context);

				context.data(isActiveKey, false);
				TagSelector.hide();
				context.input.focus();

				// release back to input (and hide selector)
				if(release) {
					context.release();
				}
			},
			updateHighlights = function(context) {
				var hashTags = getTaggedTags(context).reverse(),
					currentValue = context.val();
				context.clearHighlights(context.settings.highlightClass || hashTagHighlightClass);
				var tagStarts = {};
				$.each(hashTags, function(i, hashTag) {
					if(hashTag && hashTag.decodedName !== null && hashTag.decodedName.length > 0) {
						var nameStart = currentValue.indexOf(hashTag.decodedName);
						if(nameStart < 0 || tagStarts[nameStart]) {
							hashTags.splice(i,1);
						} else {
							while(nameStart >= 0) {
								context.addHighlight({
									start: nameStart,
									stop: hashTag.decodedName.length + nameStart,
									className: context.settings.highlightClass || hashTagHighlightClass
								});
								tagStarts[nameStart] = true;
								nameStart = currentValue.indexOf(hashTag.decodedName, nameStart + 1);
							}
						}
					}
				});
				context.renderHighlights();
			},
			wordIsTaggable = function(word) {
				return word.length > 2 && word.indexOf('#') === 0 && !ignoredRegex.test(word.substr(1)) && isNaN(parseInt(word[1], 10));
			},
			hashTagHighlightClass = 'composer-hashtag-highlight', // local ref to passed class for highlighting hashtags
			listTags = function() {}, // local ref to passed fn for listing tags
			listTagsTimeout = null;

		// capture ignored character codes
		ignoredRegex = new RegExp('[' + ignored.replace(']','\\]') + ']','i');
		for(var i = 0; i < ignored.length; i++) {
			ignoredCharacterCodes[ignored.charCodeAt(i)] = true;
		}

		var api = {
			init: function(context) {
				listTags = context.settings.onTagList || $.fn.evolutionComposer.plugins.hashtags.defaults.onTagList;
				context.input.bind(TagSelector.selectedEventName, function(){
					addTag(context, TagSelector.selection(), true, true, true);
				});
				context.input.bind('blur', function(){
					setTimeout(function(){
						context.release();
					}, 500);
				});
			},
			onTransform: function(context) {
				updateHighlights(context);
			},
			shouldActivate: function(context) {
				return wordIsTaggable(context.currentWord().value);
			},
			onActivate: function(context) {
				context.data(isActiveKey, true);
				$(document).bind('click.ui-composer-hashtags',function(){
					context.release();
					$(document).unbind('.ui-composer-hashtags');
				});
			},
			onDeactivate: function(context) {
				var currentWord = context.currentWord();
				if(wordIsTaggable(currentWord.value)) {
					addTag(context, createAdHocTaggable(currentWord.value), true, false, false);
				}
				context.data(isActiveKey, false);
				TagSelector.hide();
				context.input.focus();
			},
			val: function(value, context) {
				var hashTags = getTaggedTags(context);
				$.each(hashTags, function(i, hashTag) {
					value = value.replace(new RegExp($.telligent.evolution.regex.encode(hashTag.decodedName),'g'), hashTag.token);
				});
				return value;
			},
			onkeydown: function(context, e) {
				if(e.which === 27 || e.which === 32) {    // esc or space exits tag selection
					context.release();
				} else if(e.which === 13 || e.which === 9) { // enter or tab captures selection
					var taggable = TagSelector.selection();
					if(!taggable) {
						context.release();
					} else {
						addTag(context, taggable, true, true, true);
						return false;
					}
				} else if(e.which === 38) { // up navigates tags
					TagSelector.moveHighlightUp();
					return false;
				} else if(e.which === 40) { // down navigates tags
					TagSelector.moveHighlightDown();
					return false;
				}
				return true;
			},
			onkeypress: function(context, e) {
				// release on ignored characters
				if(typeof ignoredCharacterCodes[e.which] !== 'undefined') {
					context.release();
				}
				return true;
			},
			oninput: function(context, e) {
				if(!wordIsTaggable(context.currentWord().value)) {
					context.release();
					return true;
				}

				clearTimeout(listTagsTimeout);
				TagSelector.loading(context.input);
				listTagsTimeout = setTimeout(function(){
					var query = context.currentWord().value;
					if(!wordIsTaggable(query)) {
						context.release();
					} else if(query.length >= 2) {
						listTags(query.substr(1), function(taggables) {
							// if no longer active at this point, ignore results
							if(!context.data(isActiveKey))
								return;

							if(taggables) {
								taggables = $.map(taggables, function(tag) {
									return {
										name: tag.name,
										token: tag.token,
										decodedName: $.telligent.evolution.html.decode(tag.name)
									}
								});
							}

							var currentValue = context.currentWord().value;
							if (currentValue == query &&
								wordIsTaggable(currentValue) &&
								taggables !== null &&
								taggables.length > 0)
							{
								TagSelector.show(context.input, taggables, query);
							} else {
								TagSelector.hide();
							}
						});
					}
				}, 500);

				return true;
			}
		};

		return api;
	}());

	// encapsulated ui for displaying tags and selecting, used by the composer
	var TagSelector = (function(){
		var element = null,
			highlightClass  = 'highlight',
			tagDataKey = 'tagData',
			availableTags = {},
			attachedInput = null,
			loading = null,
			init = function(input) {
				attachedInput = input;

				if(element !== null) {
					return;
				}

				element = $('<ul class="composer-hashtag-selector"></ul>').hide().appendTo($('body'));
				loading = $('<li class="loading">...</li>');

				var loadingHighlightIndex = 0,
					loadingHtml = [
						'<strong>&bull;</strong>&bull;&bull;',
						'&bull;<strong>&bull;</strong>&bull;',
						'&bull;&bull;<strong>&bull;</strong>'
					],
					loadingHtmlInterval;
				loadingHtmlInterval = setInterval(function(){
					loadingHighlightIndex = loadingHighlightIndex+1;
					if(loadingHighlightIndex === 3)
						loadingHighlightIndex = 0;
					loading.get(0).innerHTML = loadingHtml[loadingHighlightIndex];
				}, 175);

				element.delegate('li','click',function(e){
					if(attachedInput !== null) {
						element.find('li.' + highlightClass).removeClass(highlightClass);
						$(this).addClass(highlightClass);
						attachedInput.trigger(api.selectedEventName);
					}
				});
			},
			reposition = function() {
				if(attachedInput !== null) {
					var offset = attachedInput.offset(), input = $(attachedInput);
					element.css({
						width: input.outerWidth() - 2,
						top: offset.top + input.outerHeight() - 1,
						left: offset.left
					});
				}
			};

		var api = {
			selectedEventName: 'HASHTAG_SELECTED',
			show: function(input, tags, query) {
				init(input);
				reposition();
				element.hide().empty();
				var queryRegex = new RegExp($.telligent.evolution.regex.encode($.telligent.evolution.html.encode(query)),'i');
				$.each(tags, function(i, tag){
					var match = tag.name.match(queryRegex);
					var tagListItem = match !== null
						? $('<li>'+tag.name.replace(queryRegex, '<strong>' + match[0] + '</strong>')+'</li>')
						: $('<li>'+tag.name+'</li>');
					tagListItem.data(tagDataKey, tag);
					element.append(tagListItem);
				});
				element.show();
			},
			hide: function() {
				if(element !== null) {
					element.hide().empty();
				}
			},
			loading: function(input) {
				init(input);
				reposition();
				element.hide().empty().append(loading).show();
			},
			moveHighlightUp: function() {
				var choices = element.find('li');
				if(choices.length === 0) {
					return;
				}
				// find currently selected
				var highlightIndex = choices.length;
				$.each(choices, function(i, choice){
					if($(choice).hasClass(highlightClass)) {
						highlightIndex = i;
						$(choice).removeClass(highlightClass);
					}
				});
				// if past the end, loop to the top
				if(highlightIndex - 1 < 0) {
					highlightIndex = choices.length;
				}
				// highlight new choice
				$(choices.get(highlightIndex - 1)).addClass(highlightClass);
			},
			moveHighlightDown: function() {
				var choices = element.find('li');
				if(choices.length === 0) {
					return;
				}
				// find currently selected
				var highlightIndex = -1;
				$.each(choices, function(i, choice){
					if($(choice).hasClass(highlightClass)) {
						highlightIndex = i;
						$(choice).removeClass(highlightClass);
					}
				});
				// if past the end, loop to the top
				if(highlightIndex + 1 >= choices.length) {
					highlightIndex = -1;
				}
				// highlight new choice
				$(choices.get(highlightIndex + 1)).addClass(highlightClass);
			},
			selection: function() {
				var choices = element.find('li');
				if(choices.length === 0) {
					return null;
				}
				var currentHighlight = choices.filter('li.' + highlightClass);
				if(currentHighlight !== null && currentHighlight.length > 0) {
					return currentHighlight.data(tagDataKey);
				} else {
					// return first hashTag
					return $(choices.get(0)).data(tagDataKey);
				}
			}
		}

		return api;
	}());

	$.fn.evolutionComposer.plugins.hashtags = hashTagComposer;
	$.fn.evolutionComposer.plugins.hashtags.defaults = {
		onTagList: function(query, complete) {
			$.telligent.evolution.get({
				url: $.telligent.evolution.site.getBaseUrl() + 'api.ashx/v2/hashtags.json?IncludeFields=Token,PreviewHtml',
				data: {
					QueryText: query,
					PageSize: 5
				},
				cache: false,
				dataType: 'json',
				success: function(response) {
					if(response.HashTags && response.HashTags.length > 0) {
						var results = $.map(response.HashTags, function(tag) {
							return { name: tag.PreviewHtml, token: tag.Token };
						});
						complete(results);
					} else {
						complete(null);
					}
				}
			});
		}
	};

}(jQuery, window));