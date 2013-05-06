(function () {
	var Node = tinymce.html.Node, JSON = tinymce.util.JSON;
	var inlineEditing = {
		visible: false,
		trigger: '#',
		triggerKeyCode: 51,
		triggered: false,
		maximumWordLength: 256,
		stopCharacters: /[-_~`!@#$%^&*()=+{[}\]\\|;:'",<.> \s\t]+/i
	};
	var hashtagsList = {
		container: null,
		selected: null,
		selectedIndex: -1
	}
	var DOWN_ARROW_KEY = 40;
	var UP_ARROW_KEY = 38;
	var ESC_KEY = 27;
	var ENTER_KEY = 13;
	var BACKSPACE_KEY = 8;
	var DELETE_KEY = 46;
	var nodeId = 1;

	var hashtagsSupported = {};

	tinymce.PluginManager.requireLangPack('hashtags');

	tinymce.create('tinymce.plugins.HashtagsPlugin', {
		init: function (ed, url) {
			var self = this, i, disabledState;

			self.editor = ed;
			self.url = url;

			ed.contentCSS[ed.contentCSS.length] = url + '/css/content.css';
			var link = document.createElement('link');
			link.type = 'text/css';
			link.href = url + '/css/ui.css';
			link.rel = 'stylesheet';
			window.document.body.appendChild(link);

			// preload hashtags support
			self.supportsHashtags(ed);

			ed.onPreInit.add(function () {
				ed.parser.addNodeFilter('#text', function (nodes) {
					var i = nodes.length;
					while (i--)
						self.textToSpan(nodes[i]);
				});

				ed.serializer.addNodeFilter('span', function (nodes, name, args) {
					var i = nodes.length, node;

					while (i--) {
						node = nodes[i];
						if ((node.attr('class') || '').indexOf('mceHashtag') !== -1)
							self.spanToObject(node, args);
					}
				});
			});

			ed.onInit.add(function () {
				if (ed.theme && ed.theme.onResolveName) {
					ed.theme.onResolveName.add(function (theme, path_object) {
						if (path_object.name === 'span' && ed.dom.hasClass(path_object.node, 'mceHashtag'))
							path_object.name = 'hashtag';
					});
				}
				if (ed && ed.plugins.contextmenu) {
					ed.plugins.contextmenu.onContextMenu.add(function (plugin, menu, element) {
						if (self.supportsHashtags(ed) && element.nodeName === 'SPAN' && element.className.indexOf('mceHashtag') !== -1) {
							menu.add({ title: 'hashtags.remove', cmd: 'mceRemoveHashtag' });
						}
					});
				}
				if (ed) {
					ed.onNodeChange.addToTop(function (ed, cm, n) {
						var sc, ec;

						sc = ed.dom.getParent(ed.selection.getStart(), function (n) {
							return ed.dom.hasClass(n, 'mceHashtag');
						});

						ec = ed.dom.getParent(ed.selection.getEnd(), function (n) {
							return ed.dom.hasClass(n, 'mceHashtag');
						});

						if (sc || ec) {
							disabledState = 1;
							self.setDisabled(1);
						} else if (disabledState == 1) {
							self.setDisabled(0);
							disabledState = 0;
						}
					});
					ed.onKeyDown.addToTop(function (ed, e) {
						if (self.supportsHashtags(ed)) {
							return self.handleKeyDown(ed, e);
						}
					});

					ed.onKeyUp.add(function (ed, e) {
						if (self.supportsHashtags(ed)) {
							return self.handleKeyUp(ed, e);
						}
					});

					ed.onClick.add(function (ed, e) {
						if (self.supportsHashtags(ed)) {
							self.hideHashtags();
						}
					});
				}
			});

			ed.addCommand('mceRemoveHashtag', function () {
				var data, span;

				span = ed.selection.getNode();
				if (self.isHashtagSpan(span)) {
					data = ed.dom.getAttrib(span, 'data-mce-json');
					if (data) {
						data = JSON.parse(data);
					}
				}

				if (data) {
					ed.dom.setOuterHTML(span, span.innerHTML);
				}
			});
		},

		supportsHashtags: function (ed) {
			var contentTypeId = ed.getParam('evolution_contenttypeid');

			if (!contentTypeId)
				return false;

			if (!hashtagsSupported[contentTypeId]) {
				this.getSupportsHashtags(contentTypeId, function (supported) {
					hashtagsSupported[contentTypeId] = supported;
				});
			}

			return hashtagsSupported[contentTypeId] == 'true';
		},

		handleKeyDown: function (ed, e) {
			if (inlineEditing.visible) {
				if (e.keyCode == DOWN_ARROW_KEY) {
					this.highlightNextHashtag();
					return tinymce.dom.Event.cancel(e);
				}
				if (e.keyCode == UP_ARROW_KEY) {
					this.highlightPreviousHashtag();
					return tinymce.dom.Event.cancel(e);
				}
				if (e.keyCode == ENTER_KEY) {
					this.selectHashtag(ed, this.getCurrentWord(ed));
					inlineEditing.triggered = false;
					return tinymce.dom.Event.cancel(e);
				}
				if (e.keyCode == ESC_KEY) {
					inlineEditing.triggered = false;
					this.hideHashtags();
					return tinymce.dom.Event.cancel(e);
				}
			}
		},

		handleKeyUp: function (ed, e) {
			if (inlineEditing.visible || inlineEditing.triggered || e.keyCode == inlineEditing.triggerKeyCode) {
				if (e.keyCode != DOWN_ARROW_KEY && e.keyCode != UP_ARROW_KEY && e.keyCode != ENTER_KEY && e.keyCode != ESC_KEY) {
					var currentWord = this.getCurrentWord(ed);
					if (!inlineEditing.triggered) {
						inlineEditing.lastQuerySuccessful = true;
						inlineEditing.lastSuccessfulQuery = '';
					}
					if (currentWord.length > inlineEditing.maximumWordLength || currentWord == '' || inlineEditing.stopCharacters.test(currentWord.substr(1))) {
						inlineEditing.triggered = false;
						this.hideHashtags();
					} else {
						inlineEditing.triggered = true;
						if (currentWord.length > 2 && (inlineEditing.lastQuerySuccessful || currentWord.length - 1 <= inlineEditing.lastSuccessfulQuery.length || currentWord.substr(1, inlineEditing.lastSuccessfulQuery.length) != inlineEditing.lastSuccessfulQuery)) {
							inlineEditing.visible = true;
							this.showHashtags(ed, currentWord.substr(1));
						} else {
							this.hideHashtags();
						}
					}
				}
			}
		},

		highlightNextHashtag: function () {
			if (hashtagsList.container && hashtagsList.selected && hashtagsList.container.childNodes[0].childNodes.length > hashtagsList.selectedIndex + 1) {
				hashtagsList.selected.className = '';
				hashtagsList.selectedIndex++;
				hashtagsList.selected = hashtagsList.container.childNodes[0].childNodes[hashtagsList.selectedIndex];
				hashtagsList.selected.className = 'mceHashtagsSelected';
			}
		},

		highlightPreviousHashtag: function () {
			if (hashtagsList.container && hashtagsList.selected && hashtagsList.container.childNodes[0].childNodes.length > 0 && hashtagsList.selectedIndex > 0) {
				hashtagsList.selected.className = '';
				hashtagsList.selectedIndex--;
				hashtagsList.selected = hashtagsList.container.childNodes[0].childNodes[hashtagsList.selectedIndex];
				hashtagsList.selected.className = 'mceHashtagsSelected';
			}
		},

		setHighlightdHashtag: function (index) {
			if (hashtagsList.container && hashtagsList.selected && hashtagsList.container.childNodes[0].childNodes.length > index && index >= 0) {
				hashtagsList.selected.className = '';
				hashtagsList.selectedIndex = index;
				hashtagsList.selected = hashtagsList.container.childNodes[0].childNodes[hashtagsList.selectedIndex];
				hashtagsList.selected.className = 'mceHashtagsSelected';
			}
		},

		showHashtags: function (ed, text) {
			var self = this;

			if (!hashtagsList.container) {
				hashtagsList.container = document.createElement('div');
				ed.dom.setAttrib(hashtagsList.container, 'class', 'mceHashtagsList');
				ed.dom.setAttrib(hashtagsList.container, 'style', 'position:absolute; z-index: 200001;');

				var ul = document.createElement('ul');
				hashtagsList.container.appendChild(ul);

				document.body.appendChild(hashtagsList.container);
			}

			hashtagsList.selected = null;
			hashtagsList.container.childNodes[0].innerHTML = '';

			var li = document.createElement('li');
			li.innerHTML = self.editor.getLang('hashtags.loading', 'Loading...');
			hashtagsList.container.childNodes[0].appendChild(li);

			hashtagsList.container.style.display = 'block';

			var tinymceScroll = this.getWindowScrollOffset(window);
			var tinymcePosition = ed.dom.getPos(ed.getContentAreaContainer());
			var nodeScroll = this.getWindowScrollOffset(ed.getWin());
			var nodePosition = ed.dom.getPos(ed.selection.getNode());
			var textareaTop = 0;
			var textareaLeft = 0;
			var range = ed.selection.getRng();
			if (range.expand)
				range.expand('word');

			var rect = null;
			if (range.getClientRects().length == 0) {
				var node = ed.getWin().document.createElement('span');
				range.insertNode(node);
				var pos = ed.dom.getPos(node);
				rect = {
					left: pos.x,
					top: pos.y,
					width: 0,
					height: node.offsetHeight
				};
				node.parentNode.removeChild(node);
			}
			else
				rect = range.getClientRects()[0];

			if (rect) {
				textareaTop = rect.top + rect.height;
				textareaLeft = rect.left;
			} else {
				textareaTop = (parseInt(ed.dom.getStyle(ed.selection.getNode(), 'font-size', true)) * 1.3) + nodePosition.y;
				textareaLeft = nodePosition.x;
			}

			hashtagsList.container.style.top = (tinymcePosition.y + tinymceScroll.y + textareaTop - nodeScroll.y) + 'px';
			hashtagsList.container.style.left = (tinymcePosition.x + tinymceScroll.x + textareaLeft - nodeScroll.x) + 'px';

			hashtagsList.lastSearchText = text;
			window.clearTimeout(hashtagsList.searchHandle);
			var bookmark = ed.selection.getBookmark(1);
			hashtagsList.searchHandle = window.setTimeout(function () {
				self.searchForHashtags(text, function (searchText, hashtags) {
					if (hashtagsList.lastSearchText != searchText)
						return;

					hashtagsList.selected = null;
					hashtagsList.container.childNodes[0].innerHTML = '';

					if (!hashtags || hashtags.length == 0) {
						if (inlineEditing.lastQuerySuccessful) {
							inlineEditing.lastSuccessfulQuery = searchText.substr(0, searchText.length - 1);
							inlineEditing.lastQuerySuccessful = false;
						}
						self.hideHashtags();
						return;
					}

					inlineEditing.lastQuerySuccessful = true;
					inlineEditing.lastSuccessfulQuery = searchText;

					for (var i = 0; i < hashtags.length; i++) {
						li = document.createElement('li');
						li.style.cursor = 'pointer';
						li.innerHTML = hashtags[i].previewhtml;
						li.onclick = function () {
							ed.selection.moveToBookmark(bookmark);
							self.selectHashtag(ed, self.getCurrentWord(ed));
						};
						li.onmouseover = function () {
							self.setHighlightdHashtag(parseInt(ed.dom.getAttrib(this, 'data-index')));
						};
						ed.dom.setAttrib(li, 'data-index', i);
						ed.dom.setAttrib(li, 'data-tagname', hashtags[i].name);
						hashtagsList.container.childNodes[0].appendChild(li);

						if (!hashtagsList.selected) {
							hashtagsList.selectedIndex = i;
							hashtagsList.selected = li;
							hashtagsList.selected.className = 'mceHashtagsSelected';
						}
					}
				});
			}, 249);
		},

		hideHashtags: function (ed) {
			if (hashtagsList.container) {
				hashtagsList.container.style.display = 'none';
				hashtagsList.selected = null;
				hashtagsList.selectedIndex = -1;
			}
			inlineEditing.visible = false;
		},

		getCurrentWord: function (ed) {
			var nodeText = ed.selection.getSel().focusNode == null ? "" : ed.selection.getSel().focusNode.nodeValue;
			var positionInNode = ed.selection.getSel().focusOffset - 1;
			if (nodeText == null || nodeText.length == 0) {
				return "";
			}
			var lastDelimiter = 0;
			for (var i = positionInNode; i >= 0; i--) {
				if (nodeText.charAt(i) == inlineEditing.trigger) {
					lastDelimiter = i;
					break;
				}
			}
			var word = nodeText.substr(lastDelimiter, (positionInNode + 1) - lastDelimiter);
			if (word.length > 0 && word.charAt(0).toString() == inlineEditing.trigger) {
				return word;
			}
			return "";
		},

		selectHashtag: function (ed, matchedText) {
			// modify the range to replace overwrite the option text that has already been entered
			if (matchedText.length <= 0 || !hashtagsList.selected)
				return;

			var range = ed.selection.getRng();
			range.setStart(range.startContainer, range.startOffset - matchedText.length);
			ed.selection.setRng(range);

			var data = {
				id: 'mceHashtag' + (new Date()).getTime(),
				tagName: ed.dom.getAttrib(hashtagsList.selected, 'data-tagname')
			}

			ed.selection.setContent('<span class="mceItem mceHashtag" id="' + data.id + '" data-mce-json="' + JSON.serialize(data, "'") + '">' + hashtagsList.selected.innerHTML + '</span>');

			this.hideHashtags();
		},

		isHashtagSpan: function (span) {
			return span && span.nodeName === 'SPAN' && this.editor.dom.hasClass(span, 'mceHashtag')
		},

		blockEditing: function (ed, e) {
			var k = e.keyCode;

			// Don't block arrow keys, pg up/down, and F1-F12
			if ((k > 32 && k < 41) || (k > 111 && k < 124)) {
				return;
			}
			else if (k == BACKSPACE_KEY || k == DELETE_KEY) {
				ed.execCommand('mceRemoveHashtag');
			}
			else {
				var n = ed.dom.getParent(ed.selection.getStart(), function (n) {
					return ed.dom.hasClass(n, 'mceHashtag');
				});

				if (!n) {
					n = ed.dom.getParent(ed.selection.getEnd(), function (n) {
						return ed.dom.hasClass(n, 'mceHashtag');
					});
				}

				if (n) {
					if (e.type == 'keydown' && (k > 46 || k == 32 || k == 13) && !(k >= 144 && k <= 145) && !(k >= 91 && k <= 92)) {
						if (k == 32 || k == 13) {
							var tn = document.createTextNode('|');
							ed.dom.insertAfter(tn, n);
							ed.selection.select(tn, true);
							ed.selection.setContent('&nbsp;');
							ed.nodeChanged({});
						} else {
							var tn = document.createTextNode('|');
							ed.dom.insertAfter(tn, n);
							ed.selection.select(tn, true);
							ed.nodeChanged({});
							return;
						}
					}
				}
				else
					return;
			}

			return tinymce.dom.Event.cancel(e);
		},

		setDisabled: function (s) {
			var t = this, ed = t.editor;

			tinymce.each(ed.controlManager.controls, function (c) {
				c.setDisabled(s);
			});

			if (s !== t.disabled) {
				if (s) {
					ed.onKeyDown.addToTop(t.blockEditing);
					ed.onKeyPress.addToTop(t.blockEditing);
					ed.onKeyUp.addToTop(t.blockEditing);
					ed.onPaste.addToTop(t.blockEditing);
				} else {
					ed.onKeyDown.remove(t.blockEditing);
					ed.onKeyPress.remove(t.blockEditing);
					ed.onKeyUp.remove(t.blockEditing);
					ed.onPaste.remove(t.blockEditing);
				}

				t.disabled = s;
			}
		},

		getInfo: function () {
			return {
				longname: 'Hashtags',
				author: 'Telligent',
				authorurl: 'http://telligent.com',
				version: '7.0'
			};
		},

		spanToObject: function (node, args) {
			var self = this, editor = self.editor, data, n;

			data = node.attr('data-mce-json');
			if (!data)
				return;

			data = JSON.parse(data);

			if (data.tagName) {
				n = new Node('#text', 3);
				n.raw = true;
				n.value = '[tag:' + data.tagName + ']';
			}

			if (n)
				node.replace(n);
			else
				node.remove();
		},

		textToSpan: function (node) {
			var self = this, editor = self.editor;

			// If node isn't in document
			if (!node.parent)
				return;

			var rn = new Node('div');
			var re = /\[tag:([^\]]+)\]/g;
			var result;
			var lastIndex = 0;
			while (result = re.exec(node.value)) {
				(function () {
					var data = {
						id: 'mceHashtag' + nodeId,
						tagName: result[1]
					}

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

					var span = new Node('span', 1);
					rn.append(span);

					span.attr({
						'id': data.id,
						'class': 'mceItem mceHashtag',
						"data-mce-json": JSON.serialize(data, "'")
					});

					var tn2 = new Node('#text', 3);
					tn2.raw = true;
					tn2.value = self.editor.getLang('hashtags.no_preview', '???');
					span.append(tn2);

					self.getHashtagPreview(data, function (html) {
						var e = editor.dom.get(data.id);
						if (e)
							e.innerHTML = html
					});
				})();

				lastIndex = re.lastIndex;
				nodeId++;
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

		getWindowScrollOffset: function (w) {
			if (typeof (w.pageXOffset) == 'number') {
				//Netscape compliant
				scrollX = w.pageXOffset;
				scrollY = w.pageYOffset;
			}
			else if (w.document.body && (w.document.body.scrollLeft || w.document.body.scrollTop)) {
				//DOM compliant
				scrollX = w.document.body.scrollLeft;
				scrollY = w.document.body.scrollTop;
			}
			else if (w.document.documentElement && (w.document.documentElement.scrollLeft || w.document.documentElement.scrollTop)) {
				//IE6 standards compliant mode
				scrollX = document.documentElement.scrollLeft;
				scrollY = document.documentElement.scrollTop;
			}

			return { x: scrollX, y: scrollY };
		},

		getHashtagPreview: function (data, callback) {
			var self = this;
			if (!data.tagName)
				callback('');
			else
				tinymce.util.XHR.send({
					url: self.getCallbackUrl({ t: 'p', tagname: data.tagName }),
					success: function (r) {
						var o = tinymce.util.JSON.parse(r);
						try {
							if (o && o.html)
								callback(o.html);
							else
								callback('');
						} catch (e) { }
					},
					error: function (r) {
						try {
							callback('');
						} catch (e) { }
					}
				});
		},

		getSupportsHashtags: function (contentTypeId, callback) {
			var self = this;
			tinymce.util.XHR.send({
				url: self.getCallbackUrl({ t: 'm', contenttypeid: contentTypeId }),
				success: function (r) {
					var o = tinymce.util.JSON.parse(r);
					try {
						if (o && o.supported)
							callback(o.supported);
						else
							callback('false');
					} catch (e) { }
				},
				error: function (r) {
					try {
						callback('false');
					} catch (e) { }
				}
			});
		},

		searchForHashtags: function (searchText, callback) {
			var self = this;
			tinymce.util.XHR.send({
				url: self.getCallbackUrl({ t: 's', query: searchText }),
				success: function (r) {
					var o = tinymce.util.JSON.parse(r);
					try {
						if (o && o.hashtags)
							callback(searchText, o.hashtags);
						else
							callback(searchText, null);
					} catch (e) { }
				},
				error: function (r) {
					try {
						callback(searchText, null);
					} catch (e) { }
				}
			});
		},

		getCallbackUrl: function (params) {
			var self = this;
			var url = self.url + '/ajax/hashtags.ashx?';

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
		}
	});

	// Register plugin
	tinymce.PluginManager.add('hashtags', tinymce.plugins.HashtagsPlugin);
})();
