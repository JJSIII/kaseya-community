<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemeConfigurationImport.aspx.cs" Inherits="Telligent.Evolution.ControlPanel.Settings.ThemeConfigurationImport" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">

	<div class="CommonContentArea">
	<div class="CommonContent">
	    <div class="CommonFormArea">
        
        <CP:StatusMessage runat="server" id="StatusMessage" />
				
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
	        <tr>
		        <td class="CommonFormDescription" colspan="3">
			        <CP:ResourceControl runat="server" ResourceName="CP_ThemeConfigurationImport_Description" />
		        </td>
	        </tr>
            <tr>
                <td class="CommonFormFieldName">
	                <CP:ResourceControl runat="server" ResourceName="CP_ThemeConfigurationImport_File" />
                </td>
                <td class="CommonFormField"><input id="File" type="file" runat="server" /></td>
            </tr>
	        <tr>
		        <td colspan="3" class="CommonFormActionButtons">
			        <cp:resourcelinkbutton id="ImportButton" runat="server" cssclass="CommonTextButton" resourcename="CP_ThemeConfigurationImport_Import" />
		        </td>
	        </tr>
        </table>
    </div>
</asp:Content>

