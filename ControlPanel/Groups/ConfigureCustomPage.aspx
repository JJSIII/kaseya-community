<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfigureCustomPage.aspx.cs" Inherits="Telligent.EvolutionWeb.ControlPanel.Groups.ConfigureCustomPage" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">
    
    <script type="text/javascript">
        function ResetPageNameInput() {
            var pageNameInput = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "PageNameTextBox").ClientID %>');
            if (pageNameInput && pageNameInput.value == '<%= ResourceManager.GetString("CP_Settings_ConfigureCustomPage_PageNameDesc", "ControlPanelResources.xml") %>')
                pageNameInput.value = '';
            else if (pageNameInput && pageNameInput.value == '')
                pageNameInput.value = '<%= ResourceManager.GetString("CP_Settings_ConfigureCustomPage_PageNameDesc", "ControlPanelResources.xml") %>';
        }

        function validateName(source, args) {
            if (args.Value.match(/^[a-zA-Z0-9_-]+$/))
                args.IsValid = true;
            else
                args.IsValid = false;
        }
    </script>

	<div class="CommonContentArea">
	    <div class="CommonContent">
	        <TEControl:ResourceControl ID="DuplicatePageNameMessage" runat="server" ResourceName="CP_Settings_ConfigureCustomPage_DuplicatePageName" ResourceFile="ControlPanelResources.xml" Tag="Div" CssClass="CommonMessageError" Visible="false" />
	        <div class="CommonFormFieldName">
	            <CP:ResourceControl ResourceName="CP_Settings_ConfigureCustomPage_PageTitle" runat="server" />
	        </div>
	        <div class="CommonFormField">
	            <TEControl:ContentFragmentTokenTextBox runat="server" Width="250" ID="PageTitleTextBox" />
	            <asp:RequiredFieldValidator runat="server" ControlToValidate="PageTitleTextBox" ErrorMessage="*" />
	        </div>
	        <div class="CommonFormFieldName">
	            <CP:ResourceControl runat="server" ResourceName="CP_Settings_ConfigureCustomPage_PageName" />: 
	        </div>
	        <div class="CommonFormField">
	            <asp:TextBox runat="server" Width="300" ID="PageNameTextBox" onclick="ResetPageNameInput()" onblur="ResetPageNameInput()" />
	            <asp:RequiredFieldValidator runat="server" ControlToValidate="PageNameTextBox" ErrorMessage="*" />
	            <asp:CustomValidator runat="server" ControlToValidate="PageNameTextBox" ID="CustomPageNameValidator" ClientValidationFunction="validateName" ErrorMessage="Name not in the correct format, only alphanumeric and hyphens are allowed, without spaces." />
	        </div>
        </div>
        <div class="CommonFormField PanelSaveButton">
            <TEControl:ConditionalContent runat="server">
                <ContentConditions><TEControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="PageName" Operator="IsSetOrTrue" /></ContentConditions>
                <TrueContentTemplate>
                    <CP:ResourceButton runat="server" ID="Save" ResourceName="CP_Membership_Roles_Save" />
                </TrueContentTemplate>
                <FalseContentTemplate>
                    <CP:ResourceButton runat="server" ID="CreateNew" ResourceName="CP_Settings_ConfigureCustomPage_CreateNewButton" />
                </FalseContentTemplate>
            </TEControl:ConditionalContent>
        </div>
        
    </div>
</asp:Content>