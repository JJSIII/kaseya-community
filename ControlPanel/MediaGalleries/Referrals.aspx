<%@ Page CodeBehind="Referrals.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.Referrals" MasterPageFile="~/ControlPanel/Masters/MediaGalleries.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.MediaGalleries.Components" %>
<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server"><asp:literal id="PageTitle" runat="server" /></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Posts" runat="server" id="SelectedNavigation1" />
	<div class="CommonDescription">
		<cp:resourcelabel runat="server" resourcename="CP_MediaGalleries_Referrals_SubTitle"></cp:resourcelabel>
	</div>
</asp:Content>