(function($){

    var boundHashChanges = {},
        subscribedPagingMessages = {},
        currentPageLoads = {},
        buildLinks = function(context) {
            var links = [],
                settings = context.settings,
                totalPages,
                modifyUrl = function(page) {
                    var query = {};
                    query[settings.pageKey] = page;
                    var mod = {
                        url: settings.baseUrl,
                        query: query
                    };
                    if(settings.hash && settings.hash.length > 0) {
                        mod[settings.hash] = settings.hash;
                    }
                    return $.telligent.evolution.url.modify(mod);
                };
            if(settings.totalItems === 0 || settings.pageSize === 0) {
                totalPages = 0;
            } else {
                totalPages = Math.floor(settings.totalItems / settings.pageSize);
                if(settings.totalItems % settings.pageSize > 0) {
                    totalPages = totalPages + 1;
                }
            }

            if(totalPages > 1) {
                // first
                if(settings.showFirst) {
                    if(settings.currentPage >= 3 && totalPages > settings.numberOfPagesToDisplay) {
                        links[links.length] = {
                            type: 'first',
                            selected: false,
                            page: 1,
                            url: modifyUrl(1)
                        };
                    }
                }
                // previous
                if(settings.showPrevious) {
                    if(settings.currentPage > 0) {
                        links[links.length] = {
                            type: 'previous',
                            selected: false,
                            page: settings.currentPage,
                            url: modifyUrl(settings.currentPage)
                        };
                    }
                }

                // individual page links
                if(settings.showIndividualPages) {
                    // determine lower bound
                    var start;
                    if(totalPages < settings.numberOfPagesToDisplay || settings.currentPage - Math.floor(settings.numberOfPagesToDisplay / 2) < 0) {
                        start = 0;
                    } else if(settings.currentPage + Math.floor(settings.numberOfPagesToDisplay / 2) >= totalPages) {
                        start = totalPages - settings.numberOfPagesToDisplay;
                    } else {
                        start = settings.currentPage - Math.floor(settings.numberOfPagesToDisplay / 2);
                    }

                    // determine upper bound
                    var end;
                    var lastBuffer = Math.floor(settings.numberOfPagesToDisplay / 2);
                    if(settings.numberOfPagesToDisplay % 2 === 0) {
                        lastBuffer = lastBuffer - 1;
                    }
                    if(totalPages < settings.numberOfPagesToDisplay || settings.currentPage + lastBuffer >= totalPages) {
                        end = totalPages - 1;
                    } else if(settings.currentPage - Math.floor(settings.numberOfPagesToDisplay / 2) < 0) {
                        end = settings.numberOfPagesToDisplay - 1;
                    } else {
                        end = settings.currentPage + lastBuffer;
                    }
                    // add links
                    var i;
                    for(i = start; i <= end; i++) {
                        links[links.length] = {
                            type: 'page',
                            selected: (settings.currentPage === i),
                            page: i + 1,
                            url: modifyUrl(i+1)
                        };
                    }
                }

                // next
                if(settings.showNext) {
                    if(settings.currentPage + 1 < totalPages) {
                        links[links.length] = {
                            type: 'next',
                            selected: false,
                            page: settings.currentPage + 2,
                            url: modifyUrl(settings.currentPage + 2)
                        };
                    }
                }

                // last
                if(settings.showLast) {
                    if(settings.currentPage + 3 < totalPages && totalPages > settings.numberOfPagesToDisplay) {
                        links[links.length] = {
                            type: 'last',
                            selected: false,
                            page: totalPages,
                            url: modifyUrl(totalPages)
                        };
                    }
                }
            }

            return links;
        },
        renderLinks = function(context) {
            var pagerHtml = context.template({ links: context.links });
            context.selection.html(pagerHtml);
        },
        initAjaxPaging = function(context) {
            subscribeToPagingMessages(context);
            bindToHashChanges(context);
            changeHashOnNavigation(context);
            loadInitialPage(context);
        },
        loadInitialPage = function(context) {
            // if there was already a page key in this query string's hash, pre-load that page
            var initialPage = parseInt($.telligent.evolution.url.hashData()[context.settings.pageKey], 10);
            if(!isNaN(initialPage) && initialPage !== context.settings.currentPage) {
                // don't allow page loads to stack up infinitely in case a pager was included on a callback
                if(currentPageLoads[context.settings.pageKey]) { return; }
                currentPageLoads[context.settings.pageKey] = true;
                // call the implementation of the paged content requestor
                context.settings.onPage(initialPage, function(response){
                    context.currentPageIndex = initialPage;
                    renderNewlyPagedContent(context, initialPage, 0, response, false);
                });
            };
        },
        changeHashOnNavigation = function(context) {
            // intercept paging link clicks and update the hash data
            $(context.selection).delegate('a','click',function(e){
                e.preventDefault();
                var link = $(this),
                    hashModification = {};
                hashModification[context.settings.pageKey] = link.data('page');
                $.telligent.evolution.url.hashData(hashModification);
            });
        },
        bindToHashChanges = function(context) {
            // only bind to a hash change once for a given key
            if(boundHashChanges[context.settings.pageKey]) { return; }
            boundHashChanges[context.settings.pageKey] = true;

            // listen for relevant hash changes related to page changes
            context.currentPageIndex = parseInt($.telligent.evolution.url.hashData()[context.settings.pageKey], 10);
            if(isNaN(context.currentPageIndex)) {
                context.currentPageIndex = context.settings.currentPage;
            }
            $(window).bind('hashchange', function(e){
                var newPageIndex = parseInt($.telligent.evolution.url.hashData()[context.settings.pageKey], 10);
                if(!isNaN(newPageIndex)) {
                    if(context.currentPageIndex === newPageIndex)
                        return;
                    context.newPageIndex = newPageIndex;
                    var dataToTrigger = {
                        currentPage: context.currentPageIndex,
                        newPage: context.newPageIndex,
                        container: context.settings.pagedContentContainer
                    };
                    // publish global message
                    $.telligent.evolution.messaging.publish(context.settings.pagedContentPagingEvent, dataToTrigger);
                    // raise local event on this plugin
                    context.selection.trigger('evolutionPagerPaging', dataToTrigger)
                    context.currentPageIndex = newPageIndex;
                }
            });
        },
        subscribeToPagingMessages = function(context) {
            // unsubscribe from previous subscriptions for this widget, if there were any
            if(subscribedPagingMessages[context.settings.pagedContentPagingEvent]) {
                context.currentPageIndex = parseInt($.telligent.evolution.url.hashData()[context.settings.pageKey], 10);
                $.telligent.evolution.messaging.unsubscribe(subscribedPagingMessages[context.settings.pagedContentPagingEvent]);
            }
            // subscribe to paging messages
            subscribedPagingMessages[context.settings.pagedContentPagingEvent] =
                $.telligent.evolution.messaging.subscribe(context.settings.pagedContentPagingEvent, function(data) {
                    // don't allow page loads to stack up infinitely in case a pager was included on a callback
                    if(currentPageLoads[context.settings.pageKey]) { return; }
                    currentPageLoads[context.settings.pageKey] = true;
                    // call the implementation of the paged content requestor
                    context.settings.onPage(data.newPage, function(response){
                        context.currentPageIndex = data.newPage;
                        renderNewlyPagedContent(context, data.newPage, data.currentPage, response, true);
                    })
                });
        },
        renderNewlyPagedContent = function(context, page, oldPage, content, shouldAnimate) {
            var publishPagedMessage = function() {
                var dataToTrigger = {
                    page: page,
                    container: context.settings.pagedContentContainer
                };
                // publish global message
                $.telligent.evolution.messaging.publish(context.settings.pagedContentPagedEvent, dataToTrigger);
                // raise local event on this plugin
                context.selection.trigger('evolutionPagerPaged', dataToTrigger)
            };
            // render content
            if(shouldAnimate && (context.settings.transition === 'slide' || context.settings.transition === 'fade')) {
                var transition = 'fade';
                if(context.settings.transition === 'slide') {
                    transition = page < oldPage ? 'slideRight' : 'slideLeft';
                }
                var container = $(context.settings.pagedContentContainer);
                var newContent = $('<div></div>')
                    .attr('id',container.attr('id'))
                    .html(content)
                    .hide()
                    .insertAfter(context.settings.pagedContentContainer);

                container.glowTransition(newContent, {
                    type: transition,
                    duration: context.settings.transitionDuration,
                    complete: function() {
                        $(context.settings.pagedContentContainer).css({width:'',height:'',overflow:'hidden'});
                        publishPagedMessage();
                        currentPageLoads[context.settings.pageKey] = false;
                    }
                });
            } else {
                $(context.settings.pagedContentContainer).html(content);
                publishPagedMessage();
                currentPageLoads[context.settings.pageKey] = false;
            }

            // update links
            context.settings.currentPage = page - 1;
            context.links = buildLinks(context);
            renderLinks(context);
        };

    $.fn.evolutionPager = function(options) {
        var settings = $.extend({}, $.fn.evolutionPager.defaults, options || {}),
            context = {
                selection: this,
                settings: settings,
                template: $.telligent.evolution.template.compile(settings.template)
            };
        context.links = buildLinks(context);

        renderLinks(context);

        if(settings.onPage && settings.pagedContentContainer &&
            settings.pagedContentContainer.length > 0)
        {
            initAjaxPaging(context);
        }

        return this;
    };
    $.fn.evolutionPager.defaults = {
        // normal options
        currentPage: 0,
        pageSize: 10,
        totalItems: 0,
        showPrevious: false,
        showNext: false,
        showFirst: true,
        showLast: true,
        showIndividualPages: true,
        numberOfPagesToDisplay: 5,
        pageKey: 'pi',
        hash: '',
        baseUrl: window.location.href,
        // ajax-specific options
        onPage: function(pageIndex, complete) { },
        pagedContentContainer: '',
        pagedContentPagingEvent: 'ui.page.paging',
        pagedContentPagedEvent: 'ui.page.paged',
        transition: null, // slide|fade|null
        transitionDuration: 250,
        // template
        template: '' +
        ' <% foreach(links, function(link, i) { %> ' +
        '     <% if(link.type === "first") { %> ' +
        '         <a href="<%: link.url %>" class="first" data-type="first" data-page="<%= link.page %>" data-selected="false"> ' +
        '             <span>&#171;</span> ' +
        '         </a> ' +
        '     <% } else if(link.type === "previous") { %> ' +
        '         <a href="<%: link.url %>" class="previous" data-type="previous" data-page="<%= link.page %>" data-selected="false"> ' +
        '             <span>&#60;</span> ' +
        '         </a> ' +
        '     <% } else if(link.type === "page") { %> ' +
        '         <a href="<%: link.url %>" class="page<%= link.selected ? " selected" : "" %>" data-type="page" data-page="<%= link.page %>" data-selected="<%= link.selected ? "true" : "false" %>"> ' +
        '             <span><%= link.page %></span> ' +
        '         </a> ' +
        '     <% } else if(link.type === "next") { %> ' +
        '         <a href="<%: link.url %>" class="next" data-type="next" data-page="<%= link.page %>" data-selected="false"> ' +
        '             <span>&#62;</span> ' +
        '         </a> ' +
        '     <% } else if(link.type === "last") { %> ' +
        '         <a href="<%: link.url %>" class="last" data-type="last" data-page="<%= link.page %>" data-selected="false"> ' +
        '             <span>&#187;</span> ' +
        '         </a> ' +
        '     <% } %> ' +
        '     <% if(i < (links.length - 1)) { %> ' +
        '         <span class="separator"></span> ' +
        '     <% } %> ' +
        ' <% }); %> '
    };

}(jQuery));

