<%@ Page language="c#" Codebehind="ThemeConfiguration-Import.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Groups.ThemeConfigurationImport" MasterPageFile="~/ControlPanel/Masters/Modal.Master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">

    <TEControl:Title ID="title" runat="server" IncludeSiteName="true" Text="Import" />
    
    <TEControl:ImportGroupThemeConfigurationForm runat="server" FileHtmlInputFileId="File" SubmitButtonId="Submit">
        <SuccessActions><TEControl:RefreshPageAction runat="server" WindowNameScript="window.parent.Telligent_Modal.GetWindowOpener(window)" /></SuccessActions>
        <FormTemplate>
            <div class="CommonFormDescription">
                Browse for the XML file containing your theme configuration information and click 'Import'. Note that the imported values will be saved immediately. 
            </div>
            <table cellspacing="0" border="0" cellpadding="0">
                <tr>
                    <td class="CommonFormFieldName">
                        <TEControl:ResourceControl runat="server" ResourceName="Hubs_Import" />
                    </td>
                    <td class="CommonFormField">
                        <input type="file" id="File" runat="server" />
                    </td>
                </tr>
            </table>
            <p />
            <div class="CommonFormFieldName">
                <asp:Button ID="Submit" runat="server" />
            </div>
        </FormTemplate>
    </TEControl:ImportGroupThemeConfigurationForm>

</asp:Content>