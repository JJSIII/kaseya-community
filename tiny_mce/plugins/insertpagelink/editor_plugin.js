(function() {
	tinymce.PluginManager.requireLangPack('insertpagelink');

	tinymce.create('tinymce.plugins.TelligentEvolutionPageLinkPlugin', {
		init : function(ed, url) {
			ed.addCommand('mceInsertPageLink', function() {
				if (tinyMCE_TelligentEvolutionOptions)
		    		tinyMCE_TelligentEvolutionOptions.InsertPageLinkOpenFunction();
			});

			ed.addButton('insertpagelink', {
				title : 'insertpagelink.desc',
				cmd : 'mceInsertPageLink',
				image : url + '/img/insertpagelink.gif'
			});

			ed.onNodeChange.add(function(ed, cm, n) {
				cm.setActive('insertpagelink', n.nodeName == 'IMG');
			});
		},

		createControl : function(n, cm) {
			return null;
		},

		getInfo : function() {
			return {
				longname : 'Insert Page Link',
				author : 'Telligent Systems',
				authorurl: 'http://telligent.com/',
				infourl: 'http://telligent.com/',
				version : tinyMCE.majorVersion + "." + tinyMCE.minorVersion
			};
		}
	});

	tinymce.PluginManager.add('insertpagelink', tinymce.plugins.TelligentEvolutionPageLinkPlugin);
})();