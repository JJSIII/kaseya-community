<%@ Page language="c#" EnableViewState="False" Codebehind="switch.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.ManageWikis.WikiSwitchPage" MasterPageFile="~/ControlPanel/Masters/Wikis.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Wikis.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderID="PanelNavigation" runat="server">
    <div class="DashboardMenuAreaFull">
        <CP:NavigationDropDownList CssClass="DashboardMenu" OpenCssClass="DashboardMenuOpen" runat="server" FileName="~/ControlPanel/DashboardMenu.config" MenuGroupCssClass="DashboardContextMenuGroup" MenuItemCssClass="DashboardContextMenuItem" MenuItemSelectedCssClass="DashboardContextMenuItemHover" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="Down" />
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <script type="text/javascript">
	// <![CDATA[
	function closeModal(redirectUrl)
	{
	    window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(redirectUrl);
	}
	// ]]>
	</script>
	
	
	    <div class="CommonDescription">
		    <cp:resourcecontrol runat="server" resourcename="CP_Wiki_Switch_Description" />
	    </div>
	    <cp:statusmessage id="Status" runat="server" visible="false"></cp:statusmessage>
		
	    <h4><CP:CSLiteral runat="server" ID="message" /></h4>
		
        <div class="CommonListArea" style="clear:both">
        <asp:Repeater runat = "Server" id = "theWikis">
        <HeaderTemplate>
        <table id="BlogLists" cellSpacing="0" cellPadding="0" border="0" width="100%">
        <thead>
        <tr>
            <th class="CommonListHeaderLeftMost" ><cp:resourcecontrol runat="server" resourcename="CP_Wiki_GridCol_Name" /></th>
            <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Wiki_GridCol_Address" /></th>
            <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Wiki_GridCol_Enabled" /></th>    
        </tr>
        </thead>
        </HeaderTemplate>
        <ItemTemplate>
        <tr>
            <td class="CommonListCellLeftMost">
                <strong><a onclick="window.parent.location = '<%# WikiUrls.Instance().ControlPanel_Manage((int)DataBinder.Eval(Container.DataItem,"ID")) %>';" href="<%# WikiUrls.Instance().ControlPanel_Manage((int)DataBinder.Eval(Container.DataItem,"ID")) %>"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem,"Name").ToString(), 50)%></a></strong>
            </td>
            <td class="CommonListCell">
                /<%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem,"ApplicationKey").ToString(), 50)%>
            </td>
            <td class="CommonListCell" align="center">
                <img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"Enabled").ToString()) ? "published" : "unpublished" %>.gif"/>
            </td>    
        </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
        <tr class="AltListRow">
            <td class="CommonListCellLeftMost">
                <strong><a onclick="window.parent.location = '<%# WikiUrls.Instance().ControlPanel_Manage((int)DataBinder.Eval(Container.DataItem,"ID")) %>';" href="<%# WikiUrls.Instance().ControlPanel_Manage((int)DataBinder.Eval(Container.DataItem,"ID")) %>"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem,"Name").ToString(), 50)%></a></strong>
            </td>
            <td class="CommonListCell">
                /<%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem,"ApplicationKey").ToString(), 50)%>
            </td>
            <td class="CommonListCell" align="center">
                <img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"Enabled").ToString()) ? "published" : "unpublished" %>.gif"/>
            </td>    
        </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
        </table>
        </FooterTemplate>
        </asp:Repeater>
        </div>				

</asp:Content>