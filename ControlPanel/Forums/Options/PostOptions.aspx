<%@ Page language="c#" Codebehind="PostOptions.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Forums.PostOptions" MasterPageFile="~/ControlPanel/Masters/ForumAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server"><CP:ResourceControl runat="Server" resourcename="CP_ForumsAdmin_PostOptions_Title" ID="Resourcecontrol2"/></asp:Content>
<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
	<cp:controlpanelselectednavigation selectednavitem="ForumsPostOptions" runat="server" />
	<div class="CommonDescription">
		<CP:ResourceControl runat="Server" resourcename="CP_ForumsAdmin_PostOptions_SubTitle" ID="Resourcecontrol3"/>
	</div>
		<CP:FileOnlyStatusMessage id="FOStatus" runat="server" visible="false"></CP:FileOnlyStatusMessage>
		
		<asp:PlaceHolder id="OptionHolder" runat="Server">
			<cp:statusmessage id="Status" runat="server"></cp:statusmessage>
			<TWC:TabbedPanes id="EditorTabs" runat="server"
				PanesCssClass="CommonPane"
				TabSetCssClass="CommonPaneTabSet"
				TabCssClasses="CommonPaneTab"
				TabSelectedCssClasses="CommonPaneTabSelected"
				TabHoverCssClasses="CommonPaneTabHover"
				>
				<TWC:TabbedPane runat="server">
					<Tab><CP:ResourceControl runat="server" ResourceName="CP_ForumsAdmin_PostOptions_Tab_General" /></Tab>
					<Content>
						<h3 class="CommonSubTitle"><CP:ResourceControl runat="Server" resourcename="CP_ForumsAdmin_PostOptions_GeneralSettings" ID="Resourcecontrol4"/></h3>
						<table border="0" cellspacing="0" cellpadding="2">
                            <asp:PlaceHolder id="RssNotAllowedLicensingHolder" runat="Server">
								<tr>
									<td class="CommonFormFieldName">&nbsp;</td>
									<td class="CommonFormField"><cp:resourcecontrol id="RssNotAllowedLicensing" visible="false" runat="server" Tag="div" CssClass="CommonLicenseRestrictionMessage" resourcename="CP_Settings_RssNotAllowedLicensing" /></td>
								</tr>
							</asp:PlaceHolder>
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_RSS_Feeds" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_RSS_Feeds_Descr" />
								</td>
								<td class="CommonFormField" nowrap="nowrap">
									<cp:yesnoradiobuttonlist id="EnableForumsRSS" runat="server" cssclass="ControlPanelTextInput" repeatcolumns="2"></cp:yesnoradiobuttonlist>
								</td>
							</tr>
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_ThreadStatus_Allow" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_ThreadStatus_Allow_Descr" />
								</td>
								<td class="CommonFormField" nowrap="nowrap">
									<cp:yesnoradiobuttonlist id="EnableThreadStatus" runat="server" cssclass="ControlPanelTextInput" repeatcolumns="2"></cp:yesnoradiobuttonlist></td>
							</tr>
		                    <TR>
			                    <TD class="CommonFormFieldName">
				                    <strong><cp:ResourceLabel runat="server" resourcename="CP_ForumsAdmin_PostOptions_EnableUserModerationCounters" /></strong>
				                    <br />
				                    <cp:resourcecontrol runat="Server" resourcename="CP_ForumsAdmin_PostOptions_EnableUserModerationCounters_Descr" />
			                    </TD>
			                    <TD class="CommonFormField">
				                    <cp:yesnoradiobuttonlist id="optEnableUserModerationCounters" runat="server" repeatcolumns="2" cssclass="ControlPanelTextInput" />
			                    </TD>
		                    </TR>
				             <TR>
					            <TD class="CommonFormFieldName">
						            <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Tagging_Allow" /></strong><br />
						            <cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_Tagging_Allow_Descr" /></TD>
					            <TD class="CommonFormField" noWrap>
						            <cp:yesnoradiobuttonlist id="Tagging" runat="server" repeatcolumns="2" cssclass="ControlPanelTextInput"></cp:yesnoradiobuttonlist></TD>
				            </TR>							
							
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_RSS_Threads" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="CP_Settings_RSS_Threads_Descr" />
								</td>
								<td class="CommonFormField" nowrap="nowrap">
									<asp:textbox id="RSSDefaultThreadsPerFeed" runat="server" maxlength="3"></asp:textbox>
									<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="RSSDefaultThreadsPerFeed"
										id="RSSDefaultThreadsPerFeedValidator" />
								</td>
							</tr>
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_PostPerPage" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_PostPerPage_Descr" />
								</td>
								<td class="CommonFormField">
									<asp:textbox id="PostsPerPage" runat="Server" maxlength="4"></asp:textbox>
									<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PostsPerPage"
										id="PostsPerPageValidator" />
								</td>
							</tr>
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_DaysPostMarkedAsRead" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_DaysPostMarkedAsRead_Descr" />
								</td>
								<td class="CommonFormField">
									<asp:textbox id="DaysPostMarkedAsRead" runat="Server"></asp:textbox>
									<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="DaysPostMarkedAsRead"
										id="DaysPostMarkedAsReadValidator" />
								</td>
							</tr>
                            <TR>
					            <TD class="CommonFormFieldName">
					                <strong><cp:resourcecontrol ID="Resourcecontrol1" runat="server" resourcename="Admin_SiteSettings_DateTime_Filter" /></strong>
					                <br />
						            <cp:resourcecontrol ID="Resourcecontrol5" runat="Server" resourcename="Admin_SiteSettings_DateTime_Filter_Descr" />
					            </TD>
					            <TD class="CommonFormField">
						            <cp:datefilter id="ThreadDateFilter" runat="server" AddText="false" />
					            </TD>
				            </TR>

						</table>
					</Content>
				</TWC:TabbedPane>
				<TWC:TabbedPane runat="server">
					<Tab><CP:ResourceControl runat="server" ResourceName="CP_ForumsAdmin_PostOptions_Tab_Editing" /></Tab>
					<Content>
						<h3 class="CommonSubTitle"><CP:ResourceControl runat="Server" resourcename="CP_ForumsAdmin_PostOptions_PostEditing" /></h3>
						<table border="0" cellspacing="0" cellpadding="2">
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Posting_RequireEditNotes" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_Posting_RequireEditNotes_Descr" />
								</td>
								<td class="CommonFormField">
									<cp:yesnoradiobuttonlist id="RequireEditNotes" runat="server" cssclass="ControlPanelTextInput" repeatcolumns="2"></cp:yesnoradiobuttonlist></td>
							</tr>
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Editing_Notes" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_Editing_Notes_Descr" />
								</td>
								<td class="CommonFormField" nowrap="nowrap">
									<cp:yesnoradiobuttonlist id="DisplayEditNotes" runat="server" cssclass="ControlPanelTextInput" repeatcolumns="2"></cp:yesnoradiobuttonlist></td>
							</tr>
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Editing_Age" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_Editing_Age_Descr" />
								</td>
								<td class="CommonFormField">
									<asp:textbox id="PostEditBodyAgeInMinutes" runat="server"></asp:textbox>
									<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PostEditBodyAgeInMinutes" id="PostEditBodyAgeInMinutesValidator" />
								</td>
							</tr>
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Deleting_Age" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_Deleting_Age_Descr" />
								</td>
								<td class="CommonFormField">
									<asp:textbox id="PostDeleteAgeInMinutes" runat="server"></asp:textbox>
									<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PostDeleteAgeInMinutes" id="PostDeleteAgeInMinutesValidator" />
								</td>
							</tr>
						</table>
					</Content>
				</TWC:TabbedPane>
				<TWC:TabbedPane runat="server">
					<Tab><CP:ResourceControl runat="server" ResourceName="CP_ForumsAdmin_PostOptions_Tab_Attachments" /></Tab>
					<Content>
						<h3 class="CommonSubTitle"><CP:ResourceControl runat="Server" resourcename="CP_ForumsAdmin_PostOptions_PostAttachments" /></h3>
						<table border="0" cellspacing="0" cellpadding="2">
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="CP_ForumsAdmin_Options_FileStorage_FileStorageExtensions" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="CP_ForumsAdmin_Options_FileStorage_FileStorageExtensions_Help" />
								</td>
								<td class="CommonFormField">
									<asp:textbox id="AllowedAttachmentTypes" runat="server" Columns="60" Rows="5" TextMode="MultiLine" Wrap="true"></asp:textbox></td>
							</tr>
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Attachments_MaxSize" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_Attachments_MaxSize_Desc" />
								</td>
								<td class="CommonFormField">
									<asp:textbox id="MaxAttachmentSize" runat="server"></asp:textbox>
									<asp:regularexpressionvalidator runat="server" ValidationExpression="^[0-9]*" 
										ControlToValidate="MaxAttachmentSize">&nbsp;* <CP:ResourceControl runat="server" ResourceName="CP_RequireNumber" /></asp:regularexpressionvalidator></TD>
									<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="MaxAttachmentSize"
										id="MaxAttachmentSizeValidator" />
								</td>
							</tr>
						</table>
					</Content>
				</TWC:TabbedPane>
				<TWC:TabbedPane runat="server">
					<Tab><CP:ResourceControl runat="server" ResourceName="CP_ForumsAdmin_PostOptions_Tab_Duplicate" /></Tab>
					<Content>
						<h3 class="CommonSubTitle"><CP:ResourceControl runat="Server" resourcename="CP_ForumsAdmin_PostOptions_DuplicatePosts" /></h3>
						<table border="0" cellspacing="0" cellpadding="2">
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Posting_Dups" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_Posting_Dups_Descr" />
								</td>
								<td class="CommonFormField" nowrap="nowrap">
									<cp:yesnoradiobuttonlist id="PreventDuplicatePosts" runat="server" cssclass="ControlPanelTextInput" repeatcolumns="2"></cp:yesnoradiobuttonlist></td>
							</tr>
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Posting_DupsInterval" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_Posting_DupsInterval_Descr" />
								</td>
								<td class="CommonFormField" nowrap="nowrap">
									<asp:textbox id="DuplicatePostIntervalInMinutes" runat="Server"></asp:textbox>
									<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="DuplicatePostIntervalInMinutes"
										id="DuplicatePostIntervalInMinutesValidator" />
								</td>
							</tr>
						</table>
					</Content>
				</TWC:TabbedPane>
				<TWC:TabbedPane runat="server">
					<Tab><CP:ResourceControl runat="server" ResourceName="CP_ForumsAdmin_PostOptions_Tab_PopularPosts" /></Tab>
					<Content>
						<h3 class="CommonSubTitle"><CP:ResourceControl runat="Server" resourcename="CP_ForumsAdmin_PostOptions_PopularCriteria" /></h3>
						<table border="0" cellspacing="0" cellpadding="2">
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Posting_Popular" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_Posting_Popular_Descr" />
								</td>
								<td class="CommonFormField">
									<asp:textbox id="PopularPostThresholdPosts" runat="Server"></asp:textbox>
									<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PopularPostThresholdPosts" />
									<asp:RangeValidator ID="PopularPostThresholdPostsValidator" runat="server" Type="Integer" MinimumValue="1" MaximumValue="2147483647" ControlToValidate="PopularPostThresholdPosts" />
								</td>
							</tr>
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Posting_Popular_View" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_Posting_Popular_View_Descr" />
								</td>
								<td class="CommonFormField">
									<asp:textbox id="PopularPostThresholdViews" runat="Server"></asp:textbox>
									<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PopularPostThresholdViews" />
									<asp:RangeValidator ID="PopularPostThresholdViewsValidator" runat="server" Type="Integer" MinimumValue="1" MaximumValue="2147483647" ControlToValidate="PopularPostThresholdViews" />
								</td>
							</tr>
							<tr>
								<td class="CommonFormFieldName">
									<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Posting_Popular_Age" /></strong><br />
									<cp:ResourceControl runat="Server" resourcename="Admin_SiteSettings_Posting_Popular_Age_Descr" />
								</td>
								<td class="CommonFormField">
									<asp:textbox id="PopularPostThresholdDays" runat="Server"></asp:textbox>
									<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PopularPostThresholdDays" />
									<asp:RangeValidator ID="PopularPostThresholdDaysValidator" runat="server" Type="Integer" MinimumValue="1" MaximumValue="2147483647" ControlToValidate="PopularPostThresholdDays" />
								</td>
							</tr>
						</table>
					</Content>
				</TWC:TabbedPane>
			</TWC:TabbedPanes>
			<p class="PanelSaveButton DetailsFixedWidth">
				<cp:ResourceLinkButton id="SaveButton" runat="server" cssclass="CommonTextButton" resourcename="Save"></cp:ResourceLinkButton></p>
		</asp:PlaceHolder>
</asp:Content>