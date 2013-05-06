<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Masters/ApiDocumentation.Master" AutoEventWireup="true" CodeBehind="Extension.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.ApiDocumentation.Extension" %>
<%@ Register TagPrefix="CP" TagName="ExtensionProperty" Src="~/ControlPanel/ApiDocumentation/ExtensionProperty.ascx" %>
<%@ Register TagPrefix="CP" TagName="ExtensionMethod" Src="~/ControlPanel/ApiDocumentation/ExtensionMethod.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

<div class="Extension">
    <div class="ExtensionHeading">
        <h1 runat="server" id="ExtensionName"></h1>
        <p runat="server" id="ExtensionDescription"></p>
    </div>
    <asp:Repeater runat="server" ID="PropertyRepeater">
        <HeaderTemplate><h2><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_ApiDocumentation_Properties" ResourceFile="ControlPanelResources.xml" /></h2></HeaderTemplate>
        <ItemTemplate>
            <CP:ExtensionProperty runat="server" Property="<%# Container.DataItem %>" />
        </ItemTemplate>
    </asp:Repeater>
    <asp:Repeater runat="server" ID="MethodRepeater">
        <HeaderTemplate><h2><CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_ApiDocumentation_Methods" ResourceFile="ControlPanelResources.xml" /></h2></HeaderTemplate>
        <ItemTemplate>
            <CP:ExtensionMethod runat="server" Method="<%# Container.DataItem %>" />
        </ItemTemplate>
    </asp:Repeater>
</div>

</asp:Content>
