/**
 * Moderation Menu
 *
 * Triggers event: evolutionModerateLinkClicked on any addditional link clicked in addition to moderation links
 * to allow other included links to have relevance
 * also raises 'ui.reportabuse' and 'ui.unreportabuse' messages
 */
(function($){

    var flagEvent = 'ui.reportabuse',
        TE = $.telligent.evolution,
        linkClickedEventName = 'evolutionModerateLinkClicked',
        flag = function(context) {
            context.settings.onReport(context.settings.contentId, context.settings.contentTypeId,
                function(response){
                    TE.messaging.publish(flagEvent, {
                        contentId: context.settings.contentId,
                        contentTypeId: context.settings.contentTypeId
                    });
                    showNotification(context, response.Report);
                });
        },
		clearHideTimer = function(context) {
			if (context.hideTimer) {
				clearTimeout(context.hideTimer);
				context.hideTimer = null;
			}
		}
        buildModerationLink = function(context) {
            context.moderationLink = $(TE.template.compile(context.settings.moderationLinkTemplate)({
				linkClassName: context.settings.linkClassName,
                resources: {
                    moderateLinkText: context.settings.moderateLinkText
                }
            })).appendTo(context.element);
        },
        buildModerationPopup = function(context) {
            context.popup = $('<div></div>').glowPopUpPanel({
                cssClass: 'content-moderation',
                position: 'downleft',
                zIndex: 1000,
                hideOnDocumentClick: true
            });
			context.popup.bind({
				glowPopUpPanelShown: function(e) {
					context.moderationLink.addClass('open');
				},
				glowPopUpPanelHidden: function(e){
					context.moderationLink.removeClass('open');
				}
			});
        },
        buildModerationMenuContent = function(context, complete) {
            context.settings.onGetAdditionalLinks(function(additionalLinks) {
                var links = [];
                if(context.settings.initialState) {  // show unflag link
                    links = additionalLinks.concat([
                        { href:'#', className:'evolutionModerateFlagged', text:context.settings.reportedLinkText }
                    ]);
                } else {  // show flag link
                    links = additionalLinks.concat([
                        { href:'#', className:'evolutionModerateFlag', text:context.settings.reportLinkText }
                    ]);
                }
                var menuContent = $(TE.template.compile(context.settings.moderationMenuTemplate)({ links: links }));
                menuContent.bind('mouseleave',function(e){
                    hideMenu(context);
                });
				menuContent.bind('mouseenter',function(e){
					clearHideTimer(context);
				});
                menuContent.delegate('a','click', function(e) {
                    var target= $(e.target);
                    if(target.hasClass('evolutionModerateFlag')) {
                        e.preventDefault();
                        flag(context);
                    } else if(target.hasClass('evolutionModerateFlagged')) {
                        e.preventDefault();
                    } else {
                        if(target.attr('href') === '#') {
                            e.preventDefault();
                        }
                        context.element.trigger(linkClickedEventName, e.target);
                    }
                });
                complete(menuContent);
            });
        },
        showMenu = function(context) {
            if(!context.popup) {
                buildModerationPopup(context);
            }
            buildModerationMenuContent(context, function(moderationMenuContent) {
				clearHideTimer(context);
                context.popup.glowPopUpPanel('html',moderationMenuContent)
                    .glowPopUpPanel('show',context.moderationLink);
            });
        },
		hideMenu = function(context) {
			if (!context.hideTimer)
				context.hideTimer = setTimeout(function() {
					context.popup.glowPopUpPanel('hide');
					context.hideTimer = null;
				}, 200);
		},
        formatNotificationMessage = function(context, report) {
            return context.settings.reportedNotificationMessageText.replace(/\{NAME\}/gi,
                report && report.AuthorUser && report.AuthorUser.DisplayName ? report.AuthorUser.DisplayName : '');
        },
        showNotification = function(context, report) {
            var notificationContent = TE.template.compile(context.settings.notificationTemplate)({
                resources: {
                    reportedNotificationMessageText: formatNotificationMessage(context, report),
                    undoLinkText: context.settings.undoLinkText
                },
                contextId: context.contextId
            });
            TE.notifications.show(notificationContent, {
                type: 'moderation',
                duration: context.settings.notificationDuration,
				cssClass: ''
            });
        },
        handleFlagMessages = function(context) {
            TE.messaging.subscribe(flagEvent, function(e) {
                if(context.settings.contentId === e.contentId && context.settings.contentTypeId === e.contentTypeId) {
                    context.settings.initialState = true // change the state to flagged for showing subsequent menus
                }
            });
        },
        init = function(context) {
            buildModerationLink(context);
            context.moderationLink.bind({
                mouseenter: function(e) {
                    e.preventDefault();
                    if(context.popup && context.popup.glowPopUpPanel('isShown')) {
                        hideMenu(context);
                    } else {
                        showMenu(context);
                    }
					clearHideTimer(context);
                },
                mouseleave: function(e) {
                    if(!$(e.relatedTarget).is('.content-moderation') && $(e.relatedTarget).closest('.content-moderation').length === 0) {
                        hideMenu(context);
                    }
                }
            });
            handleFlagMessages(context);
        };

    $.fn.evolutionModerate = function(options) {
        var settings = $.extend({}, $.fn.evolutionModerate.defaults, options || {});
        return this.each(function(){
            var context = {
                element: $(this),
                settings: settings
            };
            init(context);
        });
    };
    $.fn.evolutionModerate.defaults = {
        contentId: '',
        contentTypeId: '',
        initialState: false,
		linkClassName: '',
        onReport: function(contentId, contentTypeId, complete) { },
        onGetAdditionalLinks: function(complete) { complete([]); },
        notificationDuration: 5000,
        moderateLinkText: 'moderate',
        reportLinkText: 'Flag as spam/abuse',
        reportedLinkText: 'Flagged as spam/abuse',
        reportedNotificationMessageText: "{NAME}'s post has been flagged. <strong>Thank you for your feedback.</strong>",
        undoLinkText: 'Undo',
        moderationLinkTemplate: '<a href="#" class="<%: linkClassName %>"><span></span><%= resources.moderateLinkText %></a>',
        moderationMenuTemplate: '' +
        '<ul class="navigation-list">' +
        '   <% foreach(links, function(link){ %>' +
        '       <li class="navigation-item">' +
        '           <a href="<%: (link.href || "#") %>" class="<%: (link.className || "") %>"><%= link.text %></a>' +
        '       </li>' +
        '   <% }); %>' +
        '</ul>',
        notificationTemplate: '<p><%= resources.reportedNotificationMessageText %></p>'
    };

}(jQuery));
