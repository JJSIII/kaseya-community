<%@ Page language="c#" Codebehind="Settings.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleryAdmin.Settings" MasterPageFile="~/ControlPanel/Masters/MediaGalleryAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl id="SectionDescription" runat="server" ResourceName="CP_MediaGalleryAdmin_Settings_Title"></CP:ResourceControl>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="MediaGallerySettings" />

	<DIV class="CommonDescription">
        <CP:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_Settings_Description" /> 
    </DIV>

	<CP:StatusMessage id="Status" runat="server" visible="false"></CP:StatusMessage>
	
	<asp:PlaceHolder runat="server" ID="NotSupportedHolder" Visible="false">
	    <div class="CommonMessageWarning">
	        <CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryViewType_NotSupported" />
        </div>
	</asp:PlaceHolder>
	
	<asp:PlaceHolder id="OptionHolder" runat="Server">
        <table cellspacing="0" cellpadding="0" border="0">
            <tr>
	            <td class="CommonFormFieldName">
		            <strong><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_Settings_ViewModeOverride" /></strong><br />
		            <cp:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_Settings_ViewModeOverride_Help" /></td>
	            <td class="CommonFormField">
	                <TEControl:YesNoCheckBox runat="server" ID="EnableOverrideViewModeCheckBox" />
		        </td>
            </tr>
            <tr>
	            <td class="CommonFormFieldName">
		            <strong><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_Settings_ViewMode" /></strong><br />
		            <cp:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_Settings_ViewMode_Help" /></td>
	            <td class="CommonFormField">
		            <asp:DropDownList runat="server" ID="ViewModeDropDown" />
		        </td>
            </tr>
			<tr>
				<td class="CommonFormFieldName">
					<strong><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_Settings_BlogFileStorageExtensions" /></strong><br />
					<cp:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_Settings_BlogFileStorageExtensions_Help" />
				</td>
				<td class="CommonFormField">
					<asp:TextBox id="MediaGalleryFileStorageExtensions" runat="Server" cssclass="ControlPanelTextInput" Width="400" Columns="60" Rows="5" TextMode="MultiLine" Wrap="true" />
				</td>
			</tr>
        </table>
	</asp:PlaceHolder>
	
	<P style="text-align: right">
		<cp:ResourceButton id="Save" runat="Server" ResourceName="Save" />
	</P>
</asp:Content>