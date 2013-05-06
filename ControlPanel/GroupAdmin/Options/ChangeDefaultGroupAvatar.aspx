<%@ Page language="c#" Codebehind="ChangeDefaultGroupAvatar.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.GroupAdmin.ChangeDefaultGroupAvatar" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">
	<script type="text/javascript">
    // <!--
    function ValidateDelete()
    {
        return (window.confirm('<CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_Avatar_SelectableAvatar_DeleteConfirmation" />'));
    }
    // -->
    </script>
    <cp:statusmessage id="Status" runat="server" />
    <TWC:TabbedPanes runat="server" ID="Tabs"
	    PanesCssClass="CommonPane"
        TabSetCssClass="CommonPaneTabSet"
        TabCssClasses="CommonPaneTab"
        TabSelectedCssClasses="CommonPaneTabSelected"
        TabHoverCssClasses="CommonPaneTabHover">
		
		<TWC:TabbedPane runat="server">
		    <Tab><TEControl:ResourceControl runat="server" ResourceName="EditProfile_UploadAvatarTab" /></Tab>
		    <Content>
		        <div class="CommonFormFieldName">
                    <strong><CP:ResourceControl runat="server" ResourceName="CP_UserEdit_Avatar_UploadDefault" /></strong>
                </div>
                <div class="CommonFormField">
                    <asp:FileUpload runat="server" id="defaultAvatarFileUpload" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="UploadGroup" ErrorMessage="<br/>Please browse to an image first." ControlToValidate="defaultAvatarFileUpload" />
                    <p>
                        <CP:ResourceButton id="uploadDefaultAvatarButton" ResourceName="CP_UserEdit_Avatar_UploadButton" Runat="server" ValidationGroup="UploadGroup" /> 
                        <CP:ResourceButton runat="server" ResourceName="CP_UserEdit_Avatar_RemoveButton" ID="deleteDefaultAvatar" OnClientClick="return ValidateDelete();" />
                    </p>
                </div>
		    </Content>
		</TWC:TabbedPane>
		
        <TWC:TabbedPane runat="server" ID="AvatarSelectionTab">
            <Tab><TEControl:ResourceControl runat="server" ResourceName="EditProfile_AvatarSelect" /></Tab>
            <Content>
				<asp:Panel runat="server" ID="avatarSelectPanel">
					<asp:CheckBox runat="server" ID="EnableSelectAvatarCheckbox" Checked="true" Visible="false" />
					<div class="CommonFormFieldName"><TEControl:ResourceControl Tag="Strong" ResourceName="EditProfile_AvatarSelect" runat="server" /></div>
					<div class="CommonFormField">
						<asp:RadioButtonList RepeatLayout="Flow" runat="server" ID="SelectableAvatars" CssClass="SelectableAvatars" RepeatColumns="6" />
						<asp:RequiredFieldValidator runat="server" ValidationGroup="SelectGroup" ErrorMessage="<br/>Please select an image first." ControlToValidate="SelectableAvatars" />
					</div>
					<div class="CommonFormFieldName">		
						<CP:ResourceButton runat="server" id="UpdateSelectedAvatarButton" ResourceName="EditProfile_UseSelectedAvatar" ValidationGroup="SelectGroup" />
						<CP:ResourceButton runat="server" ID="RemoveSelectAvatarButton" ResourceName="EditProfile_RemoveAvatar" />
					</div>
				</asp:Panel>
				<asp:Panel runat="server" ID="noAvatarsPanel" Visible="false">
					<div class="CommonFormFieldName"><TEControl:ResourceControl Tag="Strong" ResourceName="EditProfile_NoAvailableAvatars" runat="server" /></div>
				</asp:Panel>
            </Content>
        </TWC:TabbedPane>
        
    </TWC:TabbedPanes>
    
	
</asp:Content>