<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WidgetEditorContentPane.ascx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Tools.WidgetEditorContentPane" %>
<div runat="server" id="EditableFileWrapper">
    <table width="100%" class="EditableContent">
        <asp:PlaceHolder runat="server" ID="FileMetaControls" Visible="false">
            <tr runat="server" id="FileNameRow">
                <td class="CommonFormFieldName"><cp:formlabel runat="Server" controltolabel="FileName" resourcename="CP_Tools_WidgetEditor_FileName" /></td>
                <td class="CommonFormField">
                    <asp:TextBox runat="server" ID="FileName" CssClass="fileName" Columns="40" MaxLength="40" />.<asp:DropDownList runat="server" ID="FileTypes" CssClass="fileType" />
                    <a href="#" class="delete" title="<CP:ResourceControl runat="server" ResourceName="CP_Tools_WidgetEditor_Delete" />"><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_Tools_WidgetEditor_Delete" /></a>
                </td>
            </tr>                            
        </asp:PlaceHolder>
        <tr>
            <td colspan="2">
                <div class="EditorLabel">
                    <cp:formlabel runat="Server" controltolabel="FileContent" ID="FileContentLabel" ResourceName="CP_Tools_WidgetEditor_FileName" /><br />
                    <asp:Literal runat="server" ID="FieldDescriptionLiteral"></asp:Literal>
                </div>
                <asp:TextBox Wrap="false" runat="server" ID="FileContent" TextMode="MultiLine" CssClass="editor" spellcheck="false" Height="600px" />
            </td>
        </tr>
    </table>
</div>