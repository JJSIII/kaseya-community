<%@ Page language="c#" Codebehind="WikiComments.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.ManageWikis.WikiComments" MasterPageFile="~/ControlPanel/Masters/Wikis.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.Extensibility.Api.Entities.Version1" %>
<%@Import Namespace="Telligent.Evolution.Wikis.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="SectionDescription" runat="server" resourcename="CP_Wiki_Comments_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <cp:controlpanelselectednavigation runat="server" SelectedNavItem="WikiComments" />
	<div class="CommonDescription">
		<cp:resourcecontrol id="Section_Sub_Description" runat="server" resourcename="CP_Wiki_Comments_SubTitle" />
	</div>
	
    <script type = "text/javascript">
    function redirectUrl() {
        var filterPage = document.getElementById("pageId");
        var url = '<%= WikiUrls.Instance().ControlPanel_CommentList(CurrentWiki.ID) %>&pid=' + filterPage.value;
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

	function confirmDelete()
	{
		return getSelectedCheckboxes().length > 0 &&
				confirm('<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_BulkDeleteSelected") %>');
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
		var result = 'action=' + action + '&cids=';
		var pa = getSelectedCheckboxes();
		var b = true;
		for (var i = 0; i < pa.length; i++)
		{
			var delimit = ',';
			if (b)
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

	    if (pubbutton.attr('isPublished') == null) {
	        pubbutton.attr('isPublished', !defaultStatus);
	    }
	    else {
	        pubbutton.attr('isPublished', !pubbutton.attr('isPublished'));
	    }

	    // call the AjaxMethod on the code-behind and send the response to updatePublishStatusCallback
	    WikiComments.Toggle(postid, updatePublishStatusCallback);

	    if (pubbutton.attr('isPublished')) {
	        pubbutton.attr('disabled', 'disabled');
	    }
	    else {
	        pubbutton.attr('disabled', '');
	    }

	    if (pubbutton.attr('isPublished')) {
	        img.attr('src', basePath + 'published.gif');
	        img.attr('title', "Published");
	    }
	    else {
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

	function checkIsPublished(postid, defaultStatus) {
	    var button = $('button-' + postid);
	    var published;

	    if (button.isPublished == null) {
	        published = defaultStatus;
	    }
	    else {
	        published = button.isPublished;
	    }

	    if (!published) {
	        alert('<%= ResourceManager.GetString("FeedbackEditor_ViewUnpublished") %>');
	        return false;
	    }

	    return true;
	}
    </script>	
    <input type="hidden" id="pageId" value="<%= CSContext.Current.GetIntFromQueryString("pid", -1) %>" />
    <div>
        <!-- <input style="visibility:<%= MassEditVisibility() %>" type="button" onclick="bulkEdit('approve')" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_PublishSelected", "ControlPanelResources.xml") %>' /> -->
        <input style="visibility:<%= MassEditVisibility() %>" type="button" onclick="if(confirmDelete()){bulkEdit('delete');}" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_DeleteSelected", "ControlPanelResources.xml") %>' />
    </div>

    <div class="CommonListArea">
    <TEControl:WrappedRepeater ShowHeaderFooterOnNone="false" runat = "Server" id="theComments">
    <HeaderTemplate>
        <table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
	        <thead>
		        <tr>
			        <th class="CommonListHeaderLeftMost" width="20px"><input type="checkbox" name="master" id="master" onclick="checkAll(this,'CommentListing');" /></th>
			        <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_Comments_Comment"/></th>
                    <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Approved" /></th>
			        <th class="CommonListHeader">&nbsp;</th>
		        </tr>
	        </thead>
    </HeaderTemplate>
    <ItemTemplate>
	    <tr>
	    <td class="CommonListCellLeftMost"><input type="checkbox" name="cb-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" /></td>
	    <td class="CommonListCell">
		    <a href='<%# WikiUrls.Instance().Comments(GetPage(((Comment)Container.DataItem))) %>'>
	        <strong><%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "CreatedDate")).ToString("MMM d, yyyy hh:mm tt")%></strong></a>
            <br />
	        <%# ForceExcerpt((Comment)Container.DataItem)%>
	        <div style="font-size:.8em; color:#959595">
	        <CP:ResourceControl runat="server" ResourceName="CP_Blog_Comments_By" />
	        <%# RenderName((Comment)Container.DataItem)%>
	        </div>
	    </td>
	    <td class="CommonListCell Status">
		    <img id = "status-image-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>"  src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? "published" : "unpublished" %>.gif"
		         title="<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? ResourceManager.GetString("CP_Blog_Comments_Published", "ControlPanelResources.xml") : ResourceManager.GetString("CP_Blog_Comments_NotPublished", "ControlPanelResources.xml")%>" />
	    </td>
	    <td  class="CommonListCell Status" width="180px">
		    <input id="button-Pub-Edit-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="javascript:Telligent_Modal.Open('<%# WikiUrls.Instance().ControlPanel_CommentEditor(CurrentWiki.ID, (Guid)DataBinder.Eval(Container.DataItem,"CommentId")) %>', 625, 475, refreshCallback);" value="Edit" />
		    <input id="button-Pub-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="updatePublishStatus('<%# DataBinder.Eval(Container.DataItem,"CommentId") %>',<%# DataBinder.Eval(Container.DataItem,"IsApproved").ToString().ToLower() %>)" value="<%# ResourceManager.GetString("CP_Blog_Comments_Publish", "ControlPanelResources.xml") %>" <%# (bool)DataBinder.Eval(Container.DataItem, "IsApproved") ? "disabled" : "enabled" %> />
            <input id="button-Pub-Delete-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="if(confirm('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Wiki_Comments_Delete_Warning") %>')){window.location='<%# GetActionUrl("delete",(Guid)DataBinder.Eval(Container.DataItem, "CommentId"))%>';}" value="<%# ResourceManager.GetString("CP_Blog_GridCol_Delete", "ControlPanelResources.xml")%>" />
	    </td>
	    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
	    <tr class="AltListRow">
	    <td class="CommonListCellLeftMost"><input type="checkbox" name="cb-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" /></td>
	    <td class="CommonListCell">
		    <a href='<%# WikiUrls.Instance().Comments(GetPage(((Comment)Container.DataItem))) %>'>
	        <strong><%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "CreatedDate")).ToString("MMM d, yyyy hh:mm tt")%></strong></a>
            <br />
	        <%# ForceExcerpt((Comment)Container.DataItem)%>
	        <div style="font-size:.8em; color:#959595">
	        <CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_Blog_Comments_By" />
	        <%# RenderName((Comment)Container.DataItem)%>
	        </div>
	    </td>
	    <td class="CommonListCell Status">
		    <img id = "status-image-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>"  src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? "published" : "unpublished" %>.gif"
		         title="<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? ResourceManager.GetString("CP_Blog_Comments_Published", "ControlPanelResources.xml") : ResourceManager.GetString("CP_Blog_Comments_NotPublished", "ControlPanelResources.xml")%>" />
	    </td>
	    <td  class="CommonListCell Status" width="180px">
		    <input id="button-Pub-Edit-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="javascript:Telligent_Modal.Open('<%# WikiUrls.Instance().ControlPanel_CommentEditor(CurrentWiki.ID, (Guid)DataBinder.Eval(Container.DataItem,"CommentId")) %>', 625, 475, refreshCallback);" value="Edit" />
		    <input id="button-Pub-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="updatePublishStatus('<%# DataBinder.Eval(Container.DataItem,"CommentId") %>',<%# DataBinder.Eval(Container.DataItem,"IsApproved").ToString().ToLower() %>)" value="<%# ResourceManager.GetString("CP_Blog_Comments_Publish", "ControlPanelResources.xml") %>" <%# (bool)DataBinder.Eval(Container.DataItem, "IsApproved") ? "disabled" : "enabled" %> />
            <input id="button-Pub-Delete-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="if(confirm('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Wiki_Comments_Delete_Warning") %>')){window.location='<%# GetActionUrl("delete",(Guid)DataBinder.Eval(Container.DataItem, "CommentId"))%>';}" value="<%# ResourceManager.GetString("CP_Blog_GridCol_Delete", "ControlPanelResources.xml")%>" />
	    </td>
	    </tr>
    </AlternatingItemTemplate>	
    <NoneTemplate>
        <div class="CommonMessageWarning">
            <table>
                <tr>
                    <td style="width:35px">
		                <img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/spam.gif" />
                    </td>
                    <td>
                        <CP:ResourceControl runat="server" ResourceName="CP_Wiki_Comments_NoComments" />
                    </td>
                </tr>
            </table>
        </div>
    </NoneTemplate>
    <TrailerTemplate>
        </table>
    </TrailerTemplate>
    </TEControl:WrappedRepeater>

    <asp:Panel id="HideWhenNoResults" runat="server">
        <div style="margin-top: 5px">
        <table cellpadding="0" cellspacing="0" border="0"  width="100%">
            <tr>
	            <td align="left">
                    <!-- <input type="button" onclick="bulkEdit('approve')" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_PublishSelected", "ControlPanelResources.xml") %>' /> -->
	                <input type="button" onclick="if(confirmDelete()){bulkEdit('delete');}" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_DeleteSelected", "ControlPanelResources.xml") %>' />
	            </td>
	            <td align="right">
                    <TEControl:Pager runat="Server" id="csPager" MessageText="More Comments" />
	            </td>
            </tr>
        </table>
        </div>
    </asp:Panel>
    </div>
	
</asp:Content>