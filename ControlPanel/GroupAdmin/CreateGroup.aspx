<%@ Page language="c#" EnableViewState="true" Codebehind="CreateGroup.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.GroupAdmin.CreateGroup" MasterPageFile="~/ControlPanel/Masters/GroupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	New Group
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="CreateHub" runat="server" />
	
    <CP:StatusMessage id="Status" runat="server"></CP:StatusMessage>

    <asp:Panel runat="server" ID="DescriptionPanel">
	<DIV class="CommonDescription">
		<CP:ResourceControl runat="server" ResourceName="CP_HubAdmin_SectionEdit_New_Description" />
	</DIV>
	</asp:Panel>

	<TEControl:CreateGroupForm runat="server" 
	    DescriptionTextBoxId="HubDescription"
	    ApplicationKeyTextBoxId="AppKey" 
        CreateButtonId="Create" 
        GroupTypeRadioButtonListId="HubType" 
        ParentGroupSelectionListId="ParentGroupSelection"
        GroupNameTextBoxId="NewGroupName"
        NameTextBoxId="HubName"
        CustomValidatorId="CustomValidator"
        DescriptionValidatorId="DescriptionValidator"
        ApplicationKeyValidatorId="ApplicationKeyValidator"
		NameValidatorId="GroupNameValidator"
        JoinfulGroupsNotAllowedMessageId = "JoinfulGroupsNotAllowedMessage"
        SubFormIds=""
        id="CreateHubForm1"
        >
        <SuccessActions>
            <TEControl:GoToSiteUrlAction UrlName="hub_ControlPanel_AdminHubsCreated" runat="server">
                <Parameter1Template><TEControl:GroupData runat="server" Property="ID" /></Parameter1Template>
            </TEControl:GoToSiteUrlAction>
        </SuccessActions>
        <FormTemplate>
        
            <TWC:TabbedPanes id="EditorTabs" runat="server"
	            PanesCssClass="CommonPane"
	            TabSetCssClass="CommonPaneTabSet"
	            TabCssClasses="CommonPaneTab"
	            TabSelectedCssClasses="CommonPaneTabSelected"
	            TabHoverCssClasses="CommonPaneTabHover"
	            >
	            <TWC:TabbedPane runat="server">
		            <Tab><TEControl:ResourceControl runat="server" ResourceName="Hubs_Options" /></Tab>
		            <Content>
                        <div class="CommonFormArea">
                            <asp:CustomValidator runat="server" ID="CustomValidator" />
                        
                            <table cellspacing="0" cellpadding="0" border="0">
	                            <tr>
		                            <td class="CommonFormFieldName">
			                            <strong><CP:ResourceControl runat="server" ResourceName="Name" /></strong><br />
			                            <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupName_Desc" runat="server" />
		                            </td>
		                            <td class="CommonFormField">
			                            <asp:TextBox runat="server" ID="HubName" Columns="40" MaxLength="256" /> 
			                            <asp:RegularExpressionValidator runat="server" ControlToValidate="HubName" ValidationExpression="[\w\W]{0,256}" Display="Dynamic" EnableClientScript="true"><span class="validationWarning"><TEControl:ResourceControl runat="server" ResourceName="Groups_GroupName_TooLong" /></span></asp:RegularExpressionValidator>
			                            <asp:RequiredFieldValidator runat="server" ControlToValidate="HubName" Cssclass="validationWarning">*</asp:RequiredFieldValidator>
										<asp:CustomValidator id="GroupNameValidator" runat="server"><CP:ResourceControl runat="server" ResourceName="CP_GroupAdmin_GroupNameAlreadyExists" /></asp:CustomValidator>
		                            </td>
	                            </tr>
	                            
	                            <tr>
		                            <td class="CommonFormFieldName">
			                            <strong><CP:ResourceControl runat="server" ResourceName="URL" /></strong><br />
			                            <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupUrl_Desc" runat="server" />
		                            </td>
		                            <td class="CommonFormField">
			                            <asp:TextBox runat="server" ID="AppKey" Columns="40" />
			                            <asp:CustomValidator runat="server" ID="ApplicationKeyValidator" CssClass="validationWarning" ><CP:ResourceControl runat="server" ResourceName="CP_GroupAdmin_GroupInvalidUrl" /></asp:CustomValidator>
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
		                                <div class="CommonFormField"><asp:TextBox id="HubDescription" Runat="Server" CssClass="ControlPanelTextInput" TextMode="MultiLine" rows="3" /></div>
                                    </td>
		                        </tr>
            	                
                                <tr>
                                    <td class="CommonFormFieldName">
                                        <TEControl:ResourceControl ResourceName="Hubs_Type" runat="server" Tag="Strong" />
                                        <br />
                                        <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupType_Desc" runat="server" /> <asp:RequiredFieldValidator runat="server" ControlToValidate="HubType" Cssclass="validationWarning">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td class="CommonFormField">
                                        <cp:resourcecontrol ID="JoinfulGroupsNotAllowedMessage" runat="server" Tag="span" CssClass="CommonLicenseRestrictionMessage" resourcename="LicensingRestriction_JoinfulGroups" />
                                        <asp:RadioButtonList runat="server" ID="HubType" />
                                    </td>
                                </tr>
                                
                                <tr runat="server" id="groupSelectRow">
                                    <td class="CommonFormFieldName">
										<TEControl:ResourceControl ResourceName="Hubs_Group" runat="server" Tag="Strong" /><br />
										<CP:ResourceControl ResourceName="CP_GroupAdmin_ParentGroup_Desc" runat="server" />
                                    </td>
                                    <td class="CommonFormField">
                                        <TEControl:GroupSelectionList runat="server" ID="ParentGroupSelection" Width="350" RequiredGroupPermission="Group_CreateGroup" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </Content>
                </TWC:TabbedPane>
            </TWC:TabbedPanes>
            
            <p class="PanelSaveButton DetailsFixedWidth">
		        <cp:ResourceButton id="Create" runat="Server" ResourceName="Save" />
	        </p>
                    
        </FormTemplate>
    </TEControl:CreateGroupForm>
	
</asp:Content>





























































































































































































