<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/modal.Master" %>
<%@ Import Namespace="Telligent.Evolution.Components"%>

<asp:Content ContentPlaceHolderID="content" runat="server">
	<TEControl:JQuery runat="server" />
	<TEControl:JQueryValidate runat="server" />

    <TEControl:Title runat="server" ResourceName="EditProfile_ChangeAvatar" />

    <script type="text/javascript" language="javascript">
        // <![CDATA[
        var isUploaded = false;
        var isUploading = false;
        var uploadValidation;
        $(document).ready(function() {
            var selector = '#<%= CSControlUtility.Instance().FindControl(this, "SubmitAvatar").ClientID %>';
            if ($(selector).length > 0) {
                var validation = new Telligent_Validation(selector, { 
                    onValidatedFunction: function(isValid, buttonClicked, context) { 
                        if (isValid) 
                            $(selector).removeClass('disabled'); 
                        else
                            $(selector).addClass('disabled');
                    }, 
                    onSuccessfulClickFunction: function(e) { $('.processing', $(selector).parent()).css("visibility", "visible"); $(selector).addClass('disabled'); } 
                });
                

                uploadValidation = validation.AddCustomValidation('fileUpload',
                    function() { return !isUploading && isUploaded; },
                    '<%= JavaScript.Encode(ResourceManager.GetString("Avatar_Upload_ClickToBrowse")) %>',
                    '.field-item.avatar-upload .field-item-validation', null);
            }
            
            var selector2 = '#<%= CSControlUtility.Instance().FindControl(this, "UpdateSelectedAvatarButton").ClientID %>';
            if ($(selector2).length > 0) {
                var validation2 = new Telligent_Validation(selector2, { onValidatedFunction: function(isValid, buttonClicked, context) { if (isValid) $(selector2).removeClass('disabled'); else $(selector2).addClass('disabled'); }, onSuccessfulClickFunction: function(e) { $('.processing', $(selector2).parent()).css("visibility", "visible"); $(selector2).addClass('disabled'); } });

                var radioValidation = validation2.AddCustomValidation('requiredselectedavatar',
			            function() { return $('#<%= CSControlUtility.Instance().FindControl(this, "SelectableAvatars").ClientID %> input:checked').length > 0 },
			            '<%= JavaScript.Encode(ResourceManager.GetString("RequiredField")) %>',
			            '.field-item.avatar-select .field-item-validation', null);

                $('#<%= CSControlUtility.Instance().FindControl(this, "SelectableAvatars").ClientID %> input').click(radioValidation);
            }

            var selector3 = '#<%= CSControlUtility.Instance().FindControl(this, "UpdateLinkedAvatarButton").ClientID %>';
            if ($(selector3).length > 0) {
                var validation3 = new Telligent_Validation(selector3, { onValidatedFunction: function(isValid, buttonClicked, context) { if (isValid) $(selector3).removeClass('disabled'); else $(selector3).addClass('disabled'); }, onSuccessfulClickFunction: function(e) { $('.processing', $(selector3).parent()).css("visibility", "visible"); $(selector3).addClass('disabled'); } });

                validation3.AddField('#<%= CSControlUtility.Instance().FindControl(this, "AvatarUrl").ClientID %>', { required: true, messages: { required: '<%= JavaScript.Encode(ResourceManager.GetString("Avatar_Url_ImageUrl")) %>'} }, '.field-item.avatar-link .field-item-validation', null);
            }
        });

        function CloseModal()
        {
            var opener = window.parent.Telligent_Modal.GetWindowOpener(window);
            opener.Telligent_Modal.Close();
        }

        function UploadError() {
            isUploaded = false;
            isUploading = false;
            uploadValidation();
            $('.field-item.avatar-upload .field-item-validation').html('<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_FileUpload_Error")) %>').show();
        }

        function UploadComplete() {
            isUploaded = true;
            isUploading = false;
            uploadValidation();
        }

        function UploadStarted() {
            isUploaded = false;
            isUploading = true;
            uploadValidation();
        }
        // ]]>
	</script>

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
            <TEControl:ControlVisibilityCondition runat="server" ControlId="FileUpload" />
        </Conditions>
        <Actions>
            <TEControl:SetVisibilityAction runat="server" ControlIdsToHide="AvatarUploadTab" />
        </Actions>
    </TEControl:ConditionalAction>
    
    <TEControl:ConditionalAction runat="server">
        <Conditions Operator="Not">
            <TEControl:ControlVisibilityCondition runat="server" ControlId="AvatarUrl" />
        </Conditions>
        <Actions>
            <TEControl:SetVisibilityAction runat="server" ControlIdsToHide="AvatarLinkTab" />
        </Actions>
    </TEControl:ConditionalAction>
    
    <TWC:TabbedPanes id="ProfileTabs" runat="server"
        PanesCssClass="tab-pane"
        TabSetCssClass="tab-set"
        TabCssClasses="tab"
        TabSelectedCssClasses="tab selected"
        TabHoverCssClasses="tab hover"
        >
            <TWC:TabbedPane runat="server" ID="AvatarUploadTab">
                <Tab><TEControl:ResourceControl runat="server" ResourceName="EditProfile_UploadAvatarTab" /></Tab>
                <Content>
                    <TEControl:EditUserAvatarForm runat="server"
                         UploadAvatarButtonId="SubmitAvatar"
                         AvatarFileUploadId="FileUpload"
                         RemoveAvatarButtonId="RemoveUploadAvatarButton"
                    >
                       <SuccessActions>
                            <TEControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
                        </SuccessActions>
                        <FormTemplate>
                            <div class="field-list-header"></div>
                            <fieldset class="field-list">
                                <ul class="field-list">
                                    <li class="field-item avatar-upload">
                                        <label class="field-item-header"><TEControl:ResourceControl runat="server" ResourceName="EditProfile_UploadAvatar" /></label>
                                        <span class="field-item-description"><TEControl:ResourceControl runat="server" ResourceName="EditProfile_UploadAvatar_Desc" /></span>
                                        <span class="field-item-input"><TWC:FileUpload ID="FileUpload" runat="server" OnUploadErrorClientFunction="UploadError" OnUploadingCompleteClientFunction="UploadComplete" OnUploadingStartedClientFunction="UploadStarted" /></span>
                                        <span class="field-item-validation" style="display: none;"></span>
                                    </li>
                                    <li class="field-item submit-form">
                                        <span class="field-item-input">
                                            <asp:LinkButton ID="SubmitAvatar" runat="server" CssClass="internal-link submit-form"><span></span><TEControl:ResourceControl runat="server" ResourceName="EditProfile_AvatarUploadButton" /></asp:LinkButton>
                                            <asp:LinkButton ID="RemoveUploadAvatarButton" runat="server" CssClass="internal-link submit-form"><span></span><TEControl:ResourceControl runat="server" ResourceName="EditProfile_RemoveAvatar" /></asp:LinkButton>
                                            <span class="processing" style="visibility: hidden;"></span>
                                        </span>
                                    </li>
                                </ul>
                            </fieldset>
                            <div class="field-list-footer"></div>
                        </FormTemplate>
                    </TEControl:EditUserAvatarForm>
                </Content>
            </TWC:TabbedPane>
            
            <TWC:TabbedPane runat="server" ID="AvatarSelectionTab">
                <Tab><TEControl:ResourceControl runat="server" ResourceName="EditProfile_AvatarSelect" /></Tab>
                <Content>
                    <TEControl:EditUserAvatarForm runat="server"
                        SelectableAvatarsRadioButtonListId="SelectableAvatars" 
                        SelectableAvatarHeight="60" 
                        SelectableAvatarWidth="60"
                        SubmitButtonId="UpdateSelectedAvatarButton"
                        RemoveAvatarButtonId="RemoveSelectAvatarButton"
                    >
                       <SuccessActions>
                            <TEControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
                        </SuccessActions>
                        <FormTemplate>
                            <div class="field-list-header"></div>
                            <fieldset class="field-list">
                                <ul class="field-list">
                                    <li class="field-item avatar-select">
                                        <label class="field-item-header"><TEControl:ResourceControl ResourceName="EditProfile_AvatarSelect" runat="server" /></label>
                                        <span class="field-item-description"><TEControl:ResourceControl runat="server" ResourceName="EditProfile_AvatarSelect_Desc" /></span>
                                        <span class="field-item-input"><asp:RadioButtonList RepeatLayout="Flow" runat="server" ID="SelectableAvatars" RepeatColumns="6" /></span>
                                        <span class="field-item-validation" style="display: none;"></span>
                                    </li>
                                    <li class="field-item submit-form">
                                        <span class="field-item-input">
                                            <asp:LinkButton ID="UpdateSelectedAvatarButton" runat="server" CssClass="internal-link submit-form" ValidationGroup="UploadGroup"><span></span><TEControl:ResourceControl runat="server" ResourceName="EditProfile_UseSelectedAvatar" /></asp:LinkButton>
                                            <asp:LinkButton ID="RemoveSelectAvatarButton" runat="server" CssClass="internal-link submit-form"><span></span><TEControl:ResourceControl runat="server" ResourceName="EditProfile_RemoveAvatar" /></asp:LinkButton>
                                            <span class="processing" style="visibility: hidden;"></span>
                                        </span>
                                    </li>
                                </ul>
                            </fieldset>
                            <div class="field-list-footer"></div>
                        </FormTemplate>
                    </TEControl:EditUserAvatarForm>
                </Content>
            </TWC:TabbedPane>
            
            <TWC:TabbedPane runat="server" ID="AvatarLinkTab">
                <Tab><TEControl:ResourceControl runat="server" ResourceName="EditProfile_LinkToAvatarTab" /></Tab>
                <Content>
                    <TEControl:EditUserAvatarForm runat="server"
                        AvatarUrlTextBoxId="AvatarUrl"
                        SubmitButtonId="UpdateLinkedAvatarButton"
                        RemoveAvatarButtonId="RemoveLinkAvatarButton"
                    >
                       <SuccessActions>
                            <TEControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
                        </SuccessActions>
                        <FormTemplate>
                            <div class="field-list-header"></div>
                            <fieldset class="field-list">
                                <ul class="field-list">
                                    <li class="field-item avatar-link">
                                        <label class="field-item-header"><TEControl:ResourceControl runat="server" ResourceName="EditProfile_AvatarUrl" /></label>
                                        <span class="field-item-description"><TEControl:ResourceControl runat="server" ResourceName="EditProfile_AvatarUrl_Desc" /></span>
                                        <span class="field-item-input"><asp:TextBox id="AvatarUrl" runat="server" MaxLength="256" Columns="60" /></span>
                                        <span class="field-item-validation" style="display: none;"></span>
                                    </li>
                                    <li class="field-item submit-form">
                                        <span class="field-item-input">
                                            <asp:LinkButton ID="UpdateLinkedAvatarButton" runat="server" CssClass="internal-link submit-form" ValidationGroup="LinkGroup"><span></span><TEControl:ResourceControl runat="server" ResourceName="EditProfile_UseLinkedAvatar" /></asp:LinkButton>
                                            <asp:LinkButton ID="RemoveLinkAvatarButton" runat="server" CssClass="internal-link submit-form"><span></span><TEControl:ResourceControl runat="server" ResourceName="EditProfile_RemoveAvatar" /></asp:LinkButton>
                                            <span class="processing" style="visibility: hidden;"></span>
                                        </span>
                                    </li>
                                </ul>
                            </fieldset>
                            <div class="field-list-footer"></div>
                        </FormTemplate>
                    </TEControl:EditUserAvatarForm>
                </Content>
            </TWC:TabbedPane>
            
    </TWC:TabbedPanes>
    
</div>

</asp:Content>