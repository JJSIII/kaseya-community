(function() {

	tinymce.PluginManager.requireLangPack('contentselector');

	tinymce.create('tinymce.plugins.TelligentEvolutionContentSelectorPlugin', {
		init : function(ed, url) {

			ed.addCommand('mceContentSelector', function() {
				if (tinyMCE_TelligentEvolutionOptions)
					tinyMCE_TelligentEvolutionOptions.ContentSelectorOpenFunction();
			});

			ed.addButton('contentselector', {
				title : 'contentselector.desc',
				cmd : 'mceContentSelector',
				image : url + '/img/browse.gif'
			});
		},

		createControl : function(n, cm) {
			return null;
		},

		getInfo : function() {
			return {
				longname : 'Community Server Content Selector Plugin',
				author : 'Telligent Systems',
				authorurl: 'http://telligent.com/',
				infourl: 'http://telligent.com/',
				version : "1.0"
			};
		}
	});

	tinymce.PluginManager.add('contentselector', tinymce.plugins.TelligentEvolutionContentSelectorPlugin);
})();