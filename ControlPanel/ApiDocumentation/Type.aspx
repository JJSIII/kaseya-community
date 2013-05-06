<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Masters/ApiDocumentation.Master" AutoEventWireup="true" CodeBehind="Type.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.ApiDocumentation.Type" %>
<%@ Register TagPrefix="CP" TagName="ExtensionMethod" Src="~/ControlPanel/ApiDocumentation/ExtensionMethod.ascx" %>
<%@ Register TagPrefix="CP" TagName="PropertyList" Src="~/ControlPanel/ApiDocumentation/Properties.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

<div class="Type">
    <div class="TypeHeading">
        <h1 runat="server" id="TypeName"></h1>
        <p runat="server" id="TypeDescription"></p>
    </div>
    <CP:PropertyList runat="server" id="PropertyList"></CP:PropertyList>
    <asp:Repeater runat="server" ID="MethodRepeater">
        <HeaderTemplate><h2><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_ApiDocumentation_Methods" ResourceFile="ControlPanelResources.xml" /></h2></HeaderTemplate>
        <ItemTemplate>
            <CP:ExtensionMethod runat="server" Method="<%# Container.DataItem %>" />
        </ItemTemplate>
    </asp:Repeater>
</div>

</asp:Content>
