<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MediaGalleryQuotasControl.ascx.cs" Inherits="Telligent.Evolution.ControlPanel.MediaGalleryAdmin.MediaGalleryQuotasControl" %>

<TABLE cellSpacing="0" cellPadding="0" border="0">
    <TR>
        <TD class="CommonFormFieldName">
            <strong><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_Options_Quotas_FileCountQuota" /></strong><br />
            <cp:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_Options_Quotas_FileCountQuota_Help" /></TD>
        <TD class="CommonFormField">
            <asp:textbox id="FileCountQuota" runat="server" MaxLength="8" Size="6"></asp:textbox>
            <asp:regularexpressionvalidator runat="server"
	            ValidationExpression="^[0-9]*" ControlToValidate="FileCountQuota"><CP:ResourceControl runat="server" ResourceName="CP_RequireNumber" /></asp:regularexpressionvalidator></TD>
    </TR>
    <TR>
        <TD class="CommonFormFieldName">
            <strong><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_Options_Quotas_TotalStorageQuota" /></strong><br />
            <cp:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_Options_Quotas_TotalStorageQuota_Help" /></TD>
        <TD class="CommonFormField">
            <asp:textbox id="TotalStorageQuota" runat="server" MaxLength="8" Size="6"></asp:textbox>
            <asp:regularexpressionvalidator runat="server"
	            ValidationExpression="^[0-9]*" ControlToValidate="TotalStorageQuota"><CP:ResourceControl runat="server" ResourceName="CP_RequireNumber" /></asp:regularexpressionvalidator></TD>
    </TR>
</TABLE>