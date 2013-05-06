<%@ Page language="c#" Codebehind="TagPosts.aspx.cs" AutoEventWireup="false" Inherits="Telligent.EvolutionWeb.ControlPanel.Moderation.TagPosts" MasterPageFile="~/ControlPanel/Masters/ForumModeration.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<%= string.Format(Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Moderation_TagPosts_Title"), CSContext.Current.Tags != null ? CSContext.Current.Tags[0] : "")%>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="CommonTasks" runat="server" id="ControlPanelSelectedNavigation1" />
    	
    <div class="CommonDescription">
	    <CP:ResourceControl runat="server" ResourceName="CP_Moderation_TagPosts_Description" />
    </div>
    <div>			
    <table border = "0" cellpadding="3" cellpadding="3">
        <tr>
            <td>
                <CP:ResourceControl id="FeedbackFilterLabelBulk" runat="Server" resourcename="CP_Moderation_TagPosts_BulkActions" />
            </td>
            <td align="left">
                <CP:ResourceLinkButton runat="server" ID="BulkDeleteButton" CssClass="CommonTextButton" CommandName="Delete" ResourceName="CP_Moderation_TagPosts_RemoveFromTag" />
            </td>
        </tr>
    </table>			
    </div>

    <div class="CommonListArea">
	    <asp:Repeater runat="Server" id="thePosts">
		    <HeaderTemplate>
			    <table id="PostListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
				    <thead>
					    <tr>
						    <th class="CommonListHeaderLeftMost"><input type="checkbox" name="master" id="master" onclick="checkAll(this,'PostListing');" /></th>
						    <th class="CommonListHeader"><CP:ResourceControl runat="server" ResourceName="CP_Moderation_TagPosts_List_Post" /></th>
						    <th class="CommonListHeader"><CP:ResourceControl runat="server" ResourceName="CP_Moderation_TagPosts_List_Published" /></th>
                            <th class="CommonListHeader"><CP:ResourceControl runat="server" ResourceName="CP_Moderation_TagPosts_List_Actions" /></th>
					    </tr>
				    </thead>
		    </HeaderTemplate>
		    <ItemTemplate>
			    <tr>
			        <td class="CommonListCellLeftMost"><asp:CheckBox runat="server" ID="DeleteCheckBox" /></td>
			        <td class="CommonListCell">
					    <strong><%# DataBinder.Eval(Container.DataItem,"Name")%></strong><br /> 
					    <%# Formatter.GetBodySummary(DataBinder.Eval(Container.DataItem, "FormattedBody").ToString(), 200, "", System.Drawing.Color.Black, System.Drawing.Color.Black) %>
				    </td>
			        <td class="CommonListCell" nowrap="nowrap">
			            by: <strong><%# DataBinder.Eval(Container.DataItem,"UserName") %></strong><br/>
			            <%# DataBinder.Eval(Container.DataItem,"PostDate", "{0:MMM dd yyyy, hh:mm tt}") %>
			        </td>
			        <td  class="CommonListCell" nowrap="nowrap">
			            <a href="<%# DataBinder.Eval(Container.DataItem, "Uri")%>" class="CommonTextButton"><CP:ResourceControl runat=server ResourceName="View" /></a>
                        <CP:ResourceButton runat="server" ID="DeleteButton" CssClass="CommonTextButton" CommandName="Delete" ResourceName="CP_Moderation_TagPosts_RemoveFromTag" />
			       </td>
			    </tr>
		    </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="AltListRow">
				    <td class="CommonListCellLeftMost"><asp:CheckBox runat="server" ID="DeleteCheckBox" /></td>
			        <td class="CommonListCell">
					    <strong><%# DataBinder.Eval(Container.DataItem,"Name")%></strong><br /> 
					    <%# Formatter.GetBodySummary(DataBinder.Eval(Container.DataItem, "FormattedBody").ToString(), 200, "", System.Drawing.Color.Black, System.Drawing.Color.Black) %>
				    </td>
			        <td class="CommonListCell" nowrap="nowrap">
			            by: <strong><%# DataBinder.Eval(Container.DataItem,"UserName") %></strong><br/>
			            <%# DataBinder.Eval(Container.DataItem,"PostDate", "{0:MMM dd yyyy, hh:mm tt}") %>
			        </td>
			        <td  class="CommonListCell" nowrap="nowrap">
			            <a href="<%# DataBinder.Eval(Container.DataItem, "Uri")%>" class="CommonTextButton"><CP:ResourceControl ID="ResourceControl1" runat=server ResourceName="View" /></a>
                        <CP:ResourceButton runat="server" ID="DeleteButton" CssClass="CommonTextButton" CommandName="Delete" ResourceName="CP_Moderation_TagPosts_RemoveFromTag" />
			       </td>
			    </tr>
		    </AlternatingItemTemplate>
		    <FooterTemplate>
			    </table>
		    </FooterTemplate>
	    </asp:Repeater>
    </div>
    			
    <TEControl:Pager runat="Server" id="pager" />

</asp:Content>