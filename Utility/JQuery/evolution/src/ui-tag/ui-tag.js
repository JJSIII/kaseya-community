(function($){

	var formatTags = function(tagsList, urlFormat, elm) {
		var c = $(elm);
		c.html('');

		if (!tagsList) {
			return;
		}

		var first = true;
		$.each(tagsList.split(/,/), function(i, v) {
			var t = $.trim(v);
			if (t) {
				if (first) {
					first = false;
				} else {
					c.append(", ");
				}
				if (!urlFormat) {
					c.append(t);
				} else {
					c.append($('<a rel="nofollow tag">').attr('href', urlFormat.replace(/{tag}/g, $.telligent.evolution.url.encodePathComponent($.telligent.evolution.html.decode(t)))).text(t));
				}
			}
		});
	};

	$.telligent.evolution.ui.components.tag = {
		setup: function() {
		},
		add: function(elm, options) {
			var tagsContainer = jQuery('<span></span>');
			$(elm).append(tagsContainer);
			formatTags(options.tags, options.urlformat, tagsContainer);

			var editTags = null;
			if (options.readonly !== 'true') {
				editTags = $('<a href="javascript:void(0);" class="internal-link edit-tags"></a>');
				$(elm).append(editTags);

				editTags.evolutionInlineTagEditor({
					allTags: $.grep(options.selectabletags.split(','), function(item) { return item; }),
					currentTags: $.grep(options.tags.split(','), function(item) { return item; }),
					onSave: function(tags, successFn) {
						var data = {
							Tags: tags && tags.length > 0 ? tags.join(',') : '',
							ContentId: options.contentid,
							ContentTypeId: options.contenttypeid
						};

						if (options.tagtypeid) {
							data.TypeId = options.tagtypeid;
						}

						$.telligent.evolution.put({
							url: $.telligent.evolution.site.getBaseUrl() + 'api.ashx/v2/contenttags.json',
							data: data,
							success: function(response) {
								formatTags(data.Tags, options.urlformat, tagsContainer);
								successFn();
							}
						});
					}
				});
			}
		}
	};

}(jQuery));