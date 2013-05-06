<%@ Page language="c#" Codebehind="UserProfileData.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.UserProfileData" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">
    <script type="text/javascript">
        function changeMade() {
        <%-- 
            var clone = document.getElementById('<%= CloneButton.ClientID %>');
            if (clone != null) {
                clone.disabled = true;
            }
            document.getElementById('<%= SaveButton.ClientID %>').disabled = false;
            
        --%>
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
        <%--
            for (var indx = 0; indx < document.getElementById('<%= string.Format("{0}_select", currentFields.ClientID) %>').options.length; indx++) {
                if (indx != 0) {
                    document.getElementById('<%= Page.Form.ClientID %>').GrantedPermissions.value += ',' + document.getElementById('<%= string.Format("{0}_select", currentFields.ClientID) %>').options[indx].value;
                }
                else {
                    document.getElementById('<%= Page.Form.ClientID %>').GrantedPermissions.value = document.getElementById('<%= string.Format("{0}_select", currentFields.ClientID) %>').options[indx].value;
                }
            }
            document.getElementById('<%= Page.Form.ClientID %>').ChangesMade.value = 'true';
            changeMade();
            --%>
        }

        function Move(fromList, toList) {
            var itemIndex = fromList.GetSelectedIndex();
            var item = fromList.GetItemAtIndex(itemIndex);
            fromList.RemoveItem(item);
            toList.AddItem(item);
            fromList.Refresh();
            toList.Refresh();
        }
        function MoveAll(fromList, toList) {
            var count = fromList.GetItemCount();
            for(var i = count -1; i >= 0; i--) {
                var item = fromList.GetItemAtIndex(i);
                fromList.RemoveItem(item);
                toList.AddItem(item);
            }
            fromList.Refresh();
            toList.Refresh();
        }
    </script>
	<div class="CommonContentArea">
		<div class="CommonContent">
			<cp:StatusMessage runat="server" id="statusMessage" />
			<div class="CommonFormDescription"><cp:ResourceLabel runat="server" ResourceName="UserProfileData_Instructions" />:</div>
			<table cellpadding="3" cellspacing="0" border="0" width="500">
				<tr>
					<td align="left" class="CommonFormFieldName" nowrap="nowrap">
						<strong><cp:ResourceLabel runat="server" ResourceName="CP_Membership_Settings_Profile_FieldGroup_Name" /></strong>
					</td>
					<td align="left" class="CommonFormField" nowrap="nowrap">
						<asp:textbox id="fieldGroupName" runat="server" Width="256" MaxLength="256" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<table width="100%">
							<tr>
								<td>
									<i><CP:ResourceControl runat="server" ResourceName="CP_Membership_UserProfileEdit_AvailableFields" /></i>:<br />
									<TWC:OrderedList runat="server" ID="availableFields" Width="200px" Height="250px" EnableMoveUpButton="false" EnableMoveDownButton="false" DraggableOrderedListIds="currentFields" />
								</td>
                                <td align="center">
                                    <div style="padding-right: 8px;">
                                        <p>
                                            <input id="moveRight" type="button" value=" > " onclick="if (document.images) Move(window.<%= this.availableFields.ClientID %>,window.<%= this.currentFields.ClientID %>)"></p>
                                        <p>
                                            <input id="moveLeft" type="button" value=" < " onclick="if (document.images) Move(window.<%= this.currentFields.ClientID %>,window.<%= this.availableFields.ClientID %>)"></p>
                                        <p>
                                            <input id="moveAllRight" type="button" value=">>" onclick="if (document.images) MoveAll(window.<%= this.availableFields.ClientID %>,window.<%= this.currentFields.ClientID %>)"></p>
                                        <p>
                                            <input id="moveAllLeft" type="button" value="<<" onclick="if (document.images) MoveAll(window.<%= this.currentFields.ClientID %>,window.<%= this.availableFields.ClientID %>)"></p>
                                    </div>
                                </td>
								<td>
									<i><CP:ResourceControl runat="server" ResourceName="CP_Membership_UserProfileEdit_CurrentPanelFields" />:</i><br />
									<TWC:OrderedList runat="server" ID="currentFields" Width="200px" Height="250px" DraggableOrderedListIds="availableFields" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="CommonFormField PanelSaveButton" colspan="2">
						<asp:button id="saveButton" runat="server" />
					</td>
				</tr>
			</table>
		</div>
	</div>
</asp:Content>