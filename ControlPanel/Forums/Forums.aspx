<%@ Page language="c#" Codebehind="Forums.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Forums.Forums" MasterPageFile="~/ControlPanel/Masters/ForumAdmin.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="SectionDescription" runat="server" resourcename="CP_Forums_ForumList_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">

    <cp:controlpanelselectednavigation runat="server" SelectedNavItem="ForumList" />
	<div class="CommonDescription">
	    <TEControl:ConditionalContent runat="server">
            <ContentConditions>
                <TEControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="ForumID" Operator="GreaterThan" ComparisonValue="-1" />
            </ContentConditions>
            <TrueContentTemplate>
                <CP:ResourceControl runat="server" ResourceName="CP_Forums_ForumList_CreatedMessage">
                    <Parameter1Template><TEForum:ForumData runat="server" Property="Name" LinkTo="HomePage" /></Parameter1Template>
                </CP:ResourceControl>
            </TrueContentTemplate>
            <FalseContentTemplate>
                <cp:resourcecontrol id="Section_Sub_Description" runat="server" resourcename="CP_Forums_ForumList_SubTitle" />
            </FalseContentTemplate>
        </TEControl:ConditionalContent>
	</div>
	
	<div style="float: right; margin-bottom: 10px;">
        <div style="float: left; text-align: left; margin-right: 8px;">
            <TEControl:GroupLookUpTextBox ID="GroupLookUp" runat="server" RequiredGroupPermission="Group_CreateBlog" MaximumSelections="1"
                Width="164" EmptyHtml='<%# ResourceManager.GetString("CP_Forums_ForumList_FilterToGroup", "ControlPanelResources.xml") %>' />
        </div>
        <TEControl:ResourceButton runat="server" ResourceName="Search" OnClick="SearchButton_Click" CssClass="SearchButton" />
    </div>
	<asp:Repeater runat="server" id="ForumList">
        <HeaderTemplate>
        <div class="CommonListArea">
	        <table id="Listing" cellSpacing="0" cellPadding="0" border="0" width="100%">
		        <thead>
			        <tr>
				        <th class="CommonListHeaderLeftMost">
					        <cp:resourcecontrol runat="server" resourcename="CP_Forums_SectionEdit_Name" />
				        </th>
				        <th class="CommonListHeader">
					        <cp:resourcecontrol runat="server" resourcename="CP_Description" />
				        </th>
				        <th class="CommonListHeader">
					        <cp:resourcecontrol runat="server" resourcename="CP_Forums_SectionEdit_Group" />
				        </th>
				        <th class="CommonListHeader">
					        <cp:resourcecontrol runat="server" resourcename="CP_Forums_SectionEdit_ForumEnabled" />
				        </th>
				        <th class="CommonListHeader">
				            &nbsp;	
			            </th>
			        </tr>
		        </thead>
        </HeaderTemplate>
        <ItemTemplate>
                <tr>
                    <td class="CommonListCellLeftMost">
						<TEForum:ForumData runat="server" Property="Name" LinkTo="HomePage" />
                    </td>
                    <td class="CommonListCell">
                        <%# Eval("Description") %>&nbsp;
                    </td>
                    <td class="CommonListCell">
                        <%# Eval("Group.GroupPath")%>&nbsp;
                    </td>
                    <td class="CommonListCell" style="text-align: center;">
                        <img src="<%= Telligent.Evolution.Components.SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(Eval("IsActive").ToString()) ? "published" : "unpublished" %>.gif"
	                        title="<%# Boolean.Parse(Eval("IsActive").ToString()) ? Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Comments_Published", "ControlPanelResources.xml") : Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Comments_NotPublished", "ControlPanelResources.xml")%>" />
                    </td>
                    <td class="CommonListCell" nowrap="nowrap">
                       <input type="button" value="Edit" onclick="window.location = '<%# Telligent.Evolution.Components.Globals.GetSiteUrls().UrlData.FormatUrl("forums_ControlPanel_EditForum", Eval("SectionID").ToString(), Eval("GroupID").ToString()) %>'" />
                       &nbsp;
                       <input type="button" value="Read" onclick="window.location = '<%# Eval("Url") %>'"  />
                       &nbsp;
                       <CP:ResourceButton runat="server" ID="DeleteButton" CommandArgument='<%# Eval("SectionID") %>' CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this forum?');" ResourceName="CP_PermissionList_Delete" />
                    </td>
                </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
                <tr class="AltListRow">
                    <td class="CommonListCellLeftMost">
                        <TEForum:ForumData runat="server" Property="Name" LinkTo="HomePage" />
                    </td>
                    <td class="CommonListCell">
                        <%# Eval("Description") %>&nbsp;
                    </td>
                    <td class="CommonListCell">
                        <%# Eval("Group.GroupPath")%>&nbsp;
                    </td>
                    <td class="CommonListCell" style="text-align: center;">
                        <img src="<%= Telligent.Evolution.Components.SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(Eval("IsActive").ToString()) ? "published" : "unpublished" %>.gif"
	                        title="<%# Boolean.Parse(Eval("IsActive").ToString()) ? Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Comments_Published", "ControlPanelResources.xml") : Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Comments_NotPublished", "ControlPanelResources.xml")%>" />
                    </td>
                    <td class="CommonListCell" nowrap="nowrap">
                       <input type="button" value="Edit" onclick="window.location = '<%# Telligent.Evolution.Components.Globals.GetSiteUrls().UrlData.FormatUrl("forums_ControlPanel_EditForum", Eval("SectionID").ToString(), Eval("GroupID").ToString()) %>'" />
                       &nbsp;
                       <input type="button" value="Read" onclick="window.location = '<%# Eval("Url") %>'"  />
                       &nbsp;
                       <CP:ResourceButton runat="server" ID="DeleteButton" CommandArgument='<%# Eval("SectionID") %>' CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this forum?');" ResourceName="CP_PermissionList_Delete" />
                    </td>
                </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
        </div>
        </FooterTemplate>
    </asp:Repeater>
    
    <TEControl:Pager runat="server" id="forumPager" />
	
	<p class="PanelSaveButton">
		<cp:resourcelinkbutton id="AddButton" runat="server" resourcename="CP_Forums_TreeView_NewForum" cssclass="CommonTextButton" /> &nbsp;&nbsp;&nbsp;
	</p>
</asp:Content>