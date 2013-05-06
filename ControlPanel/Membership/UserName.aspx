<%@ Page language="c#" Codebehind="UserName.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.UserName" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">
		<cp:changeusername runat="server" id="ContentControl" isModal="true">
		    <SkinTemplate>
                <div class="CommonContentArea">
                    <div class="CommonContent">
	                    <cp:StatusMessage runat="server" id="StatusMessage" />
	                    <div class="CommonFormDescription"><cp:ResourceLabel runat="server" ResourceName="ChangeUserName_Instructions" /></div>
	                    <table cellpadding="3" cellspacing="0" border="0" width="300">
		                    <tr>
			                    <td align="left" class="CommonFormFieldName" nowrap="nowrap">
				                    <strong><cp:ResourceLabel runat="server" ResourceName="ChangeUserName_CurrentUserName" /></strong>
			                    </td>
			                    <td align="left" class="CommonFormField" nowrap="nowrap">
				                    <asp:Label id="CurrentUserName" runat=server />
			                    </td>
		                    </tr>
		                    <tr>
			                    <td align="left" class="CommonFormFieldName" nowrap="nowrap">
				                    <strong><cp:ResourceLabel runat="server" ResourceName="ChangeUserName_DesiredUserName" /></strong>
			                    </td>
			                    <td align="left" class="CommonFormField" nowrap="nowrap">
				                    <asp:textbox id="DesiredUserName" runat="server" MaxLength="256" />
			                    </td>
		                    </tr>
		                    <tr>
			                    <td class="CommonFormFieldName" colspan="2">
				                    <asp:CheckBox ID="IgnoreDisallowedNames" Runat="server" />
			                    </td>
		                    </tr>
		                    <tr>
			                    <td class="CommonFormField PanelSaveButton" colspan="2">
				                    <asp:button id="ChangeUserNameButton" runat="server" />
			                    </td>
		                    </tr>
	                    </table>
                    </div>
                </div>
		    </SkinTemplate>
		</cp:changeusername>
</asp:Content>