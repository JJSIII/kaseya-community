<%@ Page language="c#" Codebehind="UserDelete.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.UserDelete" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">
	<cp:deleteuser runat="server" id="ContentControl" isModal="true">
	    <SkinTemplate>
	        <div class="CommonContentArea">
                <div class="CommonContent">
	                <cp:StatusMessage runat="server" id="StatusMessage" />
	                <div class="CommonFormDescription"><cp:ResourceLabel runat="server" ResourceName="DeleteUser_Instructions" /></div>
	                <table cellpadding="3" cellspacing="0" border="0" class="DeleteUser">
		                <tr>
			                <td align="left" class="CommonFormFieldName DeleteUser" nowrap="nowrap">
				                <strong><cp:ResourceLabel runat="server" ResourceName="DeleteUser_DeleteUserName" /></strong>
			                </td>
			                <td align="left" class="CommonFormField DeleteUser" nowrap="nowrap">
				                <asp:Label id="DeleteUserName" runat=server />
			                </td>
		                </tr>
		                <tr>
			                <td align="left" class="CommonFormFieldName" nowrap="nowrap" colspan="2">
				                <strong><cp:ResourceLabel runat="server" ResourceName="DeleteUser_ReassignUserName" /></strong>
				                <br />
				                &nbsp;&nbsp;&nbsp;<asp:RadioButton ID="AssignToUser" GroupName="who" Runat="server" Checked="True" /><asp:textbox id="ReassignUserName" runat="server" MaxLength="256" />
				                <asp:CustomValidator runat="server" ControlToValidate="ReassignUserName" ID="UserDeleteCustomValidator"><TEControl:ResourceControl runat="server" ResourceName="DeleteUser_DeleteUserValidationError" /></asp:CustomValidator>
				                <br />
				                &nbsp;&nbsp;&nbsp;<asp:RadioButton ID="AssignToAnonymous" GroupName="who" runat="server" />
			                </td>
		                </tr>
		                <tr>
			                <td class="CommonFormField PanelSaveButton" colspan="2">
				                <asp:button id="DeleteUserButton" runat="server" />
			                </td>
		                </tr>
	                </table>
                </div>
            </div>
	    </SkinTemplate>
	</cp:deleteuser>
</asp:Content>