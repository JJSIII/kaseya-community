/* clicnt-side functionality for Widget Resource Editing */
(function ($) {
	var api = {};
	var dataKey = '_languageResourceEditor',
		setupLanguageSelect = function (context) {
			var revealLanguage = function () {
				var language = context.internal.languageSelect.val();
				context.internal.languages.hide().filter('[data-language="' + language + '"]').show();
			};
			context.internal.languageSelect.bind('change', function () { revealLanguage(); });
			revealLanguage();
		},
		setupDeleteLinks = function (context) {
			if (context.settings.enableAddRemove) {
				context.selection.delegate(context.settings.deleteLinks, 'click', function (e) {
					e.preventDefault();
					var resourceItem = $(this).closest('li');
					var resourceName = resourceItem.find('.attribute-name input').val();

					if (confirm(context.settings.deleteConfirmMessage.replace(/NAME/, resourceName))) {
						resourceItem.remove();
						serialize(context);
					}
				});
			} else {
				$(context.settings.deleteLinks).hide();
			}
		},
		addNew = function (context) {
			var list = $(context.settings.resourceList + ':visible', context.selection);
			var language = list.closest('.language').attr('data-language');
			var newResource = $(context.settings.resourceTemplate.replace(/LANGUAGE/, language));
			list.append(newResource);
			serialize(context);
			newResource.find('.attribute-name input').focus();
		},
		setupAddNewLink = function (context) {
			if (context.settings.enableAddRemove) {
				context.internal.addNewLink.bind('click', function (e) {
					e.preventDefault();
					addNew(context);
				});
			} else {
				$(context.internal.addNewLink).hide();
			}

			context.selection.delegate('input[type="text"]', 'keydown', function (e) {
				if (e.which === 13) {
					e.preventDefault();
					e.stopPropagation();
					addNew(context);
				}
			});
			context.selection.delegate('input[type="text"]', 'keyup', function (e) {
				var input = $(e.target);
				if (input.val() === '') {
					input.removeClass('populated').addClass('empty');
				} else {
					input.removeClass('empty').addClass('populated');
				}
			});
		},
        serialize = function (context) {
        	var serializedResources = [];
        	$(context.settings.resources).each(function () {
        		var resource = $(this);
        		serializedResources.push($.param({
        			lang: resource.attr('data-language'),
        			name: resource.find('.attribute-name input').val(),
        			val: resource.find('.attribute-value input').val()
        		}));
        	});
        	var serialized = $.param({ r: serializedResources });
        	context.internal.state.val(serialized);
        },
		init = function (options) {
			return this.each(function () {
				var settings = $.extend({}, $.fn.languageResourceEditor.defaults, options || {});
				var item = $(this);
				var context = {
					settings: settings,
					selection: item,
					internal: {
						state: $(settings.state, item),
						languageSelect: $(settings.languageSelect, item),
						resources: $(settings.resources, item),
						addNewLink: $(settings.addNewLink, item),
						resourceList: $(settings.resourceList, item),
						languages: $(settings.languages, item)
					}
				};
				serialize(context);
				$(this).delegate('input', 'blur', function () {
					serialize(context);
				});
				$(this).data(dataKey, context);
				setupDeleteLinks(context);
				setupAddNewLink(context);
				setupLanguageSelect(context);
			});
		};
	$.fn.languageResourceEditor = function (method) {
		return init.apply(this, arguments);
	};
	$.fn.languageResourceEditor.defaults = {
		enableAddRemove: true,
		state: 'input[type="hidden"]',
		languageSelect: 'select',
		resources: 'li.resource',
		deleteLinks: 'li.resource a.delete',
		addNewLink: 'a.add',
		resourceList: 'ul',
		languages: '.language',
		deleteConfirmMessage: 'Are you sure you want to delete the resource "NAME"?',
		resourceTemplate: ("<li class=\"attribute-item resource\" data-language=\"LANGUAGE\">" +
			"<span class=\"attribute-name\"><input type=\"text\" value=\"\" /></span> " +
			"<span class=\"attribute-value\"><input type=\"text\" value=\"\" /></span>" +
			"<a href=\"#\" class=\"delete\">delete</a>" +
			"</li>")
	};
})(jQuery);
