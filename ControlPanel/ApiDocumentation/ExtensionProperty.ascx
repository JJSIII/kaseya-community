<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExtensionProperty.ascx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.ApiDocumentation.ExtensionProperty" %>
<%@ Register TagPrefix="CP" TagName="TypeLink" Src="~/ControlPanel/ApiDocumentation/TypeLink.ascx" %>

<div class="ExtensionProperty Member">
    <a name="" runat="server" id="PropertyAnchor"><h3 runat="server" id="PropertyNameHeading"></h3></a>
    <div class="MemberBody">
        <p runat="server" id="PropertyDescriptionParagraph"></p>
        <h4><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_ApiDocumentation_Type" ResourceFile="ControlPanelResources.xml" /></h4>
        <p class="MemberBody">
            <CP:TypeLink runat="server" ID="PropertyTypeLink" />
        </p>
        <h4><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_ApiDocumentation_Usage" ResourceFile="ControlPanelResources.xml" /></h4> 
        <p class="code" runat="server" id="PropertySyntaxPre"></p>
    </div>
</div>