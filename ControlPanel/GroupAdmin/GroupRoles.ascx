<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GroupRoles.ascx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.GroupAdmin.GroupRoles" %>
	<cp:controlpanelselectednavigation selectednavitem="SiteRoles" runat="server" />
		<script type="text/javascript">
		// <![CDATA[
		function disableRoleEdit()
		{
			document.getElementById('moveRight').disabled = true;
			document.getElementById('moveAllRight').disabled = true;
			document.getElementById('moveLeft').disabled = true;
			document.getElementById('moveAllLeft').disabled = true;
			document.getElementById('<%= RoleName.ClientID %>').disabled = true;
		}
		
		function deleteOption(object, index) {
			object.options[index] = null;
		}

		function addOption(object, text, value) {
			var defaultSelected = true;
			var selected = true;
			var optionName = new Option(text, value, defaultSelected, selected)
			object.options[object.length] = optionName;
		}

		function copySelected(fromObject, toObject) {
			for (var i = 0, l = fromObject.options.length; i < l; i++) {
				if (fromObject.options[i].selected)
					addOption(toObject, fromObject.options[i].text, fromObject.options[i].value);
			}
			for (var i = fromObject.options.length - 1; i > -1; i--) {
				if (fromObject.options[i].selected)
					deleteOption(fromObject, i);
			}
			setValues();
		}

		function copyAll(fromObject, toObject) {
			for (var i = 0, l = fromObject.options.length; i < l; i++) {
				addOption(toObject, fromObject.options[i].text, fromObject.options[i].value);
			}
			for (var i = fromObject.options.length - 1; i > -1; i--) {
				deleteOption(fromObject, i);
			}
			setValues();
		}

		function setValues()
		{
			document.getElementById('<%= Page.Form.ClientID %>').GrantedPermissions.value = '';
			document.getElementById('<%= Page.Form.ClientID %>').AvailablePermissions.value = '';
		
			for (var indx = 0; indx < document.getElementById('<%= listGrantedPermissions.ClientID %>').options.length; indx++) {
				if (indx != 0)
				{
					document.getElementById('<%= Page.Form.ClientID %>').GrantedPermissions.value += ',' + document.getElementById('<%= listGrantedPermissions.ClientID %>').options[indx].value;
				}
				else
				{
					document.getElementById('<%= Page.Form.ClientID %>').GrantedPermissions.value = document.getElementById('<%= listGrantedPermissions.ClientID %>').options[indx].value;
				}
			}

			for (var indx = 0; indx < document.getElementById('<%= listAvailablePermissions.ClientID %>').options.length; indx++) {
				if (indx != 0) {
					document.getElementById('<%= Page.Form.ClientID %>').AvailablePermissions.value += ',' + document.getElementById('<%= listAvailablePermissions.ClientID %>').options[indx].value;
				}
				else {
					document.getElementById('<%= Page.Form.ClientID %>').AvailablePermissions.value = document.getElementById('<%= listAvailablePermissions.ClientID %>').options[indx].value;
				}
			}
			
			document.getElementById('<%= Page.Form.ClientID %>').ChangesMade.value = 'true';
		}
		// ]]>
	</script>
	<input type="hidden" name="AvailablePermissions" id="AvailablePermissions" value="" />
	<input type="hidden" name="GrantedPermissions" id="GrantedPermissions" value="" />
	<input type="hidden" name="ChangesMade" id="ChangesMade" value="" />

    <cp:resourcecontrol id="RoleEditingNotAllowedLicensing" visible="false" runat="server" Tag="div" CssClass="CommonLicenseRestrictionMessage" resourcename="CP_Membership_Roles_NotAllowedLicensing" />

	<table cellpadding="3" cellspacing="0" border="0" width="600">
		<tr>
			<td>
				<cp:resourcelabel id="DescResourceLabel" runat="server" resourcename="CP_Membership_Roles_List"></cp:resourcelabel>:&nbsp;
				<asp:dropdownlist id="RoleList" runat="Server" AutoPostBack="True" />&nbsp;
                <cp:resourcebutton id="RevertThisRoleButton" runat="server" resourcename="CP_Membership_Roles_RevertRolePermissionOverrides" />&nbsp;
                <cp:resourcebutton id="RevertAllRolesButton" runat="server" resourcename="CP_Membership_Roles_RevertGroupPermissionOverrides" />
			</td>
		</tr>
		<tr>
			<td><hr /></td>
		</tr>
	</table>

	<table cellpadding="3" cellspacing="0" border="0" width="500">
		<tr>
			<td align="left" class="CommonFormFieldName" nowrap="nowrap">
				<strong><cp:ResourceLabel runat="server" ResourceName="CP_Membership_Roles_Name" /></strong>
			</td>
			<td align="left" class="CommonFormField" nowrap="nowrap">
				<asp:textbox id="RoleName" runat="server" Width="256" MaxLength="256" Enabled="false" />
			</td>
		</tr>
		<tr>
			<td align="left" class="CommonFormFieldName" nowrap="nowrap">
				<strong><cp:ResourceLabel runat="server" ResourceName="CP_Membership_Roles_Description" /></strong>
			</td>
			<td align="left" class="CommonFormField" nowrap="nowrap">
				<asp:textbox id="RoleDescription" runat="server" Width="256" MaxLength="256" Enabled="false" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="100%">
					<tr>
						<td>
							<i><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_GroupAdmin_AvailablePerms" />:</i><br />
							<select runat="server" ID="listAvailablePermissions" name="listAvailablePermissions" runat="server" class="RolesListBox" multiple="true" />
						</td>
						<td align="center">
							<div style="padding-right:8px">
								<p><input id="moveRight" type="button" value=" > " onclick="if (document.images) copySelected(<%=this.listAvailablePermissions.ClientID %>,<%=this.listGrantedPermissions.ClientID %>)"></p>
								<p><input id="moveLeft" type="button" value=" < " onclick="if (document.images) copySelected(<%=this.listGrantedPermissions.ClientID %>,<%=this.listAvailablePermissions.ClientID %>)"></p>
								<p><input id="moveAllRight" type="button" value=">>" onclick="if (document.images) copyAll(<%=this.listAvailablePermissions.ClientID %>,<%=this.listGrantedPermissions.ClientID %>)"></p>
								<p><input id="moveAllLeft" type="button" value="<<" onclick="if (document.images) copyAll(<%=this.listGrantedPermissions.ClientID %>,<%=this.listAvailablePermissions.ClientID %>)"></p>
							</div>
						</td>
						<td>
							<i><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_GroupAdmin_GrantedPerms" />:</i><br />
							<select runat="server" ID="listGrantedPermissions" name="listGrantedPermissions" class="RolesListBox" multiple="true"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>