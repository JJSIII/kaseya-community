<%@ Control language="c#" Codebehind="SectionEditControl.ascx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Forums.SectionEditControl" %>
<%@ Import Namespace="Telligent.Evolution.Discussions.Components" %>
<%@ Register TagPrefix="CP" TagName="AppRoles" Src="~/ControlPanel/GroupAdmin/AppRoles.ascx" %>
<cp:resourcecontrol id="AddSectionHelpResource" Tag="Div" CssClass="CommonDescription" runat="server" visible="false" resourcename="CP_Forums_Home_AddNewForumHelp"></cp:resourcecontrol>
<cp:statusmessage id="Status" runat="server"></cp:statusmessage>

<script type="text/javascript">
    
    function toggleEnableEmbeddingFields()
    {
        var enableEmbedding = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "EmbedEnable").ClientID %>');
        var embedCode = document.getElementById('EmbedCodeRow');

        if (enableEmbedding && embedCode)
        {
            if (!getRadioSelectedValue(enableEmbedding))
                embedCode.style.display = 'none';
            else
            {
                try { embedCode.style.display = 'table-row'; }
                catch (e) { embedCode.style.display = 'block'; }
            }
        }
    }
    
    function toggleEmbedDomainFields()
    {
        var enableAllDomains = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "EmbedAllDomains").ClientID %>');
        var allowedDomains = document.getElementById('AllowedDomainsRow');

        if (enableAllDomains && allowedDomains)
        {
            if (getRadioSelectedValue(enableAllDomains))
                allowedDomains.style.display = 'none';
            else
            {
                try { allowedDomains.style.display = 'table-row'; }
                catch (e) { allowedDomains.style.display = 'block'; }
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
    
    function canUncheckThreadType(control)
    {
        if (control.checked == true)
            return true;
        var questionAndAnswerInput = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "AllowQuestionCheckBox").ClientID %>');
        var discussionInput = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "AllowDiscussionCheckBox").ClientID %>');
        
        if ((questionAndAnswerInput && questionAndAnswerInput.checked == true) || (discussionInput && discussionInput.checked == true))
            return true;

        return false;
    }

    function canUncheckThreadType(control) {
        var canCheck = false;
        var displayDefaultThreadType = false;
        var questionAndAnswerInput = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "AllowQuestionCheckBox").ClientID %>');
        var discussionInput = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "AllowDiscussionCheckBox").ClientID %>');
        var defaultThreadTypeBox = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "EnableThreadStatusTrackingRow").ClientID %>');

        if (control.checked == true)
            canCheck = true;
        else if ((questionAndAnswerInput && questionAndAnswerInput.checked == true) || (discussionInput && discussionInput.checked == true))
            canCheck = true;

        if ((questionAndAnswerInput && questionAndAnswerInput.checked == true) && (discussionInput && discussionInput.checked == true))
            displayDefaultThreadType = true;
        else
            displayDefaultThreadType = false;

        // Display Default ThreadType DDL
        if (defaultThreadTypeBox && canCheck) {
            if (displayDefaultThreadType) {
                defaultThreadTypeBox.style.position = 'relative';
                defaultThreadTypeBox.style.visibility = "visible";
            }
            else {
                defaultThreadTypeBox.style.position = 'absolute';
                defaultThreadTypeBox.style.visibility = "hidden";
            }
        }


        return canCheck;
    }
</script>

