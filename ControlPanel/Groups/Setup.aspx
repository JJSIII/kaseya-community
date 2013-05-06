<%@ Page language="c#" Codebehind="Setup.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Groups._setup" MasterPageFile="~/ControlPanel/Masters/Groups.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script runat="server">
 
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        CSContext csContext = CSContext.Current;
        
        HyperLink link = CSControlUtility.Instance().FindControl(this, "EditAvatarLink") as HyperLink;
        if (!csContext.SiteSettings.EnableGroupSelectableAvatars && !csContext.SiteSettings.EnableGroupUploadedAvatars)
            link.Visible = false;
        else
        {
            link.NavigateUrl = "#";
            link.Attributes["onclick"] = ModalHelper.BuildHandler(this.Page, GroupUrls.Instance().EditGroupAvatar(CSControlUtility.Instance().GetCurrentGroup(this)), 560, 300, "new Function('" + CSControlUtility.Instance().FindControl(this, "AvatarArea").ClientID + ".Reload();')", true);
            link.Text = ResourceManager.GetString("Hubs_Avatar_Change");
        }
    }

</script>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <script type="text/javascript">
        function DeleteGroup() {
            if (window.confirm('<CP:ResourceControl ResourceName="CP_Group_DeleteWithApplicationsConfirmation" runat="server" Encoding="JavaScript" />'))
                SetupGroupPage.DeleteGroup(DeleteGroupCallback);
        }
        function DeleteGroupCallback(result) {
            if (result.error == null) {
                eval(result.value);
            }
        }
    </script>
   
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Setup" runat="server" />

	<div>
		<CP:statusmessage id="administratorGroupWarning" runat="server"></CP:statusmessage>
	</div>

	<div class="CommonDescription">
		<CP:ResourceControl runat="server" ResourceName="CP_HubAdmin_SectionEdit_Edit_Description" />
	</div>
	
	<TEControl:EditGroupForm runat="server" SubFormIds=""
        ApplicationKeyTextBoxId="AppKey" 
        GroupTypeRadioButtonListId="HubType" 
        GroupDropDownListId="HubGroup"
        ParentGroupSelectionListId="ParentGroupSelection"
        DescriptionTextBoxId="Description" 
        NameTextBoxId="HubName"
        EnableContactCheckBoxId="HubEnableContact"
        EnableGroupMessagesCheckBoxId="GroupEnableMessages"
        SubmitButtonId="Save"
        ApplicationKeyValidatorId="ApplicationKeyValidator"
        GroupTypeValidatorId="GroupTypeValidator">
        <SuccessActions>
            <TEControl:ReturnToGroupUrlAction runat="server" />
            <TEControl:GoToReferralUrlAction runat="server" />
            <TEControl:GoToSiteUrlAction UrlName="myGroup_ControlPanel" runat="server">            
                <Parameter1Template><TEControl:GroupData Property="ID" runat="server" /></Parameter1Template>
            </TEControl:GoToSiteUrlAction>           
        </SuccessActions>
        <FormTemplate>
            <div class="FixedWidthContainer">
            <table cellspacing="0" cellpadding="0" border="0">
                <tbody>
                <tr>
                    <td class="CommonFormFieldName">
                        <TEControl:ResourceControl ResourceName="Name" runat="server" Tag="Strong" /><br />
                        <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupName_Desc" runat="server" />
                    </td>
                    <td class="CommonFormField"><asp:TextBox runat="server" ID="HubName" Columns="40" /> <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="HubName" Cssclass="validationWarning">*</asp:RequiredFieldValidator></td>
                </tr>
                <TEControl:PlaceHolder runat="server">
                    <DisplayConditions>
                        <TEControl:ControlVisibilityCondition runat="server" ControlId="EditAvatarLink" ControlVisibilityEquals="true" />
                    </DisplayConditions>
                    <ContentTemplate>
                        <tr>
                            <td class="CommonFormFieldName">
                                <CP:ResourceControl ID="ResourceControl1" ResourceName="CP_GroupAdmin_GroupAvatar" runat="server" Tag="Strong" /><br />
                                <CP:ResourceControl ID="ResourceControl3" ResourceName="CP_GroupAdmin_GroupAvatar_Desc" runat="server" />
                            </td>
                            <td class="CommonFormField">
                                <TEControl:DelayedContent ID="AvatarArea" runat="server" LoadImmediately="true" DelayImmediateLoad="false">
                                    <ContentTemplate>
                                        <TEControl:GroupAvatar ID="GroupAvatar1" runat="server" Width="80" Height="80" />
                                    </ContentTemplate>
                                </TEControl:DelayedContent>
                                <div>
                                    <asp:HyperLink runat="server" ID="EditAvatarLink" />
                                </div>
                            </td>
                        </tr>
                    </ContentTemplate>
                </TEControl:PlaceHolder>
                <tr>
                    <td class="CommonFormFieldName">
                        <strong><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="URL" /></strong><br />
                        <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupUrl_Desc" runat="server" />
                    </td>
                    <td class="CommonFormField">
                        <asp:Literal runat="server" ID="AppKeyUrlPrefix" /><asp:TextBox runat="server" ID="AppKey" Columns="20" /><asp:Literal runat="server" ID="AppKeyUrlSuffix" />
                        <asp:CustomValidator runat="server" ID="ApplicationKeyValidator"><CP:ResourceControl runat="server" ResourceName="CP_GroupAdmin_GroupInvalidUrl" /></asp:CustomValidator>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2">
                        <div class="CommonFormFieldName">
                            <TEControl:ResourceControl ResourceName="Description" runat="server" Tag="Strong" /><br />
                            <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupDescription_Desc" runat="server" />
                        </div>
                        <div class="CommonFormField"><asp:TextBox id="Description" Runat="Server" CssClass="ControlPanelTextInput" Columns="60" MaxLength="256" /></div>
                    </td>
                </tr>

                <tr>
                    <td class="CommonFormFieldName">
                        <TEControl:ResourceControl ResourceName="Hubs_Type" runat="server" Tag="Strong" /><br />
                        <CP:ResourceControl ResourceName="CP_GroupAdmin_GroupType_Desc" runat="server" />
                    </td>
                    <td class="CommonFormField"><asp:RadioButtonList runat="server" ID="HubType" /> <asp:RequiredFieldValidator ID="GroupTypeValidator" runat="server" ControlToValidate="HubType" Cssclass="validationWarning">*</asp:RequiredFieldValidator></td>
                </tr>
                
                <tr>
                    <td class="CommonFormFieldName">
                        <TEControl:ResourceControl ResourceName="Hubs_Group" runat="server" Tag="Strong" /><br />
                        <CP:ResourceControl ResourceName="CP_GroupAdmin_ParentGroup_Desc" runat="server" />
                    </td>
                    <td class="CommonFormField"><TEControl:GroupSelectionList runat="server" ID="ParentGroupSelection" Width="400" RequiredGroupPermission="Group_CreateGroup" /></td>
                </tr>
                
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
                </tbody>
            </table>
            </div>
            
            <p class="PanelSaveButton DetailsFixedWidth">
                <cp:ResourceLabel id="Delete" runat="Server" CssClass="CommonTextButton" ResourceName="Delete" onclick="DeleteGroup();" />
		        <cp:ResourceLinkButton id="Save" runat="Server" CssClass="CommonTextButton" ResourceName="Save" />
	        </p>
	        <p class="PanelSaveButton">
	            <CP:ResourceLabel id="deleteWarning" runat="server" ResourceName="CP_Group_DeleteWithApplicationsWarning" />
	        </p>

        </FormTemplate>
    </TEControl:EditGroupForm>
	
</asp:Content>