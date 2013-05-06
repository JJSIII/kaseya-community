<%@ Page language="c#" Codebehind="Wikis.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.WikiAdmin.WikisListPage" MasterPageFile="~/ControlPanel/Masters/WikiAdmin.master" %>
<%@ Import Namespace="Telligent.Evolution.Wikis.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>

<script runat="server">
    private string WikiUrl(int wikiID)
    {
        if (wikiID > 0)
        {
            Wiki wiki = Wikis.GetWiki(wikiID);
            if (wiki != null)
                return WikiUrls.Instance().View(wiki);
        }
        return string.Empty;
    }
</script>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="SectionDescription" runat="server" resourcename="CP_Wiki_WikiList_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <cp:controlpanelselectednavigation runat="server" SelectedNavItem="WikiList" />
	
	<div class="CommonDescription">
		<cp:resourcecontrol id="Section_Sub_Description" runat="server" resourcename="CP_Wiki_WikiList_SubTitle" />
	</div>
	
	<div style="float: right; margin-bottom: 10px;">
        <div style="float: left; text-align: left; margin-right: 8px;">
            <TEControl:GroupLookUpTextBox ID="GroupLookUp" runat="server" RequiredGroupPermission="Group_CreateBlog" MaximumSelections="1"
                Width="164" EmptyHtml='<%# ResourceManager.GetString("CP_Wiki_WikiList_FilterToGroup", "ControlPanelResources.xml") %>' />
        </div>
        <TEControl:ResourceButton runat="server" ResourceName="Search" OnClick="SearchButton_Click" CssClass="SearchButton" />
    </div>
	<asp:Repeater Runat="server" id="WikiList">
        <HeaderTemplate>
        <div class="CommonListArea">
	        <table id="Listing" cellSpacing="0" cellPadding="0" border="0" width="100%">
		        <thead>
			        <tr>
				        <th class="CommonListHeaderLeftMost">
					        <cp:resourcecontrol runat="server" resourcename="CP_Wiki_GridCol_Name" />
				        </th>
				        <th class="CommonListHeader">
					        <cp:resourcecontrol runat="server" resourcename="CP_Wiki_GridCol_Group" />
				        </th>
				        <th class="CommonListHeader">
					        <cp:resourcecontrol runat="server" resourcename="CP_Wiki_GridCol_Description" />
				        </th>
				        <th class="CommonListHeader">
					        <cp:resourcecontrol runat="server" resourcename="CP_Wiki_GridCol_Enabled" />
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
                        <a href="<%# WikiUrl((int)Eval("ID"))%>"><%# Eval("Name") %></a>
                    </td>
                    <td class="CommonListCell">
                        <%# DataBinder.Eval(Container.DataItem, "Group.GroupPath")%>
                    </td>
                    <td class="CommonListCell">
                        <%# Eval("Description") %>&nbsp;
                    </td>
                    <td class="CommonListCell Status">
                        <img src="<%= Telligent.Evolution.Components.SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(Eval("Enabled").ToString()) ? "published" : "unpublished" %>.gif"
	                        title="<%# Boolean.Parse(Eval("Enabled").ToString()) ? Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Comments_Published", "ControlPanelResources.xml") : Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Comments_NotPublished", "ControlPanelResources.xml")%>" />
                    </td>
                    <td class="CommonListCell" nowrap="nowrap">
                       <input type="button" value="Edit" onclick="window.location = 'WikiEdit.aspx?WikiID=<%# DataBinder.Eval(Container.DataItem,"ID") %>'" />
                       &nbsp;
                       <input type="button" value="Manage" <%# ((bool)Eval("Enabled")) ? "" : "disabled" %> onclick="window.location = '<%# WikiUrls.Instance().ControlPanel_Manage((int)DataBinder.Eval(Container.DataItem,"ID")) %>'" />
                       &nbsp;
                       <CP:ResourceButton runat="server" ID="DeleteButton" CommandArgument='<%# Eval("ID") %>' CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this wiki?');" ResourceName="CP_PermissionList_Delete" />
                    </td>
                </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
                <tr class="AltListRow">
                    <td class="CommonListCellLeftMost">
                        <a href="<%# WikiUrl((int)Eval("ID"))%>"><%# Eval("Name") %></a>
                    </td>
                    <td class="CommonListCell">
                        <%# DataBinder.Eval(Container.DataItem, "Group.GroupPath")%>
                    </td>
                    <td class="CommonListCell">
                        <%# Eval("Description") %>&nbsp;
                    </td>
                    <td class="CommonListCell Status">
                        <img src="<%= Telligent.Evolution.Components.SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(Eval("Enabled").ToString()) ? "published" : "unpublished" %>.gif"
	                        title="<%# Boolean.Parse(Eval("Enabled").ToString()) ? Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Comments_Published", "ControlPanelResources.xml") : Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Comments_NotPublished", "ControlPanelResources.xml")%>" />
                    </td>
                    <td class="CommonListCell" nowrap="nowrap">
                       <input type="button" value="Edit" onclick="window.location = 'WikiEdit.aspx?WikiID=<%# DataBinder.Eval(Container.DataItem,"ID") %>'" />
                       &nbsp;
                       <input type="button" value="Manage" <%# ((bool)Eval("Enabled")) ? "" : "disabled" %> onclick="window.location = '<%# WikiUrls.Instance().ControlPanel_Manage((int)DataBinder.Eval(Container.DataItem,"ID")) %>'" />
                       &nbsp;
                       <CP:ResourceButton runat="server" ID="DeleteButton" CommandArgument='<%# Eval("ID") %>' CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this wiki?');" ResourceName="CP_PermissionList_Delete" />
                    </td>
                </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
        </div>
        </FooterTemplate>
    </asp:Repeater>
	
	<TEControl:Pager runat = "Server" id = "thePager" />
	
	<p class="PanelSaveButton">
		<cp:resourcelinkbutton id="AddButton" runat="server" resourcename="CP_Wiki_WikiList_CreateWiki" cssclass="CommonTextButton" /> &nbsp;&nbsp;&nbsp;
	</p>
</asp:Content>