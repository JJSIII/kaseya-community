<%@ Page language="c#" Codebehind="SkinOptions.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.BlogAdmin.SkinOptionsPage" MasterPageFile="~/ControlPanel/Masters/BlogAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="server" resourcename="CP_BlogAdmin_Options_ThemeSettings" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="BlogSettingsSkin" />
    
    <asp:Label runat="server" ID="LicenseMessage" Visible="false" ForeColor="Red"><CP:ResourceControl runat="Server" ResourceName="CP_BlogAdmin_Options_LicenseNotSupported" /></asp:Label>
		
	<div class="CommonDescription">
		<CP:ResourceControl runat="server" resourcename="CP_BlogAdmin_Options_ThemeSettings_Instructions" />
	</div>
	<CP:FileOnlyStatusMessage id="FOStatus" runat="server" visible="false" />
	
	<asp:PlaceHolder id="OptionHolder" runat="Server">
		<CP:StatusMessage id="Status" runat="server" visible="false" />
		<div class="FixedWidthContainer">
		<table cellSpacing="0" cellPadding="0" border="0">
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:ResourceControl runat="Server" resourcename="CP_BlogAdmin_Options_ThemeSettings_EnableThemes" /></strong><br />
				<cp:ResourceControl runat="Server" resourcename="CP_BlogAdmin_Options_ThemeSettings_EnableThemes_Help" />
			</td>
			<td class="CommonFormField">
				<cp:YesNoRadioButtonList id="enableThemes" runat="Server" repeatcolumns="2" />
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName">
				<strong><CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_Options_ThemeSettings_EnableThemeConfiguration" /></strong><br />
				<CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_Options_ThemeSettings_EnableThemeConfiguration_Help" />
			</td>
			<td class="CommonFormField">
				<cp:YesNoRadioButtonList id="enableThemeConfiguration" runat="Server" repeatcolumns="2" />
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:ResourceControl runat="server" resourcename="CP_BlogAdmin_Options_ThemeSettings_DefaultTheme" /></strong><br />
				<cp:ResourceControl runat="server" resourcename="CP_BlogAdmin_Options_ThemeSettings_DefaultTheme_Help" />
			</td>
			<td class="CommonFormField">
			    <TWC:DropDownList runat="server" ID="defaultTheme" ShowHtmlWhenSelected="false" SelectListWidth="440" SelectListHeight="375" />
			</td>
		</tr>
        <asp:PlaceHolder id="RssNotAllowedLicensingHolder" runat="Server">
			<tr>
				<td class="CommonFormFieldName">&nbsp;</td>
				<td class="CommonFormField"><cp:resourcecontrol id="RssNotAllowedLicensing" visible="false" runat="server" Tag="div" CssClass="CommonLicenseRestrictionMessage" resourcename="CP_Settings_RssNotAllowedLicensing" /></td>
			</tr>
		</asp:PlaceHolder>
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:ResourceControl runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_AggregatePostCount" /></strong><br />
				<cp:ResourceControl runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_AggregatePostCount_Help" />
			</td>
			<td class="CommonFormField">
				<asp:textbox id="aggregatePostCount" runat="Server" cssclass="ControlPanelTextInput" width="50" />
				<asp:requiredfieldvalidator runat="Server" controltovalidate="aggregatePostCount" display="Dynamic" text="*" id="aggregatePostCountValidator"/>
				<asp:RegularExpressionValidator runat="server" ControlToValidate="aggregatePostCount" ValidationExpression="^\d+$"><CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_Options_ValidationError" /></asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:ResourceControl runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_IndividualPostCount" /></strong><br />
				<cp:ResourceControl runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_IndividualPostCount_Help" />
			</td>
			<td class="CommonFormField">
				<asp:textbox id="individualPostCount" runat="Server" cssclass="ControlPanelTextInput" width="50" />
				<asp:requiredfieldvalidator runat="Server" controltovalidate="individualPostCount" display="Dynamic" text="*" id="individualePostCountValidator"/>
				<asp:RegularExpressionValidator runat="server" ControlToValidate="individualPostCount" ValidationExpression="^\d+$"><CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_Options_ValidationError" /></asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:ResourceControl runat="server" resourcename="CP_BlogAdmin_Options_ThemeSettings_AggregatePostSize" /></strong><br />
				<cp:ResourceControl runat="server" resourcename="CP_BlogAdmin_Options_ThemeSettings_AggregatePostSize_Help" />
			</td>
			<td class="CommonFormField">
				<asp:textbox id="aggregatePostSize" runat="Server" width="50" CssClass="ControlPanelTextInput" />
				<asp:requiredfieldvalidator id="PostSizeValidator" runat="server" text="*" display="Dynamic" controltovalidate="aggregatePostSize" />
				<asp:RegularExpressionValidator runat="server" ControlToValidate="aggregatePostSize" ValidationExpression="^\d+$"><CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_Options_ValidationError" /></asp:RegularExpressionValidator>
			</td>
		</tr>
		</table>
		</div>
		<P class="PanelSaveButton DetailsFixedWidth">
			<cp:ResourceLinkButton id="SaveButton" runat="Server" resourcename="Save" cssclass="CommonTextButton" />
		</P>
	</asp:PlaceHolder>
</asp:Content>