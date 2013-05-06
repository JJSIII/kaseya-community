<%@ Page language="c#" Codebehind="UserPassword.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.UserPassword" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">
		<cp:changepassword runat="server" id="ContentControl" isModal="true">
		    <SkinTemplate>
                <div class="CommonContentArea">
                <div class="CommonContent">
                            <div class="CommonFormDescription"><cp:ResourceLabel runat="server" ResourceName="ChangePassword_Title"/><asp:Label id="UserName" runat=server /></div>
                            <table cellpadding="3" cellspacing="0" border="0" width="100%">
                              <tr>
                                <td class="CommonFormFieldName">
				                    <strong><cp:ResourceLabel runat="server" ResourceName="ChangePassword_NewPassword" /></strong>
                                </td>
                                <td class="CommonFormField">
                                  <asp:textbox TextMode="Password" runat="server" id="NewPassword1" Columns="40" MaxLength="64"/>
                                  <asp:requiredfieldvalidator id="ValidatePassword1" runat="server" ControlToValidate="NewPassword1" Display=Dynamic>*</asp:requiredfieldvalidator>
    					                    <asp:RegularExpressionValidator id="newPasswordRegExValidator" runat="server" ControlToValidate="NewPassword1" Display=Dynamic>*</asp:RegularExpressionValidator>
                                  <asp:CustomValidator ControlToValidate="NewPassword1" id="newPasswordContentValidator" EnableClientScript=false runat="server" Display=Dynamic>*</asp:CustomValidator>
                                </td>        
                              </tr>        
                              <tr>
                                <td class="CommonFormFieldName">
                                    <strong><cp:ResourceLabel runat="server" ResourceName="ChangePassword_ReEnterNewPassword" /></strong>
                                </td>
                                <td class="CommonFormField">
                                  <asp:textbox TextMode="Password" runat="server" id="NewPassword2" Columns="40" MaxLength="64"/>
                                  <asp:requiredfieldvalidator id="ValidatePassword2" runat="server" ControlToValidate="NewPassword2" Display=Dynamic>*</asp:requiredfieldvalidator>                 
                                  <asp:comparevalidator id="ComparePassword" runat="server" ControlToValidate="NewPassword2" ControlToCompare="NewPassword1" Display=Dynamic>*</asp:comparevalidator>
                                </td>        
                              </tr>
                              <tr>
                                <td class="CommonFormField PanelSaveButton" colspan="2">
                                  <asp:ValidationSummary id="ValidationMsg" runat="server" DisplayMode="BulletList" Width="100%" />               
                                  <asp:button id="ChangePasswordButton" runat="server" />
                                </td>
                              </tr>            
                            </table>

                </div>
                </div>

		    </SkinTemplate>
		</cp:changepassword>
</asp:Content>