<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="WidgetSelectTheme.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Tools.WidgetSelectTheme" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ID="Content1" ContentPlaceHolderId="bcr" runat="server">

    <TEControl:Title runat="server" ResourceName="CP_Tools_WidgetEditor_SaveForTheme" ResourceFile="ControlPanelResources.xml" IncludeSiteName="false" IncludeSectionOrHubName="false" />

	<div class="CommonContentArea">
	    <div class="CommonContent">
            <div class="CommonFormArea">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr runat="server" id="RevertConfigurationArea">
                        <td class="CommonFormField">
                            <asp:DropDownList runat="server" ID="ThemeList" />
                        </td>
                        <td class="CommonFormFieldName">
                            <CP:ResourceControl ID="ResourceControl23" runat="server" ResourceName="CP_Tools_WidgetEditor_SaveForThemeDesc" />
                        </td>
                    </tr>
                </table>
            </div>
	        <div class="CommonFormArea">
                <div class="CommonFormField PanelSaveButton">
                    <TEControl:ResourceButton runat="server" ID="SelectTheme" ResourceName="CP_Tools_WidgetEditor_SaveForTheme" ResourceFile="ControlPanelResources.xml" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>