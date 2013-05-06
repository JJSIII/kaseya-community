<%@ Page language="c#" Codebehind="UserDownloads.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.UserDownloads" MasterPageFile="~/ControlPanel/Masters/MediaGalleries.master" %>
<%@ Register TagPrefix="CP" TagName = "DownloadList" Src = "~/ControlPanel/MediaGalleries/UserDownloadList.ascx" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<asp:Literal runat="server" id="DownloadsTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Files" runat="server" id="SelectedNavigation1" />
	<div class="CommonDescription">
		<CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_UserDownloads_Description"/>
	</div>
	<CP:DownloadList id="DownloadList1" runat="Server"></CP:DownloadList>
</asp:Content>