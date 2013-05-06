<%@ Page language="c#" Codebehind="AdvancedConfiguration.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.AdvancedConfigurationPage" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
	<CP:ControlPanelSelectedNavigation SelectedNavItem="AdvancedConfiguration" runat="server" id="SelectedNavigation1" />
	<DIV class="CommonDescription">
		<cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_SubTitle" />
	</DIV>
	<script type="text/javascript">
	function toggleITunesOptions()
	{
		var enableITunes = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "EnableITunes").ClientID %>');
		var itunesOptions = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "ITunesOptions").ClientID %>');

		var isDisabled = !getRadioSelectedValue(enableITunes);

		if (isDisabled)
		{
			itunesOptions.style.visibility = 'hidden';
		}
		else
		{
			itunesOptions.style.visibility = 'visible';
		}
	}

	function getRadioSelectedValue(control)
	{
		if (control.getElementsByTagName) {
			var children = control.getElementsByTagName('INPUT');
			for (var i = 0; i < children.length; i++) {
				if (children[i].type == 'radio' && children[i].checked)
					return children[i].value == 'True';
			}
		}
	}
	</script>
	
    <cp:configokstatusmessage id="Status" runat="server" visible="false" />
    <TWC:TabbedPanes runat="server"
    PanesCssClass="CommonPane"
    TabSetCssClass="CommonPaneTabSet"
    TabCssClasses="CommonPaneTab"
    TabSelectedCssClasses="CommonPaneTabSelected"
    TabHoverCssClasses="CommonPaneTabHover">
    
    <TWC:TabbedPane runat="server">
        <Tab><CP:ResourceControl runat="server" ResourceName="CP_Blogs_AdvancedConfiguration_FeedbackTabTitle" /></Tab>
        <Content>
        
        <div class="CommonFormDescription">
            <cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_FeedbackDescription" />
        </div>

        <table>
			<tr>
				<td class="CommonFormFieldName">
						<CP:FormLabel ID="FormLabel2" runat="Server" ControlToLabel="ModerationDDLOverride" ResourceName="CP_Blogs_AdvancedConfiguration_ModerateComments" />
				</td>
				<td class="CommonFormField">
						<cp:CommentModerationDropDownList runat="Server" id="ModerationDDLOverride" AllowIgnore="true"/>
				</td>
			</tr>
            <tr>
                <td class="CommonFormFieldName">
		                <CP:FormLabel runat="Server" ControlToLabel="ynEnableRepliesOverride" ResourceName="CP_Blogs_AdvancedConfiguration_AllowReplies" />
                </td>
                
                <td class="CommonFormField">
		                <cp:YesNoRadioButtonList id="ynEnableRepliesOverride" runat="server" RepeatColumns="2" />
                </td>
            </tr>

            <tr>
                <td class="CommonFormFieldName">
		                <CP:FormLabel runat="Server" ControlToLabel="ynEnableRatingsOverride" ResourceName="CP_Blogs_AdvancedConfiguration_EnableRatings" />
                </td>
                
                <td class="CommonFormField">
		                <cp:YesNoRadioButtonList id="ynEnableRatingsOverride" runat="server" RepeatColumns="2" />
                </td>
            </tr>

            <tr>
                <td class="CommonFormFieldName">
		                <CP:FormLabel runat="Server" ControlToLabel="ynEnableTrackbacksOverride" ResourceName="CP_Blogs_AdvancedConfiguration_EnableTrackBacks" />
                </td>
                
                <td class="CommonFormField">
		                <cp:YesNoRadioButtonList id="ynEnableTrackbacksOverride" runat="server" RepeatColumns="2" />
                </td>
            </tr>

            <tr>
                <td class="CommonFormFieldName">
	                    <CP:FormLabel runat="Server" ControlToLabel="ExpiredDays" ResourceName="CP_Blogs_AdvancedConfiguration_ExpiredDays" />
                </td>
                
                <td class="CommonFormField">
	                    <asp:DropDownList id="ExpiredDays" Runat="server" />
                </td>
            </tr>
        </table>
	
	   
	    
	    </Content>
	</TWC:TabbedPane>
	
	<TWC:TabbedPane runat="server">
	    <Tab><CP:ResourceControl runat="server" ResourceName="CP_Blogs_AdvancedConfiguration_CommentSpamTabTitle" /></Tab>
	    <Content>
	        <div class="CommonFormDescription">
                <cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_CommentSpamDescription" />
            </div>
	        
            <table>
                <tr>
                    <td class="CommonFormFieldName">
		                    <cp:formlabel runat="Server" resourcename="CP_Blogs_RemoteOptions_AutoModerate" controltolabel="SpamAutoModerate" />
                    </td>
                    
                    <td class="CommonFormField">
		                    <asp:textbox id="SpamAutoModerate" runat="Server" width="50" MaxLength="10" /><asp:customvalidator id="sam_valide" controltovalidate="SpamAutoModerate" display="dynamic" errormessage="*" font-bold="True" onservervalidate="ServerValidation" runat="server"/>
                    </td>
                </tr>

                <tr>
                    <td class="CommonFormFieldName">
		                    <cp:formlabel runat="Server" resourcename="CP_Blogs_RemoteOptions_AutoDelete" controltolabel="SpamAutoDelete" />
                    </td>
                    
                    <td class="CommonFormField">
		                    <asp:textbox id="SpamAutoDelete" runat="Server" width="50" MaxLength="10"  /><asp:customvalidator id="sad_valide" controltovalidate="SpamAutoDelete" display="dynamic" errormessage="*" font-bold="True" onservervalidate="ServerValidation" runat="server"/>
                    </td>
                </tr>
            </table>
	        
	    
	    </Content>
	</TWC:TabbedPane>
	
	<TWC:TabbedPane runat="server">
	    <Tab><CP:ResourceControl runat="server" ResourceName="CP_Blogs_AdvancedConfiguration_RSSTabTitle" /></Tab>
	    <Content>
	        <div class="CommonFormDescription">
                <cp:resourcecontrol runat="server" resourcename="CP_Blogs_SyndicationOptions_SubTitle" />
            </div>            
            <table>
				<asp:PlaceHolder id="RssNotAllowedLicensingHolder" runat="Server">
					<tr>
						<td class="CommonFormFieldName">&nbsp;</td>
						<td class="CommonFormField"><cp:resourcecontrol id="RssNotAllowedLicensing" visible="false" runat="server" Tag="div" CssClass="CommonLicenseRestrictionMessage" resourcename="CP_Settings_RssNotAllowedLicensing" /></td>
					</tr>
				</asp:PlaceHolder>
                <tr>
                    <td class="CommonFormFieldName">
		                    <CP:FormLabel runat="Server" ControlToLabel="ynEnableRss" ResourceName="CP_Blogs_SyndicationOptions_EnableRss" />
                    </td>
                    
                    <td class="CommonFormField">
		                    <cp:YesNoRadioButtonList id="ynEnableRss" runat="server" RepeatColumns="2" />
                    </td>
                </tr>
                
                <tr>
                    <td class="CommonFormFieldName">
		                    <CP:FormLabel runat="Server" ControlToLabel="ynEnableAtom" ResourceName="CP_Blogs_SyndicationOptions_EnableAtom" />
                    </td>
                    
                    <td class="CommonFormField">
		                    <cp:YesNoRadioButtonList id="ynEnableAtom" runat="server" RepeatColumns="2" />
                    </td>
                </tr>

                <tr>
                    <td class="CommonFormFieldName">
		                    <CP:FormLabel runat="Server" ControlToLabel="ynEnableTagsRss" ResourceName="CP_Blogs_SyndicationOptions_EnableTagsRss" />
                    </td>
                    
                    <td class="CommonFormField">
		                    <cp:YesNoRadioButtonList id="ynEnableTagsRss" runat="server" RepeatColumns="2" />
                    </td>
                </tr>

                <tr>
                    <td class="CommonFormFieldName">
		                    <CP:FormLabel runat="Server" ControlToLabel="ynEnableRssCommentFeeds" ResourceName="CP_Blogs_SyndicationOptions_EnableRssCommentFeeds" />
                    </td>
                    
                    <td class="CommonFormField">
		                    <cp:YesNoRadioButtonList id="ynEnableRssCommentFeeds" runat="server" RepeatColumns="2" />
                    </td>
                </tr>
            </table>
	        
            

	    </Content>
	</TWC:TabbedPane>
	
	<TWC:TabbedPane runat="server">
	    <Tab><cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_Title" /></Tab>
	    <Content>
	        <div class="CommonFormDescription">
                <cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_Description" />
            </div>

			<table width="68%">
				<tr>
					<td class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_Enable" /></strong><br />
							<cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_Enable_Help" />
					</td>
					<td class="CommonFormField">
							<cp:YesNoRadioButtonList id="EnableITunes" runat="server" RepeatColumns="2" onclick="toggleITunesOptions()" />
					</td>
				</tr>
			</table>

            <table id="ITunesOptions" runat="server">
                <tr>
                    <td class="CommonFormFieldName">
		                    <strong><cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_Category" /></strong><br />
		                    <cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_Category_Help" />
                    </td>
                    <td class="CommonFormField">
		                    <asp:TextBox runat="server" id="ITunesCategory" Columns="60" />
                    </td>
                </tr>
                
                <tr>
                    <td class="CommonFormFieldName">
		                    <strong><cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_Image" /></strong><br />
		                    <cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_Image_Help" />
                    </td>
                    <td class="CommonFormField">
                            <script type="text/javascript">
                                function updateITunesImageUrl(url)
                                {
                                    if (url)
                                    {
                                        document.getElementById('<%= ITunesImageUrl.ClientID %>').value = url[1];
                                    }
                                }
                            </script>
                    
		                    <asp:TextBox runat="server" ID="ITunesImageUrl" Columns="44" /> <CP:Modal runat="server" ID="ITunesImageBrowser" Width="600" Height="400" ModalType="Button"  Callback="updateITunesImageUrl" />
                    </td>
                </tr>
                
                <tr>
                    <td class="CommonFormFieldName">
		                    <strong><cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_Explicit" /></strong><br />
		                     <cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_Explicit_Help" />
                    </td>
                    <td class="CommonFormField">
		                    <asp:DropDownList runat="server" ID="ITunesExplicit">

		                    </asp:DropDownList>
                    </td>
                </tr>
                
                <tr>
                    <td class="CommonFormFieldName">
		                    <strong><cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_Keywords" /></strong><br />
		                    <cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_Keywords_Help" />
                    </td>
                    <td class="CommonFormField">
		                    <asp:TextBox runat="server" ID="ITunesKeywords" Columns="60" />
                    </td>
                </tr>
                
                <tr>
                    <td class="CommonFormFieldName">
		                    <strong><cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_OwnerName" /></strong><br />
		                    <cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_OwnerName_Help" />
                    </td>
                    <td class="CommonFormField">
		                    <asp:TextBox runat="server" ID="ITunesOwnerName" Columns="60" />
                    </td>
                </tr>
                
                <tr>
                    <td class="CommonFormFieldName">
		                    <strong><cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_OwnerEmail" /></strong><br />
		                    <cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_OwnerEmail_Help" />
                    </td>
                    <td class="CommonFormField">
		                    <asp:TextBox runat="server" ID="ITunesOwnerEmail" Columns="60" />
                    </td>
                </tr>
                
                <tr>
                    <td class="CommonFormFieldName">
		                    <strong><cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_SubTitle" /></strong><br />
		                    <cp:resourcecontrol runat="server" resourcename="CP_Blogs_AdvancedConfiguration_ITunesOptions_SubTitle_Help" />
                    </td>
                    <td class="CommonFormField">
		                    <asp:TextBox runat="server" ID="ITunesSubTitle" Columns="60" />
                    </td>
                </tr>
            </table>

	    </Content>
	</TWC:TabbedPane>
	
	<TWC:TabbedPane runat="server">
	    <Tab><CP:ResourceControl runat="server" ResourceName="CP_Blogs_AdvancedConfiguration_FeedBurnerTabTitle" /></Tab>
	    <Content>	
	        <div class="CommonFormDescription">
	            <a href="http://feedburner.com/" target="_blank"><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_FeedBurner" /></a>&#153; 
	            <CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_FeedBurnerDesc" /> <a href="http://www.feedburner.com/fb/a/about"><CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_FeedBurnerReadMore" /></a>
            </div>
            
            <div class="CommonFormFieldName">
                <strong>1. <CP:ResourceControl ID="ResourceControl4" runat="server" ResourceName="CP_TelligentEvolutionRssUrl" /></strong><br />
                <CP:ResourceControl ID="ResourceControl5" runat="server" ResourceName="CP_UrlToRegisterWithFeedBurnerDesc" />
            </div>
            <div class="CommonFormField">
                <asp:TextBox id="PrivateRSS" runat="server" cssclass="ControlPanelTextInput" />
            </div>
				
		    <div class="CommonFormFieldName">
		        <strong>2. <CP:ResourceControl ID="ResourceControl6" runat="server" ResourceName="CP_FeedBurnerUrl" /></strong><br />
		        <CP:ResourceControl ID="ResourceControl7" runat="server" ResourceName="CP_UrlProviderByFeedBurner" />
		    </div>
		    <div class="CommonFormField">
			    <asp:TextBox id="ExternalSyndicationFeed" runat="server" cssclass="ControlPanelTextInput" /> <asp:RegularExpressionValidator runat="server" ControlToValidate="ExternalSyndicationFeed" Id="ExternalSyndicationFeedValidation" display="dynamic" errormessage="*" font-bold="True" />
		    </div>
	    </Content>
	</TWC:TabbedPane>
	
	<TWC:TabbedPane runat="server">
	    <Tab><CP:ResourceControl runat="server" ResourceName="CP_Blogs_AdvancedConfiguration_MiscTabTitle" /></Tab>
	    <Content>
            <table>

	        <asp:Panel runat="server" id="CrossPostingPanel">
            <tr>
                <td class="CommonFormFieldName">
    			    <cp:formlabel runat="Server" controltolabel="ynEnableCrossPostingDefault" resourcename="CP_Blogs_CreateEditBlogPost_EnableCrossPosting" />
                </td>
                <td class="CommonFormField">
    			    <cp:yesnoradiobuttonlist id="ynEnableCrossPostingDefault" runat="server" repeatcolumns="2" />
                </td>
            </tr>
            <tr>
				<td colspan="2">
					<div class="CommonFormField" style="float: right;">
						<cp:hyperlink id="NewButton" runat="Server" resourcename="CP_Blogs_RemoteOptions_NewSetting" cssclass="CommonTextButton" />
					</div>
					<div class="CommonFormFieldName">
    					<cp:resourcecontrol runat="server" resourcename="CP_Blogs_RemoteOptions_CrossPosting" />
					</div>
					<div style="clear:both;">
	                <asp:repeater id="SettingsList" runat="server">
	                <headertemplate>
		                <table class="DetailsFixedWidth" cellspacing="0" cellpadding="4" border="0" >
			                <tr>
				                <th><cp:resourcecontrol runat="Server" resourcename="CP_Blogs_RemoteOptions_Url" /></th>
				                <th><cp:resourcecontrol runat="Server" resourcename="CP_Blogs_RemoteOptions_AppKey" /></th>
				                <th><cp:resourcecontrol runat="Server" resourcename="CP_Blogs_RemoteOptions_Username" /></th>
			                </tr>
		                </headertemplate>
		                <itemtemplate>
			                <tr>
				                <td><asp:literal id="ID" runat="Server" visible="false" /><asp:literal id="Url" runat="Server" /></td>
				                <td><asp:literal id="AppKey" runat="Server" /></td>
				                <td><asp:literal id="Username" runat="Server" /></td>
				                <td><cp:hyperlink id="Edit" runat="Server" resourcename="Edit" /> | <cp:hyperlink id="Delete" runat="Server" resourcename="Delete" /></td>
			                </tr>
		                </itemtemplate>
		                <footertemplate>
		                </table>
	                    </footertemplate>
	                </asp:repeater>
					</div>
				</td>
            </tr>
	        </asp:Panel>

            <tr>
                <td colspan="2">
	                <div class="CommonFormFieldName">
		                <cp:formlabel runat="Server" resourcename="CP_Blogs_RemoteOptions_PingServices" controltolabel="PingServices" />
	                </div>
	                <div class="CommonFormField">
		                <asp:textbox id="PingServices" Rows="5" TextMode="Multiline" runat="Server" Columns="60" />
	                </div>
                </td>
            </tr>
            <tr>
                <td class="CommonFormFieldName" width="60%">
    		        <CP:FormLabel runat="Server" ControlToLabel="ynSyndicateExternalLinks" ResourceName="CP_Blogs_SyndicationOptions_SyndicateExternalLinks" /><br />
                    <cp:resourcecontrol runat="server" resourcename="CP_Blogs_SyndicationOptions_SyndicateExternalLinks_Help" />
                </td>
                <td class="CommonFormField">
                    <cp:YesNoRadioButtonList id="ynSyndicateExternalLinks" runat="server" RepeatColumns="2" />
                </td>
            </tr>
            </table>
	        
	    </Content>
	</TWC:TabbedPane>
	
	</TWC:TabbedPanes>

	<p class="PanelSaveButton">
		<cp:ResourceButton id="SaveButton" runat="Server" ResourceName="Save" />
	</p>
</asp:Content>