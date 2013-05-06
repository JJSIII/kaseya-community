<%@ Page language="c#" EnableViewState = "false" Codebehind="Feedback.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.FeedbackPage" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>
<%@ Register TagPrefix="CPB" Namespace="Telligent.Evolution.ControlPanel.Blogs" Assembly="Telligent.Evolution.Web" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Blogs.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<TEControl:CSLiteral runat="server" id="CommentTitleLiteral" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Feedback" runat="server" />
    <div class="CommonDescription">
	    <CP:ResourceControl runat="server" ResourceName="CP_Blog_Feedback_SubTitle" />
    </div>

    <script type = "text/javascript">
    function redirectUrl()
    {
        var filterPost = document.getElementById("feedbackId");
        var filterSent = $('<%=filterSent.ClientID%>');
        var url = '<%= BlogUrls.Instance().ControlPanel_EmailFeedback(CurrentWeblog.SectionID) %>&status=' + filterSent[filterSent.selectedIndex].value;
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

    function bulkEdit(action)
    {
        var result = 'action=' + action + '&ids=';
        var cb = $('master');
	    var pa = $('CommentListing').getElementsByTagName('INPUT');
	    var b = true;
	    for(var i=0; i<pa.length; i++)
	    {
		    var e = pa[i];
		    if(e.getAttribute('type') == 'checkbox' && e.name != cb.name && e.checked)
		    {
		        var delimit = ',';
		        if(b)
		        {
	        	    delimit = '';
	        	    b = false;    
		        }
                result += e.name.replace('cb-',delimit);
		    }
	    }
    	
	    if(window.location.search)
          window.location =   window.location + '&' + result;    
        else
          window.location =   window.location + '?' + result;
    }

    function updateSentStatus(postid, defaultStatus)
    {
        var basePath = '<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/';   
        var img = document.getElementById('status-image-' + postid);
        var approvebutton = document.getElementById('button-Pub-' + postid);
        
        Feedback.Approve(postid, null);

        approvebutton.disabled = true;
        
        img.src = basePath + 'published.gif';
        img.title = "Sent";
    }

    function checkIsSent(postid, defaultStatus)
    {
        var button = $('button-' + postid);
        var sent;
        
        if(button.isPublished == null)
        {
            sent = defaultStatus;
        }
        else
        {
            sent = button.isPublished;
        }

	    if (!sent)  
	    {
		    alert('<%= ResourceManager.GetString("FeedbackEditor_ViewUnpublished") %>');
		    return false;
	    }
    	
	    return true;
    }
    </script>	
    <table cellpadding="0" cellspacing="0" border="0"  width="100%">
	    <tr>
            <td align="left">
                <input style="visibility:<%= MassEditVisibility() %>" type="button" onclick="bulkEdit('approve')" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Feedback_ApproveSelected", "ControlPanelResources.xml") %>' />
                <input style="visibility:<%= MassEditVisibility() %>" type="button" onclick="if(confirm('<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_BulkDeleteSelected") %>')){bulkEdit('delete');}" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_DeleteSelected", "ControlPanelResources.xml") %>' />
            </td>
		    <td align="right">
			    <asp:dropdownlist id="filterSent" runat="server" onchange="redirectUrl();" />
		    </td>
	    </tr>
    </table>
    <div class="CommonListArea">
    <TEControl:WrappedRepeater ShowHeaderFooterOnNone="false" runat = "Server" id="feedbackRepeater">
    <HeaderTemplate>
        <table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
	        <thead>
		        <tr>
			        <th class="CommonListHeaderLeftMost" width="20px"><input type="checkbox" name="master" id="master" onclick="checkAll(this,'CommentListing');" /></th>
			        <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_Feedback_Feedback"/></th>	
			        <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_Feedback_Approved" /></th>											
			        <th class="CommonListHeader">&nbsp;</th>											
		        </tr>
	        </thead>
    </HeaderTemplate>
    <ItemTemplate>
	    <tr>
	    <td class="CommonListCellLeftMost"><input type="checkbox" name="cb-<%# Eval("Id") %>" /></td>
	    <td class="CommonListCell">
	        <a href="javascript:Telligent_Modal.Open('<%# BlogUrls.Instance().ControlPanel_EmailFeedbackViewer(CurrentWeblog.SectionID, (int)DataBinder.Eval(Container.DataItem,"Id")) %>', 525, 375, refreshCallback);"><strong><%# Eval("Subject")%></strong></a>
            <br />
	        <%# Eval("Excerpt") %>
	        <div style="font-size:.8em; color:#959595">
	        <CP:ResourceControl runat="server" ResourceName="CP_Blog_Comments_By" />
	        <%# Eval("EmailAddress") %>
	        <CP:ResourceControl runat="server" ResourceName="CP_Blog_Comments_On" />
	        <%# UserTime.ConvertToUserTime((DateTime)Eval("CreationDate")).ToString("MMM d, yyyy")%>
	        </div>
	    </td>
	    <td class="CommonListCell Status">
	        <img id = 'status-image-<%# Eval("Id") %>' 
	        <TEControl:PlaceHolder runat="server">
	            <DisplayConditions>
	                <TEControl:CustomCondition runat="server" CustomResult='<%# Eval("IsModerated") %>' />
	            </DisplayConditions>
	            <ContentTemplate>
	                 src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/spam.gif" title="Possible Spam: Not Sent" />
	            </ContentTemplate>
	        </TEControl:PlaceHolder>
	        
	        <TEControl:PlaceHolder runat="server">
	            <DisplayConditions Operator="Not">
	                <TEControl:CustomCondition runat="server" CustomResult='<%# Eval("IsModerated") %>' />
	            </DisplayConditions>
	            <ContentTemplate>
	             src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/published.gif" title="Feedback Sent" />
	            </ContentTemplate>
	        </TEControl:PlaceHolder>
	    </td>
	    <td  class="CommonListCell Status" width="180px">
		    <input id="button-Pub-<%# Eval("Id") %>" type="button" onclick="updateSentStatus(<%# Eval("Id") %>,<%# Eval("IsModerated").ToString().ToLower() %>)" value="<%# ResourceManager.GetString("CP_Blog_Feedback_Approve", "ControlPanelResources.xml") %>" <%# (bool)DataBinder.Eval(Container.DataItem, "IsModerated") ? "enabled" : "disabled" %> />
		    <input type="button" onclick="if(confirm('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Blog_Feedback_DeleteWarning") %>')){window.location='<%# GetActionUrl("delete",DataBinder.Eval(Container.DataItem, "Id"))%>';}" value="<%# ResourceManager.GetString("CP_Blog_GridCol_Delete", "ControlPanelResources.xml")%>" />
	    </td>
	    </tr>
    </ItemTemplate>	
    <NoneTemplate>
        <div class="CommonMessageWarning">
            <table>
                <tr>
                    <td style="width:35px">
		                <img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/spam.gif" />
                    </td>
                    
                    <td>
                        <CP:ResourceControl runat="server" ResourceName="CP_Blog_Feedback_NoFeedback" />
                    </td>
                </tr>
            </table>
        </div>
    </NoneTemplate>
    <FooterTemplate>
        </table>    
    </FooterTemplate>
    </TEControl:WrappedRepeater>

    <asp:Panel id="HideWhenNoResults" runat="server">
        <div style="margin-top: 5px">
        <table cellpadding="0" cellspacing="0" border="0"  width="100%">
            <tr>
	            <td align="left">
	                <input type="button" onclick="bulkEdit('approve')" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Feedback_ApproveSelected", "ControlPanelResources.xml") %>' />
	                <input type="button" onclick="if(confirm('<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_BulkDeleteSelected") %>')){bulkEdit('delete');}" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("FeedbackEditor_DeleteSelected", "ControlPanelResources.xml") %>' />
	            </td>
	            <td align="right">
                    <TEControl:Pager runat="Server" id="csPager" MessageText="More Feedback" />
	            </td>
            </tr>
        </table>
        </div>
    </asp:Panel>
    </div>
</asp:Content>