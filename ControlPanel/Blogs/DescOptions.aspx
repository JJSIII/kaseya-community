<%@ Page language="c#" Codebehind="DescOptions.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.DescriptiveOptionsPage" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol runat="server" resourcename="CP_Blogs_DescOptions_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="TitleDescriptionAndNews" runat="server" id="SelectedNavigation1" />
	<DIV class="CommonDescription">
		<cp:resourcecontrol ID="Resourcecontrol1" runat="server" resourcename="CP_Blogs_DescOptions_TitleDesc" />
	</DIV>
    <script type = "text/javascript">
    function toggleEmailFields()
    {
        var emailDropDown = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "NotificationType").ClientID %>');
        var enableContact = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "EnableContact").ClientID %>');
        var notifyAllOwners = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "ynNotifyAllOwners").ClientID %>');
        var moderationNotificationThreshold = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "ModerationNotificationThreshold").ClientID %>');
        var blockSpamFeedbackNotifications = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "BlockSpamFeedbackNotifications").ClientID %>');
        
        var isDisabled = emailDropDown.value == 0;
        
        enableContact.disabled = isDisabled;
        toggleChildInput(enableContact, isDisabled);
        notifyAllOwners.disabled = isDisabled;
        toggleChildInput(notifyAllOwners, isDisabled);
        blockSpamFeedbackNotifications.disabled = isDisabled;
        toggleChildInput(blockSpamFeedbackNotifications, isDisabled);
        moderationNotificationThreshold.disabled = isDisabled;
        
        var NotifyAllOwnersRow = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "NotifyAllOwnersRow").ClientID %>');
        var EnableContactRow = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "EnableContactRow").ClientID %>');
        var ContactAddressRow = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "ContactAddressRow").ClientID %>');
        var CommentNotificationsRow = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "CommentNotificationsRow").ClientID %>');
        var BlockSpamNotificationsRow = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "BlockSpamNotificationsRow").ClientID %>');
        var ModerationThresholdRow = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "ModerationThresholdRow").ClientID %>');
        
        
        if (isDisabled)
        {
            NotifyAllOwnersRow.style.visibility = 'hidden';
            EnableContactRow.style.visibility = 'hidden';
            ContactAddressRow.style.visibility = 'hidden';
            CommentNotificationsRow.style.visibility = 'hidden';
            BlockSpamNotificationsRow.style.visibility = 'hidden';
            ModerationThresholdRow.style.visibility = 'hidden';
        }
        else
        {
            NotifyAllOwnersRow.style.visibility = 'visible';
            EnableContactRow.style.visibility = 'visible';
            ContactAddressRow.style.visibility = 'visible';
            CommentNotificationsRow.style.visibility = 'visible';
            BlockSpamNotificationsRow.style.visibility = 'visible';
            ModerationThresholdRow.style.visibility = 'visible';
        }
 
    }
    
    function toggleAboutFields()
    {
        var enableAbout = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "ynEnableAbout").ClientID %>');
        var aboutTitle = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "AboutTitlePanel").ClientID %>');
        var aboutDescription = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "AboutDesciptionPanel").ClientID %>');

        var isDisabled = !getRadioSelectedValue(enableAbout);

        if (isDisabled)
        {
        	aboutTitle.style.visibility = 'hidden';
            aboutDescription.style.visibility = 'hidden';
        }
        else
        {
        	aboutTitle.style.visibility = 'visible';
            aboutDescription.style.visibility = 'visible';
        }
    }
    
    function toggleChildInput(control, isDisabled)
    {
	    if (control.getElementsByTagName) 
	    {
		    var children = control.getElementsByTagName('INPUT');
		    for (var i = 0; i < children.length; i++)
		    {
			    children[i].disabled = isDisabled;
		    }
		    
		    var children = control.getElementsByTagName('SPAN');
		    for (var i = 0; i < children.length; i++)
		    {
			    children[i].disabled = isDisabled;
		    }
        }
    }
    
    function getRadioSelectedValue(control)
    {
        if (control.getElementsByTagName)
        {
            var children = control.getElementsByTagName('INPUT');
            for (var i = 0; i < children.length; i++)
            {
                if (children[i].type == 'radio' && children[i].checked)
                    return children[i].value == 'True';
            }
        }
    }
    </script>
    
	<cp:configokstatusmessage id="Status" runat="server" visible="false" />
	
	<div class="CommonFormArea">
	<TWC:TabbedPanes runat="server"
	    PanesCssClass="CommonPane"
	    TabSetCssClass="CommonPaneTabSet"
	    TabCssClasses="CommonPaneTab"
	    TabSelectedCssClasses="CommonPaneTabSelected"
	    TabHoverCssClasses="CommonPaneTabHover">
	
	<TWC:TabbedPane runat="server">
	    <Tab><cp:resourcecontrol runat="server" resourcename="CP_Blogs_DescOptions_TabDescTitle" /></Tab>
	    <Content>
	    <div class="CommonFormDescription">
		    <cp:resourcecontrol runat="server" resourcename="CP_Blogs_DescOptions_SubTitle" />
	    </div>
	    <div class="CommonFormFieldName">
		    <CP:FormLabel runat="server" resourcename="CP_Blogs_DescOptions_BlogTitle" ControlToLabel="Name" />
		    <asp:RequiredFieldValidator id="TitleValidator" ControlToValidate="Name" Display="Dynamic" Runat="server" />
	    </div>
	    <div class="CommonFormField">
		    <asp:TextBox id="Name" Runat="Server" CssClass="ControlPanelTextInput" />
	    </div>
	    <div class="CommonFormFieldName">
		    <CP:FormLabel runat="server" resourcename="CP_Blogs_DescOptions_Description" ControlToLabel="Description" />
	    </div>
	    <div class="CommonFormField">
		    <asp:TextBox id="Description" Runat="Server" CssClass="ControlPanelTextInput" MaxLength="256" />
		    <div>
	            <asp:customvalidator id="DescriptionValidator" runat="server" controltovalidate="Description" font-bold="True">
				    <CP:ResourceControl runat="server" ResourceName="CP_DescriptionLengthValidation" /></asp:customvalidator>
	        </div>
	    </div>
	    </Content>
	</TWC:TabbedPane>
	
	<TWC:TabbedPane runat="server">
	    <Tab><cp:resourcecontrol runat="server" resourcename="CP_Blogs_DescOptions_TabEmailTitle" /></Tab>
	    <Content>
	        <div class="CommonFormDescription">
		        <cp:resourcecontrol runat="server" resourcename="CP_Blogs_DescOptions_EmailTabDescription" />
		        <%= string.Format(ResourceManager.GetString("CP_Blogs_DescOptions_EmailAddressInfo", "ControlPanelResources.xml"), Globals.GetSiteUrls().UserEditProfile)%>
	        </div>

            <table width="100%">
                <tr>
                    <td colspan="3">
                        <div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_Email" /></div>
                    </td>
                </tr>
                <tr>
                    <td class="CommonFormFieldName">
		                    <cp:formlabel runat="Server" controltolabel="NotificationType" resourcename="CP_Blogs_DescOptions_FeedbackNotify" />				    
                    </td>

                    <td class="CommonFormField">
                            <cp:feedbacknotificationdropdownlist id="NotificationType" runat="server" onchange="toggleEmailFields();" />				    
                    </td>
                </tr>
                
                <tr id="NotifyAllOwnersRow" runat="server">
                    <td class="CommonFormFieldName">
                            <cp:formlabel runat="Server" controltolabel="ynNotifyAllOwners" resourcename="CP_Blogs_DescOptions_NotifyAllOwners" />			        
                    </td>

                    <td class="CommonFormField">
                            <cp:yesnoradiobuttonlist id="ynNotifyAllOwners" runat="server" repeatcolumns="2" />                    
                    </td>
                </tr>

                <tr id="EnableContactRow" runat="server">
                    <td class="CommonFormFieldName">
		                <CP:FormLabel runat="Server" ResourceName="CP_Blogs_DescOptions_EnableContact" ControlToLabel="EnableContact" />
			            <div>
                            <CP:ResourceControl runat="server" ResourceName="CP_Blogs_DescOptions_EnableContactWarning" />
		                </div>
                    </td>

                    <td class="CommonFormField">
			                <cp:YesNoRadioButtonList id="EnableContact" runat="server" RepeatColumns="2" />
                    </td>
                </tr>
                
                <tr id="ContactAddressRow" runat="server">
                    <td class="CommonFormFieldName">
		                <CP:FormLabel runat="Server" ResourceName="CP_Blogs_DescOptions_Email" ControlToLabel="EnableContact" />
                    </td>

                    <td class="CommonFormField">
			                <asp:TextBox runat="server" ID="ContactEmail" />
			                <asp:RegularExpressionValidator runat="server" ControlToValidate="ContactEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"><CP:ResourceControl runat="server" ResourceName="CP_Blogs_DescOptions_EmailValidationError" /></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr id="CommentNotificationsRow" runat="server">
                    <td colspan="3">
                        <div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_Comment_Notifications" /></div>
                    </td>
                </tr>

                <tr id="BlockSpamNotificationsRow" runat="server">
                    <td class="CommonFormFieldName">
				            <CP:FormLabel runat="Server" ResourceName="CP_Blogs_DescOptions_BlockSpamFeedbackNotifications" ControlToLabel="BlockSpamFeedbackNotifications" />&nbsp;
                    </td>

                    <td class="CommonFormField">
				            <cp:YesNoRadioButtonList id="BlockSpamFeedbackNotifications" runat="server" RepeatColumns="2" />
                    </td>
                </tr>

                <tr id="ModerationThresholdRow" runat="server">
                    <td class="CommonFormFieldName">
		                    <CP:FormLabel runat="server" resourcename="CP_Blogs_DescOptions_ModerationNotificationThreshold" ControlToLabel="ModerationNotificationThreshold" />
                    </td>

                    <td class="CommonFormField">
			                <asp:TextBox id="ModerationNotificationThreshold" width="50" Runat="Server" CssClass="ControlPanelTextInput" />		        
                    </td>
                </tr>

            </table>
		        
            
    		
		    
	    </Content>
	</TWC:TabbedPane>
	
	<TWC:TabbedPane runat="server">
	    <Tab><cp:resourcecontrol runat="server" resourcename="CP_Blogs_DescOption_TabAboutTitle" /></Tab>
	    <Content>
            <div class="CommonFormDescription">
                <cp:resourcecontrol runat="server" resourcename="CP_Blogs_DescOptions_AboutSubTitle" />
            </div>

            <table width="100%">
                <tr>
                    <td colspan="3">
                        <div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_About_You" /></div>
                    </td>
                </tr>

                <tr>
                    <td class="CommonFormFieldName">
                            <CP:FormLabel runat="Server" ResourceName="CP_Blogs_DescOptions_AboutEnablePage" ControlToLabel="ynEnableAbout" />&nbsp;
                    </td>
                    
                    <td class="CommonFormField">
		                    <cp:YesNoRadioButtonList id="ynEnableAbout" runat="server" RepeatColumns="2" onclick="toggleAboutFields()" />
                    </td>
                </tr>

                <tr id="AboutTitlePanel" runat="server">
                    <td colspan="2">
	                    <div class="CommonFormFieldName">
				            <CP:FormLabel runat="server" ResourceName="CP_Blogs_AboutOptions_AboutTitle" ControlToLabel="AboutTitle" />
			            </div>

			            <div class="CommonFormField">
				            <asp:TextBox id="AboutTitle" CssClass="ControlPanelTextInput" Runat="Server" />
			            </div>
                    </td>
                </tr>
                
                <tr id="AboutDesciptionPanel" runat="server">
                    <td colspan="2">
			            <div class="CommonFormFieldName">
				            <CP:FormLabel runat="server" ResourceName="CP_Blogs_AboutOptions_AboutDescription" ControlToLabel="Description" />
			            </div>
			            <div class="CommonFormField">
                            <TEControl:Editor id="AboutDescription" runat="Server" Height="225px" />
			            </div>
                    </td>
                </tr>
            </table>

	    </Content>
	</TWC:TabbedPane>
	
	<TWC:TabbedPane runat="server">
	    <Tab><cp:resourcecontrol runat="server" resourcename="CP_Blogs_DescOption_TabSearchTitle" /></Tab>
	    <Content>
	        <div class="CommonFormDescription">
		        <cp:resourcecontrol runat="server" resourcename="CP_Blogs_DescOptions_SearchSubTitle" />
	        </div>

            <div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_Post_SEO" /></div>

            <div class="CommonFormFieldName">
                <cp:formlabel runat="server" resourcename="CP_Blogs_DescOptions_MetaTagDescription" controltolabel="MetaTagDescription" />
            </div>
            <div class="CommonFormField">
                <asp:textbox id="MetaTagDescription" runat="Server" maxlength="512" rows="5" TextMode="MultiLine" cssclass="ControlPanelTextInput" />
            </div>
        
            <div class="CommonFormFieldName">
                <cp:formlabel runat="server" resourcename="CP_Blogs_DescOptions_MetaTagKeyword" controltolabel="MetaTagKeywords" />
            </div>
            <div class="CommonFormField">
                <asp:textbox id="MetaTagKeywords" runat="Server" maxlength="512" cssclass="ControlPanelTextInput" />
            </div>
        

	        <asp:PlaceHolder id="RawHTMLPanel" runat="Server">
	            
                <div class="CommonFormFieldName">
                    <cp:formlabel runat="server" resourcename="CP_Blogs_DescOptions_RawHTMLHeader" controltolabel="RawHTMLHeader" />
                </div>
                <div class="CommonFormField">
                    <asp:textbox id="RawHTMLHeader" runat="Server" cssclass="ControlPanelTextInput" textmode="MultiLine" rows="5" />
                </div>
	                
	        </asp:PlaceHolder>
	    </Content>
	</TWC:TabbedPane>
	
	</TWC:TabbedPanes>
	<p class="PanelSaveButton">
		<cp:ResourceButton id="SaveButton" runat="Server" ResourceName="Save" />
	</p>
	</div>
</asp:Content>