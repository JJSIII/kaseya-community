(function() {
	tinymce.PluginManager.requireLangPack('smilies');

	tinymce.create('tinymce.plugins.TelligentEvolutionSmiliesPlugin', {
		init : function(ed, url) {
			ed.addCommand('mceSmilies', function() {
				ed.windowManager.open({
					file : url + '/smilies.htm',
					width : 300 + ed.getLang('smilies.delta_width', 0),
					height : 300 + ed.getLang('smilies.delta_height', 0),
					inline : 1
				}, {
					plugin_url : url,
					smilies : (tinyMCE_TelligentEvolutionOptions && tinyMCE_TelligentEvolutionOptions.Smilies) ? tinyMCE_TelligentEvolutionOptions.Smilies : new Array()
				});
			});

			ed.addButton('smilies', {
				title : 'smilies.desc',
				cmd : 'mceSmilies',
				image : url + '/img/smiley.gif'
			});
		},

		createControl : function(n, cm) {
			return null;
		},

		getInfo : function() {
			return {
				longname : 'Smilies',
				author : 'Telligent Systems',
				authorurl: 'http://telligent.com/',
				infourl: 'http://telligent.com/',
				version : tinyMCE.majorVersion + "." + tinyMCE.minorVersion
			};
		}
	});

	tinymce.PluginManager.add('smilies', tinymce.plugins.TelligentEvolutionSmiliesPlugin);
})();