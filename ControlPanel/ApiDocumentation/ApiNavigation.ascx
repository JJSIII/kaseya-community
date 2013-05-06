<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="ApiNavigation.ascx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.ApiDocumentation.ApiNavigation" %>
<div class="navigation">
    <div class="section">
        <h2><a href="#" title="CP_All_Extensions" runat="server" id="AllExtensionsLink"><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_ApiDocumentation_ApiExtensions" ResourceFile="ControlPanelResources.xml" /></a></h2>

        <asp:Repeater runat="server" ID="ExtensionCategoriesRepeater">
            <HeaderTemplate>
                <select class="extension">
                    <option value=""><CP:ResourceControl runat="server" ResourceName="CP_ApiDocumentation_SelectExtension" ResourceFile="ControlPanelResources.xml" /></option>
            </HeaderTemplate>
            <ItemTemplate>
                <optgroup label="<%# DataBinder.Eval(Container.DataItem, "Category")%>">
                <asp:Repeater runat="server" ID="ExtensionRepeater">
                    <ItemTemplate>
                        <option id="option" runat="server"></option>
                    </ItemTemplate>
                </asp:Repeater>
                </optgroup>
            </ItemTemplate>
            <FooterTemplate></select></FooterTemplate>
        </asp:Repeater>
        <h4 runat="server" id="ExtensionTitle" visible="false">
            <a href="#" runat="server" id="BackToExtensions">&#x25c0;</a> <asp:Literal runat="server" id="ExtensionTitleText" runat="server"></asp:Literal>
        </h4>        
        <asp:Repeater runat="server" ID="ExtensionPropertyRepeater" OnItemDataBound="memberRepeater_ItemDataBound">
            <HeaderTemplate>
                <h4><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_ApiDocumentation_Properties" ResourceFile="ControlPanelResources.xml" /></h4>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                    <li class="property"><a href="#" runat="server" id="MemberLink"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
        <asp:Repeater runat="server" ID="ExtensionMethodRepeater" OnItemDataBound="memberRepeater_ItemDataBound">
            <HeaderTemplate>
                <h4><CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_ApiDocumentation_Methods" ResourceFile="ControlPanelResources.xml" /></h4>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                    <li class="method"><a href="#" runat="server" id="MemberLink"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <div class="section">
        <h2><CP:ResourceControl ID="ResourceControl4" runat="server" ResourceName="CP_ApiDocumentation_Documentation" ResourceFile="ControlPanelResources.xml" /></h2>
        <ul>
            <li><a href="#" runat="server" id="DocumentationLink"><CP:ResourceControl ID="ResourceControl6" runat="server" ResourceName="CP_All_Extensions" ResourceFile="ControlPanelResources.xml" /></a></li>
            <asp:Repeater runat="server" ID="StaticContentRepeater">
                <ItemTemplate>
                    <li><a href="#" runat="server" id="ContentLink"></a></li>
                </ItemTemplate>
            </asp:Repeater>
            <li><a href="http://telligent.com/r.ashx?7N" target="_blank"><CP:ResourceControl ID="ResourceControl5" runat="server" ResourceName="CP_ApiDocumentation_TelligentDocumentation" /></a></li>
        </ul>
    </div>
</div>