<TWC:TabbedPanes id="TabStrip" runat="server"
	PanesCssClass="CommonPane"
	TabSetCssClass="CommonPaneTabSet"
	TabCssClasses="CommonPaneTab"
	TabSelectedCssClasses="CommonPaneTabSelected"
	TabHoverCssClasses="CommonPaneTabHover"
	>
	<TWC:TabbedPane runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_Tab_Basic" /></Tab>
		<Content>
		<table cellspacing="0" cellpadding="2" border="0">
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_Name" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_Name_Detail" /></td>
			<td class="CommonFormField">
				<asp:textbox id="Name" runat="server" CssClass="ControlPanelTextInputBig" columns="40" maxlength="256"></asp:textbox>
				<asp:requiredfieldvalidator id="NameRequired" runat="server" controltovalidate="Name" font-bold="True" errormessage="*"></asp:requiredfieldvalidator>
				<asp:RegularExpressionValidator ValidationExpression="^.*[^\s]+.*$" 
                     ControlToValidate="Name" Display="Dynamic"
                     ErrorMessage="<br/>Forum Name does not contain an alphanumeric character." runat="server" />
            </td>
		</tr>
		<tr>
			<td class="CommonFormFieldName" valign="top">
				<cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_ForumDescription" /><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_ForumDescription_Detail" /></td>
			<td class="CommonFormField">
				<asp:textbox id="Description" runat="server" columns="40" maxlength="256"></asp:textbox>
				<asp:customvalidator id="DescriptionValidator" runat="server" controltovalidate="Description" font-bold="True">
				    <CP:ResourceControl runat="server" ResourceName="CP_DescriptionLengthValidation" /></asp:customvalidator></td>
		</tr>
		<tr runat="server">
			<td class="CommonFormFieldName">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_Group" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_Group_Detail" /></td>
			<td class="CommonFormField">
				<asp:literal id="GroupValue" runat="server"></asp:literal>
				<TEControl:GroupLookUpTextBox ID="GroupLookUp" runat="server" RequiredGroupPermission="Group_CreateForum" MaximumSelections="1" />
				<asp:CustomValidator id="ParentGroupValidator" runat="server" controltovalidate="GroupLookUp">*</asp:CustomValidator>
			</td>
		</tr>
		<tr>
		    <td class="CommonFormFieldName">
		        <strong><CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_AllowedThreads" /></strong><br />
		        <CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_AllowedThreads_Desc" />
		    </td>
		    <td class="CommonFormField">
                <CP:ResourceControl id="QAForumsNotAllowedLicensing" visible="false" runat="server" Tag="div" CssClass="CommonLicenseRestrictionMessage" resourcename="CP_Forums_QAForumsNotAllowedLicensing" />
		        <asp:CheckBox runat="server" ID="AllowQuestionCheckBox" onclick="return canUncheckThreadType(this);" /> 
                <TEControl:ResourceControl runat="server" resourcename="Forums_QuestionThreadType">
                    <DisplayConditions><TEControl:ControlVisibilityCondition runat="server" ControlId="AllowQuestionCheckBox" ControlVisibilityEquals="true" /></DisplayConditions>
                    <TrailerTemplate><br /></TrailerTemplate>
                </TEControl:ResourceControl>
                <asp:CheckBox runat="server" ID="AllowDiscussionCheckBox" onclick="return canUncheckThreadType(this);" /> 
                <TEControl:ResourceControl runat="server" resourcename="Forums_DiscussionThreadType">
                    <DisplayConditions><TEControl:ControlVisibilityCondition runat="server" ControlId="AllowDiscussionCheckBox" ControlVisibilityEquals="true" /></DisplayConditions>
                    <TrailerTemplate><br /></TrailerTemplate>
                </TEControl:ResourceControl>
		    </td>
		</tr>
		<tr id="EnableThreadStatusTrackingRow" runat="server">
			<td class="CommonFormFieldName">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_EnableThreadStatusTracking" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_EnableThreadStatusTracking_Detail" /></td>
			<td class="CommonFormField">
                <asp:DropDownList runat="server" ID="DefaultThreadTypeDropDown" />
            </td>
		</tr>
		<script type = "text/javascript">
		    canUncheckThreadType(document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "AllowQuestionCheckBox").ClientID %>'));
        </script>
		<tr>
			<td class="CommonFormFieldName" nowrap="nowrap">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_IsActive" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_IsActive_Detail" /></td>
			<td class="CommonFormField">
				<cp:yesnoradiobuttonlist id="IsActive" runat="server"  repeatcolumns="2"></cp:yesnoradiobuttonlist></td>
		</tr>
		<tr runat="server" id="SectionLocalizationArea">
			<td class="CommonFormFieldName">
				<strong><cp:resourceControl runat="Server" resourcename="CP_Forums_SectionEdit_DefaultLanguage" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_DefaultLanguage_Detail" />
			</td>
			<td class="CommonFormField">
				<asp:DropDownList ID="DefaultLanguage" runat="server" />
			</td>
		</tr>
		</table>
		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane runat="server" ID="AdvancedTab">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_Tab_Advanced" /></Tab>
		<Content>
		<table cellspacing="0" cellpadding="2" border="0">
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_IsSearchable" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_IsSearchable_Detail" /></td>
			<td class="CommonFormField">
				<cp:yesnoradiobuttonlist id="IsSearchable" runat="server"  repeatcolumns="2"></cp:yesnoradiobuttonlist></td>
		</tr>
		<tr>
			<td class="CommonFormFieldName" nowrap="nowrap">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_IsModerated" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_IsModerated_Detail" /></td>
			<td class="CommonFormField">
				<cp:yesnoradiobuttonlist id="IsModerated" runat="server"  repeatcolumns="2"></cp:yesnoradiobuttonlist></td>
		</tr>
		<tr>
			<td class="CommonFormFieldName" nowrap="nowrap">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_EnableModeratedNotifications" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_EnableModeratedNotifications_Detail" />
            </td>
			<td class="CommonFormField">
				<cp:yesnoradiobuttonlist id="EnableModeratedNotifications" runat="server"  repeatcolumns="2" />
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName" nowrap="nowrap">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_EnablePostStatistics" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_EnablePostStatistics_Detail" /></td>
			<td class="CommonFormField">
				<cp:yesnoradiobuttonlist id="EnablePostStatistics" runat="server"  repeatcolumns="2"></cp:yesnoradiobuttonlist></td>
		</tr>
		<tr>
			<td class="CommonFormFieldName" nowrap="nowrap">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_EnablePostPoints" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_EnablePostPoints_Detail" /></td>
			<td class="CommonFormField">
				<cp:yesnoradiobuttonlist id="EnablePostPoints" runat="server"  repeatcolumns="2"></cp:yesnoradiobuttonlist></td>
		</tr>
		</table>
		</Content>
	</TWC:TabbedPane>
	
	<TWC:TabbedPane ID="SectionPermissions" runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_Tab_Permissions" /></Tab>
		<Content>
		    <CP:AppRoles id="AppRoles" runat="server" />
		</Content>
	</TWC:TabbedPane>
	
	<TWC:TabbedPane runat="server" id="EmbedTab">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_Embed_Tab" /></Tab>
		<Content>
		<table cellspacing="0" cellpadding="2" border="0">
		<tr>
			<td class="CommonFormFieldName">
				<strong><CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_Embed_EnableEmbedding" /></strong><br />
				<cp:resourcecontrol  runat="Server" resourcename="CP_Forums_SectionEdit_Embed_EnableEmbedding_Detail" /></td>
			<td class="CommonFormField">
				<cp:yesnoradiobuttonlist id="EmbedEnable" runat="server" repeatcolumns="2" onclick="toggleEnableEmbeddingFields();"></cp:yesnoradiobuttonlist>
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName">
				<strong><CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_Embed_EnableAllDomains" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_Embed_EnableAllDomains_Detail" /></td>
			<td class="CommonFormField">
				<cp:yesnoradiobuttonlist id="EmbedAllDomains" runat="server" repeatcolumns="2" onclick="toggleEmbedDomainFields();"></cp:yesnoradiobuttonlist></td>
			</td>
		</tr>
		<tr id="AllowedDomainsRow">
			<td class="CommonFormFieldName">
				<strong><CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_Embed_AllowedDomains" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_Embed_AllowedDomains_Detail" /></td>
			<td class="CommonFormField">
				<asp:textbox id="EmbedDomains" runat="server" TextMode="MultiLine" Rows="5" Columns="40" Width="300px"></asp:textbox>
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName">
				<strong><CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_Embed_CreateNewThreadsAs" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_Embed_CreateNewThreadsAs_Detail" /></td>
			<td class="CommonFormField">
				<TEControl:UserLookUpTextBox ID="EmbedThreadUser" runat="server" LookUpType="AllUsers" MaximumLookUpCount="20" MaximumUsers="1" Width="300px" />
			</td>
		</tr>
		<tr id="EmbedCodeRow">
			<td class="CommonFormFieldName">
				<strong><CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_Embed_Code" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_Embed_Code_Detail" /></td>
			<td class="CommonFormField">
				<asp:TextBox ID="EmbedCode" runat="server" Width="300px" onclick="this.select();" oncontextmenu="this.select();" />
			</td>
		</tr>
		</table>
		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane runat="server" id="MailingListTab">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_Forums_SectionEdit_Tab_MailingList" /></Tab>
		<Content>
		<table cellspacing="0" cellpadding="2" border="0">
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_LE_EnableMailingList" /></strong><br />
				<cp:resourcecontrol  runat="Server" resourcename="CP_Forums_SectionEdit_LE_EnableMailingList_Detail" /></td>
			<td class="CommonFormField">
				<cp:yesnoradiobuttonlist id="LEEnableMailingList" runat="server"  repeatcolumns="2"></cp:yesnoradiobuttonlist>
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_LE_ListName" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_LE_ListName_Detail" /></td>
			<td class="CommonFormField">
				<asp:textbox id="LEListName" runat="server" columns="50" maxlength="256"></asp:textbox>
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_LE_EmailAddress" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_LE_EmailAddress_Detail" /></td>
			<td class="CommonFormField">
				<asp:textbox id="LEEmailAddress" runat="server" columns="20" maxlength="256"></asp:textbox>
				<asp:Literal ID="LEEmailDomain" Runat="server" />
				<asp:RegularExpressionValidator id="emailRegExValidator" runat="server" ControlToValidate="LEEmailAddress" ValidationExpression="\w+([-+.]\w+)*">*</asp:RegularExpressionValidator>
				<asp:customvalidator id="LEEmailValidator" runat="server" controltovalidate="LEEmailAddress" font-bold="True"
					errormessage="*"></asp:customvalidator>
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName" valign="top">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_LE_FooterMessage" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_LE_FooterMessage_Detail" /></td>
			<td class="CommonFormField">
				<asp:textbox id="LEFooterMessage" runat="server" columns="50" maxlength="1000" textmode="MultiLine" rows="3"></asp:textbox>
			</td>
		</tr>
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_LE_PassiveMode" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_LE_PassiveMode_Detail" /></td>
			<td class="CommonFormField">
				<cp:yesnoradiobuttonlist id="LEPassiveMode" runat="server"  repeatcolumns="2"></cp:yesnoradiobuttonlist></td>
		</tr>
		<tr>
			<td class="CommonFormFieldName">
				<strong><cp:resourcelabel runat="server" resourcename="CP_Forums_SectionEdit_LE_PassiveModeEmail" /></strong><br />
				<cp:resourcecontrol runat="Server" resourcename="CP_Forums_SectionEdit_LE_PassiveModeEmail_Detail" /></td>
			<td class="CommonFormField">
				<asp:textbox id="LEPassiveModeAddress" runat="server" columns="50" maxlength="256"></asp:textbox>
				<TEControl:EmailValidator runat=server ID="Regularexpressionvalidator1" ControlToValidate="LEPassiveModeAddress">*</TEControl:EmailValidator>				
				<asp:CustomValidator ID="PassiveEmailValidator" runat="server" />
			</td>
		</tr>
		</table>
		</Content>
	</TWC:TabbedPane>
</TWC:TabbedPanes>

<script type="text/javascript">

toggleEmbedDomainFields();
toggleEnableEmbeddingFields();

</script>