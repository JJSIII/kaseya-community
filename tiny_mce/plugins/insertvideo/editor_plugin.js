(function() {

	tinymce.PluginManager.requireLangPack('insertvideo');

	tinymce.create('tinymce.plugins.TelligentEvolutionInsertVideoPlugin', {
		init : function(ed, url) {

			ed.addCommand('mceInsertVideo', function() {
				if (tinyMCE_TelligentEvolutionOptions)
		    		tinyMCE_TelligentEvolutionOptions.InsertVideoOpenFunction();
			});

			ed.addButton('insertvideo', {
				title : 'insertvideo.desc',
				cmd : 'mceInsertVideo',
				image : url + '/img/insert_video.gif'
			});
		},

		createControl : function(n, cm) {
			return null;
		},

		getInfo : function() {
			return {
				longname : 'Community Server Insert Video Plugin',
				author : 'Telligent',
				authorurl : 'http://telligent.com/',
				infourl : 'http://telligent.com/',
				version : tinyMCE.majorVersion + "." + tinyMCE.minorVersion
			};
		}
	});

	tinymce.PluginManager.add('insertvideo', tinymce.plugins.TelligentEvolutionInsertVideoPlugin);
})();