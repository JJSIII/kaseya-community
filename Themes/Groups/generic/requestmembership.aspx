<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/Common/modal.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="content">
	<TEControl:Title runat="server" IncludeSiteName="false" EnableRendering="false" Tag="H1" CssClass="title">
        <ContentTemplate><TEControl:ResourceControl runat="server" ResourceName="Hubs_RequestMembership" /></ContentTemplate>
    </TEControl:Title>
	
	<TEControl:RequestGroupMembershipForm runat="server" MessageTextBoxId="RequestAccessMessage" SubmitButtonId="RequestButton">
		<RequestSentActions>
			<TEControl:ExecuteScriptAction runat="server" Script="var opener = window.parent.Telligent_Modal.GetWindowOpener(window); opener.location = opener.location; opener.Telligent_Modal.Close(true);" />
		</RequestSentActions>
		<RequestAcceptedActions>
			<TEControl:ExecuteScriptAction runat="server" Script="var opener = window.parent.Telligent_Modal.GetWindowOpener(window); opener.location = opener.location; opener.Telligent_Modal.Close(true);" />
		</RequestAcceptedActions>
		<FormTemplate>
			<div class="field-list-header"></div>
			<fieldset class="field-list">
				<legend class="field-list-description"><span><TEControl:ResourceControl runat="server" ResourceName="Hubs_RequestMembership_Desc" /></span></legend>
				<ul class="field-list">
					<TEControl:PlaceHolder runat="server" Tag="Li" CssClass="field-item">
						<DisplayConditions><TEControl:ControlVisibilityCondition runat="server" ControlId="RequestAccessMessage" ControlVisibilityEquals="true" /></DisplayConditions>
						<ContentTemplate>
							<TEControl:FormLabel runat="server" ResourceName="CreateEditPost_Body" LabelForId="RequestAccessMessage" CssClass="field-item-header" />
							<span class="field-item-input"><asp:TextBox runat="server" TextMode="MultiLine" Rows="5" style="width: 90%;" ID="RequestAccessMessage" /></div>
						</ContentTemplate>
					</TEControl:PlaceHolder>
					<li class="field-item">
						<span class="field-item-input">
							<asp:LinkButton ID="RequestButton" runat="server" CssClass="internal-link join-group"><span></span><TEControl:ResourceControl runat="server" ResourceName="Hubs_RequestMembership" /></asp:LinkButton>
						</span>
					</li>
				</ul>
			</fieldset>
			<div class="field-list-footer"></div>
		</FormTemplate>
	</TEControl:RequestGroupMembershipForm>
	
</asp:Content>