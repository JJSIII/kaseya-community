(function($, global){

	// mentionable composer plugin
	var mentionComposer = (function(){

		var queryCache = {},
			entryChar = '@'
			allowedSpacesKey = '_allowed_spaces',
			isActiveKey = '_hashtag_composer_active',
			caretPosition = 0,
			getMentions = function(context) {
				var mentionedMentionables = context.data('_mentioned_mentionables');
				if(typeof mentionedMentionables === 'undefined' || mentionedMentionables === null) {
					mentionedMentionables = [];
					context.data('_mentioned_mentionables', mentionedMentionables);
				}
				return mentionedMentionables;
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
			mentionMentionable = function(context, mentionable) {
				// record what was mentioned for pre-processing later
				var mentionedMentionables = getMentions(context);
				mentionedMentionables[mentionedMentionables.length] = mentionable;
				// release back to input (and hide selector)
				context.release();
				// replace @text with mentionable's name
				var currentWord = effectiveCurrentWord(context);
				context.replace(currentWord.start, currentWord.stop + 1, mentionable.decodedName + ' ');
				// highlight mentinoed mentionables
				updateHighlights(context);
				// remove any allowed spaces in current word checks
				allowedSpaces(context, 0)
				// set proper position
				setCursorPosition(context, (currentWord.start + (mentionable.decodedName + ' ').length));
			},
			updateHighlights = function(context) {
				var mentions = getMentions(context),
					currentValue = context.val();
				context.clearHighlights(context.settings.highlightClass || mentionHighlightClass);
				$.each(mentions, function(i, mention) {
					if(mention && mention.decodedName !== null && mention.decodedName.length > 0) {
						var nameStart = currentValue.indexOf(mention.decodedName);
						if(nameStart < 0) {
							mentions.splice(i,1);
						} else {
							while(nameStart >= 0) {
								context.addHighlight({
									start: nameStart,
									stop: mention.decodedName.length + nameStart,
									className: context.settings.highlightClass || mentionHighlightClass
								});
								nameStart = currentValue.indexOf(mention.decodedName, nameStart + 1);
							}
						}
					}
				});
				context.renderHighlights();
			},
			mentionHighlightClass = 'composer-mentionable-mention-highlight', // local ref to passed class for highlighting mentinos
			getMentionables = function() {}, // local ref to passed fn for listing mentionables
			getMentionablesTimeout = null,
			allowedSpaces = function(context, spaces) {
				if(typeof spaces !== 'undefined') {
					context.data('_allowed_spaces', spaces);
					return spaces;
				} else {
					var allowed = context.data('_allowed_spaces');
					return allowed || 0;
				}
			},
			effectiveCurrentWord = function(context) {
				var toCaret = context.val().substring(0, caretPosition),
					knownGoodQuery = null;
				$.each(queryCache, function(query, mentionables) {
					if(mentionables !== null && mentionables.length > 0 && toCaret.match(entryChar + $.telligent.evolution.regex.encode(query) + '$')) {
						knownGoodQuery = entryChar + query;
						return false;
					}
				});
				if(knownGoodQuery !== null) {
					var queryAt = toCaret.length - knownGoodQuery.length;
					allowedSpaces(context, knownGoodQuery.split(' ').length - 1);
					return {
						value: knownGoodQuery,
						start: queryAt,
						stop: queryAt + knownGoodQuery.length
					};
				} else {
					return context.currentWord({
						caretPosition: caretPosition,
						allowedWhiteSpaceBeforeCaret: allowedSpaces(context)
					});
				}
			};

		var api = {
			init: function(context) {
				getMentionables = context.settings.onMentionableList || $.fn.evolutionComposer.plugins.mentions.defaults.onMentionableList;
				context.input.bind(MentionSelector.selectedEventName, function(){
					mentionMentionable(context, MentionSelector.selection());
				});
				context.input.bind({
					blur: function(){
						setTimeout(function(){
							context.release();
						}, 500);
					},
					// always get a reference to the latest caret position, even when inactive, as
					// chrome returns an inaccurate position during onInput
					keydown: function() {
						caretPosition = context.caretPosition() + 1;
					}
				});
			},
			onTransform: function(context) {
				updateHighlights(context);
			},
			shouldActivate: function(context) {
				return effectiveCurrentWord(context).value.indexOf(entryChar) === 0;
			},
			onActivate: function(context) {
				context.data(isActiveKey, true);
				$(document).bind('click.mentions',function(){
					context.release();
					$(document).unbind('.mentions');
				});
			},
			onDeactivate: function(context) {
				context.data(isActiveKey, false);
				MentionSelector.hide();
				context.input.focus();
				allowedSpaces(context, 0);
			},
			val: function(value, context) {
				var mentions = getMentions(context);
				$.each(mentions, function(i, mention) {
					value = value.replace(mention.decodedName, mention.token);
				});
				return value;
			},
			onkeydown: function(context, e) {
				if(e.which === 32) { // space adds to the tracked allowed spaces, which may be ignored if no match
					allowedSpaces(context, allowedSpaces(context) + 1);
				} else if(e.which === 27) {	   // esc exits mentionable selection
					context.release();
					return false;
				} else if(e.which === 13 || e.which === 9) { // enter or tab captures selection
					var mentionable = MentionSelector.selection();
					if(!mentionable) {
						context.release();
					} else {
						mentionMentionable(context, mentionable);
					}
					return false;
				} else if(e.which === 38) { // up navigates mentionables
					MentionSelector.moveHighlightUp();
					return false;
				} else if(e.which === 40) { // down navigates mentionables
					MentionSelector.moveHighlightDown();
					return false;
				}
				return true;
			},
			onkeypress: function(context, e) {
				return true;
			},
			oninput: function(context, e) {
				clearTimeout(getMentionablesTimeout);
				MentionSelector.loading(context.input);
				getMentionablesTimeout = setTimeout(function(){
					var query = effectiveCurrentWord(context).value.substring(1);
					if(query.length > 1) {
						var handleMentionables = function(mentionables) {
							if(mentionables !== null && mentionables.length > 0) {
								MentionSelector.show(context.input, mentionables, query);
							} else {
								context.release();
							}
						};
						if(typeof queryCache[query] !== 'undefined') {
							if(!context.data(isActiveKey))
								return;

							handleMentionables(queryCache[query]);
						} else {
							getMentionables(query, function(mentionables) {
								// if no longer active at this point, ignore results
								if(!context.data(isActiveKey))
									return;

								if(mentionables) {
									mentionables = $.map(mentionables, function(mentionable) {
										return {
											name: mentionable.name,
											token: mentionable.token,
											decodedName: $.telligent.evolution.html.decode(mentionable.name)
										}
									});
								}
								queryCache[query] = mentionables;
								if (effectiveCurrentWord(context).value.substring(1) == query) {
									handleMentionables(mentionables);
								}
							});
						}
					} else {
						context.release();
					}
				}, 500);

				return true;
			}
		};

		return api;
	}());

	// encapsulated ui for displaying mentionables and selecting, used by the composer
	var MentionSelector = (function(){
		var element = null,
			highlightClass	= 'highlight',
			mentionableDataKey = 'mentionableData',
			availableMentionables = {},
			attachedInput = null,
			loading = null,
			init = function(input) {
				attachedInput = input;

				if(element !== null) {
					return;
				}

				element = $('<ul class="composer-mentionable-selector"></ul>').hide().appendTo($('body'));
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
			selectedEventName: 'MENTIONABLE_SELECTED',
			show: function(input, mentionables, query) {
				init(input);
				reposition();
				element.hide().empty();
				var queryRegex = new RegExp($.telligent.evolution.regex.encode($.telligent.evolution.html.encode(query)),'i');
				$.each(mentionables, function(i, mentionable){
					var match = mentionable.name.match(queryRegex);
					var mentionableListItem = match !== null
						? $('<li>'+mentionable.name.replace(queryRegex, '<strong>' + match[0] + '</strong>')+'</li>')
						: $('<li>'+mentionable.name+'</li>');
					mentionableListItem.data(mentionableDataKey, mentionable);
					element.append(mentionableListItem);
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
					return currentHighlight.data(mentionableDataKey);
				} else {
					// return first mention
					return $(choices.get(0)).data(mentionableDataKey);
				}
			}
		}

		return api;
	}());

	$.fn.evolutionComposer.plugins.mentions = mentionComposer;
	$.fn.evolutionComposer.plugins.mentions.defaults = {
		onMentionableList: function(query, complete) {
			$.telligent.evolution.get({
				url: $.telligent.evolution.site.getBaseUrl() + 'api.ashx/v2/mentionables.json?IncludeFields=Token,PreviewHtml',
				data: {
					QueryText: query,
					PageSize: 20
				},
				cache: false,
				dataType: 'json',
				success: function(response) {
					if(response.Mentionables && response.Mentionables.length > 0) {
						var results = $.map(response.Mentionables, function(mentionable) {
							return { name: mentionable.PreviewHtml, token: mentionable.Token };
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
