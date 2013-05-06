<%@ Page language="c#" Codebehind="CreateADMapping.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.CreateADMapping" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
	
<asp:Content ContentPlaceHolderId="bcr" runat="Server">
	<%--<script type="text/javascript">
		var opener = window.parent.Telligent_Modal.GetWindowOpener(window);
		opener.location = opener.location; 
		opener.Telligent_Modal.Close(true);
	</script>--%>
	<asp:Label runat="server" ID="message" ForeColor="Maroon" Visible="false" />
	<CP:ResourceControl runat="server" ResourceName="CP_Membership_CreateADMapping_ChooseLdapGroup" />
	<table>
		<tr>
			<td>
				<CP:LdapGroupLookUpTextBox runat="server" ID="ldapLookup" MaximumSelections="1" IncludeMappedGroups="false" Width="100" />
			</td>
			<td>
				<CP:ResourceButton runat="server" ID="Submit" ResourceName="CP_Membership_CreateADMapping_CreateRole" />
			</td>
		</tr>
	</table>
	<div style="height:160px;" />
</asp:Content>