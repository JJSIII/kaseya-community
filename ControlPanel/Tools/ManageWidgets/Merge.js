(function ($, g) {

    var innerUploadError,
        innerUploadComplete,
        innerUploadStarted;

    // expose stub modal callbacks globally for availability to the modal control
    $.extend(window, {
        uploadError: function () { innerUploadError(); },
        uploadComplete: function () { innerUploadComplete(); },
        uploadStarted: function () { innerUploadStarted(); }
    });

	var buildContext = function(selection, settings) {
			var context = {
				selection: selection,
				settings: settings,
				saveSelector: $(settings.saveSelector),
				processingSelector: $(settings.processingSelector),
				mergeContainer: $(settings.selection),
				enabled: false
			};
			return context;
		},
		registerEvents = function(context) {
			if(context.settings.mode === 'ScriptedContentFragmentImport' ||
				context.settings.mode === 'ResourceImport' ||
				context.settings.mode === 'ThemeImport') {

	            innerUploadError = function () {
	                isUploaded = false;
	                context.selection.trigger('uploadError', { type: 'import' });
	            };
				// implement behavior for when an upload is complete
	            innerUploadComplete = function () {
	                isUploaded = true;
	                context.selection.trigger('uploaded');
	                // once uploaded, ask for information about collisions in the import before actually importing
	                context.selection.trigger('mergeDataLoading');
                    $.ajax({
                        url: 'Merge.ashx',
                        type: 'POST',
	                    data: {
                            method: 'ProcessUpload',
	                    	uploadContext: context.settings.uploadContext,
							mode: context.settings.mode
	                   	},
	                    success: function (data) {
	                    	var options = {
								data: data,
								mode: context.settings.mode
	                    	};
	                    	$.extend(options, context.settings.selectorResources);
							$(context.selection).themeMergingSelector(options);
	                        context.selection.trigger('mergeDataLoaded', data);
	                    },
						error: function(xhr) {
							context.selection.trigger('uploadError', { type: 'import' });
						}
                    });
	            };
				// implement behavior for when an upload has begun
	            innerUploadStarted = function () {
	                isUploaded = false;
	                context.selection.trigger('uploading');
	            };

	            context.selection.on('click change', 'input.all', function(e) {
	            	var all = $(e.target),
	            		inputs = $(e.target).closest('ul').find('input[type="checkbox"]');
	            	if(all.is(':checked')) {
	            		inputs.attr('checked','checked');
	            	} else {
	            		inputs.removeAttr('checked');
	            	}
	            });

				context.saveSelector.on('click', function(e){
					e.preventDefault();
					if(context.enabled) {
						context.selection.trigger('persisting');
						var mergeChoices = $(context.selection).themeMergingSelector('val');
                        $.ajax({
                            url: 'Merge.ashx',
                            type: 'POST',
		                    data: {
                                method: 'PersistUpload',
		                    	uploadContext: context.settings.uploadContext,
		                    	serializedMergeOptions: mergeChoices,
								mode: context.settings.mode
		                    },
		                    success: function (data) {
		                        context.selection.trigger('persisted', data);
		                    },
							error: function(xhr) {
								context.selection.trigger('persistError', { type: 'import' });
							}
                        });
					}
				});

			} else if(context.settings.mode === 'ScriptedContentFragmentRevert') {
                context.selection.trigger('mergeDataLoading');
                var getSelection = g.parent[context.settings.revertibleFragmentsCallback];
                if(!getSelection) {
                	alert('No Fragment Selection Callback specified');
                }
                var selection = g.parent[context.settings.revertibleFragmentsCallback]();
                $.ajax({
                    url: 'Merge.ashx',
                    type: 'POST',
                    data: {
                        method: 'ProcessRevertibleWidgets',
                    	scriptedContentFragmentIds: (selection.identifiers || []).join(','),
                    	themeName: selection.theme
                    },
                    success: function (data) {
                    	var options = {
							data: data,
							mode: context.settings.mode
                    	};
                    	$.extend(options, context.settings.selectorResources);
						$(context.selection).themeMergingSelector(options);
                        context.selection.trigger('mergeDataLoaded', data);
                    },
					error: function(xhr) {
						context.selection.trigger('uploadError', { type: 'revert' });
					}
                });

				context.saveSelector.on('click', function(e){
					e.preventDefault();
					context.selection.trigger('persisting');
					var mergeChoices = $(context.selection).themeMergingSelector('val');
                    $.ajax({
                        url: 'Merge.ashx',
                        type: 'POST',
	            		data: {
                            method: 'PersistRevert',
	                    	scriptedContentFragmentIds: (selection.identifiers || []).join(','),
	                    	themeName: selection.theme,
	                    	serializedMergeOptions: mergeChoices
	                    },
	                    success: function (data) {
	                        context.selection.trigger('persisted', data);
	                    },
						error: function(xhr) {
							context.selection.trigger('persistError', { type: 'revert' });
						}
                    });
				});
			}
		},
		handleEvents = function(context) {
			context.selection.on({
				uploading: function(e, data) {
					context.saveSelector.addClass('disabled');
					context.processingSelector.show();
				},
				uploaded: function(e, data) {
					var uploadWrapper = $(context.settings.uploadWrapperSelector);
					uploadWrapper.hide();
					context.processingSelector.hide();
				},
                persistError: function(e, data) {
                    if(data && data.type && data.type === 'revert')
                        alert(context.settings.selectorResources.text_PersistRevertError);
                    else
                        alert(context.settings.selectorResources.text_PersistImportError);
					context.enabled = true;
					context.saveSelector.removeClass('disabled');
					context.processingSelector.hide();
                },
				uploadError: function(e, data) {
                    if(data && data.type && data.type === 'revert')
                        alert(context.settings.selectorResources.text_ProcessRevertError);
                    else
                        alert(context.settings.selectorResources.text_UploadImportError);
                    context.enabled = false;
					context.saveSelector.addClass('disabled');
					context.processingSelector.hide();
				},
				mergeDataLoading: function(e, data) {
				},
				mergeDataLoaded: function(e, data) {
					context.enabled = true;
					context.saveSelector.removeClass('disabled');
				},
				persisting: function(e, data) {
					context.enabled = false;
					context.saveSelector.addClass('disabled');
					context.processingSelector.show();
				},
				persisted: function(e, data) {
					context.enabled = false;
					context.saveSelector.addClass('disabled');
					context.processingSelector.hide();
					try{
						if(window.parent[context.settings.callback]) {
							window.parent[context.settings.callback]();
						}
						window.parent.Telligent_Modal.Close(true);
					} catch(e) {}
				}
			})
		};

	$.fn.themeMerger = function(options) {
		var settings = $.extend({}, $.fn.themeMerger.defaults, options || {}),
			context = buildContext(this, settings);

		handleEvents(context);
		registerEvents(context);

		return this;
	};
	$.fn.themeMerger.defaults = {
		mode: 'ScriptedContentFragmentImport', //ScriptedContentFragmentImport|ScriptedContentFragmentRevert|ResourceImport|ThemeImport
		revertableFragmentIdentifiers: '',
        revertableFragmentTheme: '',
        uploadContext: '',
        saveSelector: '',
        callback: '',
        revertibleFragmentsCallback: '',
        selectorResources: {}
	};

})(jQuery, window);


