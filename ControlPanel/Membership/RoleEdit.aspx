<%@ Page language="c#" Codebehind="RoleEdit.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.RoleEdit" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Register TagPrefix="CP" TagName = "CreateEditRole" Src = "~/ControlPanel/Membership/CreateEditRole.ascx" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">
	<CP:createeditrole id="CreateEditRole1" runat="Server"></CP:createeditrole>
</asp:Content>