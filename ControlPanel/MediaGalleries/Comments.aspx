<%@ Page language="c#" Codebehind="Comments.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.Comments" MasterPageFile="~/ControlPanel/Masters/MediaGalleries.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.Extensibility.Api.Entities.Version1" %>
<%@ Import Namespace = "Telligent.Evolution.MediaGalleries.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>
<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="server" resourcename="CP_MediaGalleries_Comments_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Comments" runat="server" id="SelectedNavigation1" />
	<div class="CommonDescription">
		<CP:ResourceControl runat="server" resourcename="CP_MediaGalleries_Comments_Description" />
	</div>
		
	<script type="text/javascript">
    // <!--
    
    function redirectUrl()
    {
        var filterPublished = $('#<%=filterPublished.ClientID%>');
        var url = '<%= MediaGalleryUrls.Instance().ControlPanel_Comments(CurrentMediaGallery.SectionID, CSContext.Current.GetIntFromQueryString(MediaGalleryQueryStringProperties.PostID, -1)) %>' + '&ip=' + filterPublished.val();
        window.location = url; 
    }
    
    function ValidateDelete(isMultiple)
    {
        if (isMultiple)
            return existsSelectedCheckboxes() && confirm('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_MediaGalleries_CommentList_DeleteSelectedWarning") %>');
        else
            return confirm('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_MediaGalleries_CommentList_DeleteWarning") %>');
    }

	function existsSelectedCheckboxes()
	{
		var pa = $("#CommentListing input[type='checkbox'][id!='master']");
		for (var i = 0; i < pa.length; i++)
		{
			if (pa[i].checked)
				return true;
		}
		return false;
	}
    
    function checkAll(isChecked)
    {
	    var pa = document.getElementsByName('PostCheck');
	    for(var i=0; i<pa.length; i++)
	    {
		    pa[i].checked = isChecked;
	    }
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

        Comments.Toggle(postid,null);

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
    
    // -->
    </script>
	
	<table cellpadding="0" cellspacing="0" border="0"  width="100%">
	    <tr>
            <td align="left">
                <asp:PlaceHolder ID="ActionButtons" runat="server">
                    <CP:ResourceButton ID="PublishSelected" runat="server" ResourceName="CP_MediaGalleries_PublishSelected" />
    		        <CP:ResourceButton ID="DeleteSelected" runat="server" ResourceName="CP_MediaGalleries_DeleteSelected" OnClientClick="return ValidateDelete(true);" />
                </asp:PlaceHolder>
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
			        <th class="CommonListHeaderLeftMost"><input type="checkbox" name="master" id="master" onclick="checkAll(this.checked);" /></th>
			        <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleries_CommentGrid_Comment"/></th>
			        <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleries_CommentGrid_Approved" /></th>											
			        <th class="CommonListHeader">&nbsp;</th>
		        </tr>
	        </thead>
    </HeaderTemplate>
    <ItemTemplate>
	    <tr>
	    <td class="CommonListCellLeftMost"><input type="checkbox" name="PostCheck" value="<%# Eval("CommentId") %>" /></td>
	    <td class="CommonListCell">
	        <%# (Container.DataItem as Comment).Body() %>
	        <div style="font-size:.8em; color:#959595">
	        <CP:ResourceControl runat="server" ResourceName="CP_Blog_Comments_By" />
	        <%# RenderName((Comment)Container.DataItem)%>
	        <CP:ResourceControl runat="server" ResourceName="CP_Blog_Comments_On" />
	        <%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "CreatedDate")).ToString("MMM d, yyyy")%>
	        </div>
	    </td>
	    <td class="CommonListCell Status">
		    <img id = "status-image-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>"  src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# ((bool) DataBinder.Eval(Container.DataItem,"IsApproved")) ? "published" : "unpublished" %>.gif" 
		        title="<%# ((bool) DataBinder.Eval(Container.DataItem,"IsApproved")) ? ResourceManager.GetString("CP_Blog_Comments_Published", "ControlPanelResources.xml") : ResourceManager.GetString("CP_Blog_Comments_NotPublished", "ControlPanelResources.xml")%>" />
	    </td>
	    <td  class="CommonListCell Status" width="180px">
		    <input type="button" onclick="javascript:Telligent_Modal.Open('<%# MediaGalleryUrls.Instance().ControlPanel_CommentEditor(CurrentMediaGallery.NodeId, (Guid)DataBinder.Eval(Container.DataItem,"CommentId")) %>', 625, 475, refreshCallback);" value="Edit" />
		    <input id="button-Pub-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="updatePublishStatus('<%# DataBinder.Eval(Container.DataItem,"CommentId") %>',<%# DataBinder.Eval(Container.DataItem,"IsApproved").ToString().ToLower() %>)" value="<%# ResourceManager.GetString("CP_Blog_Comments_Publish", "ControlPanelResources.xml") %>" <%# (bool)DataBinder.Eval(Container.DataItem, "IsApproved") ? "disabled" : "enabled" %> />
		    <cp:ResourceButton OnClientClick="return ValidateDelete(false);" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "CommentId")%>' CommandName="Delete" Runat="server" ID = "DeleteButton" ResourceName="CP_MediaGalleries_FileList_Delete" Enabled="<%# HasDeletePermission %>" />
	    </td>
	    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
	    <tr class="AltListRow">
	    <td class="CommonListCellLeftMost"><input type="checkbox" name="PostCheck" value="<%# Eval("CommentId") %>" /></td>
	    <td class="CommonListCell">
	        <%# (Container.DataItem as Comment).Body() %>
	        <div style="font-size:.8em; color:#959595">
	        <CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_Blog_Comments_By" />
	        <%# RenderName((Comment)Container.DataItem)%>
	        <CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_Blog_Comments_On" />
	        <%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "CreatedDate")).ToString("MMM d, yyyy")%>
	        </div>
	    </td>
	    <td class="CommonListCell Status">
		    <img id = "status-image-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>"  src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# ((bool) DataBinder.Eval(Container.DataItem,"IsApproved")) ? "published" : "unpublished" %>.gif" 
		        title="<%# ((bool) DataBinder.Eval(Container.DataItem,"IsApproved")) ? ResourceManager.GetString("CP_Blog_Comments_Published", "ControlPanelResources.xml") : ResourceManager.GetString("CP_Blog_Comments_NotPublished", "ControlPanelResources.xml")%>" />
	    </td>
	    <td  class="CommonListCell Status" width="180px">
		    <input type="button" onclick="javascript:Telligent_Modal.Open('<%# MediaGalleryUrls.Instance().ControlPanel_CommentEditor(CurrentMediaGallery.NodeId, (Guid)DataBinder.Eval(Container.DataItem,"CommentId")) %>', 625, 475, refreshCallback);" value="Edit" />
		    <input id="button-Pub-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="updatePublishStatus('<%# DataBinder.Eval(Container.DataItem,"CommentId") %>',<%# DataBinder.Eval(Container.DataItem,"IsApproved").ToString().ToLower() %>)" value="<%# ResourceManager.GetString("CP_Blog_Comments_Publish", "ControlPanelResources.xml") %>" <%# (bool)DataBinder.Eval(Container.DataItem, "IsApproved") ? "disabled" : "enabled" %> />
		    <cp:ResourceButton OnClientClick="return ValidateDelete(false);" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "CommentId")%>' CommandName="Delete" Runat="server" ID = "DeleteButton" ResourceName="CP_MediaGalleries_FileList_Delete" Enabled="<%# HasDeletePermission %>" />
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
                        <CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_CommentGrid_NoComments" />
                    </td>
                </tr>
            </table>
        </div>
    </NoneTemplate>	
    <FooterTemplate>
        </table>    
    </FooterTemplate>	
    </TEControl:WrappedRepeater>
    </div>
    
    <asp:PlaceHolder ID="ActionButtons2" runat="server">
        <table cellspacing="0" cellpadding="0" style="padding-top: 5px;" width="100%">
        <tr>
            <td align="left">
                <CP:ResourceButton ID="PublishSelected2" runat="server" ResourceName="CP_MediaGalleries_PublishSelected" />
			    <CP:ResourceButton ID="DeleteSelected2" runat="server" ResourceName="CP_MediaGalleries_DeleteSelected" OnClientClick="return ValidateDelete(true);" />
            </td>
            <td align="right">
                <TEControl:Pager runat="Server" id="csPager" MessageText="More Comments" />
            </td>
        </tr>
        </table>
    </asp:PlaceHolder>
	
	
</asp:Content>