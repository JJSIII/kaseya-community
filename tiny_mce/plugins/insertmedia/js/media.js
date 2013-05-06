(function() {
	var url;

	function get(id) {
		return document.getElementById(id);
	}

	function clone(obj) {
		var i, len, copy, attr;

		if (null == obj || "object" != typeof obj)
			return obj;

		// Handle Array
		if ('length' in obj) {
			copy = [];

			for (i = 0, len = obj.length; i < len; ++i) {
				copy[i] = clone(obj[i]);
			}

			return copy;
		}

		// Handle Object
		copy = {};
		for (attr in obj) {
			if (obj.hasOwnProperty(attr))
				copy[attr] = clone(obj[attr]);
		}

		return copy;
	}

	function getVal(id) {
		var elm = get(id);

		if (elm.nodeName == "SELECT")
			return elm.options[elm.selectedIndex].value;

		if (elm.type == "checkbox")
			return elm.checked;

		return elm.value;
	}

	function setVal(id, value, name) {
		if (typeof(value) != 'undefined') {
			var elm = get(id);

			if (elm.nodeName == "SELECT")
				selectByValue(document.forms[0], id, value);
			else if (elm.type == "checkbox") {
				if (typeof(value) == 'string') {
					value = value.toLowerCase();
					value = (!name && value === 'true') || (name && value === name.toLowerCase());
				}
				elm.checked = !!value;
			} else
				elm.value = value;
		}
	}

	window.Media = {
		getEvolutionScriptIncludes : function() {
			var includes = '';
			
			var headers = tinyMCEPopup.editor.plugins.insertmedia.getEvolutionHeaders();
			var re = /<script[^>]*src="([^"]*)"/gi;
			var result;
			while (result = re.exec(headers)) {
				includes += '<script src="' + RegExp.$1 + '"></script>';
				re.lastIndex = result.index + result[0].length;
			}
			
			return includes;
		},
		init : function() {
			var html, editor, self = this;

			self.editor = editor = tinyMCEPopup.editor;
			self.isPreviewed = false;
			get('insert').disabled = true;
			
			var headers = tinyMCEPopup.editor.plugins.insertmedia.getEvolutionHeaders();

			var re = /<script[^>]*>((?:\n|.)*?)<\/script>/gi;
			var findCdata = /\<\!\[CDATA\[((?:\n|.)*?)\]\]>/gi;
			var result;
			while (result = re.exec(headers))
			{
				if (result[1].length > 0)
				{
					var s = findCdata.exec(result[1]);
					if (s)
						eval(s[1]);
					else
						eval(result[1]);
				}
				
				re.lastIndex = result.index + result[0].length;
			}
			
			if (!self.editor.plugins.insertmedia.supportsUpload()) {
				get('uploadoption').parentNode.removeChild(get('uploadoption'));
			}
			
			self.data = clone(tinyMCEPopup.getWindowArg('data'));
			self.dataToForm();
			self.preview();
			
			jQuery('#search').glowLookUpTextBox({
				'delimiter':',',
				'emptyHtml':'',
				'maxValues':1,
				'onGetLookUps':function(lutb, searchText) { 
					editor.plugins.insertmedia.searchForMedia(searchText, function(items) {
						if (searchText == lutb.glowLookUpTextBox('getCurrentSearchText')) {
							var lu = [];
							for (var i = 0; i < items.length; i++) {
								lu[lu.length] = lutb.glowLookUpTextBox('createLookUp', items[i].url, items[i].url, items[i].previewHtml, true);
							}
							if (lu.length == 0)
							{
								lu[lu.length] = lutb.glowLookUpTextBox('createLookUp', '', '', self.editor.getLang('insertmedia_dlg.noMatches'), false);
							}
							
							lutb.glowLookUpTextBox('updateSuggestions', lu);
						}
						});
					},
				'selectedLookUpsHtml':[]
				})
				.bind('glowLookUpTextBoxChange', function() { window.Media.formToData(); });
				
			jQuery('#file').glowUpload({
				fileFilter: null,
				width: '250px',
				hiddenInput: '#fileinput',
				uploadUrl: editor.plugins.insertmedia.getUploadUrl()
				})
				.bind('glowUploadBegun', function() {
					setVal('fileurl','');
				})
				.bind('glowUploadComplete', function() { 
					editor.plugins.insertmedia.finalizeFileUpload(jQuery('#file').glowUpload('val').name, function(url) {
						setVal('fileurl', url);
						window.Media.formToData();	
					});
				});
		},

		insert : function() {
			if (this.data.src && this.isPreviewed) {
				var editor = tinyMCEPopup.editor;

				this.formToData();
				editor.execCommand('mceRepaint');
				tinyMCEPopup.restoreSelection();
				
				if (this.data.embedAsHtml && this.data.html)
					editor.selection.setContent(this.data.html);
				else
					editor.selection.setNode(editor.plugins.insertmedia.dataToImg(this.data));

				// IE9 requires removing the flash object from the dom before closing
				jQuery('#file').remove();
				tinyMCEPopup.close();
			}
		},

		preview : function() {
			var self = this;
			get('prev').style.display = 'none';
			get('prevloading').style.display = 'block';
			self.editor.plugins.insertmedia.getPreview(self.data, function(previewData) {
				try {
					if (previewData && previewData.html && previewData.html.length > 0) {
						self.isPreviewed = true;
						get('insert').disabled = false;
					}
					else {
						self.isPreviewed = false;
						get('insert').disabled = true;
					}				
				
					if (previewData && previewData.html && previewData.html.length > 0) {
						self.data.embedAsHtml = previewData.embedAsHtml;
						self.data.escapedSrc = previewData.url;
						self.data.html = previewData.html;
						
						jQuery('#prev').html(previewData.html);
					} else if (self.data.src && self.data.src.length > 0) {
						get('prev').innerHTML = self.editor.getLang('insertmedia_dlg.noPreview');
					} else {
						get('prev').innerHTML = self.editor.getLang('insertmedia_dlg.urlNotSet');
					}
					get('prevloading').style.display = 'none';
					get('prev').style.display = 'block';
				} catch(err) {}
			});
			
		},

		moveStates : function(to_form, field) {
			var data = this.data, editor = this.editor,
				mediaPlugin = editor.plugins.insertmedia, ext, src, typeInfo, defaultStates, src;

			if (!to_form) {
				data.type = get('type').options[get('type').selectedIndex].value;
				data.width = isNaN(parseInt(getVal('width'), 10)) ? 0 : parseInt(getVal('width'), 10);
				data.height = isNaN(parseInt(getVal('height'), 10)) ? 0 : parseInt(getVal('height'), 10);
				
				var prevSrc = data.src;
				
				if (getVal('type') == 'url')
					data.src = getVal('url');
				else if (getVal('type') == 'upload')
				{
					data.src = getVal('fileurl');
				}
				else if (getVal('type') == 'search')
				{
					if (jQuery('#search').glowLookUpTextBox('count') > 0)
						data.src = jQuery('#search').glowLookUpTextBox('getByIndex', 0).Value;
					else
						data.src = '';
				}
				
				if (prevSrc != data.src) {
					data.embedAsHtml = false;
					data.escapedSrc = data.src;
					data.html = '';
				}
			}
			else {
				if (!data.type || (data.type != 'url' && data.type != 'upload' && data.type != 'search') || (data.src && data.src.length > 0) || (data.type == 'upload' && !get('uploadoption')))
					data.type = 'url';
			}

			get('urlcontainer').style.display = 'none';
			get('uploadcontainer').style.display = 'none';
			get('searchcontainer').style.display = 'none';

			if (get(data.type + 'container'))
				get(data.type + 'container').style.display = 'table-row';

			setVal('type', data.type);
			setVal('width', data.width > 0 ? data.width : '');
			setVal('height', data.height > 0 ? data.height : '');
			
			if (to_form && data.src)
				setVal('url', data.src);
		},

		dataToForm : function() {
			this.moveStates(true);
		},

		formToData : function(field) {
			this.isPreviewed = false;
			get('insert').disabled = true;
			this.moveStates(false, field);
			this.preview();
		}
	};

	tinyMCEPopup.requireLangPack();
	tinyMCEPopup.onInit.add(function() {
		Media.init();
	});
})();
