<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="LanguageResourceEditor.ascx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Utility.LanguageResourceEditor" %>
<asp:ScriptManager runat="server" />
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
  <Scripts>
    <asp:ScriptReference Assembly="Telligent.Evolution.Web" Name="Telligent.Evolution.Web.ControlPanel.Utility.LanguageResourceEditor.js"  />
  </Scripts>
</asp:ScriptManagerProxy>

<div class="resource-editor" runat="server" id="ResourceEditorWrapper">
    <table width="100%">
        <tbody>
            <tr>
                <td class="CommonFormFieldName">
                    <label><CP:ResourceControl runat="server" ResourceName="CP_Tools_WidgetEditor_Resource_Language" /></label><br />
                </td>                                
                <td class="CommonFormField">
                    <select runat="server" id="LanguageSelect"></select>
                </td>
            </tr>    
            <tr>
                <td colspan="2">
                    <asp:Repeater runat="server" ID="LanguageRepeater">
                        <ItemTemplate>
                            <div class="language" data-language="<%# Server.HtmlEncode(((string)DataBinder.Eval(Container.DataItem, "Key"))) %>">
                                <asp:Repeater runat="server" ID="ResourceRepeater">
                                    <HeaderTemplate>
		                                <div class="attribute-list-header">
                                            <label class="input"><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_Tools_WidgetEditor_Resource_Name" /></label>
                                            <label class="value"><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_Tools_WidgetEditor_Resource_Value" /></label>
                                        </div>
		                                <ul class="attribute-list">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li class="attribute-item resource" data-language="<%# Server.HtmlEncode(((string)DataBinder.Eval(Container.DataItem, "Language"))) %>">
			                                <span class="attribute-name">    
                                                <input type="text" value="<%# Server.HtmlEncode(((string)DataBinder.Eval(Container.DataItem, "Name"))) %>" />
                                            </span>
			                                <span class="attribute-value">
                                                <input type="text" value="<%# Server.HtmlEncode(((string)DataBinder.Eval(Container.DataItem, "Value"))) %>" />
                                            </span>
                                            <a href="#" class="delete"><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_Tools_WidgetEditor_Resource_Delete" /></a>
		                                </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
		                                </ul>
		                                <div class="attribute-list-footer"></div>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <a href="#" class="CommonTextButton add"><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_Tools_WidgetEditor_Resource_AddResource" /></a>
                    <input runat="server" id="State" type="hidden" />
                </td>
            </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    jQuery(function ($) {
        $('div.resource-editor').languageResourceEditor({
            deleteConfirmMessage: "<cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_Resource_DeleteConfirm" />",
			enableAddRemove: <%= EnableAddRemove ? "true" : "false" %>
        });
    });
</script>