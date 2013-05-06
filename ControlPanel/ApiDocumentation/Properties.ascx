<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Properties.ascx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.ApiDocumentation.Properties" %>
<%@ Register TagPrefix="CP" TagName="TypeLink" Src="~/ControlPanel/ApiDocumentation/TypeLink.ascx" %>

<asp:Repeater runat="server" ID="PropertyRepeater">
    <HeaderTemplate>
        <h2><CP:ResourceControl ID="ResourceControl4" runat="server" ResourceName="CP_ApiDocumentation_Properties" ResourceFile="ControlPanelResources.xml" /></h2>
        <table cellspacing="0">
            <thead>
                <tr>
                    <th><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_ApiDocumentation_Name" ResourceFile="ControlPanelResources.xml" /></th>
                    <th><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_ApiDocumentation_Type" ResourceFile="ControlPanelResources.xml" /></th>
                    <th><CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_ApiDocumentation_Description" ResourceFile="ControlPanelResources.xml" /></th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <AlternatingItemTemplate>
            <tr class="oddrow">
                <td><%# DataBinder.Eval(Container.DataItem, "Name") %></td>
                <td><CP:TypeLink runat="server" TypeMetadata="<%# ((Telligent.Evolution.Components.ApiDocumentation.ExtensionPropertyMetadata)Container.DataItem).Type %>" /></td>
                <td><%# DataBinder.Eval(Container.DataItem, "Description") %></td>
            </tr>
    </AlternatingItemTemplate>
    <ItemTemplate>
            <tr>
                <td><%# DataBinder.Eval(Container.DataItem, "Name") %></td>
                <td><CP:TypeLink runat="server" TypeMetadata="<%# ((Telligent.Evolution.Components.ApiDocumentation.ExtensionPropertyMetadata)Container.DataItem).Type %>" /></td>
                <td><%# DataBinder.Eval(Container.DataItem, "Description") %></td>
            </tr>
    </ItemTemplate>
    <FooterTemplate>
            </tbody>
        </table>
    </FooterTemplate>
</asp:Repeater>