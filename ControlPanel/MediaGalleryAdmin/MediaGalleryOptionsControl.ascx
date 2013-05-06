<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MediaGalleryOptionsControl.ascx.cs" Inherits="Telligent.Evolution.ControlPanel.MediaGalleryAdmin.MediaGalleryOptionsControl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<table cellspacing="1" cellpadding="2" width="550px" border="0" id="AdvancedProperties"
	runat="server">
	<tr>
		<td class="CommonFormFieldName">
			<strong><CP:resourcecontrol runat="Server" ResourceName="CP_MediaGalleries_MediaGalleryOptionsControl_EnableExternalLinks" /></strong><br />
			<cp:ResourceControl runat="Server" resourcename="CP_MediaGalleries_MediaGalleryOptionsControl_EnableExternalLinks_Detail" />
		</td>
		<td class="CommonFormField">
			<cp:yesnoradiobuttonlist id="EnableExternalLinks" runat="server" repeatcolumns="2"  />
		</td>
	</tr>
	<tr>
		<td class="CommonFormFieldName">
			<strong><CP:ResourceControl runat="Server"  ResourceName="CP_MediaGalleries_MediaGalleryOptionsControl_EnableDownloadDisclaimer" /></strong><br />
			<cp:ResourceControl runat="Server" resourcename="CP_MediaGalleries_MediaGalleryOptionsControl_EnableDownloadDisclaimer_Detail" />
		</td>
		<td class="CommonFormField">
			<cp:yesnoradiobuttonlist id="EnableDownloadDisclaimer" runat="server" repeatcolumns="2"  />
		</td>
	</tr>
</table>

<div class="CommonFormFieldName">
	<strong><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_MediaGalleryOptionsControl_AllowedFileExtensions" /></strong><br />
	<cp:ResourceControl runat="Server" resourcename="CP_MediaGalleries_MediaGalleryOptionsControl_AllowedFileExtensions_Detail" />
</div>
<div class="CommonFormField">
	<asp:TextBox Runat="Server" id="AllowedFileExtensions" TextMode="MultiLine" CssClass="ControlPanelTextInput" Height="100" />
</div>

<p />
<div class="CommonFormFieldName">
	<strong><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_MediaGalleryOptionsControl_RestrictedFileExtensions" /></strong><br />
	<cp:ResourceControl runat="Server" resourcename="CP_MediaGalleries_MediaGalleryOptionsControl_RestrictedFileExtensions_Detail" />
</div>
<div class="CommonFormField">
	<asp:TextBox Runat="Server" id="RestrictedFileExtensions" TextMode="MultiLine" CssClass="ControlPanelTextInput" Height="100" />
</div>