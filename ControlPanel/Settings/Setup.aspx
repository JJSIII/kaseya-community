<%@ Page language="c#" Codebehind="Setup.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Settings.SettingsSetup" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Register TagPrefix="MG" TagName="Accounts" Src = "~/ControlPanel/Settings/MGAccounts.ascx" %>



<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
    <cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="CP_Settings_Setup" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <cp:controlpanelselectednavigation selectednavitem="SettingsSetup" runat="server" />
    <DIV class="CommonDescription">
        <CP:ResourceControl ID="ResourceControl4" runat="server" ResourceName="CP_Settings_SetupSiteNameDesc" />
    </DIV>
	<cp:statusmessage id="Status" runat="server" />
	<div class="CommonFormArea">
	
	<TWC:TabbedPanes runat="server"
	    PanesCssClass="CommonPane"
	    TabSetCssClass="CommonPaneTabSet"
	    TabCssClasses="CommonPaneTab"
	    TabSelectedCssClasses="CommonPaneTabSelected"
	    TabHoverCssClasses="CommonPaneTabHover">
	    
	<TWC:TabbedPane runat="server">
	    <Tab><cp:resourcecontrol runat="Server" resourcename="CP_Settings_Setup_SiteNameTabTitle" /></Tab>
	    <Content>
	        <table width="100%">
                <tr>
                    <td colspan="2">
                        <div class="CommonFormSubTitle">
                            <CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_Settings_SetupSiteName" />
                        </div>
                    </td>
                </tr>
    	        <TR>
		            <TD colspan="2">
		                <div class="CommonFormFieldName">
		                <strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_SiteContent_Name" /></strong>
		                <br />
		                <cp:resourcecontrol runat="server" resourcename="CP_Settings_SiteContent_Name_Descr" />
		                </div>
		                
			            <div class="CommonFormField">
		                <asp:textbox class="ControlPanelTextInput" id="SiteName" runat="server" maxlength="512" columns="55" />
		                </div>
		            </TD>
	            </TR>
	            <TR>
		            <TD colspan="2">
		                <div class="CommonFormFieldName">
		                <strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_SiteContent_Description" /></strong>
                        <br />
			            <cp:resourcecontrol runat="server" resourcename="CP_Settings_SiteContent_Description_Descr" />
			            </div>

			            <div class="CommonFormField">
    			            <asp:textbox class="ControlPanelTextInput" id="SiteDescription" runat="server" columns="55" textmode="Multiline" rows="6" />
    			        </div>
		            </TD>
	            </TR>

                <tr>
                    <td colspan="2">
                        <div class="CommonFormSubTitle">
                            <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_DateTime"></cp:resourcecontrol>
                        </div>
                    </td>
                </tr>
				<TR>
					<TD class="CommonFormFieldName" style="width:350px;">
					    <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_TimeZone" /></strong>
					    <br />
						<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_TimeZone_Descr" />
					</TD>
					<TD class="CommonFormField">
						<asp:DropDownList id="Timezone" runat="server" />
					</TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
					    <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_DateTime_Date" /></strong>
					    <br />
						<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_DateTime_Date_Descr" />
					</TD>
					<TD class="CommonFormField">
						<cp:dateformatdropdownlist id="DateFormat" runat="server"></cp:dateformatdropdownlist>
					</TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
					    <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_DateTime_Time" /></strong>
					    <br />
						<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_DateTime_Time_Descr" />
					</TD>
					<TD class="CommonFormField">
						<cp:timeformatdropdownlist id="TimeFormat" runat="server"></cp:timeformatdropdownlist>
					</TD>
				</TR>
			</TABLE>
	    </Content>
    </TWC:TabbedPane>
    
    <TWC:TabbedPane runat="server">
        <Tab><CP:ResourceControl runat="server" ResourceName="CP_Settings_Setup_ApplicationsTabTitle" /></Tab>
        <Content>
			<TABLE width="100%">
			    <tr>
			        <td colspan="2">
                        <div class="CommonFormSubTitle">
                            <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_EnableApplications"></cp:resourcecontrol>
                        </div>
			        </td>
			    </tr>
				<TR>
					<TD class="CommonFormFieldName">
                            <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_EnableForum" /></strong>
                            <br />
                            <cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_EnableForum_Descr" />
					</td>
				
				    <td class="CommonFormField">
					        <cp:yesnoradiobuttonlist id="Forum" runat="server" repeatcolumns="2"></cp:yesnoradiobuttonlist>
					</TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
					        <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_EnableBlog" /></strong>
					        <br />
						    <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_EnableBlog_Descr" />
					</TD>
					<TD class="CommonFormField">
    						<cp:yesnoradiobuttonlist id="Weblog" runat="server" repeatcolumns="2"></cp:yesnoradiobuttonlist>
					</TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
					        <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_EnableMediaGallery" /></strong>
					        <br />
						    <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_EnableMediaGallery_Descr" />
                            <asp:Label runat="server" ID="MediaGalleryLicensingRestriction" Visible="false" ForeColor="Red">
                                <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_ApplicationDisabled_DueToLicensing" />
                            </asp:Label>
				    </TD>
					<TD class="CommonFormField">
					    	<cp:yesnoradiobuttonlist id="MediaGallery" runat="server" repeatcolumns="2"></cp:yesnoradiobuttonlist>
					</TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
					        <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_EnableWiki" /></strong>
					        <br />
						    <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_EnableWiki_Descr" />
                            <asp:Label runat="server" ID="WikiLicensingRestriction" Visible="false" ForeColor="Red">
                                <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_ApplicationDisabled_DueToLicensing" />
                            </asp:Label>
					</TD>
					<TD class="CommonFormField">
    						<cp:yesnoradiobuttonlist id="Wiki" runat="server" repeatcolumns="2"></cp:yesnoradiobuttonlist>
					</TD>
				</TR>
			</TABLE>
        </Content>
    </TWC:TabbedPane>
    
    <TWC:TabbedPane runat="server">
        <Tab><CP:ResourceControl runat="server" ResourceName="CP_Settings_GeneralSettings" /></Tab>
        <Content>
            <TABLE width="100%">
                <tr>
                    <td colspan="2">
                        <div class="CommonFormSubTitle">
                            <CP:ResourceControl ID="ResourceControl5" runat="server" ResourceName="CP_Settings_SetupGeneralSettings" />
                        </div>
                    </td>
                </tr>
				<TR>
					<TD class="CommonFormFieldName">
					    <strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_General_Menu_SiteUrl" /></strong>
					    <br />
						<cp:resourcecontrol runat="Server" resourcename="CP_Settings_General_Menu_SiteUrl_Descr" />
					</TD>
					<TD class="CommonFormField">
						<asp:TextBox id="SiteUrl" runat="server" />
						<asp:RequiredFieldValidator runat="server" ErrorMessage="*" Font-Bold="True" ControlToValidate="SiteUrl" />
					</TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
					    <strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_General_Menu_TOS" /></strong>
					    <br />
						<cp:resourcecontrol runat="Server" resourcename="CP_Settings_General_Menu_TOS_Descr" />
                    </TD>
					<TD class="CommonFormField">
						<asp:TextBox id="TermsOfServiceUrl" runat="server" />
					</TD>
				</TR>	
				<tr>
				    <td class="CommonFormFieldName"> 
				        <strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Conversations" /></strong> <cp:resourcecontrol ID="ConversationsNotAllowedLicensing" runat="server" Tag="span" style="float:right" CssClass="CommonLicenseRestrictionMessage" resourcename="CP_Settings_Conversations_NotAllowedLicensing" />
				        <br />
						<cp:resourcecontrol runat="Server" resourcename="CP_Settings_Conversations_Desc" />
				    </td>
				    <td class="CommonFormField">
				        <cp:yesnoradiobuttonlist id="EnableConversations" runat="server" repeatcolumns="2" />
				    </td>
				</tr>
				<tr>
				    <td class="CommonFormFieldName"> 
				        <strong><CP:ResourceControl runat="server" ResourceName="CP_Settings_SiteContent_EnableRobotsMetaTag" /></strong>
				        <br />
						<CP:ResourceControl runat="server" ResourceName="CP_Settings_SiteContent_EnableRobotsMetaTag_Descr" />
				    </td>
				    <td class="CommonFormField">
				        <cp:yesnoradiobuttonlist id="EnableRobotsMetaTags" runat="server" repeatcolumns="2" />
				    </td>
				</tr>
				<TR>
		            <TD colspan="2">
		                <div class="CommonFormFieldName">
                            <strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_SiteContent_AdditionHeader"/></strong>
                            <br />
    			            <cp:resourcecontrol runat="server" resourcename="CP_Settings_SiteContent_AdditionHeader_Descr" />
                        </div>
                        
                        <div class="CommonFormField">
                            <asp:textbox class="ControlPanelTextInput" id="GenericHeader" runat="server" columns="55" textmode="Multiline" rows="6" />
                        </div>    			            
		            </TD>
	            </TR>
	            <TR>
		            <TD colspan="2">
		                <div class="CommonFormFieldName">
                            <strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_SiteContent_GoogleAnalytics"/></strong>
                            <br />
    			            <cp:resourcecontrol runat="server" resourcename="CP_Settings_SiteContent_GoogleAnalytics_Descr" />
                        </div>
                        
                        <div class="CommonFormField">
                            <asp:textbox class="ControlPanelTextInput" id="GoogleAnalytics" runat="server" columns="55" textmode="Multiline" rows="6" />
                        </div>    			            
		            </TD>
	            </TR>

			</TABLE>
        </Content>
    </TWC:TabbedPane>
    
    <TWC:TabbedPane runat="server">
        <Tab><CP:ResourceControl runat="server" ResourceName="CP_Settings_Email_Title" /></Tab>
        <Content>
            <asp:Label runat="server" ID="LicenseMessage" Visible="false" ForeColor="Red"><CP:ResourceControl runat="Server" ResourceName="CP_Settings_Email_LimitedLicense" /></asp:Label>
            <H3 class="CommonSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_SubTitle_General" /></H3>
			<TABLE cellSpacing="0" cellPadding="2" border="0">
				<TR>
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_Enable" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_Enable_Descr" />
					</TD>
					<TD class="CommonFormField">
						<cp:yesnoradiobuttonlist id="EnableEmail" runat="server" repeatcolumns="2"></cp:yesnoradiobuttonlist></TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_Digest_Enable" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_Digest_Enable_Descr" />
					</TD>
					<TD class="CommonFormField">
						<cp:yesnoradiobuttonlist id="EnableEmailDigest" runat="server" repeatcolumns="2"></cp:yesnoradiobuttonlist></TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Contact_NotificationFromEmail" /></strong><br />
						<cp:ResourceControl  runat="Server" resourcename="Admin_SiteSettings_Contact_NotificationFromEmail_Descr" />
					</TD>
					<TD class="CommonFormField">
						<asp:textbox id="NotificationFromEmailAddress" runat="server" maxlength="128"></asp:textbox>
                        <TEControl:EmailValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="NotificationFromEmailAddress"><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Contact_InvalidEmail" /></TEControl:EmailValidator>													
					</TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_MG_EmailDomain" ResourceFile="MGResources.xml" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_MG_EmailDomain_Descr" ResourceFile="MGResources.xml" />
					</TD>
					<TD class="CommonFormField">
						<asp:textbox id="MGEmailDomain" runat="server" maxlength="256"></asp:textbox>

						<asp:CustomValidator ID="EmailDomainValidator" runat="server" ControlToValidate="MGEmailDomain"><cp:resourcecontrol ID="Resourcecontrol9" runat="server" resourcename="CP_Settings_Email_MG_EmailDomain_InvalidDomain" ResourceFile="MGResources.xml" /></asp:CustomValidator>
					</TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_Encoding" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_Encoding_Descr" />
					</TD>
					<TD class="CommonFormField">
						<asp:textbox id="EmailEncoding" runat="server" maxlength="64"></asp:textbox></TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_SubjectEncoding" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_SubjectEncoding_Descr" />
					</TD>
					<TD class="CommonFormField">
						<asp:textbox id="EmailSubjectEncoding" runat="server" maxlength="64"></asp:textbox></TD>
				</TR>
				<TR id="SmtpServer_Row">
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_Server" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_Server_Descr" />
					</TD>
					<TD class="CommonFormField">
						<asp:textbox id="SmtpServer" runat="server" maxlength="64"></asp:textbox></TD>
				</TR>
				<TR id="TR1">
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_Timeout" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_Timeout_Descr" />
					</TD>
					<TD class="CommonFormField">
						<asp:textbox id="EmailTimeout" runat="server" maxlength="64"></asp:textbox><br />
						<asp:CustomValidator runat="server" ControlToValidate="EmailTimeout" Text="*" ID="EmailTimeoutValidator" />
					</TD>
				</TR>
                <tr>
                    <td class="CommonFormFieldName">
                        <strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_Api" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_Api_Descr" />
                    </td>
                    <td class="CommonFormField">
                        <a href="#" onclick="window.open('<%= SiteUrls.Instance().ApiDocumentation("email") %>', 'ApiHelp', 'width=960,height=700,scrollbars=yes,toolbar=yes,location=yes,menubar=false')">API Documentation</a>
                    </td>
                </tr>
			</TABLE>
		    <div id="SMTP_Login_Info_Area">
			<H3 class="CommonSubTitle">
				<cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_SubTitle_SMTP"></cp:resourcecontrol></H3>
			<TABLE cellSpacing="0" cellPadding="0" border="0" width="100%">
				<TR>
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_UsingSsl" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_UsingSsl_Descr" />
					</TD>
					<TD class="CommonFormField">
						<cp:yesnoradiobuttonlist id="SmtpServerUsingSsl" runat="server" repeatcolumns="2"></cp:yesnoradiobuttonlist></TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_UsingNtlm" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_UsingNtlm_Descr" /></TD>
					<TD class="CommonFormField">
						<cp:yesnoradiobuttonlist id="SmtpServerUsingNtlm" runat="server" repeatcolumns="2"></cp:yesnoradiobuttonlist></TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_NeedsLogin" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_NeedsLogin_Descr" />
					</TD>
					<TD class="CommonFormField">
						<cp:yesnoradiobuttonlist id="SmtpServerRequiredLogin" runat="server" repeatcolumns="2"></cp:yesnoradiobuttonlist></TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_UserName" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_UserName_Descr" />
					</TD>
					<TD class="CommonFormField">
						<asp:textbox id="SmtpServerUserName" runat="server" maxlength="64"></asp:textbox>
						<asp:requiredfieldvalidator id="SmtpServerUserNameValidator" runat="server" controltovalidate="SmtpServerUserName"
							font-bold="True" errormessage="*"></asp:requiredfieldvalidator></TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_Password" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_Password_Descr" />
					</TD>
					<TD class="CommonFormField">
						<asp:textbox id="SmtpServerPassword" runat="server" maxlength="64" TextMode="Password" AutoComplete="Off"></asp:textbox>
						<asp:requiredfieldvalidator id="SmtpServerPasswordValidator" runat="server" controltovalidate="SmtpServerPassword"
							font-bold="True" errormessage="*"></asp:requiredfieldvalidator></TD>
				</TR>
				<TR>
					<TD class="CommonFormFieldName">
						<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_PortNumber" /></strong><br />
						<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_PortNumber_Descr" />
					</TD>
					<TD class="CommonFormField">
						<asp:textbox id="SmtpPortNumber" runat="server" maxlength="10"></asp:textbox></TD>
				</TR>
			</TABLE>
			</div>
			
			<asp:Panel ID="MailGatewayOptions" runat="server">
				<H3 class="CommonSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_SubTitle_MailGatewayGeneral" /></H3>
				<TABLE cellSpacing="0" cellPadding="0" border="0" width="100%">
					<TR>
						<TD class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_EnableMG" ResourceFile="MGResources.xml" /></strong><br />
							<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_EnableMG_Descr" ResourceFile="MGResources.xml" />
						</TD>
						<TD class="CommonFormField">
							<cp:yesnoradiobuttonlist id="EnableMailGateway" runat="server" repeatcolumns="2" onclick="DisableFields();"></cp:yesnoradiobuttonlist></TD>
					</TR>
					<TR>
						<TD class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_MG_MaxAttachmentBytes" ResourceFile="MGResources.xml" /></strong><br />
							<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_MG_MaxAttachmentBytes_Descr" ResourceFile="MGResources.xml" />
						</TD>
						<TD class="CommonFormField">
							<asp:textbox id="MaxAttachmentBytes" runat="server" maxlength="256" AutoComplete="Off"></asp:textbox>
							<asp:requiredfieldvalidator id="MaxAttachmentBytesValidator" runat="server" controltovalidate="MaxAttachmentBytes"
							font-bold="True" errormessage="*"></asp:requiredfieldvalidator>
						</TD>
					</TR>
					<TR>
					<TR>
						<TD class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_MG_RemoteAccessCode" ResourceFile="MGResources.xml" /></strong><br />
							<cp:ResourceControl runat="Server" resourcename="CP_Settings_Email_MG_RemoteAccessCode_Descr" ResourceFile="MGResources.xml" />
						</TD>
						<TD class="CommonFormField">
							<asp:textbox id="MGSecurityCode" runat="server" maxlength="256" TextMode="Password" AutoComplete="Off"></asp:textbox></TD>
					</TR>
					<tr id="FromAddressArea" runat="server">
						<td class="CommonFormFieldName">
							<strong><CP:ResourceControl runat="server" ResourceName="CP_Settings_SetupFromAddressType" /></strong><br />
							<CP:ResourceControl runat="server" ResourceName="CP_Settings_SetupFromAddressTypeDesc" /></td>
						<td class="CommonFormField">
							<asp:DropDownList ID="FromAddressType" runat="server">
							</asp:DropDownList>
						</td>
					</tr>
                    <tr>
                        <td class="CommonFormFieldName">
                            <strong><CP:ResourceControl runat="server" ResourceName="CP_Settings_MailGatewayLogMessageHeaders" /></strong><br />
							<CP:ResourceControl runat="server" ResourceName="CP_Settings_MailGatewayLogMessageHeaders_Desc" /></td>
                        </td>
                        <td class="CommonFormField">
                            <cp:yesnoradiobuttonlist runat="server" repeatcolumns="2" ID="MailGatewayLogMessageHeaders" />
                        </td>
                    </tr>
				</TABLE>
				<H3 class="CommonSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Settings_Email_MG_Accounts" ResourceFile="MGResources.xml" /></H3>
				<MG:Accounts id="Accounts" runat="server" />
			</asp:Panel>
        </Content>
    </TWC:TabbedPane>
    </TWC:TabbedPanes>
        
    <p class="PanelSaveButton">
        <cp:resourcebutton id="SaveButton" runat="server" resourcename="Save" />
    </p>
    </div>
    
    <script type="text/javascript">
        // <![CDATA[
        function DisableFields()
        {
            var enableMailGateway = document.getElementsByName('<%=EnableMailGateway.ClientID.Replace("_", "$") %>');

            if(enableMailGateway.length > 0)
            {
                var yesButton = enableMailGateway[0];
                if(yesButton.checked)
                {
                    HideOrShowControl(document.getElementById('<%=MGSecurityCode.ClientID %>'), true);
                }
                else
                {
                    HideOrShowControl(document.getElementById('<%=MGSecurityCode.ClientID %>'), false);
                }
            }
        }
        
        function HideOrShowControl(control, visible)
        {
            if (control != null) {
                if (visible)
                    control.disabled = false;
                else
                    control.disabled = true;
            }
        }
        
        function EnableForSubmit()
        {
            HideOrShowControl(document.getElementById('<%=MGSecurityCode.ClientID %>'), true);
        }

        DisableFields();
        // ]]> 
    </script>
</asp:Content>