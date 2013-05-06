<%@ Page language="c#" Codebehind="Quotas.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleryAdmin.Quotas" MasterPageFile="~/ControlPanel/Masters/MediaGalleryAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl id="SectionDescription" runat="server" ResourceName="CP_MediaGalleryAdmin_Quotas_Title"></CP:ResourceControl>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="MediaGalleryQuotas" />

	<DIV class="CommonDescription">
        <CP:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_Quotas_GlobalQuotas_Description"></CP:ResourceControl>    
    </DIV>

	<CP:StatusMessage id="Status" runat="server" visible="false"></CP:StatusMessage>
	
    <CP:FileOnlyStatusMessage id="FOStatus" runat="server" visible="false"></CP:FileOnlyStatusMessage>

	<asp:PlaceHolder id="OptionHolder" runat="Server">
        <TABLE cellSpacing="0" cellPadding="0" border="0">
            <TR>
	            <TD class="CommonFormFieldName">
		            <strong><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_Options_Quotas_FileCountQuota" /></strong><br />
		            <cp:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_Options_Quotas_FileCountQuota_Help" /></TD>
	            <TD class="CommonFormField">
		            <asp:textbox id="FileCountQuota" runat="server" MaxLength="8" Size="8"></asp:textbox>
		            <asp:regularexpressionvalidator runat="server" ValidationExpression="^[0-9]*" 
						ControlToValidate="FileCountQuota">&nbsp;* <CP:ResourceControl runat="server" ResourceName="CP_RequireNumber" /></asp:regularexpressionvalidator></TD>
            </TR>
            <TR>
	            <TD class="CommonFormFieldName">
		            <strong><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_Options_Quotas_TotalStorageQuota" /></strong><br />
		            <cp:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_Options_Quotas_TotalStorageQuota_Help" /></TD>
	            <TD class="CommonFormField">
		            <asp:textbox id="TotalStorageQuota" runat="server" MaxLength="12" Size="8"></asp:textbox>
		            <asp:regularexpressionvalidator runat="server" ValidationExpression="^[0-9]*" 
		            ControlToValidate="TotalStorageQuota">&nbsp;* <CP:ResourceControl runat="server" ResourceName="CP_RequireNumber" /></asp:regularexpressionvalidator></TD>
            </TR>
        </TABLE>
	</asp:PlaceHolder>
	
	<P style="text-align: right">
		<cp:ResourceButton id="Save" runat="Server" ResourceName="Save" />
	</P>
</asp:Content>