(function () {
	var Node = tinymce.html.Node, JSON = tinymce.util.JSON;

	tinymce.PluginManager.requireLangPack('insertmedia');

	tinymce.create('tinymce.plugins.InsertMediaPlugin', {
		init: function (ed, url) {
			var self = this, i;

			self.editor = ed;
			self.url = url;

			ed.contentCSS[ed.contentCSS.length] = url + '/css/content.css';

			ed.onPreInit.add(function () {
				ed.parser.addNodeFilter('#text', function (nodes) {
					var i = nodes.length;
					while (i--)
						self.textToImg(nodes[i]);
				});

				ed.serializer.addNodeFilter('img', function (nodes, name, args) {
					var i = nodes.length, node;

					while (i--) {
						node = nodes[i];
						if ((node.attr('class') || '').indexOf('mceInsertMediaItem') !== -1)
							self.imgToObject(node, args);
					}
				});
			});

			ed.onExecCommand.add(function (ed, cmd, ui, val) {
				if (cmd == 'createlink' && ui == false) {
					// automatic link

					var n = ed.selection.getNode();
					if (n.nodeName != 'A') {
						for (var i = 0; i < n.childNodes.length; i++) {
							if (n.childNodes[i].nodeName == 'A' && n.childNodes[i].href == val) {
								n = n.childNodes[i];
								break;
							}
						}
					}

					if (n.nodeName == 'A') {
						var data = { id: 'mceInsertMedia' + (new Date()).getTime(), src: n.href, type: 'url', width: tinyMCE_TelligentEvolutionOptions.MediaMaxWidth, height: tinyMCE_TelligentEvolutionOptions.MediaMaxHeight };
						self.getMediaType(data, function (t) {
							if (t != 'Empty') {
								ed.dom.replace(self.dataToImg(data), n, false);
							}
						});
					}
				}
			});

			ed.onInit.add(function () {
				if (ed.theme && ed.theme.onResolveName) {
					ed.theme.onResolveName.add(function (theme, path_object) {
						if (path_object.name === 'img' && ed.dom.hasClass(path_object.node, 'mceInsertMediaItem'))
							path_object.name = 'media';
					});
				}
				if (ed && ed.plugins.contextmenu) {
					ed.plugins.contextmenu.onContextMenu.add(function (plugin, menu, element) {
						if (element.nodeName === 'IMG' && element.className.indexOf('mceInsertMediaItem') !== -1) {
							menu.add({ title: 'insertmedia.edit', icon: 'media', cmd: 'mceInsertMedia' });
							menu.add({ title: 'insertmedia.showLinkOnly', icon: 'media', cmd: 'mceInsertMediaToLink' });
						}
					});
				}
			});

			ed.addCommand('mceInsertMedia', function () {
				self.openDialog('upload');
			});

			ed.addCommand('mceInsertVideo', function () {
				self.openDialog('url');
			});

			ed.addCommand('mceInsertMediaToLink', function () {
				var data, img, a;

				img = ed.selection.getNode();
				if (self.isMediaImg(img)) {
					data = ed.dom.getAttrib(img, 'data-mce-json');
					if (data) {
						data = JSON.parse(data);
					}
				}

				if (data) {
					a = document.createElement('a');
					a.href = data.src;
					a.innerHTML = data.src;

					ed.dom.replace(a, img, false);
				}
			});

			ed.addButton('insertvideo', { title: 'insertmedia.desc', cmd: 'mceInsertVideo', image: url + '/img/insert_video.gif' });
			ed.addButton('insertmedia', { title: 'insertmedia.desc', cmd: 'mceInsertMedia', image: url + '/img/insert_image.gif' });

			ed.onNodeChange.add(function (ed, cm, node) {
				cm.setActive('insertmedia', self.isMediaImg(node));
			});
		},

		isMediaImg: function (img) {
			return img && img.nodeName === 'IMG' && this.editor.dom.hasClass(img, 'mceInsertMediaItem')
		},

		openDialog: function (defaultType) {
			var data, img, self = this;

			img = self.editor.selection.getNode();
			if (self.isMediaImg(img)) {
				data = self.editor.dom.getAttrib(img, 'data-mce-json');
				if (data) {
					data = JSON.parse(data);

					var width = self.editor.dom.getAttrib(img, 'width') || data.width;
					var height = self.editor.dom.getAttrib(img, 'height') || data.height;
					if (height != data.renderedHeight || width != data.renderedWidth) {
						data.height = height;
						data.width = width;
					}
				}
			}

			if (!data) {
				data = {
					id: 'mceInsertMedia' + (new Date()).getTime(),
					type: defaultType,
					src: self.editor.selection.getContent({ format: 'text' }),
					width: tinyMCE_TelligentEvolutionOptions.MediaMaxWidth,
					height: tinyMCE_TelligentEvolutionOptions.MediaMaxHeight
				};
			}

			self.resize(data);

			self.editor.windowManager.open({
				file: self.url + '/media.htm',
				width: 430 + parseInt(self.editor.getLang('insertmedia.delta_width', 0)),
				height: 440 + parseInt(self.editor.getLang('insertmedia.delta_height', 0)),
				inline: 1
			}, {
				plugin_url: self.url,
				data: data
			});
		},

		getInfo: function () {
			return {
				longname: 'Insert Media',
				author: 'Telligent',
				authorurl: 'http://telligent.com',
				version: '6.5'
			};
		},

		dataToImg: function (data, force_absolute) {
			var self = this, editor = self.editor, baseUri = editor.documentBaseURI, sources, attrs, img, i;

			this.resize(data);

			img = self.editor.dom.create('img', {
				id: data.id,
				src: self.editor.theme.url + '/img/trans.gif',
				'class': 'mceItem mceInsertMediaItem',
				'data-mce-json': JSON.serialize(data, "'")
			});

			this.getMediaType(data, function (type) {
				var e = editor.dom.get(data.id);
				if (e)
					e.className = 'mceItem mceInsertMediaItem mceInsertMediaItem' + type;
			});

			img.width = data.renderedWidth;
			img.height = data.renderedHeight;

			return img;
		},

		dataToHtml: function (data, force_absolute) {
			return this.editor.serializer.serialize(this.dataToImg(data, force_absolute), { forced_root_block: '', force_absolute: force_absolute });
		},

		htmlToData: function (html) {
			var fragment, img, data;

			data = {
			};

			fragment = this.editor.parser.parse(html);
			img = fragment.getAll('img')[0];

			if (img) {
				data = JSON.parse(img.attr('data-mce-json'));

				var width = img.attr('width') || data.width;
				var height = img.attr('height') || data.height;
				if (height != data.renderedHeight || width != data.renderedWidth) {
					data.height = height;
					data.width = width;
				}
			}

			this.resize(data);

			return data;
		},

		imgToObject: function (node, args) {
			var self = this, editor = self.editor, data, n;

			data = node.attr('data-mce-json');
			if (!data)
				return;

			data = JSON.parse(data);

			var width = node.attr('width') || data.width;
			var height = node.attr('height') || data.height;
			if (height != data.renderedHeight || width != data.renderedWidth) {
				data.height = height;
				data.width = width;
			}

			if (data.src) {
				self.resize(data);

				n = new Node('#text', 3);
				n.raw = true;
				n.value = '[View:' + (data.escapedSrc ? data.escapedSrc : data.src);

				if (data.width > 0)
					n.value += ':' + data.width;
				else
					n.value += ':0';

				if (data.height > 0)
					n.value += ':' + data.height;
				else
					n.value += ':0';

				n.value += ']';
			}

			if (n)
				node.replace(n);
			else
				node.remove();
		},

		textToImg: function (node) {
			var self = this, editor = self.editor;

			// If node isn't in document
			if (!node.parent)
				return;

			var rn = new Node('div');
			var re = /\[View:([^\]]*)\]/gi;
			var result;
			var lastIndex = 0;
			while (result = re.exec(node.value)) {
				var vals = RegExp.$1.split(/:/g);
				var offset = 1;
				var src = vals[0];
				while (offset < vals.length && isNaN(parseInt(vals[offset]))) {
					src += ':' + vals[offset];
					offset++;
				}

				var width = 0;
				if (offset < vals.length)
					width = vals[offset];

				var height = 0;
				if (offset + 1 < vals.length)
					height = vals[offset + 1];

				var data = {
					id: 'mceInsertMedia' + (new Date()).getTime(),
					src: src,
					width: width,
					height: height
				}

				self.resize(data);

				if (result.index > 0) {
					var tn = editor.parser.parse(node.value.substr(lastIndex, result.index - lastIndex));
					var tcn = tn.getAll('p');
					for (var tcni = 0; tcni < tcn.length; tcni++) {
						var tcnt;
						while ((tcnt = tcn[tcni].walk()) != null) {
							rn.append(tcnt)
						}
					}
				}

				var img = new Node('img', 1);
				img.attr({
					src: this.editor.theme.url + '/img/trans.gif'
				});

				rn.append(img);

				img.attr({
					'id': data.id,
					'class': 'mceItem mceInsertMediaItem',
					width: data.renderedWidth + '',
					height: data.renderedHeight + '',
					"data-mce-json": JSON.serialize(data, "'")
				});

				this.getMediaType(data, function (type) {
					var e = editor.dom.get(data.id);
					if (e)
						e.className = 'mceItem mceInsertMediaItem mceInsertMediaItem' + type;
				});

				lastIndex = re.lastIndex;
			}

			if (lastIndex > 0) {
				if (lastIndex < node.value.length) {
					var tn = editor.parser.parse(node.value.substr(lastIndex));
					var tcn = tn.getAll('p');
					for (var tcni = 0; tcni < tcn.length; tcni++) {
						var tcnt;
						while ((tcnt = tcn[tcni].walk()) != null) {
							rn.append(tcnt)
						}
					}
				}
				node.replace(rn);
				rn.unwrap();
			}
		},

		getCallbackUrl: function (params) {
			var self = this;
			var url = self.url + '/ajax/media.ashx?';

			var qs = {};
			var contextKeyValues = tinyMCE_TelligentEvolutionOptions.ContextQueryString.split(/&/g);
			for (var i = 0; i < contextKeyValues.length; i++) {

				var keyAndValue = contextKeyValues[i].split(/=/);
				if (keyAndValue.length == 2) {
					qs[keyAndValue[0]] = keyAndValue[1];
				}
			}

			var k;
			for (k in params) {
				qs[encodeURIComponent(k)] = encodeURIComponent(params[k]);
			}

			var f = true;
			for (k in qs) {
				if (f)
					f = false;
				else
					url += '&';

				url += k + '=' + qs[k];
			}

			return url;
		},

		getPreview: function (data, callback) {
			var self = this;

			if (!data.src || data.src.length == 0)
				callback('');
			else {
				tinymce.util.XHR.send({
					url: self.getCallbackUrl({ t: 'gp', url: data.src, width: data.width, height: data.height }),
					success: function (r) {
						var o = tinymce.util.JSON.parse(r);
						try {
							if (o && o.html)
								callback(o);
							else {
								if (o && o.error) {
									alert(o.error);
								}
								callback('');
							}
						} catch (e) { }
					},
					error: function (r) {
						alert(self.editor.getLang('insertmedia.previewError', 'An error occurred while previewing media.'));
						try {
							callback('');
						} catch (e) { }
					}
				});
			}
		},

		getMediaType: function (data, callback) {
			var self = this;

			if (!data.src || data.src.length == 0)
				callback('Empty');
			else {
				tinymce.util.XHR.send({
					url: self.getCallbackUrl({ t: 'gmt', url: data.src }),
					success: function (r) {
						var o = tinymce.util.JSON.parse(r);
						try {
							if (o && o.type)
								callback(o.type);
							else {
								if (o && o.error) {
									alert(o.error);
								}
								callback('Empty');
							}
						} catch (e) { }
					},
					error: function (r) {
						try {
							callback('Empty');
						} catch (e) { }
					}
				});
			}
		},

		searchForMedia: function (searchText, callback) {
			var self = this;

			window.clearTimeout(self.searchTimeout);

			self.searchTimeout = window.setTimeout(function () {
				if (!searchText || searchText.length == 0)
					callback([]);
				else {
					tinymce.util.XHR.send({
						url: self.getCallbackUrl({ t: 's', query: searchText }),
						success: function (r) {
							var o = tinymce.util.JSON.parse(r);
							try {
								if (o && o.results)
									callback(o.results);
								else {
									if (o && o.error) {
										alert(o.error);
									}
									callback('');
								}
							} catch (e) { }
						},
						error: function (r) {
							try {
								callback([]);
							} catch (e) { }
						}
					});
				}
			}, 499);
		},

		getEvolutionHeaders: function () {
			return tinyMCE_TelligentEvolutionOptions.EvolutionHeadersHtml;
		},

		getUploadUrl: function () {
			return tinyMCE_TelligentEvolutionOptions.DirectUploadUrl;
		},

		finalizeFileUpload: function (fileName, callback) {
			var self = this;

			if (!fileName || fileName.length == 0)
				callback('');
			else {
				tinymce.util.XHR.send({
					url: self.getCallbackUrl({ t: 'fu', file: fileName, uploadContext: tinyMCE_TelligentEvolutionOptions.DirectUploadContext }),
					success: function (r) {
						var o = tinymce.util.JSON.parse(r);
						try {
							if (o && o.url)
								callback(o.url);
							else {
								if (o && o.error) {
									alert(o.error);
								}
								callback('');
							}
						} catch (e) { }
					},
					error: function (r) {
						alert(self.editor.getLang('insertmedia.uploadError', 'An error occurred while uploading the file.'));
						try {
							callback('');
						} catch (e) { }
					}
				});
			}
		},

		supportsUpload: function () {
			return tinyMCE_TelligentEvolutionOptions.DirectUploadSupported;
		},

		resize: function (data) {
			if (data.width > tinyMCE_TelligentEvolutionOptions.MediaMaxWidth && tinyMCE_TelligentEvolutionOptions.MediaMaxWidth > 0) // max width
				data.width = tinyMCE_TelligentEvolutionOptions.MediaMaxWidth;

			if (data.height > tinyMCE_TelligentEvolutionOptions.MediaMaxHeight && tinyMCE_TelligentEvolutionOptions.MediaMaxHeight > 0) // max height
				data.height = tinyMCE_TelligentEvolutionOptions.MediaMaxHeight;

			if (!data.width || data.width <= 0) {
				if (data.height > 0) {
					data.renderedWidth = Math.round(data.height * 4 / 3);
				} else {
					data.renderedWidth = tinyMCE_TelligentEvolutionOptions.MediaMaxWidth > 0 ? tinyMCE_TelligentEvolutionOptions.MediaMaxWidth : 550;
				}
			}
			else {
				data.renderedWidth = data.width;
			}

			if (!data.height || data.height <= 0) {
				data.renderedHeight = tinyMCE_TelligentEvolutionOptions.MediaMaxHeight > 0 ? tinyMCE_TelligentEvolutionOptions.MediaMaxHeight : Math.round(data.renderedWidth * 3 / 4);
			} else {
				data.renderedHeight = data.height;
			}

			if (data.renderedWidth > tinyMCE_TelligentEvolutionOptions.MediaMaxWidth && tinyMCE_TelligentEvolutionOptions.MediaMaxWidth > 0) // max width
				data.renderedWidth = tinyMCE_TelligentEvolutionOptions.MediaMaxWidth;

			if (data.renderedHeight > tinyMCE_TelligentEvolutionOptions.MediaMaxHeight && tinyMCE_TelligentEvolutionOptions.MediaMaxHeight > 0) // max height
				data.renderedHeight = tinyMCE_TelligentEvolutionOptions.MediaMaxHeight;
		}
	});

	// Register plugin
	tinymce.PluginManager.add('insertmedia', tinymce.plugins.InsertMediaPlugin);
})();
