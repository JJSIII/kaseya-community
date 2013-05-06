<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageWidgets.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Tools.ManageWidgets" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>
<%@ Register Src="~/ControlPanel/Tools/ManageWidgetsForSection.ascx" TagPrefix="UserControl" TagName="ManageWidgetsForSection" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="Telligent.Evolution.ControlPanel.Components"%>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="CP_Tools_ManageWidgets_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ToolsManageWidgets" />
    
    <CP:StatusMessage ID="StatusMessage" runat="server" />
   
	<div class="CommonDescription">
		<cp:resourcecontrol runat="Server" resourcename="CP_Tools_ManageWidgets_SubTitle" /><BR>
	</div>
	
	<TWC:TabbedPanes runat="server"
	    PanesCssClass="CommonPane"
	    TabSetCssClass="CommonPaneTabSet"
	    TabCssClasses="CommonPaneTab"
	    TabSelectedCssClasses="CommonPaneTabSelected"
	    TabHoverCssClasses="CommonPaneTabHover">
	    
	    <TWC:TabbedPane runat="server">
	        <Tab><cp:resourcecontrol runat="Server" resourcename="CP_Tools_ManageWidgets_DashboardsTabTitle" /></Tab>
	        <Content>
				<div class="CommonFormDescription"><%= string.Format(Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Tools_ManageWidgets_DashboardsTabHelp"), Telligent.Evolution.Components.Globals.GetSiteUrls().ControlPanel_Membership_SiteRoles)%></div>
	            <UserControl:ManageWidgetsForSection id="UserWidgets" runat="server" SelectedThemeTypeId="294234B2-9505-40a9-A679-93162FD50C1C" />
	        </Content>
        </TWC:TabbedPane>
        
	    <TWC:TabbedPane runat="server">
	        <Tab><cp:resourcecontrol runat="Server" resourcename="CP_Tools_ManageWidgets_GroupsTabTitle" /></Tab>
	        <Content>
				<CP:ResourceControl runat="server" ResourceName="CP_Tools_ManageWidgets_GroupsTabHelp" Tag="Div" CssClass="CommonFormDescription" />
	            <UserControl:ManageWidgetsForSection id="GroupWidgets" runat="server" SelectedThemeTypeId="C6108064-AF65-11DD-B074-DE1A56D89593"  />
	        </Content>
        </TWC:TabbedPane>
        
        <TWC:TabbedPane runat="server">
	        <Tab><cp:resourcecontrol runat="Server" resourcename="CP_Tools_ManageWidgets_BlogsTabTitle" /></Tab>
	        <Content>
				<CP:ResourceControl runat="server" ResourceName="CP_Tools_ManageWidgets_BlogsTabHelp" Tag="Div" CssClass="CommonFormDescription" />
                <UserControl:ManageWidgetsForSection id="BlogWidgets" runat="server" SelectedThemeTypeId="A3B17AB0-AF5F-11DD-A350-1FCF55D89593"  />
	        </Content>
        </TWC:TabbedPane>
        
        <TWC:TabbedPane runat="server">
	        <Tab><cp:resourcecontrol runat="Server" resourcename="CP_Tools_ManageWidgets_SitewideTabTitle" /></Tab>
	        <Content>
				<CP:ResourceControl runat="server" ResourceName="CP_Tools_ManageWidgets_SitewideTabHelp" Tag="Div" CssClass="CommonFormDescription" />
                <UserControl:ManageWidgetsForSection id="SiteWidgets" runat="server" SelectedThemeTypeId="0c647246-6735-42f9-875d-c8b991fe739b"  />
	        </Content>
        </TWC:TabbedPane>
    
    </TWC:TabbedPanes>
    <p class="PanelSaveButton">
        <cp:resourcelinkbutton id="RestoreDefaultsButton" onclick="RestoreDefaultsButton_OnClick" runat="server" resourcename="CP_ThemeConfiguration_RestoreDefaults" cssclass="CommonTextButton" />
        &nbsp;&nbsp;	        
        <cp:resourcelinkbutton id="SaveButton" runat="server" resourcename="Save" cssclass="CommonTextButton" OnClick="btnSave_OnClick" />
	</p>
</asp:Content>