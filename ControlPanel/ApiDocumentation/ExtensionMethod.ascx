<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExtensionMethod.ascx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.ApiDocumentation.ExtensionMethod" %>
<%@ Register TagPrefix="CP" TagName="ExtensionMethodOverload" Src="~/ControlPanel/ApiDocumentation/ExtensionMethodOverload.ascx" %>
<%@ Register TagPrefix="CP" TagName="TypeLink" Src="~/ControlPanel/ApiDocumentation/TypeLink.ascx" %>

<div class="ExtensionMethod Member">
    <a name="" runat="server" id="MethodAnchor"><h3 runat="server" id="MethodNameHeading"></h3></a>
    <div class="MemberBody">
        <asp:Repeater runat="server" ID="MethodOverloadsRepeater">        
            <HeaderTemplate><div class="MethodOverloads"></HeaderTemplate>
            <ItemTemplate>
                <CP:ExtensionMethodOverload runat="server" Overload="<%# Container.DataItem %>" />
            </ItemTemplate>
            <FooterTemplate></div></FooterTemplate>
        </asp:Repeater>
        <h4><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_ApiDocumentation_Returns" ResourceFile="ControlPanelResources.xml" /></h4>
        <p class="MemberBody">
            <CP:TypeLink runat="server" ID="ReturnsTypeLink" />
            <CP:ResourceControl runat="server" ResourceName="CP_ApiDocumentation_Nothing" ResourceFile="ControlPanelResources.xml" ID="ReturnsVoid" />
        </p>
    </div>
</div>