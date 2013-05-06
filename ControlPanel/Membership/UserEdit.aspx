<%@ Page language="c#" Codebehind="UserEdit.aspx.cs" AutoEventWireup="true" Inherits="Telligent.Evolution.ControlPanel.Membership.UserEdit" MasterPageFile="~/ControlPanel/Masters/MembershipAdmin.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<asp:literal id="PanelDescription" runat="server"></asp:literal>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <cp:controlpanelselectednavigation selectednavitem="BrowseMembers" runat="server" id="SelectedNavigation1" />
	<div>
		<CP:statusmessage id="anonymousWarning" runat="server"></CP:statusmessage>
		<CP:statusmessage id="formStatus" runat="server"></CP:statusmessage>
		<CP:statusmessage id="impersonateWarning" runat="server" Visible="false"></CP:statusmessage>
	</div>
	<TWC:TabbedPanes id="UserEditTabs" runat="server"
	PanesCssClass="CommonPane"
	TabSetCssClass="CommonPaneTabSet"
	TabCssClasses="CommonPaneTab"
	TabSelectedCssClasses="CommonPaneTabSelected"
	TabHoverCssClasses="CommonPaneTabHover"
	>
	<TWC:TabbedPane runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_UserEdit_Tab_Admin" /></Tab>
		<Content>
			<table cellpadding="2" cellspacing="0">
				<tr id="isLockedOutRow" runat="server" visible="false" class="CommonMessageWarning">
					<td class="CommonFormFieldName">
				        <strong><CP:ResourceLabel runat="server" resourcename="UserAdmin_IsLockedOut" /></strong>
					</td>
					<td class="CommonFormField">
						<CP:ResourceLinkButton runat="server" ID="unlockUser" Text="Unlock" />
					</td>
				</tr>
                <tr id="unlockedAccountRow" runat="server" visible="false" class="CommonMessageSuccess">
					<td class="CommonFormFieldName" colspan="2">
				        <strong><CP:ResourceLabel runat="server" resourcename="UserAdmin_IsUnlocked" /></strong>
					</td>
				</tr>
                <tr>
					<td class="CommonFormFieldName">
						<strong><CP:ResourceLabel runat="server" resourcename="UserAdmin_UserID" /></strong>
					</td>
					<td class="CommonFormField">
						<asp:literal id="userID" runat="server" />
					</td>
				</tr>
                <% if (!CurrentCSContext.SiteSettings.EnableMultipleEvolutionSites)
                   { %>
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="CP_UserEdit_UserName" /></strong>
					</td>
					<td class="CommonFormField">
						<a runat="server" id="changeUserName" />
					</td>
				</tr>
                    <% } %>
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="EditProfile_Password" id="Resourcelabel15" /></strong>
					</td>
					<td class="CommonFormField">
						<a runat="server" id="changePassword" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="CP_UserEdit_Roles" id="Resourcelabel52" /></strong>
					</td>
					<td class="CommonFormField">
						<a runat="server" id="changeRoles" />
					</td>
				</tr>
				<TEControl:PlaceHolder runat="server" ID="ImpersonateHolder">
                    <DisplayConditions><TEControl:ControlVisibilityCondition runat="server" ControlId="impersonateUserButton" ControlVisibilityEquals="true" /></DisplayConditions>
                    <ContentTemplate>
                        <tr>
                            <td class="CommonFormFieldName">
                                <strong><cp:resourcelabel runat="server" resourcename="CP_UserEdit_ImpersonateLabel" /></strong>
                            </td>
                            <td class="CommonFormField">
                                <CP:ResourceLinkButton runat="server" ResourceName="CP_UserEdit_ImpersonateLink" ID="impersonateUserButton" CausesValidation="false" />
                            </td>
                        </tr>
                    </ContentTemplate>
                </TEControl:PlaceHolder>
				<tr>
					<td class="CommonFormFieldName">
						<strong><CP:ResourceLabel runat="server" resourcename="UserAdmin_ForceLogin" id="Resourcelabel6" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:yesnoradiobuttonlist  id="forceLogin" runat="server" repeatdirection="Horizontal" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><CP:ResourceLabel runat="server" resourcename="UserAdmin_IsIgnored" id="Resourcelabel29" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:yesnoradiobuttonlist  id="isIgnored" runat="server" repeatdirection="Horizontal" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><CP:ResourceLabel runat="server" resourcename="UserAdmin_AccountStatus" id="Resourcelabel7" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:accountstatusdropdownlist  id="accountStatus" runat="server" AutoPostBack="true" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><CP:ResourceLabel runat="server" resourcename="UserAdmin_ModerationLevel" id="Resourcelabel8" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:moderationleveldropdownlist  id="moderationLevel" runat="server" repeatdirection="Horizontal" />
					</td>
				</tr>
			</table>
		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_UserEdit_Tab_AboutUser" /></Tab>
		<Content>
			<table cellpadding="3" cellspacing="0" runat="server" id="AboutUserTable">
				<tr>
					<td class="CommonFormFieldName">
						<strong><CP:ResourceLabel runat="server" resourcename="EditProfile_AboutUserName" id="Resourcelabel18" /></strong>
					</td>
					<td class="CommonFormField">
						<asp:textbox id="usernameEdit" runat="server" />
						<asp:requiredfieldvalidator id="UsernameEditValidator" runat="server" controltovalidate="UsernameEdit" enableclientscript="false" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><CP:ResourceLabel runat="server" resourcename="EditProfile_DateCreated" id="Resourcelabel19" /></strong>
					</td>
					<td class="CommonFormField">
						<asp:literal id="dateCreated" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong>
							<CP:ResourceLabel runat="server" resourcename="EditProfile_LastLogin" id="LastLoginLabel" />
							<CP:ResourceLabel runat="server" resourcename="EditProfile_LastLoginAttempt" id="LastLoginAttemptLabel" Visible="false" />
						</strong>
					</td>
					<td class="CommonFormField">
						<asp:literal id="lastLogin" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><CP:ResourceLabel runat="server" resourcename="EditProfile_LastActivity" id="Resourcelabel21" /></strong>
					</td>
					<td class="CommonFormField">
						<asp:literal id="lastActivity" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="EditProfile_CommonName" id="ResourceControl2" name="ResourceControl2" /></strong>
					</td>
					<td class="CommonFormField">
						<asp:textbox id="CommonName" size="30" maxlength="50" runat="server" />
					</td>
				</tr>
				<tr>
				    <td class="CommonFormFieldName">
				        <strong><CP:ResourceControl runat="server" ResourceName="CP_Membership_UserEdit_ShareFavorites" /></strong>
				    </td>
				    <td class="CommonFormField">
				        <CP:YesNoRadioButtonList runat="server" ID="shareFavorites" repeatcolumns="2" />
				    </td>
				</tr>
				<tr>
					<td class="CommonFormFieldName" valign="top">
						<strong><CP:ResourceControl runat="server" ResourceName="CP_Membership_UserEdit_Bio" /></strong>
					</td>
					<td>
					    <TEControl:Editor runat="server" id="bio" />
					</td>
				</tr>
			</table>
			
			<TEDynConfig:ConfigurationForm runat="server" ID="ProfileFieldsForm" RenderGroupsInTabs="false">
		        <PropertyFormGroupHeaderTemplate>
		            <table cellpadding="3" cellspacing="0">
		        </PropertyFormGroupHeaderTemplate>
		        <PropertyFormPropertyTemplate>
			        <tr>
				        <td class="CommonFormFieldName">
	                        <strong><TEDynConfig:PropertyData runat="server" Property="Name" /></strong>
	                        <TEDynConfig:PropertyData runat="server" Property="Description" />
	                    </td>
				        <td class="CommonFormField">
				            <TEDynConfig:PropertyControl runat="server" />
				        </td>
				    </tr>
		        </PropertyFormPropertyTemplate>
		        <PropertyFormGroupFooterTemplate>
		            </table>
		        </PropertyFormGroupFooterTemplate>
		    </TEDynConfig:ConfigurationForm>
		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_UserEdit_Tab_Avatar" /></Tab>
		<Content>
			<table cellpadding="3" cellspacing="0" runat="server" id="AvatarSection">
				<tr>
					<td class="CommonFormFieldName">
						<strong><CP:ResourceLabel runat="server" resourcename="ViewUserProfile_Avatar" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:useravatar OverrideUser="true" visible="False" id="avatar" runat="server" padimage="False" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><CP:ResourceLabel runat="server" resourcename="UserAdmin_IsAvatarApproved" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:yesnoradiobuttonlist  id="isAvatarApproved" runat="server" repeatdirection="Horizontal" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><CP:ResourceLabel runat="server" resourcename="EditProfile_UploadAvatar" /></strong>
					</td>
					<td class="CommonFormField">
						<input type="file" runat="server" id="uploadedAvatar" name="uploadedAvatar" />
						<asp:RequiredFieldValidator id="UploadedAvatarValidator" runat="server" ValidationGroup="avg" controltovalidate="uploadedAvatar" Display="Dynamic">*</asp:RequiredFieldValidator>
						<asp:button id="avatarUpdateButton" runat="server" ValidationGroup="avg" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><CP:ResourceLabel runat="server" resourcename="EditProfile_AvatarUrl" /></strong>
					</td>
					<td class="CommonFormField">
						<asp:textbox id="avatarUrl" size="50" runat="server" maxlength="256" />
					</td>
				</tr>
			</table>
		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_UserEdit_Tab_SiteOptions" /></Tab>
		<Content>
			<table cellpadding="3" cellspacing="0" runat="server" id="ForumOptionsTable">
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="EditProfile_AboutTimeZone" /></strong>
					</td>
					<td class="CommonFormField">
						<asp:DropDownList id="timezone" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="EditProfile_OptionsDateFormat" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:dateformatdropdownlist id="dateFormat" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="EditProfile_Editor" /></strong>
					</td>
					<td class="CommonFormField">
						<asp:dropdownlist id="EditorList" runat="server" />
					</td>
				</tr>
				<tr runat="server" visible = "<%# CSContext.Current.SiteSettings.EnableDisplayNames %>">
					<td class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="EditProfile_DisplayName" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:yesnoradiobuttonlist  id="enableDisplayNames" runat="server" repeatcolumns="2" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="EditProfile_DisplayInMemberList" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:yesnoradiobuttonlist  id="displayInMemberList" runat="server" repeatdirection="Horizontal" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="Admin_SiteSettings_EnableCollapsingPanels" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:yesnoradiobuttonlist  id="EnableCollapsingPanels" runat="server" repeatcolumns="2" />
					</td>
				</tr>
				<tr>
				    <td class="CommonFormFieldName">
				        <strong><CP:ResourceControl ID="ResourceControl7" runat="server" ResourceName="CP_Membership_UserEdit_EnableConversationNotifications" /></strong>
				    </td>
				    <td class="CommonFormField">
				        <CP:YesNoRadioButtonList runat="server" ID="conversationNotifications" repeatcolumns="2" />
				    </td>
				</tr>
				<tr>
				    <td class="CommonFormFieldName">
				        <strong><CP:ResourceControl ID="ResourceControl10" runat="server" ResourceName="CP_Membership_UserEdit_EnableCommentNotifications" /></strong>
				    </td>
				    <td class="CommonFormField">
				        <CP:YesNoRadioButtonList runat="server" ID="commentNotifications" repeatcolumns="2" />
				    </td>
				</tr>
				<tr id="EmoticonRow" runat="Server">
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="Admin_SiteSettings_EnableEmoticons" id="Resourcelabel14"
							name="Resourcelabel14" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:yesnoradiobuttonlist  id="enableEmoticons" runat="server" repeatcolumns="2" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="EditProfile_EnableUserSignatures" id="Resourcecontrol19" /></strong>
					</td>
					<td class="CommonFormField" nowrap="nowrap">
						<cp:yesnoradiobuttonlist  id="enableUserSignatures" runat="server" repeatcolumns="2" />
					</td>
				</tr>
				<tr>
                    <td class="CommonFormFieldName">
	                    <strong><TEControl:FormLabel runat="server" ResourceName="EditProfile_CPGridItemsPerPage" LabelForId="ControlPanelPageSizeDropDownList" /></strong>
                    </td>
                    <td class="CommonFormField">
	                    <asp:dropdownlist id="ControlPanelPageSizeDropDownList" runat="Server">
		                    <asp:listitem value="5">5</asp:listitem>
		                    <asp:listitem value="10">10</asp:listitem>
		                    <asp:listitem value="20">20</asp:listitem>
		                    <asp:listitem value="30">30</asp:listitem>
		                    <asp:listitem value="40">40</asp:listitem>
		                    <asp:listitem value="50">50</asp:listitem>
	                    </asp:dropdownlist>
                    </td>
                </tr>
				<tr>
					<td class="CommonFormFieldName" valign="top">
						<strong><CP:ResourceLabel runat="server" resourcename="EditProfile_AboutSignature" id="Resourcelabel28" /></strong>
					</td>
					<td class="CommonFormField" valign="top">
					    <TEControl:Editor runat="server" id="signature" />
						<asp:rangevalidator controltovalidate="signature" id="signatureMaxLengthValidator" enableclientscript="false"
							runat="server" />
					</td>
				</tr>
			</table>
		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_UserEdit_Tab_EmailContactInfo" /></Tab>
		<Content>	
				<h3 class="CommonSubTitle">
					<cp:resourcecontrol runat="server" resourcename="EditProfile_PrivateTitle" id="Resourcecontrol4" /></h3>
				<table cellpadding="2" cellspacing="0" border="0">
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcelabel runat="server" resourcename="EditProfile_ContactPrivateEmail" id="Resourcelabel16" /></strong>
						</td>
						<td class="CommonFormField">
							<asp:textbox id="privateEmail" size="50" runat="server" maxlength="50" />
							<asp:requiredfieldvalidator runat="server" controltovalidate="privateEmail">*</asp:requiredfieldvalidator>
				            <TEControl:EmailValidator runat=server ID="Regularexpressionvalidator1" ControlToValidate="privateEmail"><CP:ResourceControl runat="server" ResourceName="CP_Membership_UserEdit_EmailFormatError" /></TEControl:EmailValidator>										    
						</td>
					</tr>
				</table>

				<h3 class="CommonSubTitle">
					<cp:resourcecontrol runat="server" resourcename="EditProfile_EmailTitle" id="Resourcecontrol1" /></h3>
				<table cellpadding="2" cellspacing="0" border="0">
					<tr>
						<td class="CommonFormFieldName">
							<strong><CP:ResourceLabel runat="server" resourcename="EditProfile_OptionsReceiveEmails" id="Resourcelabel48" /></strong>
						</td>
						<td class="CommonFormField">
							<cp:yesnoradiobuttonlist  id="enableEmail" runat="server" repeatdirection="Horizontal" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><CP:ResourceLabel runat="server" resourcename="EditProfile_OptionsHtmlEmail" id="Resourcelabel49" /></strong>
						</td>
						<td class="CommonFormField">
							<cp:yesnoradiobuttonlist  id="enableHtmlEmail" runat="server" repeatdirection="Horizontal" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><CP:ResourceLabel runat="server" resourcename="EditProfile_OptionsEmailTracking" id="Resourcelabel50" /></strong>
						</td>
						<td class="CommonFormField">
							<cp:yesnoradiobuttonlist  id="enableEmailTracking" runat="server" repeatdirection="Horizontal" />
						</td>
					</tr>
				</table>

                <h3 class="CommonSubTitle"><cp:ResourceControl runat="server" ResourceName="EditProfile_ConversationsPreferences" /></h3>
                <table>				                    
                    <tr>
                        <td class="CommonFormFieldName">
                            <strong><cp:ResourceControl runat="server" ResourceName="EditProfile_AllowConversationsFrom" /></strong>
                        </td>
                        <td class="CommonFormField">
                            <cp:usercontacttyperadiobuttonlist id="enableStartConversations" RepeatColumns="3" runat="server" RepeatLayout="flow" />
                        </td>
                    </tr>
                </table>

				<h3 class="CommonSubTitle">
					<cp:resourcecontrol runat="server" resourcename="EditProfile_ContactTitle" id="Resourcecontrol3" /></h3>
				<table cellpadding="3" cellspacing="0">
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcelabel runat="server" resourcename="EditProfile_ContactMsn" id="Resourcelabel31" /></strong>
						</td>
						<td class="CommonFormField">
							<asp:textbox id="msnIM" size="50" runat="server" maxlength="50" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcelabel runat="server" resourcename="EditProfile_ContactAol" id="Resourcelabel32" /></strong>
						</td>
						<td class="CommonFormField">
							<asp:textbox id="aolIM" size="50" runat="server" maxlength="50" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcelabel runat="server" resourcename="EditProfile_ContactYahoo" id="Resourcelabel33" /></strong>
						</td>
						<td class="CommonFormField">
							<asp:textbox id="yahooIM" size="50" runat="server" maxlength="50" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcelabel runat="server" resourcename="EditProfile_ContactIcq" id="Resourcelabel34" /></strong>
						</td>
						<td class="CommonFormField">
							<asp:textbox id="icq" size="50" runat="server" maxlength="50" />
						</td>
					</tr>
				</table>

		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_UserEdit_Tab_Ban" /></Tab>
		<Content>
			<table cellpadding="3" cellspacing="0" visible="false" runat="server" id="userBanSection">
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="EditProfile_UserBanPeriod" id="Resourcelabel10" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:userbandropdownlist  id="userBanPeriod" runat="server" AutoPostBack="true"/>
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="EditProfile_UserBanReason" id="Resourcelabel4" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:userbanreasondropdownlist  id="userBanReason" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="EditProfile_BanedUntilDate" id="Resourcelabel11" /></strong>
					</td>
					<td class="CommonFormField">
						<asp:label id="bannedUntilDate" runat="server" />
					</td>
				</tr>
			</table>
			<table cellpadding="3" cellspacing="0" visible="false" runat="server" id="userApprovalSection">
				<tr>
					<td colspan="2">
						<cp:resourcelabel runat="server" resourcename="EditProfile_UserApprovalTitle" id="Resourcelabel12" />
					</td>
				</tr>
				<tr>
					<td class="CommonFormFieldName">
						<strong><cp:resourcelabel runat="server" resourcename="EditProfile_UserApproval" id="Resourcelabel13" /></strong>
					</td>
					<td class="CommonFormField">
						<cp:yesnoradiobuttonlist  id="isApproved" runat="server" repeatdirection="Horizontal" />
					</td>
				</tr>
			</table>
		</Content>
	</TWC:TabbedPane>
	</TWC:TabbedPanes>
	<p class="PanelSaveButton DetailsFixedWidth">
		<cp:resourcelinkbutton id="updateButton" runat="server" cssclass="CommonTextButton" resourcename="EditProfile_Update" />
	</p>
</asp:Content>