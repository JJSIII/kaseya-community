<%@ Page language="c#" Codebehind="FileStorageOptions.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.BlogAdmin.FileStorageOptions" MasterPageFile="~/ControlPanel/Masters/BlogAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="Server" resourcename="CP_BlogAdmin_Options_FileStorage_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
  <script type="text/javascript">
    function ValidateBlogFileSize(source, args) {
      var blogFilesQuotaInput = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "BlogFilesQuota").ClientID %>');
      var blogFileSize = parseInt(args.Value);
      var blogQuotaSize = parseInt(blogFilesQuotaInput.value);
      
      if (blogQuotaSize == 0 || blogQuotaSize >= blogFileSize)
        args.IsValid = true;
      else if (blogQuotaSize > 0 && blogQuotaSize < blogFileSize)
        args.IsValid = false;
    }
  </script>

    <CP:ControlPanelSelectedNavigation id="SelectedNavigation1" runat="server" SelectedNavItem="AdminFileStorageOptions" />
	<div class="CommonDescription">
		<CP:ResourceControl runat="Server" resourcename="CP_BlogAdmin_Options_FileStorage_SubTitle" />
	</div>
	
	<CP:FileOnlyStatusMessage id="FOStatus" runat="server" visible="false" />
	<asp:PlaceHolder id="OptionHolder" runat="Server">
	<CP:StatusMessage id="Status" runat="server" visible="false" />

	<div class="FixedWidthContainer">

	<table cellpadding="0" cellspacing="0" border="0" width="100%">

	<tr>
	<td class="CommonFormFieldName">
		<strong><cp:formlabel runat="Server" resourcename="CP_BlogAdmin_Options_FileStorage_EnableBlogFileStorage" controltolabel="EnableBlogFileStorage" /></strong>
		<br />
		<cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_FileStorage_EnableBlogFileStorage_Help" />
	</td>
	<td class="CommonFormField">
		<CP:YesNoRadioButtonList id="EnableBlogFileStorage" runat="Server" repeatcolumns="2" />
	</td>
	</tr>		

	<tr>
	<td class="CommonFormFieldName">
		<strong><cp:formlabel runat="Server" resourcename="CP_BlogAdmin_Options_FileStorage_BlogFilesQuota" controltolabel="BlogFilesQuota" /></strong>
		<br />
		<cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_FileStorage_BlogFilesQuota_Help" />
	</td>
	<td class="CommonFormField">
		<asp:TextBox id="BlogFilesQuota" runat="Server" Style="width:50px" />&nbsp;<CP:ResourceControl runat="Server" resourcename="CP_Blog_Files_KiloBytes" />
		<asp:regularexpressionvalidator runat="server" ValidationExpression="^[0-9]*" 
			ControlToValidate="BlogFilesQuota">&nbsp;* <CP:ResourceControl runat="server" ResourceName="CP_RequireNumber" /></asp:regularexpressionvalidator></TD>
	</td>
	</tr>		

	<tr>
	<td class="CommonFormFieldName">
		<strong><cp:formlabel ID="Formlabel1" runat="Server" resourcename="CP_BlogAdmin_Options_FileStorage_BlogFilesMaxSize" controltolabel="BlogFilesMaxSize" /></strong>
		<br />
		<cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_FileStorage_BlogFilesMaxSize_Help" />
	</td>
	<td class="CommonFormField">
		<asp:TextBox id="BlogFilesMaxSize" runat="Server" Style="width:50px" />&nbsp;<CP:ResourceControl runat="Server" resourcename="CP_Blog_Files_KiloBytes" />
		<asp:CustomValidator runat="server" ID="BlogFileSizeCustomValidator" ControlToValidate="BlogFilesMaxSize" ClientValidationFunction="ValidateBlogFileSize" Display="Dynamic">&nbsp;* <CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_Options_FileStorage_FileSizeInvalid" /></asp:CustomValidator>
		<asp:regularexpressionvalidator runat="server" ValidationExpression="^[0-9]*" 
			ControlToValidate="BlogFilesMaxSize">&nbsp;* <CP:ResourceControl runat="server" ResourceName="CP_RequireNumber" /></asp:regularexpressionvalidator></TD>
	</td>
	</tr>		
	
	<tr>
	<td class="CommonFormFieldName">
		<strong><cp:formlabel runat="Server" resourcename="CP_BlogAdmin_Options_FileStorage_BlogFileStorageExtensions" controltolabel="BlogFileStorageExtensions" /></strong>
		<br />
		<cp:resourcecontrol runat="Server" resourcename="CP_BlogAdmin_Options_FileStorage_BlogFileStorageExtensions_Help" />
	</td>
	<td class="CommonFormField">
		<asp:TextBox id="BlogFileStorageExtensions" runat="Server" cssclass="ControlPanelTextInput" Width="400" Columns="60" Rows="5" TextMode="MultiLine" Wrap="true" />
	</td>
	</tr>
	
	</table>
	</div>
	
	<p class="PanelSaveButton DetailsFixedWidth">
		<cp:ResourceButton id="SaveButton" runat="Server" resourcename="Save" />
	</p>
	</asp:PlaceHolder>
</asp:Content>