<%@ Page language="c#" Codebehind="GeneralOptions.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.BlogAdmin.GeneralOptionsPage" MasterPageFile="~/ControlPanel/Masters/BlogAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="BlogSettingsGeneral" />
	<div class="CommonDescription">
		<CP:ResourceControl runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_Instructions" />
	</div>
	
	<CP:FileOnlyStatusMessage id="FOStatus" runat="server" visible="false" />
	<asp:PlaceHolder id="OptionHolder" runat="Server">
	<CP:StatusMessage id="Status" runat="server" visible="false" />
		<table cellpadding="0" cellspacing="0" border="0">
		
		<tr>
		<td class="CommonFormFieldName">
			<strong><cp:formlabel runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_AutoCreate" controltolabel="checkAutoCreate" /></strong>
			<br />
			<cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_AutoCreate_Help" />
		</td>
		<td class="CommonFormField">
			<CP:YesNoRadioButtonList id="checkAutoCreate" runat="Server" repeatcolumns="2" />
		</td>
		</tr>
		
		<tr>
		<td class="CommonFormFieldName">
			<strong><cp:formlabel runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_EnableCrossPosting" controltolabel="EnableCrossPosting" /></strong>
			<br />
			<cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_EnableCrossPosting_Help" />
		</td>
		<td class="CommonFormField">
			<CP:YesNoRadioButtonList id="EnableCrossPosting" runat="Server" repeatcolumns="2" />
		</td>
		</tr>
		
		<tr>
		<td class="CommonFormFieldName">
			<strong><cp:formlabel runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_EnableRawHeadEditing" controltolabel="EnableRawHeadEditing" /></strong>
			<br />
			<cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_EnableRawHeadEditing_Help" />
		</td>
		<td class="CommonFormField">
			<CP:YesNoRadioButtonList id="EnableRawHeadEditing" runat="Server" repeatcolumns="2" />
		</td>
		</tr>
		
		<tr>
		<td class="CommonFormFieldName">
			<strong><cp:formlabel runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_EnableEmailSubscriptions" controltolabel="EnableEmailSubscriptions" /></strong>
			<br />
			<cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_EnableEmailSubscriptions_Help" />
		</td>
		<td class="CommonFormField">
			<CP:YesNoRadioButtonList id="EnableEmailSubscriptions" runat="Server" repeatcolumns="2" />
		</td>
		</tr>

		<tr>
		<td class="CommonFormFieldName">
			<strong><cp:formlabel runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_AutoCreateDefaultGroup" controltolabel="ParentGroupSelection" />&nbsp;</strong>
			<br />
			<cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_AutoCreateDefaultGroup_Help" />
		</td>
		<td class="CommonFormField">
			<TEControl:GroupSelectionList runat="server" ID="ParentGroupSelection" Width="350" />
		</td>
		</tr>
		
		<tr>
		<td class="CommonFormFieldName">
			<strong><cp:formlabel runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_PingServices" controltolabel="PingServices" />&nbsp;</strong>
			<br />
			<cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_PingServices_Help" />
		</td>
		<td class="CommonFormField">
			<asp:textbox id="PingServices" runat="Server" cssclass="ControlPanelTextInput" width="300" TextMode="Multiline" Rows="5"></asp:textbox>
		</td>
		</tr>

		<tr>
		<td class="CommonFormFieldName">
			<strong><cp:formlabel runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_AggregateTags" controltolabel="AggregateTags" />&nbsp;</strong>
			<br />
			<cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_AggregateTags_Help" />
		</td>
		<td class="CommonFormField">
			<asp:textbox id="AggregateTags" runat="Server" cssclass="ControlPanelTextInput" width="300" TextMode="Multiline"></asp:textbox>
		</td>
		</tr>
		
		<tr>
		<td class="CommonFormFieldName">
			<strong><cp:formlabel runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_ContactThreshold" controltolabel="ContactRequestModerationThreshold" />&nbsp;</strong>
		    <asp:CompareValidator runat = "Server" ControlToValidate="ContactRequestModerationThreshold" Operator = "DataTypeCheck" Type="Integer" Display="Dynamic"><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_Blogs_ThresholdMustBeInt" /></asp:CompareValidator>
		    <br />
			<cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_GeneralSettings_ContactThreshold_Help" />
		</td>
		<td class="CommonFormField">
			<asp:textbox id="ContactRequestModerationThreshold" runat="Server" cssclass="ControlPanelTextInput" width="300"></asp:textbox>
		</td>
		</tr>		
		
        
		</table>
	<p class="PanelSaveButton">
		<cp:ResourceButton id="SaveButton" runat="Server" resourcename="Save" />
	</p>
	</asp:PlaceHolder>
</asp:Content>