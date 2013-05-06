(function($){

	var api = {};

	var EVENT_NAMESPACE = '.evolutionInlineTagEditor',
		CONTEXT_KEY = 'evolutionTagInlineEditor_context',
		_saveTags = function (context, tags) {
			if (!context.internal.isInitialized)
				return;

			var inTags = tags.split(/[,;]/g);
			var outTags = [];
			for(var i = 0; i < inTags.length; i++)
			{
				var tag = $.trim(inTags[i]);
				if (tag)
					outTags[outTags.length] = tag;
			}

			var success = function() { context.settings.currentTags = outTags; };
			context.settings.onSave(outTags, success);
		},
		_init = function (options) {
			return this.each(function () {
				var context = {
					settings: $.extend({}, $.fn.evolutionInlineTagEditor.defaults, options || {}),
					internal: {
						state: $(this)
					}
				};

				$(this).data(CONTEXT_KEY, context);
				if (!$(this).html()) {
					$(this).text(context.settings.editButtonText);
				}

				_initialize(context);
			});
		},
		_initialize = function(context) {
			var editorContainer = $('<div></div>')
					.addClass(context.settings.editorCssClass)
					.attr('style', 'display: none;');

			var editorTextArea = $('<textarea></textarea>')
					.attr('cols', '40')
					.attr('rows', '2');

			if (context.settings.allTags && context.settings.allTags.length > 0)
				var selectTagsButton = $('<input type="button" />')
						.val(context.settings.selectTagsText);

			var saveButton = $('<input type="button" />')
					.val(context.settings.saveTagsText);

			var cancelButton = $('<input type="button" />')
					.val(context.settings.cancelText);

			var editorButtonsContainer = $('<div style="white-space: nowrap; padding-top: 4px;"><table width="100%" cellspacing="0" cellpadding="0" border="0"><tbody><td align="left"></td><td align="right"></td></tr></tbody></table></div>');
			editorButtonsContainer.find('td:eq(1)').append(saveButton);
			editorButtonsContainer.find('td:eq(1)').append(cancelButton);
			if (selectTagsButton)
				editorButtonsContainer.find('td:first').append(selectTagsButton);

			editorContainer.append(editorTextArea);
			editorContainer.append(editorButtonsContainer);

			editorTextArea.evolutionTagTextBox({allTags:context.settings.allTags});
			editorContainer.glowPopUpPanel({
					'cssClass':context.settings.editorCssClass,
					'position':'updown',
					'zIndex':500,
					'hideOnDocumentClick':false
				});

			$(context.internal.state).bind('click' + EVENT_NAMESPACE, function(e){
						editorContainer.glowPopUpPanel('hide').glowPopUpPanel('show', $(this));
						editorTextArea.val(context.settings.currentTags.length > 0 ? context.settings.currentTags.join(', '): '');
						return false;
					});

			saveButton.bind('click' + EVENT_NAMESPACE, function(e){
						_saveTags(context, editorTextArea.attr('value'));
						editorContainer.glowPopUpPanel('hide');
						return false;
					});

			cancelButton.bind('click' + EVENT_NAMESPACE, function(e){
						editorContainer.glowPopUpPanel('hide');
						return false;
					});

			if (selectTagsButton)
				selectTagsButton.bind('click' + EVENT_NAMESPACE, function(e){
							editorTextArea.evolutionTagTextBox('openTagSelector');
							return false;
						});

			context.internal.state.after(editorContainer);
			context.internal.isInitialized = true;
		};

	$.fn.evolutionInlineTagEditor = function (method) {
		if (method in api) {
			return api[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return _init.apply(this, arguments);
		} else {
			$.error('Method ' + method + ' does not exist on jQuery.fn.evolutionInlineTagEditor');
		}
	};

	$.extend($.fn.evolutionInlineTagEditor, {
		defaults: {
			allTags: [''],
			currentTags: [''],
			editorCssClass: 'tags-editor',
			editButtonText: 'Edit',
			selectTagsText: 'Select Tags',
			saveTagsText: 'Save',
			cancelText: 'Cancel',
			onSave: function(tags, success) { }
		}
	});

})(jQuery);