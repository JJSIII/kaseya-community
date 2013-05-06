<%@ Page language="c#" AutoEventWireup="false" Inherits="Telligent.EvolutionWeb.ControlPanel.Tools.ManageSpamRules" CodeBehind="ManageSpamRules.aspx.cs" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="Spam_ManageSpamRules_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
	<CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ToolsSpam" />
	<script type = "text/javascript">
		function checkAll(cb, parent)
		{
		    var inputs = $('#' + parent).find("input[type='checkbox']");
		    if ($(cb).is(':checked')) {
		        inputs.attr('checked', 'checked');
		    } else {
		        inputs.removeAttr('checked');
		    }
		}
	</script>
	<asp:panel id="ConfigurationPanel" runat="server">
		<div class="CommonDescription">
			<cp:resourcecontrol runat="Server" resourcename="Spam_ManageSpamRules_ConfigDescription" />
		</div>
		<cp:statusmessage runat="server" id="Status" />
		
	<TWC:TabbedPanes runat="server"
	    PanesCssClass="CommonPane"
	    TabSetCssClass="CommonPaneTabSet"
	    TabCssClasses="CommonPaneTab"
	    TabSelectedCssClasses="CommonPaneTabSelected"
	    TabHoverCssClasses="CommonPaneTabHover">
	    
	<TWC:TabbedPane runat="server">
	    <Tab><cp:resourcecontrol runat="Server" resourcename="Spam_ManageSpamRules_Tab_Settings" /></Tab>
	    <Content>
            <asp:Label runat="server" ID="SettingsLicenseMessage" Visible="false" ForeColor="Red"><CP:ResourceControl runat="Server" ResourceName="Spam_ManageSpamRules_LicenseNotSupported" /></asp:Label>
			<cp:resourcecontrol runat="Server" Tag="Div" CssClass="CommonFormSubTitle" resourcename="Spam_ManageSpamRules_SubTitle_SiteSettings" />
			<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td class="CommonFormFieldName"><CP:ResourceControl ResourceName="Spam_ManageSpamRules_UserSpam" runat="server" /></td>
				<td class="CommonFormField">
					<asp:textbox id="UserSpamValue" runat="server" />
					<asp:RegularExpressionValidator runat="server" ControlToValidate="UserSpamValue" ValidationExpression="^\d+$"><CP:ResourceControl runat="server" ResourceName="CP_UserFiles_Quota_ValidationError" /></asp:RegularExpressionValidator>
					<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="UserSpamValue" /><br />
				</td>
			</tr>
			<tr runat="server" id="GroupModerateRow">
				<td class="CommonFormFieldName">
					<strong><CP:ResourceControl runat="server" ResourceName="CP_Tools_ManageSpamRules_GroupContactModerationLevel" /></strong><br />
					<CP:ResourceControl runat="server" ResourceName="CP_Tools_ManageSpamRules_GroupContactModerationLevelDesc" />
				</td>
				<td class="CommonFormField">
					<asp:textbox id="GroupModerateValue" runat="server"  />
					<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="GroupModerateValue" />
				</td>
			</tr>
			</table>

			<cp:resourcecontrol runat="Server" Tag="Div" CssClass="CommonFormSubTitle" resourcename="Spam_ManageSpamRules_SubTitle_BlogSettings" />
			<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td class="CommonFormFieldName"><CP:ResourceControl ResourceName="Spam_ManageSpamRules_BlogAutoModerate" runat="server" /></td>
				<td class="CommonFormField">
					<asp:textbox id="BlogAutoModerateValue" runat="server"  />
					<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="BlogAutoModerateValue"/>
				</td>
			</tr>
			<tr>
				<td class="CommonFormFieldName"><CP:ResourceControl ResourceName="Spam_ManageSpamRules_BlogAutoDelete" runat="server" /></td>
				<td class="CommonFormField">
					<asp:textbox id="BlogAutoDeleteValue" runat="server" />
					<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="BlogAutoDeleteValue"/><br />
				</td>
			</tr>
			</table>

			<cp:resourcecontrol runat="Server" Tag="Div" CssClass="CommonFormSubTitle" resourcename="Spam_ManageSpamRules_SubTitle_GallerySettings" />
			<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td class="CommonFormFieldName"><CP:ResourceControl ResourceName="Spam_ManageSpamRules_MediaGalleryAutoModerate" runat="server" /></td>
				<td class="CommonFormField">
					<asp:textbox id="MediaGalleryAutoModerateValue" runat="server"  />
					<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="MediaGalleryAutoModerateValue"/>
				</td>
			</tr>
			<tr>
				<td class="CommonFormFieldName"><CP:ResourceControl ResourceName="Spam_ManageSpamRules_MediaGalleryAutoDelete" runat="server" /></td>
				<td class="CommonFormField">
					<asp:textbox id="MediaGalleryAutoDeleteValue" runat="server" />
					<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="MediaGalleryAutoDeleteValue"/><br />
				</td>
			</tr>
			</table>

			<cp:resourcecontrol runat="Server" Tag="Div" CssClass="CommonFormSubTitle" resourcename="Spam_ManageSpamRules_SubTitle_ForumSettings" />
			<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td class="CommonFormFieldName"><CP:ResourceControl ResourceName="Spam_ManageSpamRules_ForumAutoModerate" runat="server" /></td>
				<td class="CommonFormField">
					<asp:textbox id="ForumAutoModerateValue" runat="server"  />
					<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="ForumAutoModerateValue"/>
				</td>
			</tr>
			<tr>
				<td class="CommonFormFieldName"><CP:ResourceControl ResourceName="Spam_ManageSpamRules_ForumAutoDelete" runat="server" /></td>
				<td class="CommonFormField">
					<asp:textbox id="ForumAutoDeleteValue" runat="server" />
					<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="ForumAutoDeleteValue"/><br />
				</td>
			</tr>
			</table>

			<cp:resourcecontrol runat="Server" Tag="Div" CssClass="CommonFormSubTitle" resourcename="Spam_ManageSpamRules_SubTitle_WikiSettings" />
			<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td class="CommonFormFieldName"><CP:ResourceControl ResourceName="Spam_ManageSpamRules_WikiAutoModerate" runat="server" /></td>
				<td class="CommonFormField">
					<asp:textbox id="WikiPossibleSpamValue" runat="server"  />
					<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="WikiPossibleSpamValue"/>
				</td>
			</tr>
			<tr>
				<td class="CommonFormFieldName"><CP:ResourceControl ResourceName="Spam_ManageSpamRules_WikiAutoDelete" runat="server" /></td>
				<td class="CommonFormField">
					<asp:textbox id="WikiDefiniteSpamValue" runat="server" />
					<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="WikiDefiniteSpamValue"/><br />
				</td>
			</tr>
			</table>

			<cp:resourcecontrol runat="Server" Tag="Div" CssClass="CommonFormSubTitle" resourcename="Spam_ManageSpamRules_SubTitle_MessageSettings" />
			<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td class="CommonFormFieldName"><CP:ResourceControl ResourceName="Spam_ManageSpamRules_MessageNotification" runat="server" /></td>
				<td class="CommonFormField">
					<asp:textbox id="MessagePossibleSpamValue" runat="server"  />
					<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="MessagePossibleSpamValue"/>
				</td>
			</tr>
			<tr>
				<td class="CommonFormFieldName"><CP:ResourceControl ResourceName="Spam_ManageSpamRules_MessageAutoDelete" runat="server" /></td>
				<td class="CommonFormField">
					<asp:textbox id="MessageDefiniteSpamValue" runat="server" />
					<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="MessageDefiniteSpamValue"/><br />
				</td>
			</tr>
			<tr>
				<td class="CommonFormFieldName"><CP:ResourceControl ResourceName="Spam_ManageSpamRules_MessageEmailNotificationRole" runat="server" /></td>
				<td class="CommonFormField">
					<asp:dropdownlist id="MessageEmailRoleList" runat="Server" />&nbsp;
				</td>
			</tr>
			</table>

	    </Content>
    </TWC:TabbedPane>
    
    <TWC:TabbedPane runat="server">
        <Tab><CP:ResourceControl runat="server" ResourceName="Spam_ManageSpamRules_SubTitle_Rules" /></Tab>
        <Content>
            <asp:Label runat="server" ID="RulesLicenseMessage" Visible="false" ForeColor="Red"><CP:ResourceControl runat="Server" ResourceName="Spam_ManageSpamRules_LicenseNotSupported" /></asp:Label>
			<div class="CommonFormFieldName">
				<cp:resourcecontrol runat="Server" resourcename="Spam_ManageSpamRules_RulesDescription" />
			</div>
			<div class="CommonFormField">
				<asp:repeater id="RulesList" runat="server">
					<headertemplate>
						<table id="SpamRules" cellspacing="0" cellpadding="0" border="0" width="100%">
						<tr>
							<th class="CommonListHeaderLeftMost"><input type="checkbox" name="master" id="master" onclick="checkAll(this,'SpamRules');" />&nbsp;<cp:resourcecontrol runat="Server" resourcename="Spam_ManageSpamRules_EnabledColumnHeader" /></th>
							<th class="CommonListHeader"><cp:resourcecontrol runat="Server" resourcename="Spam_ManageSpamRules_RuleApplicationColumnHeader" /></th>
							<th class="CommonListHeader"><cp:resourcecontrol runat="Server" resourcename="Spam_ManageSpamRules_RuleNameColumnHeader" /></th>
							<th class="CommonListHeader"><cp:resourcecontrol runat="Server" resourcename="Spam_ManageSpamRules_SettingsColumnHeader" /></th>
						</tr>
					</headertemplate>
					<itemtemplate>
						<tr>
							<td class="CommonListCellLeftMost"><asp:checkbox id="RuleEnabled" value runat="Server" /><asp:literal id="RuleID" runat="Server" visible="false" /></td>
							<td class="CommonListCell"><asp:literal id="RuleAppType" runat="Server" /></td>
							<td class="CommonListCell">
								<strong><asp:literal id="RuleName" runat="Server" /></strong><br />
								<asp:literal id="RuleDesc" runat="Server" />
							</td>
							<td class="CommonListCell">
								<asp:Hyperlink id="Settings" runat="server" cssclass="CommonTextButton" />
								&nbsp;
							</td>
						</tr>
					</itemtemplate>
					<AlternatingItemTemplate> 
						<tr bgcolor="#F0F0F0">
							<td class="CommonListCellLeftMost"><asp:checkbox id="RuleEnabled" value runat="Server" /><asp:literal id="RuleID" runat="Server" visible="false" /></td>
							<td class="CommonListCell"><asp:literal id="RuleAppType" runat="Server" /></td>
							<td class="CommonListCell">
								<strong><asp:literal id="RuleName" runat="Server" /></strong><br />
								<asp:literal id="RuleDesc" runat="Server" />
							</td>
							<td class="CommonListCell">
								<asp:hyperlink id="Settings" runat="server" cssclass="CommonTextButton" />
								&nbsp;
							</td>
						</tr>
					</AlternatingItemTemplate>
					<footertemplate>
						</table>
					</footertemplate>
				</asp:repeater>
			</div>
        </Content>
    </TWC:TabbedPane>

    </TWC:TabbedPanes>
		
	<div class="CommonFormField PanelSaveButton">
		<cp:resourcebutton id="SaveButton" runat="server" resourcename="Spam_ManageSpamRules_Save" />
	</div>
	</asp:panel>
</asp:Content>