<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExtensionMethodOverload.ascx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.ApiDocumentation.ExtensionMethodOverload" %>
<%@ Register TagPrefix="CP" TagName="TypeLink" Src="~/ControlPanel/ApiDocumentation/TypeLink.ascx" %>

<div class="MethodOverload">    
    <h4 runat="server" id="OverloadHeading" class="OverloadHeading"></h4>
    <p runat="server" id="OverloadDescriptionParagraph"></p>
    <h4><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_ApiDocumentation_Usage" ResourceFile="ControlPanelResources.xml" /></h4> 
    <p class="code" runat="server" id="OverloadSyntaxPre"></p>    
    <asp:PlaceHolder runat="server" ID="ParametersPlaceholer">
        <h4><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_ApiDocumentation_Parameters" ResourceFile="ControlPanelResources.xml" /></h4>
        <CP:ResourceControl runat="server" Tag="Em" CssClass="MissingParameters" ID="MissingParameters" ResourceName="CP_ApiDocumentation_MissingParameters" ResourceFile="ControlPanelResources.xml" />
        <asp:Repeater runat="server" ID="ParametersRepeater">
            <HeaderTemplate>
                <table cellspacing="0">
                    <thead>
                        <tr>
                            <th><CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_ApiDocumentation_Name" ResourceFile="ControlPanelResources.xml" /></th>
                            <th><CP:ResourceControl ID="ResourceControl4" runat="server" ResourceName="CP_ApiDocumentation_Type" ResourceFile="ControlPanelResources.xml" /></th>
                            <th><CP:ResourceControl ID="ResourceControl5" runat="server" ResourceName="CP_ApiDocumentation_Description" ResourceFile="ControlPanelResources.xml" /></th>
                            <th><CP:ResourceControl ID="ResourceControl6" runat="server" ResourceName="CP_ApiDocumentation_Required" ResourceFile="ControlPanelResources.xml" /></th>
                            <th><CP:ResourceControl ID="ResourceControl7" runat="server" ResourceName="CP_ApiDocumentation_Default" ResourceFile="ControlPanelResources.xml" /></th>
                            <th><CP:ResourceControl ID="ResourceControl8" runat="server" ResourceName="CP_ApiDocumentation_Options" ResourceFile="ControlPanelResources.xml" /></th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <AlternatingItemTemplate>
                    <tr class="oddrow">
                        <td><%# DataBinder.Eval(Container.DataItem, "Name") %></td>
                        <td><CP:TypeLink runat="server" TypeMetadata="<%# ((Telligent.Evolution.Components.ApiDocumentation.ExtensionParameterMetadata)Container.DataItem).Type %>" /></td>
                        <td><%# DataBinder.Eval(Container.DataItem, "Description") %></td>
                        <td><asp:Literal runat="server" ID="IsRequiredLiteral"></asp:Literal></td>
                        <td><%# DataBinder.Eval(Container.DataItem, "Default") %></td>
                        <td><asp:Literal runat="server" ID="OptionsLiteral"></asp:Literal></td>
                    </tr>
            </AlternatingItemTemplate>
            <ItemTemplate>
                    <tr>
                        <td><%# DataBinder.Eval(Container.DataItem, "Name") %></td>
                        <td><CP:TypeLink ID="TypeLink1" runat="server" TypeMetadata="<%# ((Telligent.Evolution.Components.ApiDocumentation.ExtensionParameterMetadata)Container.DataItem).Type %>" /></td>
                        <td><%# DataBinder.Eval(Container.DataItem, "Description") %></td>
                        <td><asp:Literal runat="server" ID="IsRequiredLiteral"></asp:Literal></td>
                        <td><%# DataBinder.Eval(Container.DataItem, "Default") %></td>
                        <td><asp:Literal runat="server" ID="OptionsLiteral"></asp:Literal></td>
                    </tr>
            </ItemTemplate>
            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </asp:PlaceHolder>
</div>
