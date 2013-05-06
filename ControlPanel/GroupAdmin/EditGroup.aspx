<%@ Page language="c#" EnableViewState="true" Codebehind="EditGroup.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.GroupAdmin.EditGroup" MasterPageFile="~/ControlPanel/Masters/GroupAdmin.master" %>
<%@ Register TagPrefix="CP" TagName="GroupRoles" Src="~/ControlPanel/GroupAdmin/GroupRoles.ascx" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	Edit Group
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">

    <script type="text/javascript">
    
    function DeleteApplication(applicationID)
    {
        if (window.confirm('<CP:ResourceControl ResourceName="CP_Group_SubApplicationDeleteConfirmation" runat="server" Encoding="JavaScript" />'))
            EditGroupPage.DeleteApplication(applicationID, DeleteApplicationCallback);
    }

    function DeleteGroup() {
        if (window.confirm('<CP:ResourceControl ResourceName="CP_Group_DeleteWithApplicationsConfirmation" runat="server" Encoding="JavaScript" />')) {
            EditGroupPage.DeleteGroup(DeleteGroupCallback);
        }
    }

    function DeleteGroupCallback(result) {
        if (result.error == null) {
            eval(result.value);
        }
    }
    
    function DeleteApplicationCallback(result)
    {
        if (result.error)
        {
            alert(result.error);
            return;
        }
        
        if (result.value)
        {
            eval(result.value);
        }
    }

	function Callback(res) {
		if (res)
			$("#EditAvatarTd img").attr("src", res);
	}
    
    </script>
   
    <CP:ControlPanelSelectedNavigation SelectedNavItem="ManageHubs" runat="server" />
    
    <DIV>
		<CP:statusmessage id="administratorGroupWarning" runat="server"></CP:statusmessage>
	</DIV>

	<DIV class="CommonDescription">
		<CP:ResourceControl runat="server" ResourceName="CP_HubAdmin_SectionEdit_Edit_Description" />
	</DIV>

    <TEControl:EditGroupForm runat="server" SubFormIds=""
        ApplicationKeyTextBoxId="AppKey" 
        GroupTypeRadioButtonListId="HubType" 
        ParentGroupSelectionListId="ParentGroupSelection"
        DescriptionTextBoxId="HubDescription" 
        NameTextBoxId="HubName"
        EnableContactCheckBoxId="HubEnableContact"
        EnableGroupMessagesCheckBoxId="GroupEnableMessages"
        SubmitButtonId="Save"
        ApplicationKeyValidatorId="ApplicationKeyValidator"
        GroupTypeValidatorId="GroupTypeValidator"
        DescriptionValidatorId="DescriptionValidator"
        JoinfulGroupsNotAllowedMessageId="JoinfulGroupsNotAllowedMessage"
        >
        <FormTemplate>
        
            <TWC:TabbedPanes id="EditorTabs" runat="server"
	            PanesCssClass="CommonPane"
	            TabSetCssClass="CommonPaneTabSet"
	            TabCssClasses="CommonPaneTab"
	            TabSelectedCssClasses="CommonPaneTabSelected"
	            TabHoverCssClasses="CommonPaneTabHover"
	            >
	            <TWC:TabbedPane runat="server" ID="tabOptions">
		            <Tab><TEControl:ResourceControl runat="server" ResourceName="Hubs_Options" /></Tab>
		            <Content>
		                <table cellspacing="0" cellpadding="0" border="0">
		                    <tr>
		                        <td class="CommonFormFieldName">
		                            <TEControl:ResourceControl ResourceName="Name" runat="server" Tag="Strong" /><br />
		                            <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupName_Desc" runat="server" />
		                        </td>
		                        <td class="CommonFormField"><asp:TextBox runat="server" ID="HubName" Columns="40" /> <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="HubName" Cssclass="validationWarning">*</asp:RequiredFieldValidator></td>
		                    </tr>
		                    <tr>
		                        <td class="CommonFormFieldName">
		                            <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupAvatar" runat="server" Tag="Strong" /><br />
                                    <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupAvatar_Desc" runat="server" />    
		                        </td>
		                        <td class="CommonFormField" id="EditAvatarTd">
	                                <TEControl:GroupAvatar runat="server" Width="80" Height="80" />
	                                <div>
										<a onclick="Telligent_Modal.Open('<%= Telligent.Evolution.Components.GroupUrls.Instance().EditGroupAvatar(CurrentGroup) %>&ReturnAvatarUrl=true&Width=80&Height=80',560,300,Callback); return false;" href="#"><TEControl:ResourceControl ResourceName="Hubs_Avatar_Change" runat="server" /></a>
                                    </div>
		                        </td>
		                    </tr>
		                    <tr>
	                            <td class="CommonFormFieldName">
		                            <strong><CP:ResourceControl runat="server" ResourceName="URL" /></strong><br />
		                            <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupUrl_Desc" runat="server" />
	                            </td>
	                            <td class="CommonFormField">
		                            <asp:TextBox runat="server" ID="AppKey" Columns="40" />
		                            <asp:CustomValidator runat="server" ID="ApplicationKeyValidator"><CP:ResourceControl runat="server" ResourceName="CP_GroupAdmin_GroupInvalidUrl" /></asp:CustomValidator>
	                            </td>
                            </tr>
		                    
		                    <tr>
		                        <td colspan="2">
		                            <div class="CommonFormFieldName">
		                                <TEControl:ResourceControl ResourceName="Description" runat="server" Tag="Strong" /><br />
		                                <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupDescription_Desc" runat="server" />
		                                <asp:customvalidator id="DescriptionValidator" runat="server" controltovalidate="HubDescription" font-bold="True">
				                            <CP:ResourceControl runat="server" ResourceName="CP_DescriptionLengthValidation" /></asp:customvalidator>
		                            </div>
		                            <div class="CommonFormField"><asp:TextBox id="HubDescription" Runat="Server" CssClass="ControlPanelTextInput" MaxLength="256" /></div>
		                        </td>
		                    </tr>

                            <TEControl:PlaceHolder runat="server">
                                <DisplayConditions><TEControl:ControlVisibilityCondition runat="server" ControlId="HubType" ControlVisibilityEquals="true" /></DisplayConditions>
                                <ContentTemplate>
                                    <tr>
                                        <td class="CommonFormFieldName">
                                            <TEControl:ResourceControl ResourceName="Hubs_Type" runat="server" Tag="Strong" />
                                            <br />
                                            <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupType_Desc" runat="server" />
                                        </td>
                                        <td class="CommonFormField">
                                            <cp:resourcecontrol ID="JoinfulGroupsNotAllowedMessage" runat="server" Tag="span" CssClass="CommonLicenseRestrictionMessage" resourcename="LicensingRestriction_JoinfulGroups" />
                                            <asp:RadioButtonList runat="server" ID="HubType" /> <asp:RequiredFieldValidator ID="GroupTypeValidator" runat="server" ControlToValidate="HubType" Cssclass="validationWarning">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </ContentTemplate>
                            </TEControl:PlaceHolder>

                            <TEControl:PlaceHolder runat="server">
                                <DisplayConditions><TEControl:ControlVisibilityCondition runat="server" ControlId="ParentGroupSelection" ControlVisibilityEquals="true" /></DisplayConditions>
                                <ContentTemplate>                                                        
                                    <tr>
                                        <td class="CommonFormFieldName">
                                            <TEControl:ResourceControl ResourceName="Hubs_Group" runat="server" Tag="Strong" /><br />
                                            <CP:ResourceControl ResourceName="CP_GroupAdmin_ParentGroup_Desc" runat="server" />
                                        </td>
                                        <td class="CommonFormField"><TEControl:GroupSelectionList runat="server" ID="ParentGroupSelection" Width="400" RequiredGroupPermission="Group_CreateGroup" /></td>
                                    </tr>
                                </ContentTemplate>
                            </TEControl:PlaceHolder>
                            
                            <TEControl:PlaceHolder runat="server">
                                <DisplayConditions><TEControl:ControlVisibilityCondition runat="server" ControlId="HubEnableContact" ControlVisibilityEquals="true" /></DisplayConditions>
                                <ContentTemplate>
                                    <tr>
                                        <td class="CommonFormFieldName">
                                            <TEControl:ResourceControl ResourceName="Hubs_EnableContact" Tag="Strong" runat="server" /><br />
                                            <TEControl:ResourceControl runat="server" ResourceName="Hubs_Contact_Desc" />
                                        </td>
                                        <td class="CommonFormField">
                                            <asp:CheckBox runat="server" ID="HubEnableContact" />
                                        </td>
                                    </tr>
                                </ContentTemplate>
                            </TEControl:PlaceHolder>
                            
                            <tr>
                                <td class="CommonFormFieldName">
                                    <TEControl:ResourceControl ResourceName="Groups_EnableMessages" Tag="Strong" runat="server" /><br />
                                    <TEControl:ResourceControl runat="server" ResourceName="Groups_EnableMessages_Desc" />
                                </td>
                                <td class="CommonFormField">
                                    <asp:CheckBox runat="server" ID="GroupEnableMessages" />
                                </td>
                            </tr>
                        </table>
                    </Content>
                </TWC:TabbedPane>
                <TWC:TabbedPane runat="server" ID="tabApplications">
		            <Tab ID="ForumPane"><CP:ResourceControl runat=server ResourceName="Applications" /></Tab>
		            <Content>
		                <div class="CommonFormFieldName">
		                    <CP:ResourceControl ResourceName="CP_Group_SubApplications" runat="server" Tag="Strong" /><br />
		                    <CP:ResourceControl runat="server" ResourceName="CP_Group_SubApplications_Desc" />
		                </div>
		                <div class="CommonFormField">    
                            <TEControl:WrappedRepeater runat="Server" id="theApplications">
                            <HeaderTemplate>
                                <TEControl:ConditionalContent runat="server">
                                    <DisplayConditions>
                                        <TEControl:ControlPropertyValueComparison runat="server" ComparisonControlId="theApplications" ComparisonProperty="Items" ComparisonValue="0" Operator="GreaterThan" />
                                    </DisplayConditions>
                                    <TrueContentTemplate>
                                        <table id="AppList" cellSpacing="0" cellPadding="0" border="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th class="CommonListHeaderLeftMost"><cp:resourcecontrol runat="server" resourcename="CP_Group_AppNameHeader" /></th>
                                                    <th class="CommonListHeader" ><cp:resourcecontrol runat="server" resourcename="CP_Group_AppTypeHeader" /></th>
                                                    <th class="CommonListHeader" colspan="2"><cp:resourcecontrol runat="server" resourcename="CP_Group_AppEnabledHeader" /></th>
                                                </tr>
                                            </thead>
    	                            </TrueContentTemplate>
	                            </TEControl:ConditionalContent>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <tr>
                                <td class="CommonListCellLeftMost"><a href="<%# DataBinder.Eval(Container.DataItem, "Url") %>"><%# DataBinder.Eval(Container.DataItem, "Name") %></a></td>
                                <td class="CommonListCell"><%# DataBinder.Eval(Container.DataItem, "Type") %></td>
                                <td class="CommonListCell"><%# (bool)DataBinder.Eval(Container.DataItem, "Enabled") ? Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("Yes") : Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("No")%></td>
                                <td class="CommonListCell">
                                  <input type="button" onclick="window.location='<%# DataBinder.Eval(Container.DataItem, "EditPath") %>'; return false;" 
                                        value="<%# Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_PermissionList_Edit") %>" />
                                    <input type="button" onclick="DeleteApplication('<%# DataBinder.Eval(Container.DataItem, "UniqueId") %>'); return false;" 
                                        value="<%# Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_PermissionList_Delete") %>"
                                        <%# DataBinder.Eval(Container.DataItem, "Disabled") %>
                                        />
                                </td>
                            </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                            <tr class="AltListRow">
                                <td class="CommonListCellLeftMost"><a href="<%# DataBinder.Eval(Container.DataItem, "Url") %>"><%# DataBinder.Eval(Container.DataItem, "Name") %></a></td>
                                <td class="CommonListCell"><%# DataBinder.Eval(Container.DataItem, "Type") %></td>
                                <td class="CommonListCell"><%# (bool)DataBinder.Eval(Container.DataItem, "Enabled") ? Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("Yes") : Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("No")%></td>
                                <td class="CommonListCell">
                                    <input type="button" onclick="window.location='<%# DataBinder.Eval(Container.DataItem, "EditPath") %>'; return false;" 
                                        value="<%# Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_PermissionList_Edit") %>" />
                                    <input type="button" onclick="DeleteApplication('<%# DataBinder.Eval(Container.DataItem, "UniqueId") %>'); return false;" 
                                        value="<%# Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_PermissionList_Delete") %>"
                                        <%# DataBinder.Eval(Container.DataItem, "Disabled") %>
                                         />
                                </td>
                            </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                <TEControl:ConditionalContent runat="server">
                                    <DisplayConditions>
                                        <TEControl:ControlPropertyValueComparison runat="server" ComparisonControlId="theApplications" ComparisonProperty="Items" ComparisonValue="0" Operator="GreaterThan" />
                                    </DisplayConditions>
                                    <TrueContentTemplate>
		                                </table>
    	                            </TrueContentTemplate>
	                            </TEControl:ConditionalContent>
                            </FooterTemplate>
                        </TEControl:WrappedRepeater>
                        <TEControl:Pager runat="server" ID="appPager" PageSize="10">
							<PagerUrlFormatTemplate>
								<TEControl:SiteUrl runat="server" RenderRawUrl="true" UrlName="hub_ControlPanel_AdminEditGroupPaged" Parameter2="App" Parameter3="{0}">
									<Parameter1Template><TEControl:QueryStringData runat="server" Property="GroupID" /></Parameter1Template>
								</TEControl:SiteUrl>
							</PagerUrlFormatTemplate>
                        </TEControl:Pager>
                        <div style="padding-top: 4px;">
                            <asp:PlaceHolder ID="NewApplicationButtonsArea" runat="server" />
                        </div>
                        </div>
                    </Content>
                </TWC:TabbedPane>

				<TWC:TabbedPane runat="server" ID="tabPermissions">
					<Tab ID="PermissionsPane"><TEControl:ResourceControl runat="server" ResourceName="CP_Hub_NavBar_Permissions" ResourceFile="ControlPanelResources.xml" /></Tab>
					<Content>
						<CP:GroupRoles id="GroupRoles" runat="server" />
					</Content>
				</TWC:TabbedPane>
             </TWC:TabbedPanes>
                 
          <p class="PanelSaveButton DetailsFixedWidth">
            <TEControl:ConditionalContent runat="server">
			  <ContentConditions Operator="Or">
				<TEControl:GroupPropertyValueComparison runat="server" ComparisonProperty="Name" Operator="EqualTo" ComparisonValue="Administrators" />
				<TEControl:GroupPropertyValueComparison runat="server" ComparisonProperty="ParentGroupID" Operator="EqualTo" ComparisonValue="-1" />
			  </ContentConditions>
			  <FalseContentTemplate>
                <a href="#" onclick="DeleteGroup();" class="CommonTextButton"><CP:ResourceControl runat="server" ResourceName="Delete" /></a>
              </FalseContentTemplate>
            </TEControl:ConditionalContent>
            <cp:ResourceLinkButton id="Save" runat="Server" CssClass="CommonTextButton" ResourceName="Save" />
	        </p>
	        <p class="PanelSaveButton">
	          <TEControl:ConditionalContent runat="server">
			  <ContentConditions Operator="Or">
				<TEControl:GroupPropertyValueComparison runat="server" ComparisonProperty="Name" Operator="EqualTo" ComparisonValue="Administrators" />
				<TEControl:GroupPropertyValueComparison runat="server" ComparisonProperty="ParentGroupID" Operator="EqualTo" ComparisonValue="-1" />
			  </ContentConditions>
			  <FalseContentTemplate>
                <CP:ResourceLabel runat="server" ResourceName="CP_Group_DeleteWithApplicationsWarning" />
              </FalseContentTemplate>
            </TEControl:ConditionalContent>
	        </p>

        </FormTemplate>
        
    </TEControl:EditGroupForm>

</asp:Content>