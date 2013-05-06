<%@ Page language="c#" Codebehind="SyndicationOptions.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.SyndicationOptions" MasterPageFile="~/ControlPanel/Masters/MediaGalleries.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_SyndicationOptions_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="SyndicationOptions" runat="server" id="SelectedNavigation1" />
	<div class="CommonDescription">
		<CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_SyndicationOptions_Description" />
	</div>
	<CP:StatusMessage runat="server" id="Status" />
	
	<div class="FixedWidthContainer">
		<table cellspacing="0" border="0" cellpadding="0">
            <asp:PlaceHolder id="RssNotAllowedLicensingHolder" runat="Server">
				<tr>
					<td class="CommonFormFieldName">&nbsp;</td>
					<td class="CommonFormField"><cp:resourcecontrol id="RssNotAllowedLicensing" visible="false" runat="server" Tag="div" CssClass="CommonLicenseRestrictionMessage" resourcename="CP_Settings_RssNotAllowedLicensing" /></td>
				</tr>
			</asp:PlaceHolder>
		    <tr>
    		    <td class="CommonFormFieldName">
	    		    <CP:FormLabel runat="Server" ResourceName="CP_MediaGalleries_SyndicationOptions_EnableRssSyndication" ControlToLabel="EnableRssSyndication" ID="Formlabel3"/>
		        </td>
		        <td class="CommonFormField">
			        <asp:CheckBox Runat="Server" ID="EnableRssSyndication" />
    		    </td>
		    </tr>
		    <tr>
	    	    <td class="CommonFormFieldName">
		    	    <CP:FormLabel runat="Server" ResourceName="CP_MediaGalleries_SyndicationOptions_EnableTagsRssSyndication" ControlToLabel="EnableTagsRssSyndication" ID="Formlabel1"/>
    		    </td>
	    	    <td class="CommonFormField">
		    	    <asp:CheckBox Runat="Server" ID="EnableTagsRssSyndication" />
    		    </td>
		    </tr>
		</table>
	</div>
	<p class="PanelSaveButton DetailsFixedWidth">
	<cp:ResourceLinkButton id="SaveButton" runat="Server" CssClass="CommonTextButton" ResourceName="Save"></cp:ResourceLinkButton></p>
</asp:Content>