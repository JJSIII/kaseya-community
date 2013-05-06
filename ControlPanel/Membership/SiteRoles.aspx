<%@ Page Language="c#" CodeBehind="SiteRoles.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.SiteRoles"
    MasterPageFile="~/ControlPanel/Masters/MembershipAdmin.master" %>

<asp:Content ContentPlaceHolderID="DescriptionRegion" runat="server">
    <CP:ResourceLabel runat="server" ResourceName="CP_Membership_SiteRoles_Title"></CP:ResourceLabel>
</asp:Content>
<asp:Content ContentPlaceHolderID="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="SiteRoles" runat="server" />

    <script type="text/javascript">
        // <![CDATA[

        function disableRoleEdit() {
            document.getElementById('moveRight').disabled = true;
            document.getElementById('moveAllRight').disabled = true;
            document.getElementById('moveLeft').disabled = true;
            document.getElementById('moveAllLeft').disabled = true;
            //document.getElementById('<%= RoleName.ClientID %>').disabled = true;
        }

        function enableRoleEdit() {
            document.getElementById('moveRight').disabled = false;
            document.getElementById('moveAllRight').disabled = false;
            document.getElementById('moveLeft').disabled = false;
            document.getElementById('moveAllLeft').disabled = false;
            //document.getElementById('<%= RoleName.ClientID %>').disabled = false;
        }

        function roleNameFocus() {
            document.getElementById('<%= RoleName.ClientID %>').focus();
        }

        function deleteIcon() {
            document.getElementById('<%= this.DeleteIcon.ClientID %>').value = 'true';
            document.getElementById('<%= this.DeleteIconButton.ClientID %>').style.display = 'none';
            document.getElementById('<%= this.DeleteStatusMessage.ClientID %>').style.display = '';
        }

        function changeMade() {
            var clone = document.getElementById('<%= CloneButton.ClientID %>');
            if (clone != null) {
                clone.disabled = true;
            }
            document.getElementById('<%= SaveButton.ClientID %>').disabled = false;
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

		function setValues() {
            for (var indx = 0; indx < document.getElementById('<%= listGrantedPermissions.ClientID %>').options.length; indx++) {
                if (indx != 0) {
                    document.getElementById('<%= Page.Form.ClientID %>').GrantedPermissions.value += ',' + document.getElementById('<%= listGrantedPermissions.ClientID %>').options[indx].value;
                }
                else {
                    document.getElementById('<%= Page.Form.ClientID %>').GrantedPermissions.value = document.getElementById('<%= listGrantedPermissions.ClientID %>').options[indx].value;
                }
            }
            document.getElementById('<%= Page.Form.ClientID %>').ChangesMade.value = 'true';
            changeMade();
		}

		function admapclose(returnValue) {
			if (returnValue != null) {
				var href = window.location.href;
				var queryStart = href.indexOf('?');
				if (queryStart > 0) {
					var roleIdStart = href.indexOf('roleid=', queryStart);
					if (roleIdStart > 0) {
						var nextStringIndex = href.indexOf('&', roleIdStart);
						if (nextStringIndex > 0)
							var roleIdSting = href.substring(roleIdStart, nextStringIndex);
						else
							var roleIdSting = href.substring(roleIdStart);
						window.location = href.replace(roleIdSting, 'roleid=' + returnValue);
					}
					else
						window.location = window.location.href + '&roleid=' + returnValue;
				}
				else
					window.location = window.location.href + '?roleid=' + returnValue;
			}
		}

		function validateName(source, args) {
		    args.IsValid = true;
		    var roleName = document.getElementById('<%= RoleName.ClientID %>');
            var roleNameEnabled = roleName.disabled == false;
            if (roleNameEnabled == true) {
                var roleList = document.getElementById('<%= RoleList.ClientID %>');
                var newRoleName = roleName.value.replace(/^\s+|\s+$/g, "");
                var editingExistingRole = new Boolean(<%= EditingExistingRole.ToString().ToLower() %>);
                if (editingExistingRole = true) {
                    var existingRoleId = roleList.options[roleList.selectedIndex].value;
                    for (var i = 0, l = roleList.options.length; i < l; i++) {
                        if (roleList.options[i].text.toLowerCase() == newRoleName.toLowerCase() && roleList.options[i].value != existingRoleId) {
                            args.IsValid = false;
                            break;
                        }
                    }
                }
                else {
                    for (var i = 0, l = roleList.options.length; i < l; i++) {
                        if (roleList.options[i].text.toLowerCase() == newRoleName.toLowerCase()) {
                            args.IsValid = false;
                            break;
                        }
                    } 
                }
            }
		}
        // ]]>
    </script>

    <input type="hidden" name="GrantedPermissions" id="GrantedPermissions" value="" />
    <input type="hidden" name="ChangesMade" id="ChangesMade" value="" />
    <asp:HiddenField runat="server" ID="RoleId" Value="-1" />
    <asp:HiddenField runat="server" ID="DeleteIcon" Value="false" />

    <cp:resourcecontrol id="RoleEditingNotAllowedLicensing" visible="false" runat="server" Tag="div" CssClass="CommonLicenseRestrictionMessage" resourcename="CP_Membership_Roles_NotAllowedLicensing" />

    <table cellpadding="3" cellspacing="0" border="0">
        <tr>
            <td>
                <CP:ResourceLabel ID="DescResourceLabel" runat="server" ResourceName="CP_Membership_Roles_ListSite" />
                :
                <asp:DropDownList ID="RoleList" runat="Server" AutoPostBack="True" />
                <CP:ResourceButton runat="server" ID="UsersInRoleButton" Enabled="false" ResourceName="CP_Membership_Roles_ViewUsers" />
                <CP:ResourceButton runat="server" ID="DeleteButton" Enabled="false" ResourceName="CP_Membership_Roles_Delete"
                    OnClientClick="return confirm('Are you sure you want to delete this role?');" />
                <CP:ResourceButton runat="server" ID="AddNewButton" ResourceName="CP_Membership_Roles_AddRole" />
                <CP:ResourceButton runat="server" ID="CloneButton" Visible="false" ResourceName="CP_Membership_Roles_CloneRole" />
                <CP:ResourceButton runat="server" ID="CreateADMap" Visible="false" ResourceName="CP_Membership_Roles_CreateADMap" OnClientClick="javascript:Telligent_Modal.Open('CreateADMapping.aspx', 240, 350, admapclose); return false;" />
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
    </table>
    <asp:Panel ID="RoleSettings" runat="server" Visible="false">
        <table cellpadding="3" cellspacing="0" border="0" width="500">
            <tr>
                <td align="left" class="CommonFormFieldName" nowrap="nowrap">
                    <strong>
                        <CP:ResourceLabel runat="server" ResourceName="CP_Membership_Roles_Name" />
                    </strong>
                </td>
                <td align="left" class="CommonFormField" nowrap="nowrap">
                    <asp:TextBox ID="RoleName" runat="server" onchange="changeMade()" Enabled="false"
                        Width="256" MaxLength="256" />
                    <asp:CustomValidator ID="RoleNameCustomValidator" runat="server" Enabled="false" ControlToValidate="RoleName"
                        ClientValidationFunction="validateName" OnServerValidate="RoleNameCustomValidator_ServerValidate" ValidationGroup="ValidationGroupSave">
                        <TEControl:ResourceControl runat="server" ResourceName="CP_Membership_Roles_Name_Duplicate" ResourceFile="ControlPanelResources.xml"></TEControl:ResourceControl>
                    </asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td align="left" class="CommonFormFieldName" nowrap="nowrap">
                    <strong>
                        <CP:ResourceLabel runat="server" ResourceName="CP_Membership_Roles_Description" />
                    </strong>
                </td>
                <td align="left" class="CommonFormField" nowrap="nowrap">
                    <asp:TextBox ID="RoleDescription" runat="server" onchange="changeMade()" Enabled="false"
                        MaxLength="256" Columns="90" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td>
                                <i><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_GroupAdmin_AvailablePerms" />:</i><br />
                                <asp:ListBox ID="listAvailablePermissions" name="listAvailablePermissions" CssClass="RolesListBox"
                                    SelectionMode="Multiple" runat="server" />
                                <%--<select runat="server" ID="listAvailablePermissions" name="listAvailablePermissions" runat="server" class="RolesListBox" multiple="true" />--%>
                            </td>
                            <td align="center">
                                <div style="padding-right: 8px;">
                                    <p>
                                        <input id="moveRight" type="button" disabled="true" value=" > " onclick="if (document.images) copySelected(<%=this.listAvailablePermissions.ClientID %>,<%=this.listGrantedPermissions.ClientID %>)"></p>
                                    <p>
                                        <input id="moveLeft" type="button" disabled="true" value=" < " onclick="if (document.images) copySelected(<%=this.listGrantedPermissions.ClientID %>,<%=this.listAvailablePermissions.ClientID %>)"></p>
                                    <p>
                                        <input id="moveAllRight" type="button" disabled="true" value=">>" onclick="if (document.images) copyAll(<%=this.listAvailablePermissions.ClientID %>,<%=this.listGrantedPermissions.ClientID %>)"></p>
                                    <p>
                                        <input id="moveAllLeft" type="button" disabled="true" value="<<" onclick="if (document.images) copyAll(<%=this.listGrantedPermissions.ClientID %>,<%=this.listAvailablePermissions.ClientID %>)"></p>
                                </div>
                            </td>
                            <td>
                                <i><CP:ResourceControl runat="server" ResourceName="CP_GroupAdmin_GrantedPerms" />:</i><br />
                                <asp:ListBox ID="listGrantedPermissions" name="listGrantedPermissions" SelectionMode="Multiple"
                                    CssClass="RolesListBox" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
				<td  colspan="2">
					<asp:Label runat="server" ID="lblADMapped" Visible="false" Text="" ForeColor="Maroon" />
				</td>	
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td colspan="2" align="left">
                                <strong>
                                    <CP:ResourceLabel runat="server" ResourceName="CP_Membership_RoleEdit_UploadRoleIcon" />
                                    <br />
                                </strong>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <cp:roleicons id="RoleIcon" runat="server" EnableLink="false" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:FileUpload ID="RoleIconUpload" runat="server" />
                            </td>
                            <td align="right">
                                <CP:ResourceLabel runat="server" ID="DeleteIconButton" Visible="true" ResourceName="CP_Membership_RoleEdit_DeleteRoleIcon"
                                    CssClass="CommonTextButton CursorPointer" onclick="deleteIcon(); this.disabled=true;" />
                                <CP:ResourceLabel runat="server" style="display:none;" Visible="true" ID="DeleteStatusMessage" ResourceName="CP_Membership_RoleEdit_DeleteRoleIcon_Desc"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <CP:ResourceLabel runat="server" ResourceName="CP_Membership_RoleEdit_RoleIconCacheWarning_Desc"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="CommonFormField PanelSaveButton" colspan="2" style="text-align: left">
                    <CP:ResourceButton runat="server" ID="SaveButton" Enabled="false" ResourceName="CP_Membership_Roles_Save"
                        OnClientClick="setValues();" ValidationGroup="ValidationGroupSave" />
                    
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
