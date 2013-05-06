<%@ Page language="c#" Codebehind="ChangeGroupAvatar.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Groups.ChangeGroupAvatar" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">
	<script type="text/javascript" language="javascript">
		var returnValue = undefined;

        function CloseModal()
        {
            var opener = window.parent.Telligent_Modal.GetWindowOpener(window);
            opener.Telligent_Modal.Close(returnValue);
        }
    </script>
     
    <div>
        <TEControl:ConditionalAction runat="server">
            <Conditions Operator="Not">
                <TEControl:ControlVisibilityCondition runat="server" ControlId="SelectableAvatars" />
            </Conditions>
            <Actions>
                <TEControl:SetVisibilityAction runat="server" ControlIdsToHide="AvatarSelectionTab" />
            </Actions>
        </TEControl:ConditionalAction>
        
        <TEControl:ConditionalAction runat="server">
            <Conditions Operator="Not">
                <TEControl:ControlVisibilityCondition runat="server" ControlId="AvatarUpload" />
            </Conditions>
            <Actions>
                <TEControl:SetVisibilityAction runat="server" ControlIdsToHide="AvatarUploadTab" />
            </Actions>
        </TEControl:ConditionalAction>
        
        <TWC:TabbedPanes runat="server"
            PanesCssClass="CommonPane"
            TabSetCssClass="CommonPaneTabSet"
            TabCssClasses="CommonPaneTab"
            TabSelectedCssClasses="CommonPaneTabSelected"
            TabHoverCssClasses="CommonPaneTabHover"
            >
                <TWC:TabbedPane runat="server" ID="AvatarUploadTab">
                    <Tab><TEControl:ResourceControl runat="server" ResourceName="Hubs_Avatar_UploadAvatar" /></Tab>
                    <Content>
                        <TEControl:EditGroupAvatarForm runat="server"
                             UploadAvatarButtonId="UploadAvatarButton"
                             UploadAvatarHtmlInputFileId="AvatarUpload"
                             DeleteAvatarButtonId="RemoveUploadAvatarButton"
                        >
                            <SuccessActions>
                                <TEControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
                            </SuccessActions>
                            <FormTemplate>
                                <div class="CommonFormFieldName">
                                    <TEControl:ResourceControl runat="server" ResourceName="Hubs_Avatar_UploadAvatar" />
                                </div>
                                <TEControl:ResourceControl runat="server" ResourceName="Hubs_Avatar_UploadAvatar_Desc" CssClass="CommonFormFieldDescription" />
                                <div class="CommonFormField">
                                    <input type="file" runat="server" id="AvatarUpload" /> 
                                </div>
                                <div class="CommonFormFieldName">
                                    <TEControl:ResourceButton id="UploadAvatarButton" runat="server" ResourceName="Hubs_Avatar_UploadButton" CausesValidation="false" />
                                    <TEControl:ResourceButton runat="server" ID="RemoveUploadAvatarButton" ResourceName="Hubs_Avatar_RemoveAvatar" />
                                </div>
                            </FormTemplate> 
                        </TEControl:EditGroupAvatarForm>
                    </Content>
                </TWC:TabbedPane>
                
                <TWC:TabbedPane runat="server" ID="AvatarSelectionTab">
                    <Tab><TEControl:ResourceControl runat="server" ResourceName="Hubs_Avatar_AvatarSelect" /></Tab>
                    <Content>
                        <TEControl:EditGroupAvatarForm runat="server"
                             SelectableAvatarsRadioButtonListId="SelectableAvatars" 
                             SelectableAvatarHeight="60" 
                             SelectableAvatarWidth="60"
                             SubmitButtonId="UpdateSelectedAvatarButton"
                             DeleteAvatarButtonId="RemoveSelectAvatarButton"
                        >
                            <SuccessActions>
                                <TEControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
                            </SuccessActions>
                            <FormTemplate>
                                <div class="CommonFormFieldName"><TEControl:ResourceControl ResourceName="Hubs_Avatar_AvatarSelect" runat="server" /></div>
                                <TEControl:ResourceControl runat="server" ResourceName="Hubs_Avatar_AvatarSelect_Desc" CssClass="CommonFormFieldDescription" />
                                <div class="CommonFormField">
                                    <asp:RadioButtonList RepeatLayout="Flow" runat="server" ID="SelectableAvatars" RepeatColumns="6" />
                                </div>
                                <div class="CommonFormFieldName">		
                                    <TEControl:ResourceButton runat="server" id="UpdateSelectedAvatarButton" ResourceName="Hubs_Avatar_UseSelectedAvatar" />
                                    <TEControl:ResourceButton runat="server" ID="RemoveSelectAvatarButton" ResourceName="Hubs_Avatar_RemoveAvatar" />
                                </div>
                            </FormTemplate> 
                        </TEControl:EditGroupAvatarForm>
                    </Content>
                </TWC:TabbedPane>
        </TWC:TabbedPanes>
        
    </div>

</asp:Content>