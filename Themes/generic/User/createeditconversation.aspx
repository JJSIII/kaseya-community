<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/modal.Master" %>
<%@ Import Namespace="Telligent.Evolution.Components"%>

<script runat="server">
    
    protected override void OnInit(EventArgs e)
    {
      base.OnInit(e);
	  var userLookupTextBox = CSControlUtility.Instance().FindControl(this, "MessageRecipients") as UserLookUpTextBox;
      if (userLookupTextBox != null)
        userLookupTextBox.OnChangeClientFunction = this.ClientID + "_userChanged";
    }
	
</script>

<asp:Content ContentPlaceHolderID="content" runat="server">

	<TEControl:JQuery runat="server" />
	<TEControl:JQueryValidate runat="server" />
	<script type="text/javascript">
		// <![CDATA[
		var usernameValidation;
		$(document).ready(function() {
			var selector = '#<%= CSControlUtility.Instance().FindControl(this, "SaveButton").ClientID %>';
			var validation = new Telligent_Validation(selector, { onValidatedFunction: function(isValid, buttonClicked, context) { if (isValid) $(selector).removeClass('disabled'); else $(selector).addClass('disabled'); }, onSuccessfulClickFunction: function(e) { $('.processing', $(selector).parent()).css("visibility", "visible"); $(selector).addClass('disabled');} });
				
			validation.AddField('#<%= CSControlUtility.Instance().FindControl(this, "MessageSubject").ClientID %>', { required: true }, '.field-item.message-subject .field-item-validation', null);

			usernameValidation = validation.AddCustomValidation(
					'requiredrecipients', 
					function() { 
						return ValidateUserName();
					}, 
					'<%= JavaScript.Encode(ResourceManager.GetString("RequiredField")) %>',
					'.field-item.message-recipients .field-item-validation', null);
			
			var f = validation.AddCustomValidation('friendmessage', 
				function() { 
					return <%= ((Editor) CSControlUtility.Instance().FindControl(this, "Message")).GetContentScript() %>.length > 0 }, 
					'<%= JavaScript.Encode(ResourceManager.GetString("Conversation_MessageBodyRequired")) %>', 
					'.field-item.message-body .field-item-validation', null);
			<%= ((Editor) CSControlUtility.Instance().FindControl(this, "Message")).GetAttachOnChangeScript("f") %>

		});
		
		function <%= this.ClientID %>_userChanged(lookupTextBox) {
			usernameValidation();
		}
		
		function ValidateUserName() {
			return <%= CSControlUtility.Instance().FindControl(this, "MessageRecipients").ClientID %>_getSelectedLookUpCount() > 0;
		}
		// ]]>
	</script>

    <TEControl:ConditionalAction runat="server">
        <Actions><TEControl:GoToMessageAction runat="server" /></Actions>
        <Conditions Operator="not"><TEControl:SiteSettingsPropertyValueComparison runat="server" ComparisonProperty="EnableConversations" Operator="issetortrue" /></Conditions>
    </TEControl:ConditionalAction>
    
    <TEControl:ConditionalAction runat="server">
        <Conditions><TEMessage:ConversationPropertyValueComparison runat="server" ComparisonProperty="ID" Operator="IsSetOrTrue" /></Conditions>
        <Actions><TEControl:SetControlPropertyAction runat="server" ControlId="SaveButton" Property="ResourceName" Value="ReplyMessage_Button" /></Actions>
    </TEControl:ConditionalAction>

    <TEControl:Title runat="server" IncludeSiteName="false">
        <ContentTemplate>
            <TEControl:ConditionalContent runat="server">
                <ContentConditions><TEMessage:ConversationPropertyValueComparison runat="server" ComparisonProperty="ID" Operator="IsSetOrTrue" /></ContentConditions>
                <TrueContentTemplate><TEControl:ResourceControl ResourceName="ReplyToConversation_Title" runat="server" /></TrueContentTemplate>
                <FalseContentTemplate><TEControl:ResourceControl ResourceName="CreateConversation_Title" runat="server" /></FalseContentTemplate>
            </TEControl:ConditionalContent>
        </ContentTemplate>
    </TEControl:Title>

    <TEMessage:CreateEditConversationForm runat="server"
         MessageBodyEditorId="Message"
         MessageRecipientsUserLookUpTextBoxId="MessageRecipients"
         MessageSubjectTextBoxId="MessageSubject"
         SubmitButtonId="SaveButton"
         id="CreateConversationForm"
         ValidationGroup="messageValidationGroup"
    >
        <SuccessActions>
            <TEControl:SetVisibilityAction runat="server" ControlIdsToHide="Message" />
            <TEControl:RefreshPageAction runat="server" WindowNameScript="window.parent.Telligent_Modal.GetWindowOpener(window)" />
        </SuccessActions>
        <FormTemplate>
            <div class="field-list-header"></div>
            <fieldset class="field-list">
                <ul class="field-list">
	                <li class="field-item message-recipients">
		                <label class="field-item-header"><TEControl:ResourceControl runat="server" ResourceName="Recipients" /></label>
		                <span class="field-item-input"><TEControl:UserLookUpTextBox ID="MessageRecipients" Width="300px" LookUpType="AccessingUserCanStartConversation" runat="server" /></span>
		                <span class="field-item-validation" style="display: none;"></span>
		            </li>
	                <li class="field-item message-subject">
		                <label class="field-item-header"><TEControl:ResourceControl runat="server" ResourceName="Subject" /></label>
		                <span class="field-item-input"><asp:TextBox runat="server" ID="MessageSubject" autocomplete="off" columns="60" /></span>
		                <span class="field-item-validation" style="display: none;"></span>
	                </li>
	                <li class="field-item message-body">
		                <span class="field-item-input message-body"><TEControl:Editor runat="Server" id="Message" Width="500" Height="180" /></span>
	                    <span class="field-item-validation" style="display: none;"></span>
	                </li>
					<li class="field-item submit-form">
						<span class="field-item-input">
							<asp:LinkButton ID="SaveButton" runat="server" CssClass="internal-link submit-form"><span></span><TEControl:ResourceControl runat="server" ResourceName="CreateConversation_Button" /></asp:LinkButton>
							<span class="processing" style="visibility: hidden;"></span>
						</span>
					</li>
	            </ul>
	        </fieldset>
	        <div class="field-list-footer"></div>
		</FormTemplate>
    </TEMessage:CreateEditConversationForm>	   

</asp:Content>