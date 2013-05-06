<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MediaGalleryEditControl.ascx.cs" Inherits="Telligent.Evolution.ControlPanel.MediaGalleryAdmin.MediaGalleryEditControl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="CP" TagName = "MediaGalleryDetails" Src = "~/ControlPanel/MediaGalleryAdmin/MediaGalleryEditControlDetails.ascx" %>
<%@ Register TagPrefix="CP" TagName = "MediaGalleryOptions" Src = "~/ControlPanel/MediaGalleryAdmin/MediaGalleryOptionsControl.ascx" %>
<%@ Register TagPrefix="CP" TagName = "MediaGalleryQuotas" Src = "~/ControlPanel/MediaGalleryAdmin/MediaGalleryQuotasControl.ascx" %>
<%@ Register TagPrefix="CP" TagName="AppRoles" Src="~/ControlPanel/GroupAdmin/AppRoles.ascx" %>

<TWC:TabbedPanes id="EditorTabs" runat="server"
	PanesCssClass="CommonPane"
	TabSetCssClass="CommonPaneTabSet"
	TabCssClasses="CommonPaneTab"
	TabSelectedCssClasses="CommonPaneTabSelected"
	TabHoverCssClasses="CommonPaneTabHover"
	>
	<TWC:TabbedPane runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_CreateEditMediaGallery_Tab_Settings" /></Tab>
		<Content>
			<CP:MediaGalleryDetails id="SectionDetails1" runat="Server"></CP:MediaGalleryDetails>
		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane runat="server" ID="AdvancedTab">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_CreateEditMediaGallery_Tab_Options" /></Tab>
		<Content>
			<CP:MediaGalleryOptions id="MediaGalleryOptions1" runat="Server"></CP:MediaGalleryOptions>
		</Content>
	</TWC:TabbedPane>
	
	<TWC:TabbedPane ID="PermissionsTab" runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_Tab_Permissions" /></Tab>
		<Content>
		    <CP:AppRoles id="AppRoles" runat="server" />
		</Content>
	</TWC:TabbedPane>
	
	<TWC:TabbedPane runat="server" id="QuotasTab">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_CreateEditMediaGallery_Tab_Quotas" /></Tab>
		<Content>
		    <CP:MediaGalleryQuotas runat="server" id="MediaGalleryQuotas1" />
		</Content>
    </TWC:TabbedPane>
</TWC:TabbedPanes>	
