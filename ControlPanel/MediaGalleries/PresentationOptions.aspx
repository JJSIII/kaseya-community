<%@ Page language="c#" Codebehind="PresentationOptions.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.PresentationOptions" MasterPageFile="~/ControlPanel/Masters/MediaGalleries.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_PresentationOptions_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="PresentationOptions" runat="server" />
	<div class="CommonDescription">
		<CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_PresentationOptions_Description" />
	</div>
	<CP:StatusMessage runat="server" id="Status" />
	
	<asp:PlaceHolder runat="server" ID="NotSupportedHolder" Visible="false">
	    <div class="CommonMessageWarning">
	        <CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryViewType_NotSupported" />
        </div>
	</asp:PlaceHolder>
	
	<asp:PlaceHolder id="OptionHolder" runat="Server">
	    <div class="FixedWidthContainer">
		    <table cellspacing="0" border="0" cellpadding="0">
		        <tr>
		            <td class="CommonFormFieldName">
			            <strong><CP:ResourceControl runat="Server" ResourceName="CP_MediaGalleries_PresentationOptions_ViewMode" /></strong><br />
			            <CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_PresentationOptions_ViewMode_Help" />
		            </td>
		            <td class="CommonFormField">
			            <asp:DropDownList runat="server" ID="ViewModeDropDown" />
		            </td>
		        </tr>
		    </table>
	    </div>
    </asp:PlaceHolder>
	    
	<p class="PanelSaveButton DetailsFixedWidth">
			<cp:ResourceLinkButton id="SaveButton" runat="Server" CssClass="CommonTextButton" ResourceName="Save"></cp:ResourceLinkButton>
	</p>
</asp:Content>