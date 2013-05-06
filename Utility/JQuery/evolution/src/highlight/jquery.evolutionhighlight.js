(function($){

    var highlighterKey = '_HIGHLIGHTER_CONTEXT',
        getContext = function(selection, options) {
            var context = selection.data(highlighterKey);
            if(typeof context === 'undefined' || context === null) {
                context = buildContext(selection, options);
                selection.data(highlighterKey, context);
            }
            return context;
        },
        buildContext = function(selection, options) {
            var context = {
                selection: selection.filter('textarea'),
                settings: $.extend({}, $.fn.evolutionHighlight.defaults, options || {})
            };
            buildHighlightingContainer(context);
            return context;
        },
        buildHighlightingContainer = function(context) {
			context.wrapper = $('<div></div>');
			context.mirror = $('<div></div>');

			// remove margins from textarea and apply to wrapper
			var wrapperStyle = {
				position: 'relative',
				width: context.selection.outerWidth(),
				height: context.selection.outerHeight()
			};
			$.each(['margin-left','margin-right','margin-top','margin-bottom'], function(i, styleName) {
				wrapperStyle[styleName] = context.selection.css(styleName);
				context.selection.css(styleName, 0);
			});

			// capture textarea styles to apply to mirror
            var mirrorStyle = {
				position: 'absolute',
				top: '0px',
				left: '0px',
				zIndex: '0',
				borderTopColor: 'transparent',
				borderBottomColor: 'transparent',
				borderLeftColor: 'transparent',
				borderRightColor: 'transparent',
				backgroundColor: context.selection.css('backgroundColor'),
				color: 'transparent',
				width: context.selection.width(),
				height: context.selection.height(),
				overflow: 'hidden',
				whiteSpace: 'normal'
			};
            $.each(context.settings.styles, function(i,styleName){
                mirrorStyle[styleName] = context.selection.css(styleName);
            });

			// new styles to apply to text area
			var textAreaStyle = {
				position: 'absolute',
				top: '0px',
				left: '0px',
				zIndex: '1',
				backgroundColor: 'transparent',
				width: context.selection.width(),
				height: context.selection.height()
			};

			// apply styles
			context.wrapper.css(wrapperStyle).addClass('highlighter');
			context.mirror.css(mirrorStyle);
			context.selection.css(textAreaStyle);

			// set background-color
			context.mirror.css('color', context.mirror.css('background-color'));

			// rearrange DOM
			context.selection.before(context.wrapper);
			context.wrapper.append(context.selection);
			context.wrapper.append(context.mirror);
        },
        rDoubleSpace = /\s\s/gi,
        rBreak = /\n/gi,
		highlight = function(context) {
			// prepare highlights
			var ranges = {};
			$.each(context.settings.ranges, function(i, range) {
				ranges[range.start] = ranges[range.start] || [];
	            ranges[range.start].push(range);
	            ranges[range.stop] = ranges[range.stop] || [];
	            ranges[range.stop].push(range);
			});

            var rawValue = context.selection.val();
                newValue = [],
                spanDepth = 0;
            for(var i = 0; i < rawValue.length; i++) {
                if(typeof ranges[i] !== 'undefined') {
                    $.each(ranges[i], function(h, range) {
                        if(range.start === i) {
                            newValue[newValue.length] = '<span class="'+range.className+'" style="white-space:normal;">';
                            spanDepth++;
                        } else {
                            newValue[newValue.length] = '</span>';
                            spanDepth--;
                        }
                    });
                }
                newValue[newValue.length] = rawValue.charAt(i);
            }
            if(spanDepth > 0) {
                newValue[newValue.length] = '</span>';
            }
            var newRawValue = newValue.join('').replace(rBreak,'<br />').replace(rDoubleSpace,'&nbsp; ');
            // not using .html() as it executes js.  Not using .innerHTML directly on mirror as it errors in IE
            var mirroredValueWrapper = document.createElement('span');
            mirroredValueWrapper.innerHTML = newRawValue;
            context.mirror.empty().get(0).appendChild(mirroredValueWrapper);
		};
		var methods = {
			init: function(options) {
		        var context = getContext(this, options);
				context.settings = $.extend({}, $.fn.evolutionHighlight.defaults, options || {});
				highlight(context);
		        return this;
			},
			clear: function() {
				var context = getContext(this, null);
				if(context === null)
					return;
				context.mirror.html('');
				return this;
			},
			resize: function(width, height) {
				var context = getContext(this, null);
				if(context === null)
					return;
				var newStyle = {
					width: width,
					height: height
				};
				context.mirror.css(newStyle);
				context.selection.css(newStyle);
				context.wrapper.css({
					width: context.selection.outerWidth(),
					height: context.selection.outerHeight()
				});
				return this;
			},
			css: function(css) {
				var context = getContext(this, null);
				if(context === null)
					return;
				context.wrapper.css(css);
				return this;
			}
		};
    $.fn.evolutionHighlight = function(method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' +  method + ' does not exist on jQuery.evolutionHighlight');
        }
    };
    $.fn.evolutionHighlight.defaults = {
        ranges: [],
        styles: ['border-top-width','border-top-style','border-bottom-width',
            'border-bottom-style','border-right-width','border-right-width-value',
            'border-right-style','border-right-style-value','border-left-width',
            'border-left-width-value','border-left-style','border-left-style-value',
            'font-family','font-size','font-size-adjust','font-stretch',
            'font-style','font-variant','font-weight',
            'padding-bottom','padding-left','padding-right','padding-top',
            'letter-spacing','line-height','text-align','text-indent','word-spacing']
    };

}(jQuery));