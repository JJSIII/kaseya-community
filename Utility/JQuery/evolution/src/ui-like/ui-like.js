/* like UI component */
(function($){

    var getCurrentCount = function(contentId, contentTypeId, typeId, complete) {
        $.telligent.evolution.get({
            url: $.telligent.evolution.site.getBaseUrl() + 'api.ashx/v2/likes.json',
            data: {
                ContentId: contentId,
                ContentTypeId: contentTypeId,
                TypeId: typeId,
                SortBy: 'Date',
                SortOrder: 'Descending',
                PageSize: 1,
                PageIndex: 0
            },
            cache: false,
            dataType: 'json',
            success: function(response) {
                complete.call(this, {
                    count: response.TotalCount,
                    latestLike: response.Likes.length > 0 ? response.Likes[0] : null
                });
            }
        });
    };

    $.telligent.evolution.ui.components.like = {
        // set up efficient event-delegated handling of showing/hiding who likes popups
        setup: function() {
            $.fn.evolutionLike.delegatePopups({
                containerSelector: '.content-fragment',
                delegatedSelector: '.ui-like',
                onList: function(contentId, contentTypeId, typeId, complete, pageSize, pageIndex) {
                    $.telligent.evolution.get({
                        url: $.telligent.evolution.site.getBaseUrl() + 'api.ashx/v2/likes.json',
                        data: {
                            ContentId: contentId,
                            ContentTypeId: contentTypeId,
                            TypeId: typeId,
                            SortBy: 'Date',
                            SortOrder: 'Descending',
                            PageSize: pageSize || 20,
                            PageIndex: pageIndex || 0
                        },
                        cache: false,
                        dataType: 'json',
                        success: function(response) {
                            complete({
                                likers: $.map(response.Likes, function(like) {
                                    var liker = {
                                        displayName: like.User.DisplayName,
                                        profileUrl: like.User.ProfileUrl,
                                        avatarUrl: like.User.AvatarUrl
                                    };
                                    return liker;
                                }),
                                hasMorePages: (((response.PageIndex + 1) * response.PageSize) < response.TotalCount)
                            });
                        }
                    });
                },
                onOptions: function(elm) {
                    var data = $.telligent.evolution.ui.data(elm);
                    var parsedData = {
                        contentId: data.contentid,
                        contentTypeId: data.contenttypeid,
                        typeId: data.configuration.LikeTypeId
                    };
                    return parsedData;
                },
                likersTemplate: '' +
                    ' <% foreach(likers, function(liker) { %> ' +
                    '     <li class="content-item"> ' +
                    '         <div class="full-post-header"></div> ' +
                    '         <div class="full-post"> ' +
                    '             <span class="avatar"> ' +
                    '                 <a href="<%: liker.profileUrl %>"  class="internal-link view-user-profile"> ' +
                    '                     <img src="<%: liker.avatarUrl %>" alt="" border="0" width="32" height="32" style="width:32px;height:32px" /> ' +
                    '                 </a> ' +
                    '             </span> ' +
                    '             <span class="user-name"> ' +
                    '                 <a href="<%: liker.profileUrl %>" class="internal-link view-user-profile"><%= liker.displayName %></a> ' +
                    '             </span> ' +
                    '         </div> ' +
                    '         <div class="full-post-footer"></div> ' +
                    '     </li> ' +
                    ' <% }); %> ',
                likersPopupTemplate: '' +
                    ' <div class="who-likes-list"> ' +
                    '     <div class="content-list-header"></div> ' +
                    '     <ul class="content-list"><%= likers %></ul> ' +
                    '     <div class="content-list-footer"></div> ' +
                    '     <% if(hasMorePages) { %> ' +
                    '         <a href="#" class="show-more"><%= showMoreText %></a>' +
                    '     <% } %> ' +
                    ' </div> '
            });
        },
        // set up instances of bus-bound like toggles/counts/messages
        add: function(elm, options) {
            var readOnly = options.readonly === 'true';
            $(elm).evolutionLike({
                contentId: options.contentid,
                contentTypeId: options.contenttypeid,
                initialState: options.initialstate,
                initialMessage: options.initialmessage,
                initialCount: options.initialcount,
                format: (readOnly ? options.format.replace('{toggle}','') : options.format),
                typeId: options.configuration.LikeTypeId,
                onLike: function(contentId, contentTypeId, typeId, complete) {
                    var data = {
                        ContentId: contentId,
                        ContentTypeId: contentTypeId
                    };
                    if(typeId !== null && typeId.length > 0) {
                        data.TypeId = typeId;
                    }
                    $.telligent.evolution.post({
                        url: $.telligent.evolution.site.getBaseUrl() + 'api.ashx/v2/likes.json',
                        data: data,
                        cache: false,
                        dataType: 'json',
                        success: function(response) {
                            getCurrentCount(contentId, contentTypeId, typeId, complete);
                        }
                    });
                },
                onUnlike: function(contentId, contentTypeId, typeId, complete) {
                    var data = {
                        ContentId: contentId
                    };
                    if(typeId !== null && typeId.length > 0) {
                        data.TypeId = typeId;
                    }
                    $.telligent.evolution.del({
                        url: $.telligent.evolution.site.getBaseUrl() + 'api.ashx/v2/like.json',
                        data: data,
                        cache: false,
                        dataType: 'json',
                        success: function(response) {
                            getCurrentCount(contentId, contentTypeId, typeId, complete);
                        }
                    });
                }
            });
        }
    };

}(jQuery));