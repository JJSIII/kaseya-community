<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfigureOAuthClient.aspx.cs"
    Inherits="Telligent.EvolutionWeb.ControlPanel.Settings.ConfigureOAuthClient"
    MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>
<%@ Register TagPrefix="CP" TagName="AppRoles" Src="~/ControlPanel/GroupAdmin/AppRoles.ascx" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl id="SectionDescription" runat="server" ResourceName="ConfigureOAuthClient_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderID="TaskRegion" runat="server">
    <CP:StatusMessage ID="Status" runat="server" />
    <script type="text/javascript">
    // <![CDATA[
        function confirmGenSecret() {
            return confirm('<%= ResourceManager.GetString("ManageOAuthClients_List_ConfirmGenSecret", "ControlPanelResources.xml") %>');
        }
    // ]]>
    </script>
    <div class="CommonContentArea">
        <div class="CommonContent">
            <TWC:TabbedPanes ID="TabStrip" runat="server" PanesCssClass="CommonPane" TabSetCssClass="CommonPaneTabSet"
                TabCssClasses="CommonPaneTab" TabSelectedCssClasses="CommonPaneTabSelected" TabHoverCssClasses="CommonPaneTabHover">
                <TWC:TabbedPane runat="server">
		            <Tab><CP:ResourceControl runat="server" ResourceName="ConfigureOAuthClient_TabTitle_Configure" /></Tab>
		            <Content>
                        <asp:Panel runat="server" ID="ClientIdPanel">
                            <div class="CommonFormFieldName">
	                            <CP:ResourceControl runat="server" ResourceName="ConfigureOAuthClient_Id" />: 
	                        </div>
	                        <div class="CommonFormField">
	                            <asp:Literal runat="server" ID="ClientIdLiteral" />
	                        </div>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="OAuthClientEditPanel">
	                        <div class="CommonFormFieldName">
	                            <CP:ResourceControl ResourceName="ConfigureOAuthClient_Name" runat="server" />
	                        </div>
	                        <div class="CommonFormField">
	                            <asp:TextBox runat="server" Width="250" ID="NameTextBox" />
	                            <asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextBox" ErrorMessage="*" />
	                        </div>
	                        <div class="CommonFormFieldName">
	                            <CP:ResourceControl runat="server" ResourceName="ConfigureOAuthClient_Description" />: 
	                        </div>
	                        <div class="CommonFormField">
	                            <asp:TextBox runat="server" Width="300" ID="DescriptionTextBox" TextMode="MultiLine" />
	                        </div>
                            <div class="CommonFormFieldName">
	                            <CP:ResourceControl runat="server" ResourceName="ConfigureOAuthClient_MainUrl" />: 
	                        </div>
                            <div class="CommonFormFieldDescription">
                                <CP:ResourceControl  runat="server" ResourceName="ConfigureOAuthClient_MainUrl_Description" />
                            </div>
	                        <div class="CommonFormField">
	                            <asp:TextBox runat="server" Width="300" ID="MainUrlTextBox" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="MainUrlTextBox" ErrorMessage="*" />
                                <asp:RegularExpressionValidator runat="server" ValidationExpression="^(http|https)\://.*" ControlToValidate="MainUrlTextBox" ErrorMessage="Please enter a valid URL" />
	                        </div>
                            <div class="CommonFormFieldName">
	                            <CP:ResourceControl runat="server" ResourceName="ConfigureOAuthClient_CallbackUrl" />: 
	                        </div>
                            <div class="CommonFormFieldDescription">
                                <CP:ResourceControl  runat="server" ResourceName="ConfigureOAuthClient_CallbackUrl_Description" />
                            </div>
	                        <div class="CommonFormField">
	                            <asp:TextBox runat="server" Width="300" ID="CallbackUrlTextBox" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="CallbackUrlTextBox" ErrorMessage="*" />
                                <asp:RegularExpressionValidator runat="server" ValidationExpression="^(http|https)\://.*" ControlToValidate="CallbackUrlTextBox" ErrorMessage="Please enter a valid URL" />
	                        </div>
                            <div class="CommonFormFieldName">
                                <CP:ResourceControl runat="server" ResourceName="ConfigureOAuthClient_ClientType" />: 
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ClientType" ErrorMessage="*" />
                            </div>
                            <div class="CommonFormFieldDescription">
                                <CP:ResourceControl  runat="server" ResourceName="ConfigureOAuthClient_ClientType_Description" />
                            </div>
                            <div class="CommonFormField">
                                <asp:RadioButtonList runat="server" ID="ClientType" AutoPostBack="true">
                                    <asp:ListItem Text="Confidential" Value="Confidential" Selected="True" />
                                    <asp:ListItem Text="Public" Value="Public" />
                                </asp:RadioButtonList>
                            </div>

                            <div class="CommonFormFieldName">
                                <CP:ResourceControl runat="server" ResourceName="ConfigureOAuthClient_GrantTypes" />: 
                            </div>
			                 <div class="CommonFormField">
                                <asp:CheckBoxList runat="server" ID="GrantTypes" >
                                    <asp:ListItem Value="AuthorizationCode">
                                        Authorization Code
                                        <div class="CommonFormFieldDescription">
                                            The client will request authorization from the user and get back a code that it can use to get an access token and refresh token.
                                        </div>
                                    </asp:ListItem>
                                    <asp:ListItem Value="Password">
                                        User Credentials
                                        <div class="CommonFormFieldDescription">
                                            The client will send the users credentials to get back an access token.
                                        </div>
                                    </asp:ListItem>
                                    <asp:ListItem Value="ClientCredentials">
                                        Client Credentials
                                        <div class="CommonFormFieldDescription">
                                            The client will use its credentials to authenticate and be able to impersonate any user.  Only select this for fully trusted client applications.
                                        </div>
                                    </asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="ViewSecretPanel">
                            <div class="CommonFormFieldName">
	                            <CP:ResourceControl runat="server" ResourceName="ConfigureOAuthClient_Secret" />: 
	                        </div>
	                        <div class="CommonFormField">
	                            <asp:Literal runat="server" ID="SecretLiteral" />
	                        </div>
                        </asp:Panel>
                    </Content>
                </TWC:TabbedPane>
                <TWC:TabbedPane runat="server">
		            <Tab><CP:ResourceControl runat="server" ResourceName="ConfigureOAuthClient_TabTitle_Permissions" /></Tab>
		            <Content>
                        <CP:AppRoles runat="server" ID="AppRoles" />
                    </Content>
                </TWC:TabbedPane>
            </TWC:TabbedPanes>
        </div>
        <div class="CommonFormField PanelSaveButton">
            <CP:ResourceButton runat="server" ID="Cancel" ResourceName="ConfigureOAuthClient_Cancel"
                CausesValidation="false" />
            <TEControl:ConditionalContent runat="server">
                <ContentConditions><TEControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="clientId" Operator="IsSetOrTrue" /></ContentConditions>
                <TrueContentTemplate>
                    <CP:ResourceButton runat="server" ID="Save" ResourceName="ConfigureOAuthClient_Save" />
                    <CP:ResourceButton runat="server" ID="GenerateSecret" ResourceName="ConfigureOAuthClient_GenerateSecret" OnClientClick="return confirmGenSecret();" />
                </TrueContentTemplate>
                <FalseContentTemplate>
                    <CP:ResourceButton runat="server" ID="CreateNew" ResourceName="ConfigureOAuthClient_CreateNew" />
                </FalseContentTemplate>
            </TEControl:ConditionalContent>
        </div>
    </div>
    <CP:ControlPanelSelectedNavigation SelectedNavItem="ManageOAuthClients" runat="server" />
</asp:Content>