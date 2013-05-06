(function ($)
{
    var api = {};

    var _init = function (options)
    {
        return this.each(function ()
        {
            var context = {
                settings: $.extend({}, $.fn.evolutionUserFileTextBox.defaults, options || {}),
                internal: {
                    state: this,
                    preview: null,
                    select: null,
                    remove: null
                }
            };
            
            var outer = $('<div></div>').attr('class',context.settings.cssClass);
            
            context.internal.preview = $('<div></div>')
            	.attr('class',context.settings.previewCssClass);
            outer.append(context.internal.preview);
            
            context.internal.select = $('<input type="button" />')
            	.val(context.settings.selectText)
            	.click(function() { _select(context); return false; });
            outer.append(context.internal.select);
            
            context.internal.remove = $('<input type="button" />')
            	.val(context.settings.removeText)
            	.click(function() { _remove(context); return false; });
           	outer.append(context.internal.remove);
           	
           	var url = $(this).val();
           	if (url)
           		context.internal.preview.html(context.settings.initialPreviewHtml);
           	else
           		context.internal.preview.html(context.settings.noFileText);
           	
            $(this)
            	.data('evolutionUserFileTextBox', context)
            	.before(outer)
            	.hide();            
        });
    },
    _select = function(context)
    {
    	var modalUrl = context.settings.userFilesBrowseModalUrl;
		if (modalUrl.substr(0, 2) == '~/')
			modalUrl = $.telligent.evolution.site.getBaseUrl() + modalUrl.substr(2);
    	
    	if (window.Telligent_Modal)
            window.Telligent_Modal.Open(modalUrl, 620, 450, function(v) { _selectCallback(context, v); });
        else if ($.glowModal)
           $.glowModal(modalUrl, { width: 620, height: 450, onClose: function(v) { _selectCallback(context, v); } });
    },
    _selectCallback = function(context, v)
    {
    	if(v && v.length == 3 && v[0] && v[1])
    	{
    		context.internal.preview.html(v[2]);
    		$(context.internal.state).val(v[1]);
    	}
    },
    _remove = function(context)
    {
    	context.internal.preview.html(context.settings.noFileText);
    	$(context.internal.state).val('');
    };

    $.fn.evolutionUserFileTextBox = function (method)
    {
        if (method in api)
            return api[method].apply(this, Array.prototype.slice.call(arguments, 1));
        else if (typeof method === 'object' || !method)
            return _init.apply(this, arguments);
        else
            $.error('Method ' + method + ' does not exist on jQuery.fn.evolutionUserFileTextBox');
    };

    $.extend($.fn.evolutionUserFileTextBox, {
        defaults: {
            removeText: '',
            selectText: '',
            noFileText: '',
            initialPreviewHtml: '',
            cssClass: 'user-file-url',
            previewCssClass: 'user-file-url-preview',
            userFilesBrowseModalUrl: '~/utility/userfilesbrowse.aspx'
        }
    });
})(jQuery);
