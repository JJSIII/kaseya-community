<%@ Page language="c#" Codebehind="AccountSettings.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.AccountSettings" MasterPageFile="~/ControlPanel/Masters/MembershipAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="AccountSettings" />
	<TEControl:PlaceHolder runat="server">
	    <DisplayConditions><TEControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Success" Operator="EqualTo" ComparisonValue="true" /></DisplayConditions>
	    <ContentTemplate>
	        <CP:ResourceControl runat="server" Tag="Div" CssClass="CommonMessageSuccess" ResourceName="CP_Membership_Cache_Warning">
	            <Parameter1Template><TEControl:SiteSettingsData runat="server" Property="SiteSettingsCacheWindowInMinutes" /></Parameter1Template>
	        </CP:ResourceControl>
	    </ContentTemplate>
	</TEControl:PlaceHolder>
	<TEControl:PlaceHolder runat="server">
	    <DisplayConditions><TEControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="Success" Operator="EqualTo" ComparisonValue="false" /></DisplayConditions>
	    <ContentTemplate>
	        <CP:ResourceControl runat="server" Tag="Div" CssClass="CommonMessageSuccess" ResourceName="Admin_SiteSettings_StatusFailedVersionCheckWithUrlExpectedFormatting">
	            <Parameter1Template><TEControl:SiteUrl runat="server" UrlName="membership_ControlPanel_AccountSettings" RenderRawUrl="true" /></Parameter1Template>
	        </CP:ResourceControl>
	    </ContentTemplate>
	</TEControl:PlaceHolder>
	
	<TWC:TabbedPanes runat="server" ID="Tabs"
	    PanesCssClass="CommonPane"
        TabSetCssClass="CommonPaneTabSet"
        TabCssClasses="CommonPaneTab"
        TabSelectedCssClasses="CommonPaneTabSelected"
        TabHoverCssClasses="CommonPaneTabHover">
		
		<TWC:TabbedPane runat="server">
		<Tab><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Registration_Title" /></Tab>
		<Content>
		    <TABLE cellSpacing="0" cellPadding="3" border="0">
			    <TR>
				    <TD class="CommonFormFieldName">
					    <strong><cp:ResourceLabel runat="server" NAME="Resourcelabel7" ResourceName="CP_Membership_Settings_AllowLogin" /></strong><br />
					    <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_AllowLogin_Descr" />
					</TD>
				    <TD class="CommonFormField">
					    <cp:YesNoRadioButtonList id="optAllowLogin" runat="server" RepeatColumns="2" ></cp:YesNoRadioButtonList></TD>
			    </TR>
			    <TR>
				    <TD class="CommonFormFieldName">
					    <strong><cp:ResourceLabel runat="server" NAME="Resourcelabel9" ResourceName="CP_Membership_Settings_AllowNew" /></strong><br />
					    <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_AllowNew_Descr" />
					</TD>
				    <TD class="CommonFormField">
					    <cp:YesNoRadioButtonList id="optAllowNewUserRegistration" runat="server" RepeatColumns="2" ></cp:YesNoRadioButtonList></TD>
			    </TR>
			    <TR>
				    <TD class="CommonFormFieldName">
					    <strong><cp:ResourceLabel  runat="server" ResourceName="CP_Membership_Settings_ShowContactCheckboxes" /></strong><br />
					    <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_ShowContactCheckboxes_Descr" /></TD>
				    <TD class="CommonFormField">
					    <cp:YesNoRadioButtonList id="optShowContactCheckboxes" runat="server" RepeatColumns="2" ></cp:YesNoRadioButtonList></TD>
			    </TR>
			    <TR>
				    <TD class="CommonFormFieldName">
					    <strong><cp:ResourceLabel runat="server" ResourceName="CP_Membership_Settings_UserNameRegEx" /></strong><br />
					    <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_UserNameRegEx_Descr" /></TD>
				    <TD class="CommonFormField" noWrap>
					    <asp:TextBox id="txtUserNameRegEx" runat="server" ></asp:TextBox>
					    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserNameRegEx"
						    Font-Bold="True" ErrorMessage="*"></asp:RequiredFieldValidator></TD>
			    </TR>
			    <TR>
				    <TD class="CommonFormFieldName">
					    <strong><cp:ResourceLabel runat="server" NAME="Resourcelabel13" ResourceName="CP_Membership_Settings_UserNameMinLength" /></strong><br />
					    <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_UserNameMinLength_Descr" /></TD>
				    <TD class="CommonFormField" noWrap>
					    <asp:TextBox id="txtUsernameMinLength" runat="server"  MaxLength="3"></asp:TextBox>
					    <asp:RequiredFieldValidator id="UsernameMinLengthValidator" runat="server" ControlToValidate="txtUsernameMinLength"
						    Font-Bold="True" ErrorMessage="*"></asp:RequiredFieldValidator>
						<asp:CompareValidator runat="server" ControlToValidate="txtUsernameMinLength"  ErrorMessage="*"
							Display="Dynamic" ValueToCompare="1" Type="Integer" Operator="GreaterThanEqual" />
				    </TD>
			    </TR>
			    <TR>
				    <TD class="CommonFormFieldName">
					    <strong><cp:ResourceLabel runat="server" NAME="Resourcelabel14" ResourceName="CP_Membership_Settings_UserNameMaxLength" /></strong><br />
					    <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_UserNameMaxLength_Descr" /></TD>
				    <TD class="CommonFormField">
					    <asp:TextBox id="txtUsernameMaxLength" runat="server"  MaxLength="3"></asp:TextBox>
					    <asp:RequiredFieldValidator id="UsernameMaxLengthValidator" runat="server" ControlToValidate="txtUsernameMaxLength"
						    Font-Bold="True" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" ControlToValidate="txtUsernameMaxLength"  ErrorMessage="*"
                            Display="Dynamic" ValueToCompare="64" Type="Integer" Operator="LessThanEqual" />
				    </TD>
			    </TR>
			    <tr>
			        <td class="CommonFormFieldName">
					    <strong><cp:ResourceLabel runat="server" NAME="Resourcelabel15" ResourceName="CP_Membership_Settings_EmailRegex" /></strong><br />
					    <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_EmailRegex_Descr" /></TD>
                    </td>
                    <td class="CommonFormField">
					    <asp:TextBox id="txtEmailRegex" runat="server" ></asp:TextBox>
					    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmailRegex" Font-Bold="True" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
			    </tr>
			    <TR>
				    <TD colspan="2">
				        <div class="CommonFormFieldName">
					        <strong><cp:ResourceLabel runat="server" NAME="Resourcelabel17" ResourceName="CP_Membership_Settings_AccountActivate" /></strong><br />
					        <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_AccountActivate_Descr" />
					    </div>
				        <div class="CommonFormField">
					        <cp:AccountActivationRadioButtonList id="optAccountActivation" runat="server" RepeatColumns="2" ></cp:AccountActivationRadioButtonList></TD>
					    </div>
                    </td>
			    </TR>
			    <TR>
				    <TD class="CommonFormFieldName">
					    <strong><cp:ResourceLabel runat="server" NAME="Resourcelabel19" ResourceName="CP_Membership_Settings_PasswordRecovery" /></strong><br />
					    <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_PasswordRecovery_Descr" /></TD>
				    <TD class="CommonFormField">
					    <cp:PasswordRecoveryRadioButtonList id="optPasswordRecovery" runat="server" RepeatColumns="3"></cp:PasswordRecoveryRadioButtonList></TD>
			    </TR>
			    <TR>
				    <TD class="CommonFormFieldName">
					    <strong><cp:ResourceLabel runat="server" ResourceName="CP_Membership_Settings_PasswordRegEx" /></strong><br />
					    <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_PasswordRegEx_Descr" /></TD>
				    <TD class="CommonFormField" noWrap>
					    <asp:TextBox id="txtPasswordRegEx" runat="server" ></asp:TextBox></TD>
			    </TR>
		    </TABLE>
		</Content>
		</TWC:TabbedPane>
		
		<TWC:TabbedPane runat="server">
		    <Tab><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Profile_Title" /></Tab>
		    <Content>
		          <TABLE cellSpacing="0" cellPadding="0" border="0">
			        <TR>
				        <TD class="CommonFormFieldName">
					        <strong><cp:ResourceLabel runat="server" NAME="Resourcelabel28" ResourceName="CP_Membership_Settings_AllowSignatures" /></strong><br />
					        <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_AllowSignatures_Descr" />
				        </TD>
				        <TD class="CommonFormField">
					        <cp:YesNoRadioButtonList id="optAllowSignatures" runat="server" RepeatColumns="2" ></cp:YesNoRadioButtonList>
				        </TD>
			        </TR>
			        <TR>
				        <TD class="CommonFormFieldName">
					        <strong><cp:ResourceLabel runat="server" NAME="Resourcelabel30" ResourceName="CP_Membership_Settings_EnableSignatures" /></strong><br />
					        <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_EnableSignatures_Descr" />
				        </TD>
				        <TD class="CommonFormField">
					        <cp:YesNoRadioButtonList id="optEnableSignatures" runat="server" RepeatColumns="2" ></cp:YesNoRadioButtonList>
				        </TD>
			        </TR>
			        <TR>
				        <TD class="CommonFormFieldName">
					        <strong><cp:ResourceLabel runat="server" NAME="Resourcelabel32" ResourceName="CP_Membership_Settings_SignatureMaxLength" /></strong><br />
					        <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_SignatureMaxLength_Descr" />
				        </TD>
				        <TD class="CommonFormField">
					        <asp:TextBox id="txtSignatureMaxLength" runat="server"  MaxLength="4"></asp:TextBox>
					        <asp:RegularExpressionValidator id="txtSignatureMaxLengthValidator" runat="server" ErrorMessage="*"
						        ValidationExpression="[0-9]*" ControlToValidate="txtSignatureMaxLength"></asp:RegularExpressionValidator>
					        <asp:RequiredFieldValidator id="txtSignatureMaxLengthValidator2" runat="server" ErrorMessage="*" 
						        ControlToValidate="txtSignatureMaxLength"></asp:RequiredFieldValidator>
				        </TD>
			        </TR>
			        <TR>
				        <TD class="CommonFormFieldName">
					        <strong><cp:ResourceLabel runat="server" ResourceName="CP_Membership_Settings_AllowGender" /></strong><br />
					        <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_AllowGender_Descr" />
				        </TD>
				        <TD class="CommonFormField">
					        <cp:YesNoRadioButtonList id="optAllowGender" runat="server" RepeatColumns="2" ></cp:YesNoRadioButtonList>
				        </TD>
			        </TR>
			        <TR>
				        <TD class="CommonFormFieldName">
					        <strong><cp:ResourceLabel runat="server" NAME="Resourcelabel35" ResourceName="CP_Membership_Settings_RequireAuthenticationForProfileViewing" /></strong><br />
					        <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_RequireAuthenticationForProfileViewing_Descr" />
				        </TD>
				        <TD class="CommonFormField">
					        <cp:YesNoRadioButtonList id="optRequireAuthenticationForProfileViewing" runat="server" RepeatColumns="2" ></cp:YesNoRadioButtonList>
				        </TD>
			        </TR>
			        <TR>
				        <TD class="CommonFormFieldName">
				            <strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_General_Menu_DisplayNames" /></strong>
				            <br />
					        <cp:resourcecontrol runat="Server" resourcename="CP_Settings_General_Menu_DisplayNames_Descr" />
				        </TD>
				        <TD class="CommonFormField">
					        <cp:yesnoradiobuttonlist id="DisplayNames" runat="server" repeatcolumns="2" />
					    </TD>
			        </TR>
			        <TR>
				        <TD class="CommonFormFieldName">
					        <strong><cp:ResourceLabel runat="server" ResourceName="CP_Membership_Settings_Profile_StatusMessageMaxLength" /></strong><br />
					        <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_Profile_StatusMessageMaxLength_Desc" />
				        </TD>
				        <TD class="CommonFormField">
					        <asp:TextBox id="txtStatusMessageMaxLength" runat="server" MaxLength="4"></asp:TextBox>
					        <asp:RegularExpressionValidator id="txtStatusMessageMaxLengthValidator" runat="server" ErrorMessage="*"
						        ValidationExpression="[0-9]*" ControlToValidate="txtStatusMessageMaxLength"></asp:RegularExpressionValidator>
					        <asp:RequiredFieldValidator id="txtStatusMessageMaxLengthValidator2" runat="server" ErrorMessage="*" 
						        ControlToValidate="txtStatusMessageMaxLength"></asp:RequiredFieldValidator>
				        </TD>
			        </TR>
		        </TABLE>
		    </Content>
		</TWC:TabbedPane>
		
		<TWC:TabbedPane runat="server">
		    <Tab ID="Avatars"><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Avatar_Title" /></Tab>
		    <Content>
		        <script type="text/javascript">
                // <!--
                function ValidateDelete()
                {
                    return (window.confirm('<CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_Avatar_SelectableAvatar_DeleteConfirmation" />'));
                }
                // -->
                </script>
		    
		        <table cellspacing="0" cellpadding="3" border="0">
		            <tr>
			            <td class="CommonFormFieldName">
				            <strong><cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_AvatarSize" /></strong><br />
				            <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_Avatar_AvatarSize_Help" />
			            </td>
			            <td class="CommonFormField">
			                <asp:textbox id="txtAvatarWidth" columns="3" maxlength="3" runat="server" />
			                x
				            <asp:textbox id="txtAvatarHeight" columns="3" maxlength="3" runat="server" />
				            <asp:requiredfieldvalidator id="AvatarHeightValidator" runat="server" controltovalidate="txtAvatarHeight" errormessage="*" />
				            <asp:regularexpressionvalidator id="AvatarHeightRegExValidator" runat="server" controltovalidate="txtAvatarHeight" validationexpression="[0-9]*" errormessage="*" />
				            <asp:requiredfieldvalidator id="AvatarWidthValidator" runat="server" controltovalidate="txtAvatarWidth" errormessage="*" />
				            <asp:regularexpressionvalidator id="AvatarWidthRegExValidator" runat="server" controltovalidate="txtAvatarWidth" validationexpression="[0-9]*" errormessage="*" />
			            </td>
		            </tr>
		            <tr>
			            <td class="CommonFormFieldName">
				            <strong><cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_EnableUploadedAvatars" /></strong><br />
	                        <cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_EnableUploadedAvatars_Help" />
			            </td>
			            <td class="CommonFormField">
				            <cp:yesnoradiobuttonlist id="optEnableUploadedAvatars" runat="server" repeatcolumns="2"  />
			            </td>
		            </tr>
		            <tr>
			            <td class="CommonFormFieldName">
				            <strong><cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_EnableRemoteAvatar" /></strong><br />
				            <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_Avatar_EnableRemoteAvatar_Help" />
			            </td>
			            <td class="CommonFormField">
				            <cp:yesnoradiobuttonlist id="optEnableRemoteAvatars" runat="server" repeatcolumns="2"  />
			            </td>
		            </tr>
		            <tr>
			            <td class="CommonFormFieldName">
				            <strong><cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_EnableSelectableAvatars" /></strong><br />
	                        <cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_EnableSelectableAvatars_Help" />
			            </td>
			            <td class="CommonFormField">
				            <cp:yesnoradiobuttonlist id="optEnableSelectableAvatars" runat="server" repeatcolumns="2"  />
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
	                            <a href="javascript:Telligent_Modal.Open('ChangeDefaultUserAvatar.aspx', 560, 400, refresh);"><%= Telligent.Evolution.Components.ResourceManager.GetString("CP_UserEdit_Avatar_Change", "ControlPanelResources.xml") %></a>
		                    </div>
		                </td>
		            </tr>
		            <tr>
		                <td colspan="2">
		                    <div class="CommonFormFieldName">
		                        <strong><cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_SelectableAvatars" /></strong><br />
	                            <cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_Avatar_SelectableAvatars_Help" />
		                    </div>
		                    <div class="CommonFormField">
		                        <asp:Repeater runat="server" ID="selectableAvatars">
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
		                        <asp:FileUpload runat="server" id="selectablAvatarFileUpload" /> &nbsp; <CP:ResourceButton id="uploadButton" ResourceName="CP_Settings_FileStorage_UploadButton" Runat="server" /> 
		                    </div>
		                </td>
		            </tr>
		            
	            </table>
		    </Content>
		</TWC:TabbedPane>
		
		<TWC:TabbedPane runat="server">
		    <Tab><CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_ExTab" /></Tab>
		    <Content>
		        <table cellspacing="0" cellpadding="3" border="0">
		            <tr>
		                <td class="CommonFormFieldName">
			                <strong><cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_DefaultFriends_Title" /></strong><br />
			                <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_DefaultFriends_Desc" />
		                </td>
		                <td class="CommonFormField">
		                    <TEControl:UserLookUpTextBox runat="server" ID="txtDefaultFriends" Width="275px" ValueDelimiter="," />
		                </td>
	                </tr>
	                <tr>
					    <td class="CommonFormFieldName">
						    <strong><cp:ResourceLabel runat="server" ResourceName="CP_Membership_Settings_NewUserModLevel" /></strong><br />
						    <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_NewUserModLevel_Descr" />
						</td>
					    <td class="CommonFormField">
						    <cp:ModerationLevelDropDownList id="ddlNewUserModerationLevel" runat="server" />
						</td>
				    </tr>
	                <tr>
			            <td class="CommonFormFieldName">
				            <strong><CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_DeliverMessage" /></strong><br />
				            <CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_DeliverMessage_Desc" />
			            </td>
			            <td class="CommonFormField">
				            <cp:yesnoradiobuttonlist id="enableWelcomeMessage" runat="server" repeatcolumns="2"  />
			            </td>
		            </tr>
		            <tr>
		                <td class="CommonFormFieldName">
			                <strong><CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_MessageFrom" /></strong><br />
			                <CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_MessageFrom_Desc" />
		                </td>
		                <td class="CommonFormField">
		                    <TEControl:UserLookUpTextBox runat="server" LookUpType="AllUsers" ID="welcomeMessageAuthor" Width="275px" MaximumUsers="1" />
		                </td>
	                </tr>
	                <tr>
		                <td class="CommonFormFieldName">
			                <strong><CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_MessageSubject" /></strong><br />
			                <CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_MessageSubject_Desc" />
		                </td>
		                <td class="CommonFormField">
		                    <asp:TextBox runat="server" ID="welcomeMessageSubject" Width="275px" />
		                </td>
	                </tr>
	                <tr>
		                <td class="CommonFormFieldName">
			                <strong><CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_MessageBody" /></strong><br />
			                <CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_MessageBody_Desc" />
		                </td>
		                <td class="CommonFormField">
		                    <TEControl:Editor runat="server" ID="welcomeMessageBody" />
		                </td>
	                </tr>
	            </table>
		    </Content>
		</TWC:TabbedPane>
		
		<TWC:TabbedPane runat="server">
		    <Tab><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Friends_Title" /></Tab>
		    <Content>
		        <table cellspacing="0" cellpadding="3" border="0">
		            <tr>
			            <td class="CommonFormFieldName">
				            <strong><cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_RequireMessage" /></strong><br />
				            <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_RequireMessage_Desc" />
			            </td>
			            <td class="CommonFormField">
			                <CP:FriendshipRequireRequestMessageDropDownList id="reqRequestMessageList" runat="server" />
			            </td>
		            </tr>
		            <tr>
			            <td class="CommonFormFieldName">
				            <strong><cp:resourcelabel runat="server" resourcename="CP_Membership_Settings_DefaultMessage" /></strong><br />
				            <cp:ResourceControl runat="Server" resourcename="CP_Membership_Settings_DefaultMessage_Desc" />
			            </td>
			            <td class="CommonFormField">
				            <TEControl:Editor runat="server" ID="txtDefaultFriendRequestMessage" />
			            </td>
		            </tr>
		        </table>
		    </Content>
		</TWC:TabbedPane>
		</TWC:TabbedPanes>
	<p class="PanelSaveButton DetailsFixedWidth">
			<cp:ResourceLinkButton id="btnSave" runat="server" resourcename="Save" cssclass="CommonTextButton" />
    </p>
</asp:Content>