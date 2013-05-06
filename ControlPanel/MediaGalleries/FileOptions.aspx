<%@ Page language="c#" Codebehind="FileOptions.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.FileOptions" MasterPageFile="~/ControlPanel/Masters/MediaGalleries.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_FileOptions_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="FileOptions" runat="server" id="SelectedNavigation1" />
	<div class="CommonDescription">
			<CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_FileOptions_Description" />
	</div>
	<CP:StatusMessage runat="server" id="Status" />
	
	<div class="FixedWidthContainer">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td class="CommonFormFieldName">
					<strong><CP:ResourceControl runat="Server" ResourceName="CP_MediaGalleries_FileOptions_ModerateFiles" /></strong><br />
					<cp:ResourceControl runat="Server" resourcename="CP_MediaGalleries_FileOptions_ModerateFiles_Help" />
				</td>
				<td class="CommonFormField"><cp:YesNoRadioButtonList id="ModerateMediaGalleries" runat="server"  RepeatColumns="2" /></td>
			</tr>
			<tr>
				<td class="CommonFormFieldName">
					<strong><cp:resourcecontrol runat="Server" resourcename="CP_MediaGalleries_FileOptions_EnableFileNotifications" /></strong><br />
					<cp:ResourceControl runat="Server" resourcename="CP_MediaGalleries_FileOptions_EnableFileNotifications_Help" />
				</td>
				<td class="CommonFormField"><cp:YesNoRadioButtonList id="EnableFileNotification" runat="server"  RepeatColumns="2" /></td>
			</tr>
			<tr>
				<td class="CommonFormFieldName">
					<strong><CP:FormLabel runat="Server" ResourceName="CP_MediaGalleries_FileOptions_EnableRatings" /></strong><br />
					<cp:ResourceControl runat="Server" resourcename="CP_MediaGalleries_FileOptions_EnableRatings_Help" />
				</td>
				<td class="CommonFormField"><cp:YesNoRadioButtonList id="EnableRatings" runat="server"  RepeatColumns="2" /></td>
			</tr>
			<tr>
				<td class="CommonFormFieldName">
					<strong><CP:ResourceControl runat="Server" ResourceName="CP_MediaGalleries_FileOptions_EnableComments" /></strong><br />
					<cp:ResourceControl runat="Server" resourcename="CP_MediaGalleries_FileOptions_EnableComments_Help" />
				</td>
				<td class="CommonFormField"><cp:YesNoRadioButtonList id="EnableComments" runat="server"  RepeatColumns="2" /></td>
			</tr>
			<tr>
				<td class="CommonFormFieldName">
					<strong><CP:ResourceControl runat="Server" ResourceName="CP_MediaGalleries_FileOptions_ModerateComments" /></strong><br />
					<cp:ResourceControl runat="Server" resourcename="CP_MediaGalleries_FileOptions_ModerateComments_Help" />
				</td>
				<td class="CommonFormField"><cp:YesNoRadioButtonList id="ModerateComments" runat="server"  RepeatColumns="2" /></td>
			</tr>
			<tr>
				<td class="CommonFormFieldName">
					<strong><cp:resourceControl runat="Server" resourcename="CP_MediaGalleries_FileOptions_EnableCommentNotifications" /></strong><br />
					<cp:ResourceControl runat="Server" resourcename="CP_MediaGalleries_FileOptions_EnableCommentNotifications_Help" />
				</td>
				<td class="CommonFormField"><cp:YesNoRadioButtonList id="EnableCommentNotification" runat="server"  RepeatColumns="2" /></td>
			</tr>
		</table>
	</div>
	<p class="PanelSaveButton DetailsFixedWidth">
		<cp:ResourceLinkButton id="SaveButton" runat="Server" CssClass="CommonTextButton" ResourceName="Save"></cp:ResourceLinkButton></p>
</asp:Content>