(function($){
	// shim for html5 'input' event, exposed as 'textinput' since 'input' does exist in some browsers but is hopelessly broken
	var nativeInputEventName = 'input';
	var onInputSupported = !$.browser.msie && (('on'+nativeInputEventName) in document.createElement('input')) && (('on'+nativeInputEventName) in document.createElement('textarea'));
	$.event.special['textinput'] = {
		setup: function() {
			var elm = $(this);
			if(onInputSupported) {
				elm.bind('input', function(e){
					elm.trigger('textinput', { which: e.which });
				});
			} else {
				var currentValue;
				elm.bind({
					keydown: function(e) {
						currentValue =	elm.val();
					},
					keyup: function(e) {
						var newValue = elm.val();
						if(newValue !== currentValue) {
							elm.trigger('textinput', { which: e.which })
						}
						currentValue = newValue;
					}
				});
			}
		}
	}
}(jQuery));

(function($){

	var KEY = '__COMPOSER_CONTEXT',
		getContextFor = function(input, options) {
			input = $(input);
			var context = input.data(KEY);
			if(!context && options) {
				context = initiateAndBuildComposerContext(input, options);
				input.data(KEY, context);
			}
			return context;
		},
		initiateAndBuildComposerContext = function(input, options) {
			var settings = $.extend({}, $.fn.evolutionComposer.defaults, options || {}),
				composerContext = {
					input: input,
					settings: settings,
					plugins: $.map(settings.plugins, function(plugin) {
						if(typeof plugin == 'string') {
							return $.fn.evolutionComposer.plugins[plugin];
						} else {
							return plugin;
						}
					}),
					ranges: [],
					activePlugin: false
				};
			composerContext.pluginContext = buildPluginContext(composerContext);
			composerContext.input.evolutionHighlight();
			bindKeys(composerContext);
			return composerContext;
		},
		buildPluginContext = function(composerContext) {
			var pluginContext = {
				settings: composerContext.settings,
				input: composerContext.input,
				data: function(key, newValue) {
					if(typeof newValue !== 'undefined') {
						return composerContext.input.data(key, newValue);
					} else {
						return composerContext.input.data(key);
					}
				},
				val: function(newvalue) {
					if(typeof newvalue !== 'undefined') {
						return composerContext.input.val(newvalue);
					} else {
						return composerContext.input.val();
					}
				},
				release: function() {
					if(composerContext.activePlugin.onDeactivate) {
						composerContext.activePlugin.onDeactivate.call(composerContext.input, composerContext.pluginContext);
					}
					composerContext.activePlugin = false;
				},
				caretPosition: function() {
					return getCaretPosition(composerContext.input);
				},
				currentWord: function(options) {
					return currentWord(composerContext, $.extend({
						allowedWhiteSpaceBeforeCaret: 0,
						allowedWhiteSpaceAfterCaret: 0
					}, options || {}));
				},
				replace: function(start, stop, newText) {
					var currentVal = composerContext.input.val();
					composerContext.input.val(currentVal.substring(0, start) + newText + currentVal.substring(stop));
				},
				clearHighlights: function(rangeClass) {
					var newRanges = [];
					$.each(composerContext.ranges, function(i, range) {
						if(!rangeClass || range.className !== rangeClass) {
							newRanges.push(range);
						}
					});
					composerContext.ranges = newRanges;
					composerContext.input.evolutionHighlight({
						ranges: composerContext.ranges
					});
				},
				addHighlight: function(range) {
					composerContext.ranges.push(range);
				},
				renderHighlights: function() {
					composerContext.input.evolutionHighlight({
						ranges: composerContext.ranges
					});
				}
			};
			return pluginContext;
		},
		bindKeys = function(composerContext) {
			composerContext.input.bind({
				keypress: function(e) {
					delegateToPlugin(composerContext, 'onkeypress', e);
				},
				keydown: function(e) {
					delegateToPlugin(composerContext, 'onkeydown', e);
				},
				textinput: function(e) {
					conditionallyActivatePlugin(composerContext, e);
					delegateToPlugin(composerContext, 'oninput', e);
					runTransforms(composerContext);
				}
			});
		},
		delegateToPlugin = function(composerContext, eventName, e) {
			var delegatedResponse = true;
			if(composerContext.activePlugin && composerContext.activePlugin[eventName]) {
				delegatedResponse = composerContext.activePlugin[eventName].call(e.target, composerContext.pluginContext, e);
			}
			if(!delegatedResponse) {
				e.preventDefault();
			} else if(composerContext[eventName]) {
				delegatedResponse = composerContext[eventName].call(e.target, e);
				if(!delegatedResponse) {
					e.preventDefault();
				}
			}
		},
		conditionallyActivatePlugin = function(composerContext, e) {
			if(!composerContext.activePlugin) {
				$.each(composerContext.plugins, function(i, plugin) {
					if(plugin.shouldActivate && plugin.shouldActivate.call(composerContext.input, composerContext.pluginContext) === true) {
						composerContext.activePlugin = plugin;
						if(plugin.onActivate) {
							plugin.onActivate.call(composerContext.input, composerContext.pluginContext);
						}
						return false;
					}
				});
			}
		},
		runTransforms = function(composerContext) {
			$.each(composerContext.plugins, function(i, plugin) {
				if(plugin.onTransform) {
					plugin.onTransform.call(composerContext.input, composerContext.pluginContext);
				}
			});
		},
		isWhiteSpace = function(character) {
			return character === '\n' || character === '\t';
		},
		currentWord = function(composerContext, options) {
			var caretPosition = options.caretPosition || getCaretPosition(composerContext.input),
				word = "",
				currentValue = $(composerContext.input).val(),
				remainder = "",
				whiteSpaceIndex = 0,
				start = caretPosition,
				i = 0,
				previousWhiteSpaceIndex,
				mextWhiteSpaceIndex;
			if(caretPosition < currentValue.length && !isWhiteSpace(currentValue[caretPosition])) {
				remainder = currentValue.substring(caretPosition),
				whiteSpaceIndex = getPositionOfFirstWhiteSpace(remainder);
				if(whiteSpaceIndex < 0) {
					whiteSpaceIndex = remainder.indexOf('\n');
				}
				if(whiteSpaceIndex < 0) {
					whiteSpaceIndex = remainder.indexOf('\t');
				}
				if(whiteSpaceIndex < 0) {
					whiteSpaceIndex = remainder.length;
				}
				for(i = 0; i < options.allowedWhiteSpaceAfterCaret; i++) {
					if(whiteSpaceIndex > 0) {
						var whiteSpaceRemainder = currentValue.substring(caretPosition + whiteSpaceIndex + 1);
						nextWhiteSpaceIndex = getPositionOfFirstWhiteSpace(whiteSpaceRemainder);
						nextWhiteSpaceIndex = nextWhiteSpaceIndex === -1 ? whiteSpaceRemainder.length : nextWhiteSpaceIndex;
						if(nextWhiteSpaceIndex > 0) {
							whiteSpaceIndex += (nextWhiteSpaceIndex + 1);
						} else {
							break;
						}
					}
				}
				if(whiteSpaceIndex > 0) {
					start = 0;
					word = word + remainder.substring(0, whiteSpaceIndex);
				}
			}
			if(caretPosition > 0 && !isWhiteSpace(currentValue[caretPosition - 1])) {
				remainder = currentValue.substring(0, caretPosition),
				whiteSpaceIndex = getPositionOfLatestWhiteSpace(remainder);
				for(i = 0; i < options.allowedWhiteSpaceBeforeCaret; i++) {
					if(whiteSpaceIndex > 0) {
						previousWhiteSpaceIndex = getPositionOfLatestWhiteSpace(currentValue.substring(0, whiteSpaceIndex));
						if(previousWhiteSpaceIndex !== whiteSpaceIndex) {
							whiteSpaceIndex = previousWhiteSpaceIndex;
						} else {
							break;
						}
					}
				}
				if(whiteSpaceIndex === remainder.length) {
					whiteSpaceIndex = remainder.lastIndexOf('\n');
				}
				if(whiteSpaceIndex === remainder.length) {
					whiteSpaceIndex = remainder.lastIndexOf('\t');
				}
				if(whiteSpaceIndex === remainder.length) {
					whiteSpaceIndex = remainder.length - 1;
				}
				if(whiteSpaceIndex < remainder.length - 1) {
					start = whiteSpaceIndex + 1;
					word = remainder.substring(start) + word;
				}
			}
			return { value: word, start: start, stop: start + word.length };
		},
		getPositionOfFirstWhiteSpace = function(value) {
			var whiteSpaceIndices = [];

			$.each([' ','\t','\n'], function(i, ws) {
				var whiteSpaceIndex = value.indexOf(ws);
				if(whiteSpaceIndex >= 0)
					whiteSpaceIndices.push(whiteSpaceIndex);
			});

			whiteSpaceIndices.sort();
			if(whiteSpaceIndices.length > 0) {
				return whiteSpaceIndices[0];
			} else {
				return -1;
			}
		},
		getPositionOfLatestWhiteSpace = function(value) {
			var whiteSpaceIndices = [],
				whiteSpaceIndex;

			$.each([' ','\t','\n'], function(i, ws) {
				var whiteSpaceIndex = value.lastIndexOf(ws);
				if(whiteSpaceIndex >= 0)
					whiteSpaceIndices.push(whiteSpaceIndex);
			});

			whiteSpaceIndices.sort();
			if(whiteSpaceIndices.length > 0) {
				return whiteSpaceIndices[whiteSpaceIndices.length - 1];
			} else {
				return -1;
			}
		},
		getCaretPosition = function(input) {
			input = input.get(0);
			if (input.selectionStart) {
				return input.selectionStart;
			} else if (document.selection) {
				var range = document.selection.createRange();
				if (range === null) { return 0; }
				var textRange = input.createTextRange(),
				textRangeClone = textRange.duplicate();
				textRange.moveToBookmark(range.getBookmark());
				textRangeClone.setEndPoint('EndToStart', textRange);
				return textRangeClone.text.length;
			}
			return 0;
		},
		autoResize = function(composerContext) {
			if(typeof $.fn.evolutionResize !== 'undefined') {
				composerContext.input.evolutionResize()
					.bind('evolutionResize', function(){
						composerContext.input.evolutionHighlight('resize',
							composerContext.input.width(),
							composerContext.input.height());
					});
			}
		};

	var methods = {
		init: function(options) {
			return this.filter('textarea').each(function(){
				var elm = $(this);
				var context = getContextFor(elm, options);
				autoResize(context);
				if(context !== null) {
					$.each(context.plugins, function(i, plugin){
						if(plugin.init) {
							plugin.init.call(elm, context.pluginContext);
						}
					});
				}
				setTimeout(function(){
					elm.focus();
				}, 10);
			});
		},
		val: function(newValue) {
			if(typeof newValue !== 'undefined') {
				var context = getContextFor(this);
				if(context) {
					context.input.val(newValue);
					runTransforms(context);
				}
			} else {
				var context = getContextFor(this),
					value = '';
				if(context) {
					value = context.input.val();
					$.each(context.plugins, function(i, plugin) {
						if(plugin.val) {
							value = plugin.val.call(context.input, value, context.pluginContext);
						}
					});
				}
				return value;
			}
			return this;
		},
		onkeydown: function(fn) {
			var context = getContextFor(this);
			if(context) {
				context.onkeydown = fn;
			}
			return this;
		},
		oninput: function(fn) {
			var context = getContextFor(this);
			if(context) {
				context.oninput = fn;
			}
			return this;
		},
		resize: function(width, height) {
			var context = getContextFor(this);
			if(context) {
				context.input.evolutionHighlight('resize',width,height);
			}
			return this;
		}
	};

	$.fn.evolutionComposer = function(method) {
		if (methods[method]) {
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return methods.init.apply(this, arguments);
		} else {
			$.error('Method ' +	 method + ' does not exist on jQuery.evolutionComposer');
		}
	};
	$.fn.evolutionComposer.defaults = {
		plugins: []
	};
	$.fn.evolutionComposer.plugins = {}

}(jQuery));