(function($, g){

	var mergerContextKey = 'themeMergingSelectorContext',
		getContext = function(selection, options) {
			var context = selection.data(mergerContextKey);
			if(typeof context === 'undefined' || context === null) {
				context = buildContext(selection, options);
				selection.data(mergerContextKey, context);
			}
			return context;
		},
		buildContext = function(selection, options) {
			var context = {
				selection: selection,
				settings: $.extend({}, $.fn.themeMergingSelector.defaults, options || {})
			};
			return context;
		},
		initUi = function(context) {
			context.viewModel = buildViewModel(context);
			context.mergeTemplate = context.mergeTemplate ||
				$.telligent.evolution.template.compile(context.settings.mergeTemplate, {}, {
			    	open: '{%',
                	close: '%}'
				});
			var html = context.mergeTemplate(context.viewModel);
			context.selection.html(html);
		},
		handleEvents = function(context) {
			// widget merging options which affect all other widgets' selections
			$(context.selection).on('change', 'select.all', function(e){
				var select = $(e.target);

				var affectedSelector, wrapper, val = select.val();
				select.closest('ul').find('li.fragment select.' + select.data('affects')).each(function(){
					affectedSelector = $(this);
					affectedSelector.val(val);

					wrapper = $('#' + affectedSelector.data('fragment'));

					if(affectedSelector.hasClass('widgetResourceMergeOption')) {
						if(val === 'merge') {
							wrapper.addClass('withResourceMergeSummary');
						} else {
							wrapper.removeClass('withResourceMergeSummary withResourceMergeOptions')
						}
						return;
					}

					if(affectedSelector.hasClass('widgetMergeOption')) {
						if(val === 'merge') {
							wrapper.addClass('withMergeOptions');
						} else {
							wrapper.removeClass('withMergeOptions withResourceMergeOptions')
						}
						return;
					}
				});
			});

			$(context.selection).on('click', 'a.widgetResourceMergeSummary', function(e){
				e.preventDefault();
				var wrapper = $(e.target).closest('.fragment');
				if(wrapper.hasClass('withResourceMergeOptions')) {
					wrapper.removeClass('withResourceMergeOptions');
				} else {
					wrapper.addClass('withResourceMergeOptions');
					showResourceMerger(context, fragmentFromElement(context, wrapper), wrapper.find('div.widgetResourceMergeOptions'))
				}
				return false;
			});

			$(context.selection).on('change', 'select.widgetResourceMergeOption', function(e){
				var select = $(e.target);
				var wrapper = $('#' + select.data('fragment'));
				if(wrapper.length === 0) {
					wrapper = select.closest('li.all');
				}
				if(select.val() === 'merge') {
					wrapper.addClass('withResourceMergeSummary');
				} else {
					wrapper.removeClass('withResourceMergeSummary withResourceMergeOptions');
				}
			});

			$(context.selection).on('change', 'select.widgetMergeOption', function(e){
				var select = $(e.target);
				var wrapper = $('#' + select.data('fragment'));
				if(wrapper.length === 0) {
					wrapper = select.closest('li.all');
				}
				if(select.val() === 'merge') {
					wrapper.addClass('withMergeOptions');
				} else {
					wrapper.removeClass('withMergeOptions withResourceMergeOptions');
				}
			});
		},
		showResourceMerger = function(context, fragment, wrapper) {
			// if merger is already rendered, don't re-render it
			if(!fragment || wrapper.find('div:first').length > 0)
				return;
			context.resourceMergeTemplate = context.resourceMergeTemplate ||
				$.telligent.evolution.template.compile(context.settings.resourceMergeTemplate, {}, {
			    	open: '{%',
			    	close: '%}'
				});
			wrapper.html(context.resourceMergeTemplate(buildResourcesViewModel(context, fragment)));
		},
		buildViewModel = function(context) {
			var model = {
				fragments: {
					colliding: [],
					nonColliding: []
				},
				title: context.settings.data.Title,
                pages: {
					colliding: [],
					nonColliding: []
                },
				files: context.settings.data.Files || [],
				mode: context.settings.mode === 'ThemeImport' && !context.settings.data.AlreadyExists ? 'ThemeInstall' : context.settings.mode,
				text: { }
			};
			$.each(context.settings.data.ScriptedContentFragments || [], function(i, f) {
				if(f.AlreadyExists) {
					model.fragments.colliding.push(f);
				} else {
					model.fragments.nonColliding.push(f);
				}
			});
            $.each(context.settings.data.Pages || [], function(i, p) {
				if(p.AlreadyExists) {
					model.pages.colliding.push(p);
				} else {
					model.pages.nonColliding.push(p);
				}
            });
			return model;
		},
		filterResource = function(resources, language, encodedName) {
			var resource = null;
			var matchingResources = $.grep(resources, function(r) {
				return r.Language === language && r.EncodedKey === encodedName;
			});
			if(!matchingResources || matchingResources.length === 0) {
				resource = null;
			} else {
				resource = matchingResources[0];
			}
			return resource;
		},
		buildResourcesViewModel = function(context, fragment) {
			return {
				resources: {
					added: fragment.ResourcesAdded,
					existing: fragment.ResourcesExisting,
					colliding: fragment.ResourcesColliding,
					unchanged: fragment.ResourcesUnchanged,
				},
				fragmentId: fragment.Identifier,
				themeName: fragment.ThemeName,
				text: {}
			};
		},
		resourcesEqual = function(resource1, resource2) {
			if(resource1 === null || resource2 === null) {
				return false;
			}
			return (resource1.Language || '' === resource2.Langauge || '') && (resource1.Key || '' === resource2.Key || '');
		},
		exists = function(list, fn) {
			var i;
			for(i = 0; i < list.length; i++) {
				if(fn(list[i])) {
					return true;
				}
			}
			return false;
		},
		fragmentFromElement = function(context, elm) {
			var fragmentListItem;
			if(elm.is('li.fragment')) {
				fragmentListItem = elm;
			} else {
				fragmentListItem = elm.closest('li.fragment');
			}
			return fragmentFor(context, fragmentListItem.data('fragmentid'), fragmentListItem.data('themename'));
		},
		fragmentFor = function(context, fragmentid, theme) {
			context.fragmentCache = context.fragmentCache || {};
			var key = fragmentid + ':' + (theme || '');
			var fragment = context.fragmentCache[key];
			if(!fragment) {
				fragment = $.grep((context.settings.data.ScriptedContentFragments || []), function(f) { return f.Identifier === fragmentid && f.ThemeName === theme; })[0];
				context.fragmentCache[key] = fragment;
			}
			return fragment;
		},
		serialize = function(context) {
			var serialized = {};

			// theme

			// theme:import:header=true|false
			// theme:import:footer=true|false
			// theme:import:configuration=true|false
			// theme:page:[pagename]=true
			// theme:file:[property]:[filename]=true
			if(context.settings.mode === 'ThemeImport') {
				serialized['theme:import:header'] = context.selection.find('input.theme-header').is(':checked');
				serialized['theme:import:footer'] = context.selection.find('input.theme-footer').is(':checked');
				serialized['theme:import:configuration'] = context.selection.find('input.theme-configuration').is(':checked');
				$('li.fragment-page input', context.selection).each(function(){
					var input = $(this);
					if(input.is("[type='checkbox']")) {
						// selectable pages get the value of whether they were selected
						serialized['theme:page:' + input.data('page')] = input.is(':checked');
					} else if(input.is("[type='hidden']")) {
						// non-selectable pages are considered selected
						serialized['theme:page:' + input.data('page')] = true;
					}
				});
				$('li.file input', context.selection).each(function(){
					var input = $(this);
					serialized['theme:file:' + input.data('property') + ':' + input.data('filename')] = input.is(':checked');
				});
			}

			// fragments + resources

			// [widgetid]:[themename]:import=[new|merge|ignore]
			// [widgetid]:[themename]:implementation=[existing|new]
			// [widgetid]:[themename]:r:[langkey]:[name]=[value]

			$('li.fragment.noncolliding input', context.selection).each(function(){
				var input = $(this);
				var val = input.is(':checked') ? 'new' : 'ignore';
				serialized[input.data('identifier') + ':' + input.data('theme') + ':import'] = val;
			});

			$('li.fragment.merged', context.selection).each(function(){
				var fragmentItem = $(this),
					fragment = fragmentFromElement(context, fragmentItem);
					widgetMergeOption = fragmentItem.find('select.widgetMergeOption'),
					fragmentId = fragmentItem.data('fragmentid'),
					themeName = fragmentItem.data('themename'),
					keyPrefix = fragmentId + ':' + themeName;
				serialized[keyPrefix + ':import'] = widgetMergeOption.val();
				// if this fragment had a choice to merge or not, and merge was chosen, or there wasn't an option at all, process it
				if(widgetMergeOption.length === 0 || widgetMergeOption.val() === 'merge') {
					// whether this fragment supports implementation merging selection
					var widgetImplementationMergeOption = fragmentItem.find('select.widgetImplementationMergeOption');
					if(widgetImplementationMergeOption.length > 0) {
						serialized[keyPrefix + ':implementation'] = widgetImplementationMergeOption.val();
					}
					// fragment resources
					var widgetResourceMergeOption = fragmentItem.find('select.widgetResourceMergeOption');
					if(widgetResourceMergeOption.val() === 'new') {
						// use all new resources
						$.each(fragment.ResourcesAdded, function(i, resource) {
							serialized[keyPrefix + ':r:' + (resource.Language) + ':' + (resource.EncodedKey)] = resource.Value;
						});
						// use all new values for colliding
						$.each(fragment.ResourcesColliding, function(i, resource) {
							serialized[keyPrefix + ':r:' + (resource.Language) + ':' + (resource.EncodedKey)] = resource.NewValue;
						});
						// use all values for unchanged
						$.each(fragment.ResourcesUnchanged, function(i, resource) {
							serialized[keyPrefix + ':r:' + (resource.Language) + ':' + (resource.EncodedKey)] = resource.Value;
						});
					} else if(widgetResourceMergeOption.val() == 'merge') {
						// process merged resources with manual choices
						if(fragmentItem.find('div.widgetResourceMergeOptions div').length > 0) {
							// conflicted
							$('div.widgetResourceMergeOptionsConflicted tr.resource', fragmentItem).each(function(){
								var resourceRow = $(this),
									language = resourceRow.data('language'),
									key = resourceRow.data('name'),
									choice = resourceRow.find('input:checked').val(),
									resource = filterResource(fragment.ResourcesColliding, language, key),
									value = choice === 'new' ? resource.NewValue : resource.Value;
								serialized[keyPrefix + ':r:' + (language) + ':' + (key)] = value;
							});
							// added
							$('div.widgetResourceMergeOptionsNew tr.resource', fragmentItem).each(function(){
								var resourceRow = $(this),
									language = resourceRow.data('language'),
									key = resourceRow.data('name'),
									choice = resourceRow.find('select').val();
								if(choice === 'add') {
									var resource = filterResource(fragment.ResourcesAdded, language, key);
									serialized[keyPrefix + ':r:' + (language) + ':' + (key)] = resource.Value;
								}
							});
							// existing
							$('div.widgetResourceMergeOptionsRemoved tr.resource', fragmentItem).each(function(){
								var resourceRow = $(this),
									language = resourceRow.data('language'),
									key = resourceRow.data('name'),
									choice = resourceRow.find('select').val();
								if(choice === 'keep') {
									var resource = filterResource(fragment.ResourcesExisting, language, key);
									serialized[keyPrefix + ':r:' + (language) + ':' + (key)] = resource.Value;;
								}
							});
							// unchanged
							$('div.widgetResourceMergeOptionsUnchanged span.resource', fragmentItem).each(function(){
								var resourceRow = $(this),
									language = resourceRow.data('language'),
									key = resourceRow.data('name'),
									resource = filterResource(fragment.ResourcesUnchanged, language, key);
								serialized[keyPrefix + ':r:' + (language) + ':' + (key)] = resource.Value;
							});
						// process merged choices with default merge options
						// (adding new items, replacing conflicts with new, retaining deleted items, keeping unmodified)
						} else {
							// use all new resources
							$.each(fragment.ResourcesAdded, function(i, resource) {
								serialized[keyPrefix + ':r:' + (resource.Language) + ':' + (resource.EncodedKey)] = resource.Value;
							});
							// use all new values for colliding
							$.each(fragment.ResourcesColliding, function(i, resource) {
								serialized[keyPrefix + ':r:' + (resource.Language) + ':' + (resource.EncodedKey)] = resource.NewValue;
							});
							// use all values for unchanged
							$.each(fragment.ResourcesUnchanged, function(i, resource) {
								serialized[keyPrefix + ':r:' + (resource.Language) + ':' + (resource.EncodedKey)] = resource.Value;
							});
							// keep existing
							$.each(fragment.ResourcesExisting, function(i, resource) {
								serialized[keyPrefix + ':r:' + (resource.Language) + ':' + (resource.EncodedKey)] = resource.Value;
							});
						}
					}
				}
			});
			return $.param(serialized);
		};

	var methods = {
		init: function(options) {
			var context = getContext(this, options);
			initUi(context);
			handleEvents(context);
			return this;
		},
		val: function() {
			var context = getContext(this);
			return serialize(context);
		}
	};

	$.fn.themeMergingSelector = function(method) {
		if (methods[method]) {
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return methods.init.apply(this, arguments);
		} else {
			$.error('Method ' +	 method + ' does not exist on jQuery.themeMergingSelector');
		}
	};
	$.fn.themeMergingSelector.defaults = {
		mode: 'ScriptedContentFragmentImport',//ScriptedContentFragmentImport|ScriptedContentFragmentRevert|ResourceImport|ThemeImport,
		data: {},
		mergeTemplate: 'mergeTemplate',
		resourceMergeTemplate: 'resourceMergeTemplate'
	};

}(jQuery, window));