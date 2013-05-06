<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TypeLink.ascx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.ApiDocumentation.TypeLink" %>
<span class="TypeLink">
    <span runat="server" id="ArrayOfPrefix">
        <CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_ApiDocumentation_TypeNameArrayPrefix" ResourceFile="ControlPanelResources.xml" />
    </span>    
    <span runat="server" id="SystemType"></span>
    <a href="#" runat="server" id="TypeAnchor"></a>
    <asp:PlaceHolder runat="server" ID="GenericArgumentPlaceholder">
        <CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_ApiDocumentation_TypeNameGenericSeparator" ResourceFile="ControlPanelResources.xml" />
        <span runat="server" id="GenericSystemArgument"></span>
        <a href="#" runat="server" id="GenericArgumentAnchor"></a>
    </asp:PlaceHolder>
</span>