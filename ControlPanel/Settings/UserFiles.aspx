<%@ Page language="c#" Codebehind="UserFiles.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Settings.UserFiles" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol runat="Server" resourcename="CP_Settings_Files" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="UserFiles" />
	<div class="CommonDescription">
		<cp:resourcecontrol runat="Server" resourcename="CP_Settings_UserFiles_Subtitle" /><br />
	</div>
	
	<CP:StatusMessage runat="server" id="Status" visible="false" />
	
	<div class="FixedWidthContainer">
		<table cellpadding="0" cellspacing="0" border="0">
		    <tr>
		        <td class="CommonFormFieldName">
			        <strong><cp:resourcecontrol runat="Server" resourcename="CP_UserFiles_Enable" /></strong><br />
			        <cp:resourcecontrol runat="Server" resourcename="CP_UserFiles_Enable_Help" />
		        </td>
		        <td class="CommonFormField">
		            <CP:YesNoRadioButtonList runat="server" ID="EnableUserFiles" RepeatColumns="2" />
		        </td>
		    </tr>
    		
		    <tr>
		        <td class="CommonFormFieldName">
		            <strong><cp:resourcecontrol runat="Server" resourcename="CP_UserFiles_Quota" /></strong><br />
		            <cp:resourcecontrol runat="Server" resourcename="CP_UserFiles_Quota_Help" />
                </td>
                <td class="CommonFormField">
			          <asp:TextBox runat="server" ID="UserFilesQuota" />
			          <asp:RegularExpressionValidator runat="server" ControlToValidate="UserFilesQuota" ValidationExpression="^\d+$"><CP:ResourceControl runat="server" ResourceName="CP_UserFiles_Quota_ValidationError" /></asp:RegularExpressionValidator>
		        </td>
		    </tr>
		    
		    <tr>
		        <td class="CommonFormFieldName">
		            <strong><cp:resourcecontrol runat="Server" resourcename="CP_UserFiles_MaxSize" /></strong><br />
		            <cp:resourcecontrol runat="Server" resourcename="CP_UserFiles_MaxSize_Help" />
                </td>
                <td class="CommonFormField">
		            <asp:TextBox runat="server" ID="UserFilesMaxSize" />
  	            <asp:RegularExpressionValidator runat="server" ControlToValidate="UserFilesMaxSize" ValidationExpression="^\d+$"><CP:ResourceControl runat="server" ResourceName="CP_UserFiles_Quota_ValidationError" /></asp:RegularExpressionValidator>
		        </td>
		    </tr>
		    
		    <tr>
		        <td class="CommonFormFieldName">
		            <strong><cp:resourcecontrol runat="Server" resourcename="CP_UserFiles_Extensions" /></strong><br />
		            <cp:resourcecontrol runat="Server" resourcename="CP_UserFiles_Extensions_Help" />
                </td>
                <td class="CommonFormField">
		            <asp:TextBox runat="server" ID="UserFilesExtensions" Columns="60" Rows="5" TextMode="MultiLine" Wrap="true" />
		        </td>
		    </tr>
		</table>
	</div>
	
	<p class="PanelSaveButton DetailsFixedWidth">
		<cp:ResourceLinkButton id="SaveButton" runat="Server" CssClass="CommonTextButton" ResourceName="Save" />
	</p>
	
</asp:Content>