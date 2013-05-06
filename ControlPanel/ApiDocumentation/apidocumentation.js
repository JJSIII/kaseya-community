(function($, global, undefined){

	var buildContext = function(select, options){
			var context = {
				select: select,
				options: [],
				settings: options
			};

			select.find('option').each(function(){
				var elm = $(this),
					parent = elm.parent(),
					opt = {
						value: elm.attr('value'),
						text: elm.html(),
						group: parent.is('optgroup') ? parent.attr('label') : null
					};
					opt.searchableText = (opt.value + ' ' + opt.text + ' ' + (opt.group || '')).toLowerCase();
				if(opt.value.length > 0)
					context.options.push(opt);
			});

			return context;
		},
		buildUi = function(context) {
			context.input = $('<input type="text" placeholder="' + context.settings.searchText + '" />').css({
				width: context.select.outerWidth(),
                position: 'relative'
			}).insertBefore(context.select);

			context.selector = new Selector(context.input, function(selection) {
				context.select.val(selection.value);
				context.select.trigger('change');
				context.selector.hide();
				context.input.blur();
			});

			// set up clear link
			context.input.wrap('<div></div>');
			var wrapper = context.input.parent().css({ position: 'relative' });
			wrapper.css({ width: context.input.width() });
			var clearLink = $('<a class="clear" href="#">x</a>').appendTo(wrapper).hide();
			clearLink.click(function(){
				context.input.val('');
				clearLink.hide();
				context.input.focus();
			});
			context.input.on('keyup', function() {
				if(context.input.val().length > 0) {
					clearLink.show();
				} else {
					clearLink.hide();
				}
			});

			// initial value
			var initialValue = context.select.val();
			if(initialValue) {
				var text = context.select.find('option[value="'+initialValue+'"]').html();
				context.input.val(text);
				clearLink.show();
			}

			context.select.hide();
		},
		handleEvents = function(context) {
			context.input.bind({
				keyup: function(e) {
					var value = context.input.val(),
						groupedOptions = groupOptions(context, value.length > 0 ? filterOptions(context, value, 20) : []);
					context.selector.show(groupedOptions);
				},
				focus: function(e) {
					var value = context.input.val(),
						groupedOptions = groupOptions(context, value.length > 0 ? filterOptions(context, value, 20) : []);
					context.selector.show(groupedOptions);
				},
				blur: function(e) {
					setTimeout(function(){
						context.selector.hide();
					}, 500);
				}
			});
		},
		filterOptions = function(context, query, limit) {
			var queryWords = (query.toLowerCase() || '').split(' '), i, word;
			var matchedOptions = $.grep(context.options, function(opt) {
				var matches = true;
				for(i = 0; i < queryWords.length; i++) {
					word = queryWords[i];
					if(word === null || word.length === 0)
						continue;
					if(opt.searchableText.indexOf(queryWords[i]) < 0) {
						matches = false;
					}
				}
				return matches;
			});
			if(matchedOptions.length > limit)
				matchedOptions = matchedOptions.slice(0, limit);
			return matchedOptions;
		},
		groupOptions = function(context,options) {
			var groups = [];

			var buildGroup = function(name) {
				var group = {
					name: name,
					options: []
				};
				groups.push(group);
				return group;
			};
			var ungrouped = buildGroup(context.settings.uncategorizedText);
			var currentGroup = buildGroup(null);

			$.each(options, function(i, opt) {
				if(opt.group) {
					if(!currentGroup.name) {
						currentGroup.name = opt.group;
					} else if(currentGroup.name !== opt.group){
						currentGroup = buildGroup(opt.group);
					}
					currentGroup.options.push(opt);
				} else {
					ungrouped.options.push(opt);
				}
			});

			return $.grep(groups, function(g) { return g.options.length > 0; });
		};

	$.fn.selectSearch = function(options) {
		var options = $.extend({}, $.fn.selectSearch.defaults, options || {});
		return this.each(function(){

			var context = buildContext($(this), options);
			buildUi(context);
			handleEvents(context);

		});
	};
	$.fn.selectSearch.defaults = {
		searchText: 'Go to extension...',
		uncategorizedText: 'Uncategorized'
	};

	var Selector = (function(){
		var template = $.telligent.evolution.template.compile('' +
			'<ul class="select_searcher_options">' +
			'  <% foreach(groups, function(group) { %>' +
			'	 <li><h4><%: group.name %></h4><ul>' +
			'	 <% foreach(group.options, function(option) { %>' +
			'	   <li><a href="#" data-option="<%: option.value %>"><%: option.text %></a></li>' +
			'	 <% }); %>' +
			'	 </ul></li>' +
			'  <% }); %>' +
			'</ul>'),
			highlight = function(index, container) {
				var links = container.find('a');
				if(index + 1 > links.length) {
					index = 0;
				} else if(index < 0) {
					index = links.length - 1;
				}

				var highlightableLink = $(links.removeClass('highlight')[index]);
				highlightableLink.addClass('highlight');

				return index;
			};

		function Selector(input, onSelect) {
			this.open = false;
			this.currentSelectionIndex = 0;

			this.container = $('<div class="select_searcher"></div>').css({
				width: input.outerWidth() - 20
			}).insertAfter(input).hide();

			var self = this;

			input.on('keydown', function(e){
				if(!self.open) { return; }

				if(e.which === 9 || e.which === 13) { // tab or enter selects
					e.preventDefault();
					select(self.container.find('a.highlight'));
					return false;
				} else if (e.which === 38) { // up
					e.preventDefault();
					self.currentSelectionIndex--;
					self.currentSelectionIndex = highlight(self.currentSelectionIndex, self.container);
					return false;
				} else if (e.which === 40) { // down
					e.preventDefault();
					self.currentSelectionIndex++;
					self.currentSelectionIndex = highlight(self.currentSelectionIndex, self.container);
					return false;
				}
			});

			var select = function(link){
				if(link !== null && link.length === 1) {
					var data = { name: link.html(), value: link.data('option') };
					input.val(data.name);
					onSelect(data);
				}
			};

			this.container.on('click', 'a', function(e){
				e.preventDefault();
				select($(e.target));
			});
		};

		Selector.prototype.show = function(groupedOptions) {
			this.open = true;
			if(groupedOptions.length > 0) {
				this.container.html(template({ groups: groupedOptions })).show();
				this.currentSelectionIndex = highlight(this.currentSelectionIndex, this.container);
			} else {
				this.hide();
			}
		};

		Selector.prototype.hide = function() {
			this.open = false;
			this.container.hide().html('');
		};

		return Selector;
	})();


}(jQuery, window))

jQuery(function ($) {
	$('a[href*=#]').bind('click', function () {
		var hash = this.hash.slice(1);
		var anchor = $("[name=" + hash + ']');
		if (anchor.length) {
			$('html,body').animate({
				scrollTop: anchor.offset().top
			}, 500);
			window.location.hash = this.hash;
			return false;
		}
	});
	$('select.extension').bind('change', function () {
		var val = $(this).val();
		if (val !== null && val.length > 0) {
			window.location = val;
		}
	}).selectSearch();
});