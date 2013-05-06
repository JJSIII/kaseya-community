<%@ Page language="c#" Codebehind="PostOptions.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.PostOptionsPage" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol runat="server" resourcename="CP_Blogs_PostOptions_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="PostOptions" runat="server" id="SelectedNavigation1" />
	
	<DIV class="CommonDescription">
		<cp:resourcecontrol runat="server" resourcename="CP_Blogs_PostOptions_SubTitle" />
	</DIV>
	
    <cp:configokstatusmessage id="Status" runat="server" visible="false" />            
        
    <TWC:TabbedPanes runat="server"
    PanesCssClass="CommonPane"
    TabSetCssClass="CommonPaneTabSet"
    TabCssClasses="CommonPaneTab"
    TabSelectedCssClasses="CommonPaneTabSelected"
    TabHoverCssClasses="CommonPaneTabHover">
    <TWC:TabbedPane runat="server">
        <Tab><CP:ResourceControl runat="server" ResourceName="CP_Blogs_PostOptions_FeedbackTabTitle" /></Tab>
        <Content>
            
            <div class="CommonFormDescription">
	            <cp:resourcecontrol runat="server" resourcename="CP_Blogs_PostOptions_FeedbackDescription" />
            </div>
            
            <table width="100%">
                <tr>
                    <td colspan="2">
                        <div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_Reader_Feedback" /></div>
                    </td>
                </tr>
                
                    <td class="CommonFormFieldName">
		                    <CP:FormLabel runat="Server" ControlToLabel="ynEnableReplies" ResourceName="CP_Blogs_DefaultPostSettings_AllowReplies" />
                    </td>
                    
                    <td class="CommonFormField">
		                    <cp:YesNoRadioButtonList id="ynEnableReplies" runat="server" RepeatColumns="2" />
                    </td>
                </tr>

                <tr>
                    <td class="CommonFormFieldName">
		                    <CP:FormLabel runat="Server" ControlToLabel="ynEnableRatings" ResourceName="CP_Blogs_DefaultPostSettings_EnableRatings" />
                    </td>
                    
                    <td class="CommonFormField">
		                    <cp:YesNoRadioButtonList id="ynEnableRatings" runat="server" RepeatColumns="2" />
                    </td>
                </tr>

                <tr>
                    <td class="CommonFormFieldName">
		                    <CP:FormLabel runat="Server" ControlToLabel="ynEnableRssCommentPosting" ResourceName="CP_Blogs_SyndicationOptions_EnableRssCommentPosting" />
                    </td>
                    
                    <td class="CommonFormField">
		                    <cp:YesNoRadioButtonList id="ynEnableRssCommentPosting" runat="server" RepeatColumns="2" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_Reader_Trackbacks" /></div>
                    </td>
                </tr>

                <tr>
                    <td class="CommonFormFieldName">
			                <CP:FormLabel runat="Server" ControlToLabel="ynEnableTrackbacks" ResourceName="CP_Blogs_DefaultPostSettings_EnableTrackBacks" />
                    </td>
                    
                    <td class="CommonFormField">
		                    <cp:YesNoRadioButtonList id="ynEnableTrackbacks" runat="server" RepeatColumns="2" />
                    </td>
                </tr>

            </table>	           
		    <!--
	        <div class="OptionsFieldName">
		        <CP:FormLabel runat="Server" ControlToLabel="ModerationDDL" ResourceName="CP_Blogs_DefaultPostSettings_ModerateComments" />
	        </div>
	        <div class="CommonBottomFormField">
		        <cp:CommentModerationDropDownList runat="Server" id="ModerationDDL" />
	        </div>
	        -->
        </Content>
    </TWC:TabbedPane>
    
    <TWC:TabbedPane runat="server">
        <Tab><CP:ResourceControl runat="server" ResourceName="CP_Blogs_PostOptions_DisplayTab" /></Tab>
        <Content>
            <div class="CommonFormDescription">
	            <cp:resourcecontrol runat="server" resourcename="CP_Blogs_PostOptions_DisplayDescription" />
            </div>

            <table width="100%">
                <tr>
                    <td class="CommonFormFieldName">
			                <CP:FormLabel runat="Server" ControlToLabel="ynCommunity" ResourceName="CP_Blogs_DefaultPostSettings_CommunityParticipation" />
                    </td>
                    
                    <td class="CommonFormField">
			                <cp:YesNoRadioButtonList id="ynCommunity" runat="server" RepeatColumns="2" />
                    </td>
                </tr>
                
                <tr>
                    <td class="CommonFormFieldName">
			                <CP:FormLabel ID="FormLabel1" runat="Server" ControlToLabel="ynAggregatePost" ResourceName="CP_Blogs_DefaultPostSettings_AggregatePost" />
		            </td>
        			
		            <td class="CommonFormField">
			                <cp:YesNoRadioButtonList id="ynAggregatePost" runat="server" RepeatColumns="2" />
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
			                <CP:FormLabel runat="Server" ControlToLabel="ynSyndicateExcerpt" ResourceName="CP_Blogs_DefaultPostSettings_SyndicateExcerpt" />
                    </td>
                    
                    <td class="CommonFormField">
			                <cp:YesNoRadioButtonList id="ynSyndicateExcerpt" runat="server" RepeatColumns="2" />
                    </td>
                </tr>

                <tr>
                    <td class="CommonFormFieldName">
			                <CP:FormLabel runat="Server" ControlToLabel="ynAutoName" ResourceName="CP_Blogs_DefaultPostSettings_AutoName" />
                    </td>
                    
                    <td class="CommonFormField">
			                <cp:YesNoRadioButtonList id="ynAutoName" runat="server" RepeatColumns="2" />
                    </td>
                </tr>
            </table>
		    
		   
        </Content>
    </TWC:TabbedPane>
	
	</TWC:TabbedPanes>

	<div class="PanelSaveButton">
		<cp:ResourceButton id="SaveButton" runat="Server" ResourceName="Save" />
	</div>
</asp:Content>