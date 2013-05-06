<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Masters/ApiDocumentation.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.ApiDocumentation.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<h1><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_ApiDocumentation_ApiDocumentation" ResourceFile="ControlPanelResources.xml" /></h1>
<asp:Repeater runat="server" ID="ExtensionCategoriesRepeater">
    <HeaderTemplate>
    </HeaderTemplate>
    <ItemTemplate>
        <h3><%# DataBinder.Eval(Container.DataItem, "Category")%></h3>
        <asp:Repeater runat="server" ID="ExtensionRepeater">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <a href="#" runat="server" id="ExtensionLink"></a>
                    <span><%# DataBinder.Eval(Container.DataItem, "Description") %></span>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
        </optgroup>
    </ItemTemplate>
</asp:Repeater>
</asp:Content>
