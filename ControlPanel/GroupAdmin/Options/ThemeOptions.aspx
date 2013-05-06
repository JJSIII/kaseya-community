<%@ Page language="c#" Codebehind="ThemeOptions.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.GroupAdmin.ThemeOptionsPage" MasterPageFile="~/ControlPanel/Masters/GroupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="server" resourcename="CP_Hub_ThemeSettings" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="HubThemeOptions" />
    
    <script type="text/javascript">
    // <!--
    function ValidateDelete()
    {
        return (window.confirm('<CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_Avatar_SelectableAvatar_DeleteConfirmation" />'));
    }
    // -->
    </script>
    
	<div class="CommonDescription">
		<CP:ResourceControl runat="server" resourcename="CP_Hub_ThemeSettings_Instructions" />
	</div>
	<CP:FileOnlyStatusMessage id="FOStatus" runat="server" visible="false" />
	
	<asp:PlaceHolder id="OptionHolder" runat="Server">
		
        <asp:Label runat="server" ID="LicenseMessage" Visible="false" ForeColor="Red"><CP:ResourceControl runat="Server" ResourceName="CP_Hub_ThemeSettings_LicenseNotSupported" /></asp:Label>
		
		<CP:statusmessage id="Status" runat="server" visible="false" />
		
		<div class="FixedWidthContainer">
		<table cellSpacing="0" cellPadding="0" border="0">
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_ThemeSettings_EnableThemes" /></strong><br />
				<cp:ResourceControl runat="Server" resourcename="CP_Hub_ThemeSettings_EnableThemes_Help" />
			</td>
			<td class="CommonFormField">
				<cp:YesNoRadioButtonList id="enableThemes" runat="Server" repeatcolumns="2" />
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName">
				<strong><CP:ResourceControl runat="server" ResourceName="CP_Hub_ThemeSettings_EnableThemeConfiguration" /></strong><br />
				<CP:ResourceControl runat="server" ResourceName="CP_Hub_ThemeSettings_EnableThemeConfiguration_Help" />
			</td>
			<td class="CommonFormField">
				<cp:YesNoRadioButtonList id="enableThemeConfiguration" runat="Server" repeatcolumns="2" />
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:resourcecontrol runat="server" resourcename="CP_Hub_ThemeSettings_DefaultTheme" /></strong><br />
				<cp:ResourceControl runat="server" resourcename="CP_Hub_ThemeSettings_DefaultTheme_Help" />
			</td>
			<td class="CommonFormField">
			    <TWC:DropDownList runat="server" ID="defaultTheme" ShowHtmlWhenSelected="false" SelectListWidth="440" SelectListHeight="375" />
			</td>
		</tr>
        <tr>
            <td class="CommonFormFieldName">
	            <strong><cp:resourcelabel runat="server" resourcename="CP_Hub_ThemeSettings_Avatar_AvatarSize" /></strong><br />
	            <cp:ResourceControl runat="Server" resourcename="CP_Hub_ThemeSettings_Avatar_AvatarSize_Help" />
            </td>
            <td class="CommonFormField">
                <asp:textbox id="AvatarWidth" columns="1" maxlength="3" runat="server"  />
                x
	            <asp:textbox id="AvatarHeight" columns="1" maxlength="3" runat="server"  />
	            <asp:requiredfieldvalidator id="AvatarHeightValidator" runat="server" controltovalidate="AvatarHeight" errormessage="*" />
	            <asp:regularexpressionvalidator id="AvatarHeightRegExValidator" runat="server" controltovalidate="AvatarHeight" validationexpression="[0-9]*" errormessage="*" />
	            <asp:requiredfieldvalidator id="AvatarWidthValidator" runat="server" controltovalidate="AvatarWidth" errormessage="*" />
	            <asp:regularexpressionvalidator id="AvatarWidthRegExValidator" runat="server" controltovalidate="AvatarWidth" validationexpression="[0-9]*" errormessage="*" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="CommonFormFieldName">
                    <strong><CP:ResourceControl runat="server" ResourceName="CP_UserEdit_Avatar_Default" /></strong>
                </div>
                <div class="CommonFormField">
                    <img runat="server" id="defaultAvatarImage" />
                    <br />
                    <a href="javascript:Telligent_Modal.Open('ChangeDefaultGroupAvatar.aspx', 550, 390, refresh);"><%= Telligent.Evolution.Components.ResourceManager.GetString("CP_UserEdit_Avatar_Change", "ControlPanelResources.xml") %></a>
                </div>
            </td>
        </tr>
        <tr>
            <td class="CommonFormFieldName">
	            <strong><cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_EnableUploadedAvatars" /></strong><br />
	            <cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_EnableUploadedAvatars_Help" />
            </td>
            <td class="CommonFormField">
	            <cp:yesnoradiobuttonlist id="EnableUploadedAvatars" runat="server" repeatcolumns="2"  />
            </td>
        </tr>
        <tr>
            <td class="CommonFormFieldName">
	            <strong><cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_EnableSelectableAvatars" /></strong><br />
	            <cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_EnableSelectableAvatars_Help" />
            </td>
            <td class="CommonFormField">
	            <cp:yesnoradiobuttonlist id="EnableSelectableAvatars" runat="server" repeatcolumns="2"  />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="CommonFormFieldName">
                    <strong><cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_SelectableAvatars" /></strong><br />
	                <cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_SelectableAvatars_Help" />
                </div>
                <div class="CommonFormField">
                    <asp:Repeater runat="server" ID="SelectableAvatars">
                        <ItemTemplate>
                            <div style="width: 82px; margin-right: .5em; float: left; text-align: center;">
                                <div style="width: 80px; height: 80px; padding: 1px;">
                                    <table cellpadding="0" cellspacing="0" border="0" width="80" height="80"><tr><td align="ceter" valign="center">
                                        <img src="<%# Telligent.Evolution.Components.SiteUrls.Instance().ResizedImage((Telligent.Evolution.Extensibility.Storage.Version1.ICentralizedFile) Container.DataItem, 80, 80, false) %>" alt="" />
                                    </td></tr></table>
                                </div>
                                <div>
                                    <cp:ResourceLinkButton OnClientClick="return ValidateDelete();" CommandArgument='<%# Eval("Path")%>' CommandName="Delete" Runat="server" ID="DeleteButton" ResourceName="Delete" />
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            <div style="clear: both;"></div>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="CommonFormField">
                    <asp:FileUpload runat="server" id="SelectablAvatarFileUpload" /> &nbsp; <CP:ResourceButton id="UploadButton" ResourceName="CP_Settings_FileStorage_UploadButton" Runat="server" /> 
                </div>
            </td>
        </tr>
		            
		</table>
		</div>
		<P class="PanelSaveButton DetailsFixedWidth">
			<cp:ResourceLinkButton id="SaveButton" runat="Server" resourcename="Save" cssclass="CommonTextButton" />
		</P>
	</asp:PlaceHolder>
</asp:Content>