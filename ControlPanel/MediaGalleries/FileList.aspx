<%@ Page language="c#" Codebehind="FileList.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.FileList" MasterPageFile="~/ControlPanel/Masters/MediaGalleries.master" %>
<%@ Register TagPrefix="CP" TagName = "FileList" Src = "~/ControlPanel/MediaGalleries/FileList.ascx" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_FileList_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Files" runat="server" id="SelectedNavigation1" />
	<div class="CommonDescription">
		<CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_FileList_Description" />
	</div>
	<CP:FileList id="Postlist1" runat="Server"></CP:FileList>
</asp:Content>