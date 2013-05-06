<%@ Page Language="C#" Codebehind="Quota.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.Web.ControlPanel.WikiAdmin.Quota" MasterPageFile="~/ControlPanel/Masters/WikiAdmin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl id="SectionDescription" runat="server" ResourceName="CP_MediaGalleryAdmin_Quotas_Title"></CP:ResourceControl>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderId="TaskRegion" runat="Server">
  <script type="text/javascript">
  	function ValidateWikiFileSize(source, args) {
  		var wikiFilesQuotaInput = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "StorageQuota").ClientID %>');
  		var wikiFileSize = parseInt(args.Value);
  		var wikiQuotaSize = parseInt(wikiFilesQuotaInput.value);

  		if (wikiQuotaSize == 0 || wikiQuotaSize >= wikiFileSize)
  			args.IsValid = true;
  		else if (wikiQuotaSize > 0 && wikiQuotaSize < wikiFileSize)
  			args.IsValid = false;
  	}
  </script>

    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="WikiQuota" />

	<DIV class="CommonDescription">
        <CP:ResourceControl runat="Server" resourcename="CP_Wiki_NavBar_WikFileQuota_Description"></CP:ResourceControl>    
    </DIV>
    
    <CP:StatusMessage id="Status" runat="server" visible="false"></CP:StatusMessage>
    
	<asp:PlaceHolder id="OptionHolder" runat="Server">
        <TABLE cellSpacing="0" cellPadding="0" border="0">
            <TR>
	            <TD class="CommonFormFieldName">
		            <strong><CP:ResourceControl runat="server" ResourceName="CP_Wiki_NavBar_WikFileQuota_TotalStorageQuota" /></strong><br />
		            <cp:ResourceControl runat="Server" resourcename="CP_Wiki_NavBar_WikFileQuota_TotalStorageQuota_Help" /></TD>
	            <TD class="CommonFormField">
		            <asp:textbox id="StorageQuota" runat="server" MaxLength="8" Size="8"></asp:textbox>
		            <asp:regularexpressionvalidator runat="server" ValidationExpression="^[0-9]*" 
						ControlToValidate="StorageQuota">&nbsp;* <CP:ResourceControl runat="server" ResourceName="CP_RequireNumber" /></asp:regularexpressionvalidator></TD>
            </TR>
            <TR>
	            <TD class="CommonFormFieldName">
		            <strong><CP:ResourceControl runat="server" ResourceName="CP_Wiki_NavBar_WikFileQuota_WikiFilesMaxSize" /></strong><br />
		            <cp:ResourceControl runat="Server" resourcename="CP_Wiki_NavBar_WikFileQuota_WikiFilesMaxSize_Help" /></TD>
	            <TD class="CommonFormField">
		            <asp:textbox id="WikiFilesMaxSize" runat="server" MaxLength="8" Size="8"></asp:textbox>
            		<asp:CustomValidator runat="server" ID="WikiFileSizeCustomValidator" ControlToValidate="WikiFilesMaxSize" ClientValidationFunction="ValidateWikiFileSize" Display="Dynamic">&nbsp;* <CP:ResourceControl runat="server" ResourceName="CP_Wiki_NavBar_WikFileQuota_FileSizeInvalid" /></asp:CustomValidator>
					<asp:regularexpressionvalidator runat="server" ValidationExpression="^[0-9]*" 
						ControlToValidate="WikiFilesMaxSize">&nbsp;* <CP:ResourceControl runat="server" ResourceName="CP_RequireNumber" /></asp:regularexpressionvalidator></TD>
            </TR>
            <tr>
	            <TD class="CommonFormFieldName">
		            <strong><CP:ResourceControl runat="server" ResourceName="CP_Wiki_NavBar_WikFileQuota_AllowedExtensions" /></strong><br />
		            <cp:ResourceControl ID="ResourceControl2" runat="Server" resourcename="CP_Wiki_NavBar_WikFileQuota_AllowedExtensions_Help" /></TD>
                <td class="CommonFormField">
                    <asp:TextBox id="txtFileExtensions" runat="Server" cssclass="ControlPanelTextInput" Width="400" Columns="60" Rows="5" TextMode="MultiLine" Wrap="true" />
                </td>
            </tr>
        </TABLE>
	</asp:PlaceHolder>
	
	<P style="text-align: right">
		<cp:ResourceButton id="Save" runat="Server" ResourceName="Save" />
	</P>
</asp:Content>