<%@ Page language="c#" EnableViewState = "false" Codebehind="Comments.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.CommentsPage" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>
<%@ Register TagPrefix="CPB" Namespace="Telligent.Evolution.ControlPanel.Blogs" Assembly="Telligent.Evolution.Web" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Blogs.Components" %>
<%@ Import Namespace="Telligent.Evolution.Extensibility.Api.Entities.Version1" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<TEControl:CSLiteral runat="server" id="CommentTitleLiteral" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Comments" runat="server" id="SelectedNavigation1" />
    <div class="CommonDescription">
	    <CP:ResourceControl runat="server" ResourceName="CP_Blog_Comments_SubTitle" />
    </div>

    <script type = "text/javascript">
    function redirectUrl()
    {
        var filterPost = document.getElementById("postId");
        var filterPublished = $('#<%=filterPublished.ClientID%>');
        var url = '<%= BlogUrls.Instance().AdminFeedback(CurrentWeblog.SectionID) %>&<%=WeblogQueryStringProperties.PostID%>=' + filterPost.value + '&ip=' + filterPublished.val();
        window.location = url; 
    }

    function checkAll(cb, parent)
    {
        var inputs = $('#' + parent).find("input[type='checkbox']");
        if ($(cb).is(':checked')) {
            inputs.attr('checked', 'checked');
        } else {
            inputs.removeAttr('checked');
        }
    }

	function confirmAction(msg)
	{
		return getSelectedCheckboxes().length > 0 && confirm(msg);
	}

	function getSelectedCheckboxes()
	{
		var arr = [];
		var pa = $("#CommentListing input[type='checkbox'][id!='master']");
		for (var i = 0; i < pa.length; i++)
		{
			if (pa[i].checked)
				arr.push(pa[i]);
		}
		return arr;
	}

	function bulkEdit(action)
	{
		var result = 'action=' + action + '&<%=WeblogQueryStringProperties.PostIDList %>=';
		var pa = getSelectedCheckboxes();
		if (pa.length == 0)
			return;
		var b = true;
		for (var i = 0; i < pa.length; i++)
		{
			var delimit = ',';
			if(b)
			{
				delimit = '';
				b = false;
			}
			result += pa[i].name.replace('cb-', delimit);
		}
		
		if (window.location.search)
			window.location = window.location + '&' + result;
		else
			window.location = window.location + '?' + result;
	}

    function updatePublishStatus(postid, defaultStatus)
    {
        var basePath = '<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/';   
        var img = $('#status-image-' + postid);
        var pubbutton = $('#button-Pub-' + postid);
        
        if(pubbutton.attr('isPublished') == null)
        {
            pubbutton.attr('isPublished', !defaultStatus);
        }
        else
        {
            pubbutton.attr('isPublished', !pubbutton.attr('isPublished'));
        }

        // call the AjaxMethod on the code-behind and send the response to updatePublishStatusCallback
        Comments.Toggle(postid, updatePublishStatusCallback);

        if (pubbutton.attr('isPublished'))
        {
            pubbutton.attr('disabled', 'disabled');
        }
        else 
        {
            pubbutton.attr('disabled', '');
        }
        
        if (pubbutton.attr('isPublished')) 
        {
            img.attr('src', basePath + 'published.gif');
            img.attr('title', "Published");
        }
        else
        {
            img.attr('src', basePath + 'unpublished.gif');
            img.attr('title', "Unpublished");
        }
    }

    // this method gets the callback result from a toggle AJAX request
    function updatePublishStatusCallback(res) {
        if (res == null) {
            alert('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("Weblog_Exception_Publish_UnknownError") %>');
            return;
        }
        else if (res.error) {
            alert(res.error);
            return;
        }

        // evaluate the string representation of the object into a JS object
        var comment = null;
        eval('comment = ' + res.value + ';');

        var editbutton = $('#button-Pub-Edit-' + comment.postid);
        var deletebutton = $('#button-Pub-Delete-' + comment.postid);

        var hasEditPermission = new Boolean(comment.hasEditPermission.toLowerCase());
        var hasDeletePermission = new Boolean(comment.hasDeletePermission.toLowerCase());

        editbutton.attr('disabled', hasEditPermission ? '' : 'disabled');
        deletebutton.attr('disabled', hasDeletePermission ? '' : 'disabled');
    }

    function EditGroup() {
        var groupId = GetCurrentGroupId();
        if (groupId < 0)
            return;

        var url = '<%= Globals.GetSiteUrls().UrlData.FormatUrl("hub_ControlPanel_AdminEditGroup", "{group_id}") %>';
        url = url.replace(/\{group_id\}/gi, groupId);
        window.location = url;
    }

    function checkIsPublished(postid, defaultStatus)
    {
        var button = $('button-' + postid);
        var published;
        
        if(button.isPublished == null)
        {
            published = defaultStatus;
        }
        else
        {
            published = button.isPublished;
        }

	    if (!published)  
	    {
		    alert('<%= ResourceManager.GetString("FeedbackEditor_ViewUnpublished") %>');
		    return false;
	    }
    	
	    return true;
    }
    </script>	
    <input type="hidden" id="postId" value="<%= CSContext.Current.GetIntFromQueryString(WeblogQueryStringProperties.PostID, -1) %>" />
    <table cellpadding="0" cellspacing="0" border="0"  width="100%">
	    <tr>
            <td align="left">
                <input style="visibility:<%= MassEditVisibility() %>" type="button" onclick="bulkEdit('approve')" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_PublishSelected", "ControlPanelResources.xml") %>' />
                <input style="visibility:<%= MassEditVisibility() %>" type="button" onclick="if(confirmAction('<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_BulkDeleteSelected") %>')){bulkEdit('delete');}" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_DeleteSelected", "ControlPanelResources.xml") %>' />
            </td>
		    <td align="right">
			    <asp:dropdownlist id="filterPublished" runat="server" onchange="redirectUrl();" />
		    </td>
	    </tr>
    </table>
    <div class="CommonListArea">
    <TEControl:WrappedRepeater ShowHeaderFooterOnNone="false" runat = "Server" id="theComments">
    <HeaderTemplate>
        <table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
	        <thead>
		        <tr>
			        <th class="CommonListHeaderLeftMost"><input type="checkbox" name="master" id="master" onclick="checkAll(this,'CommentListing');" /></th>
			        <th class="CommonListHeader"><cp:resourcecontrol ID="Resourcecontrol1" runat="server" resourcename="CP_Blog_Comments_Comment"/></th>
			        <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Type" /></th>											
			        <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Approved" /></th>											
			        <th class="CommonListHeader">&nbsp;</th>										
		        </tr>
	        </thead>
    </HeaderTemplate>
    <ItemTemplate>
	    <tr>
	    <td class="CommonListCellLeftMost"><input type="checkbox" name="cb-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" /></td>
	    <td class="CommonListCell">
		    <a href='<%# (Container.DataItem as Comment).ExtendedAttributes.Get("blogUrl").Value%>'>
		        <strong><%# (Container.DataItem as Comment).ExtendedAttributes.Get("blogName").Value%></strong></a><br/>
	        <%# (Container.DataItem as Comment).Body() %>
	        <div style="font-size:.8em; color:#959595">
	        <CP:ResourceControl runat="server" ResourceName="CP_Blog_Comments_By" />
	        <%# RenderName( (Comment) Container.DataItem ) %>
	        <CP:ResourceControl runat="server" ResourceName="CP_Blog_Comments_On" />
	        <%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "CreatedDate")).ToString("MMM d, yyyy")%>
	        </div>
	    </td>
	    <td class="CommonListCell Status">
	        <%# GetCommentType((Guid?)DataBinder.Eval(Container.DataItem, "CommentTypeId"))%>
	    </td>
	    <td class="CommonListCell Status">
		    <img id = "status-image-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>"  src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? "published" : "unpublished" %>.gif"
		         title="<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? ResourceManager.GetString("CP_Blog_Comments_Published", "ControlPanelResources.xml") : ResourceManager.GetString("CP_Blog_Comments_NotPublished", "ControlPanelResources.xml")%>" />
	    </td>
	    <td  class="CommonListCell Status" width="180px">
            <input id="button-Pub-Edit-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="javascript:Telligent_Modal.Open('<%# BlogUrls.Instance().AdminFeedbackEditor((Guid)DataBinder.Eval(Container.DataItem,"Content.Application.ApplicationId"),(Guid)DataBinder.Eval(Container.DataItem,"CommentId")) %>', 625, 475, refreshCallback);" value="Edit" <%# HasEditPermission((Guid)DataBinder.Eval(Container.DataItem,"CommentId")) ? "enabled" : "disabled" %> />
		    <input id="button-Pub-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="updatePublishStatus('<%# DataBinder.Eval(Container.DataItem,"CommentId") %>',<%# DataBinder.Eval(Container.DataItem,"IsApproved").ToString().ToLower() %>)" value="<%# ResourceManager.GetString("CP_Blog_Comments_Publish", "ControlPanelResources.xml") %>" <%# (bool)DataBinder.Eval(Container.DataItem, "IsApproved") ? "disabled" : "enabled" %> />
		    <input id="button-Pub-Delete-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="if(confirm('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Blog_Comments_Delete_Warning") %>')){window.location='<%# GetActionUrl("delete",DataBinder.Eval(Container.DataItem, "CommentId"))%>';}" value="<%# ResourceManager.GetString("CP_Blog_GridCol_Delete", "ControlPanelResources.xml")%>" <%# HasDeletePermission((Guid)DataBinder.Eval(Container.DataItem,"CommentId")) ? "enabled" : "disabled" %>/>
	    </td>
	    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
	    <tr class="AltListRow">
	    <td class="CommonListCellLeftMost"><input type="checkbox" name="cb-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" /></td>
	    <td class="CommonListCell">
		    <a href='<%# (Container.DataItem as Comment).ExtendedAttributes.Get("blogUrl").Value%>'>
		        <strong><%# (Container.DataItem as Comment).ExtendedAttributes.Get("blogName").Value%></strong></a><br/>
	        <%# (Container.DataItem as Comment).Body() %>
	        <div style="font-size:.8em; color:#959595">
	        <CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_Blog_Comments_By" />
	        <%# RenderName( (Comment) Container.DataItem ) %>
	        <CP:ResourceControl ID="ResourceControl4" runat="server" ResourceName="CP_Blog_Comments_On" />
	        <%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "CreatedDate")).ToString("MMM d, yyyy")%>
	        </div>
	    </td>
	    <td class="CommonListCell Status">
	        <%# GetCommentType((Guid?)DataBinder.Eval(Container.DataItem, "CommentTypeId"))%>
	    </td>
	    <td class="CommonListCell Status">
		    <img id = "status-image-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>"  src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? "published" : "unpublished" %>.gif"
		         title="<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? ResourceManager.GetString("CP_Blog_Comments_Published", "ControlPanelResources.xml") : ResourceManager.GetString("CP_Blog_Comments_NotPublished", "ControlPanelResources.xml")%>" />
	    </td>
	    <td  class="CommonListCell Status" width="180px">
            <input id="button-Pub-Edit-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="javascript:Telligent_Modal.Open('<%# BlogUrls.Instance().AdminFeedbackEditor((Guid)DataBinder.Eval(Container.DataItem,"Content.Application.ApplicationId"),(Guid)DataBinder.Eval(Container.DataItem,"CommentId")) %>', 625, 475, refreshCallback);" value="Edit" <%# HasEditPermission((Guid)DataBinder.Eval(Container.DataItem,"CommentId")) ? "enabled" : "disabled" %> />
		    <input id="button-Pub-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="updatePublishStatus('<%# DataBinder.Eval(Container.DataItem,"CommentId") %>',<%# DataBinder.Eval(Container.DataItem,"IsApproved").ToString().ToLower() %>)" value="<%# ResourceManager.GetString("CP_Blog_Comments_Publish", "ControlPanelResources.xml") %>" <%# (bool)DataBinder.Eval(Container.DataItem, "IsApproved") ? "disabled" : "enabled" %> />
		    <input id="button-Pub-Delete-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="if(confirm('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Blog_Comments_Delete_Warning") %>')){window.location='<%# GetActionUrl("delete",DataBinder.Eval(Container.DataItem, "CommentId"))%>';}" value="<%# ResourceManager.GetString("CP_Blog_GridCol_Delete", "ControlPanelResources.xml")%>" <%# HasDeletePermission((Guid)DataBinder.Eval(Container.DataItem,"CommentId")) ? "enabled" : "disabled" %>/>
	    </td>
	    </tr>
    </AlternatingItemTemplate>	
    <FooterTemplate>
        </table>
    </FooterTemplate>
    <NoneTemplate>
        <div class="CommonMessageWarning">
            <table>
                <tr>
                    <td style="width:35px">
		                <img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/spam.gif" />
                    </td>
                    
                    <td>
                        <CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_Blog_Comments_NoComments" />
                    </td>
                </tr>
            </table>
        </div>
    </NoneTemplate>		
    </TEControl:WrappedRepeater>

    <asp:Panel id="HideWhenNoResults" runat="server">
        <div style="margin-top: 5px">
        <table cellpadding="0" cellspacing="0" border="0"  width="100%">
            <tr>
	            <td align="left">
	                <input type="button" onclick="bulkEdit('approve')" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_PublishSelected", "ControlPanelResources.xml") %>' />
	                <input type="button" onclick="if(confirmAction('<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_BulkDeleteSelected") %>')){bulkEdit('delete');}" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_DeleteSelected", "ControlPanelResources.xml") %>' />
	            </td>
	            <td align="right">
	                <TEControl:Pager runat="server" id="csPager" MessageText="More Comments" />
                    <p>
		                <asp:literal id="CommentRSS_Message" runat="server" />
                    </p>
	            </td>
            </tr>
        </table>
        </div>
    </asp:Panel>
    </div>
</asp:Content>