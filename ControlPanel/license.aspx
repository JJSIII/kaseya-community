<%@ Page language="c#" Codebehind="license.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel._Default2" MasterPageFile="~/ControlPanel/Masters/ControlPanel.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server"><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_License_AddNewPage" /></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
	<asp:Textbox id="LicenseText" runat="server" rows="10" cols="80" TextMode="MultiLine"></asp:Textbox>
	<BR>
	<asp:Button id="UpdateButton" runat="server"></asp:Button>
	<BR>
	<asp:Label id="Status" runat="server"></asp:Label>
</asp:Content>