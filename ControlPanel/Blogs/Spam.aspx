<%@ Page language="c#" EnableViewState = "false" Codebehind="Spam.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.SpamPage" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>
<%@ Register TagPrefix="CPB" Namespace="Telligent.Evolution.ControlPanel.Blogs" Assembly="Telligent.Evolution.Web" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Blogs.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>
<%@ Import Namespace="Telligent.Evolution.Extensibility.Api.Entities.Version1" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<TEControl:CSLiteral runat="server" id="CommentTitleLiteral" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Spam" runat="server" id="SelectedNavigation1" />
    <div class="CommonDescription">
	    <CP:ResourceControl runat="server" ResourceName="CP_Blog_Spam_SubTitle" />
    </div>

    <script type = "text/javascript">
    function redirectUrl()
    {
        window.location = window.location; 
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

    function bulkEdit(action)
    {
        var result = 'action=' + action + '&postids=';
        var cb = $('master');
        var b = true;
        $('#CommentListing input[type="checkbox"]').each(function ()
        {
            var e = this;
            if (e.name != cb.name && e.checked)
            {
                var delimit = ',';
                if (b)
                {
                    delimit = '';
                    b = false;
                }
                result += e.name.replace('cb-', delimit);
            }
        });

        if (window.location.search)
            window.location = window.location + '&' + result;
        else
            window.location = window.location + '?' + result;
    }

    function DeSpamPost(postid)
    {
        Spam.Toggle(postid, updatePublishStatusCallback);
    }

    // this method gets the callback result from a toggle AJAX request
    function updatePublishStatusCallback(res) 
    {
        if (res == null) 
        {
            alert('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("Weblog_Exception_Publish_UnknownError") %>');
            return;
        }
        else if (res.error) 
        {
            alert(res.error);
            return;
        }

        window.location = window.location;
    }

    </script>	
    <input type="hidden" id="postId" value="<%= CSContext.Current.GetIntFromQueryString("pid", -1) %>" />
    <table cellpadding="0" cellspacing="0" border="0"  width="100%">
	    <tr>
            <td align="left">
                <input style="visibility:<%= MassEditVisibility() %>" type="button" onclick="bulkEdit('despam')" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Spam_DeSpamSelected", "ControlPanelResources.xml") %>' />
                <input style="visibility:<%= MassEditVisibility() %>" type="button" onclick="if(confirm('<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_BulkDeleteSelected") %>')){bulkEdit('delete');}" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_DeleteSelected", "ControlPanelResources.xml") %>' />
            </td>
	    </tr>
    </table>
    <div class="CommonListArea">
    <TEControl:WrappedRepeater ShowHeaderFooterOnNone="false" runat = "Server" id="theComments">
    <HeaderTemplate>
        <table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
	        <thead>
		        <tr>
			        <th class="CommonListHeaderLeftMost" width="20px"><input type="checkbox" name="master" id="master" onclick="checkAll(this,'CommentListing');" /></th>
			        <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_Comments_Comment"/></th>
			        <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_Spam_SpamScore" /></th>											
			        <th class="CommonListHeader">&nbsp;</th>											
		        </tr>
	        </thead>
    </HeaderTemplate>
    <ItemTemplate>
	    <tr>
	    <td class="CommonListCellLeftMost"><input type="checkbox" name="cb-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" /></td>
	    <td class="CommonListCell">
	        <%# (Container.DataItem as Comment).Body() %>
	        <div style="font-size:.8em; color:#959595">
	        <CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_Blog_Comments_By" />
	        <%# RenderName( (Comment) Container.DataItem ) %>
	        <CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_Blog_Comments_On" />
	        <%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "CreatedDate")).ToString("MMM d, yyyy")%>
	        </div>
	    </td>
	    <td class="CommonListCell Status">
	        <%# (Container.DataItem as Comment).ExtendedAttributes["SpamScore"] != null ? (Container.DataItem as Comment).ExtendedAttributes["SpamScore"].Value : "" %>
	    </td>
	    <td  class="CommonListCell Status" width="180px">
		    <input id="button-Pub-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="DeSpamPost('<%# DataBinder.Eval(Container.DataItem,"CommentId") %>')" value="<%# ResourceManager.GetString("CP_Blog_Spam_DeSpam", "ControlPanelResources.xml") %>" />
		    <input type="button" onclick="if(confirm('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Blog_Comments_Delete_Warning") %>')){window.location='<%# GetActionUrl("delete",DataBinder.Eval(Container.DataItem, "CommentId"))%>';}" value="<%# ResourceManager.GetString("CP_Blog_GridCol_Delete", "ControlPanelResources.xml")%>" />
	    </td>
	    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
	    <tr class="AltListRow">
	    <td class="CommonListCellLeftMost"><input type="checkbox" name="cb-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" /></td>
	    <td class="CommonListCell">
	        <%# (Container.DataItem as Comment).Body() %>
	        <div style="font-size:.8em; color:#959595">
	        <CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_Blog_Comments_By" />
	        <%# RenderName( (Comment) Container.DataItem ) %>
	        <CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_Blog_Comments_On" />
	        <%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "CreatedDate")).ToString("MMM d, yyyy")%>
	        </div>
	    </td>
	    <td class="CommonListCell Status">
	        <%# (Container.DataItem as Comment).ExtendedAttributes["SpamScore"] != null ? (Container.DataItem as Comment).ExtendedAttributes["SpamScore"].Value : "" %>
	    </td>
	    <td  class="CommonListCell Status" width="180px">
		    <input id="button-Pub-<%# DataBinder.Eval(Container.DataItem,"CommentId") %>" type="button" onclick="DeSpamPost('<%# DataBinder.Eval(Container.DataItem,"CommentId") %>')" value="<%# ResourceManager.GetString("CP_Blog_Spam_DeSpam", "ControlPanelResources.xml") %>" />
		    <input type="button" onclick="if(confirm('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Blog_Comments_Delete_Warning") %>')){window.location='<%# GetActionUrl("delete",DataBinder.Eval(Container.DataItem, "CommentId"))%>';}" value="<%# ResourceManager.GetString("CP_Blog_GridCol_Delete", "ControlPanelResources.xml")%>" />
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
                        <CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_Blog_Spam_NoComments" />
                    </td>
                </tr>
            </table>
        </div>
    </NoneTemplate>		
    </TEControl:WrappedRepeater>
    </table>

    <asp:Panel id="HideWhenNoResults" runat="server">
        <div style="margin-top: 5px">
        <table cellpadding="0" cellspacing="0" border="0"  width="100%">
            <tr>
	            <td align="left">
	                <input type="button" onclick="bulkEdit('despam')" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Spam_DeSpamSelected", "ControlPanelResources.xml") %>' />
	                <input type="button" onclick="if(confirm('<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_BulkDeleteSelected") %>')){bulkEdit('delete');}" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_DeleteSelected", "ControlPanelResources.xml") %>' />
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