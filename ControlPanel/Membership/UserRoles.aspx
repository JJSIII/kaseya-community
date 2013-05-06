<%@ Page language="c#" Codebehind="UserRoles.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.UserRoles" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="AdditionalScripts" runat="server" >

	<script type="text/javascript">
	// <![CDATA[
		function deleteOption(object,index) {
			object.options[index] = null;
		}

		function addOption(object,text,value) {
			var defaultSelected = true;
			var selected = true;
			var optionName = new Option(text, value, defaultSelected, selected)
			object.options[object.length] = optionName;
		}

		function copySelected(fromObject,toObject) {
			for (var i=0, l=fromObject.options.length;i<l;i++) {
				if (fromObject.options[i].selected) {
					if (fromObject.options[i].value != '')
						addOption(toObject, fromObject.options[i].text, fromObject.options[i].value);
					else
						showADWarning();
				}
			}
			for (var i=fromObject.options.length-1;i>-1;i--) {
				if (fromObject.options[i].selected && fromObject.options[i].value != '')
					deleteOption(fromObject,i);
			}
			setValues();
		}

		function copyAll(fromObject,toObject) {
			for (var i = 0, l = fromObject.options.length; i < l; i++) {
				if (fromObject.options[i].value != '')
					addOption(toObject, fromObject.options[i].text, fromObject.options[i].value);
				else
					showADWarning();
			}
			for (var i = fromObject.options.length - 1; i > -1; i--) {
				 if(fromObject.options[i].value != '')
					deleteOption(fromObject,i);
			}
			setValues();
		}

		var adMessageTimeout;
		function showADWarning() {
			clearTimeout(adMessageTimeout);
			document.getElementById('ADWarning').style.display = 'block';
			adMessageTimeout = setTimeout("document.getElementById('ADWarning').style.display = 'none'", 5000);
		}

		function setValues() {
			document.getElementById('<%= this.Page.Form.ClientID %>').AssignedValues.value = '';
			for (var indx = 0; indx < document.getElementById('<%=this.listAssignedRoles.ClientID %>').options.length;indx++) {
				if (document.getElementById('<%=this.listAssignedRoles.ClientID %>').options[indx].value != '') {
					if (document.getElementById('<%= this.Page.Form.ClientID %>').AssignedValues.value != '') {
						document.getElementById('<%= this.Page.Form.ClientID %>').AssignedValues.value += ',' + document.getElementById('<%=this.listAssignedRoles.ClientID %>').options[indx].value;
					}
					else {
						document.getElementById('<%= this.Page.Form.ClientID %>').AssignedValues.value = document.getElementById('<%=this.listAssignedRoles.ClientID %>').options[indx].value;
					}
				}
			}
			document.getElementById('<%= this.Page.Form.ClientID %>').ChangesMade.value = 'true';
		}
	// ]]>	
	</script>

</asp:Content>
	
<asp:Content ContentPlaceHolderId="bcr" runat="Server">

    <div class="CommonContentArea">
    <div class="CommonContent">
	<input type="hidden" name="AssignedValues" id="AssignedValues" value="" />
	<input type="hidden" name="ChangesMade" id="ChangesMade" value="" />
	<table cellspacing="0" cellpadding="0" border="0">
    <tr>
        <td><div class="CommonFormFieldName"><strong><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_Membership_UserRoles_AvaialbleRoles" /></strong></div></td>
		<td></td>
        <td><div class="CommonFormFieldName"><strong><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="Roles" /> <asp:label id="lblUserName" runat="server" /> <CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="is_in" /></strong></div></td>
	</tr>
	<tr>
		<td><div class="CommonFormField">
			<select id="listAvailableRoles" name="listAvailableRoles" runat="server" class="RolesListBox" multiple="true" size="30" />
		</div></td>
		<td height="100%">
			<table height="100%" cols="1" cellpadding="0" width="100%">
			<tr>
				<td valign="middle">
					<p><input type="button" value=" > " onclick="if (document.images) copySelected(<%=this.listAvailableRoles.ClientID %>,<%=this.listAssignedRoles.ClientID %>)"></p>
					<p><input type="button" value=" < " onclick="if (document.images) copySelected(<%=this.listAssignedRoles.ClientID %>,<%=this.listAvailableRoles.ClientID %>)"></p>
					<p><input type="button" value=">>" onclick="if (document.images) copyAll(<%=this.listAvailableRoles.ClientID %>,<%=this.listAssignedRoles.ClientID %>)"></p>
					<p><input type="button" value="<<" onclick="if (document.images) copyAll(<%=this.listAssignedRoles.ClientID %>,<%=this.listAvailableRoles.ClientID %>)"></p>
				</td>
			</tr>
			</table>
		</td>
		<td><div class="CommonFormField">
			<select id="listAssignedRoles" name="listAssignedRoles" runat="server" class="RolesListBox" multiple="true" size="30" />
		</div></td>
	</tr>
	<tr>
		<td colspan="3" align="left">
			<div class="CommonFormField" id="ADWarning" style="display:none;">
				<cp:ResourceControl runat="server" resourcename="CP_Membership_Roles_ADMappedRoleCannotBeMoved"></cp:ResourceControl>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3" align="right">
			<div class="CommonFormField"><div class="PanelSaveButton">
				<cp:resourcelinkbutton id="btnSave" runat="server" cssclass="CommonTextButton" resourcename="Save"></cp:resourcelinkbutton>
			</div></div>
		</td>
	</tr>
    </table>
  </div>
  </div>

</asp:Content>