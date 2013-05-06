<%@ Page language="c#" Codebehind="TitleAndDescriptionOptions.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.TitleAndDescriptionOptions" MasterPageFile="~/ControlPanel/Masters/MediaGalleries.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl ResourceName="CP_MediaGalleries_TitleAndDescriptionOptions_Title" runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="TitleAndDescriptionOptions" runat="server" id="SelectedNavigation1" />
	<CP:StatusMessage runat="server" id="Status" />
	<div class="CommonDescription">
		<CP:ResourceControl ResourceName="CP_MediaGalleries_TitleAndDescriptionOptions_Description" runat="server" />
	</div>
	
	<div class="FixedWidthContainer">
		<div class="CommonFormFieldName">
			<strong><CP:FormLabel runat="server" ResourceName="CP_MediaGalleries_TitleAndDescriptionOptions_TitleField" ControlToLabel="GalleryTitle" id="FormLabel1" /></strong>
		</div>
		<div class="CommonFormField">
			<asp:TextBox Runat="Server" id="GalleryTitle" CssClass="ControlPanelTextInput" />
		</div>
		
		<p />
		<div class="CommonFormFieldName">
			<strong><CP:FormLabel runat="server" ResourceName="CP_MediaGalleries_TitleAndDescriptionOptions_DescriptionField" ControlToLabel="Description"/></strong><br />
			<CP:ResourceControl ResourceName="CP_MediaGalleries_TitleAndDescriptionOptions_DescriptionField_Help" runat="server" />
		</div>
		<div class="CommonFormField">
		    <asp:TextBox id="Description" Runat="Server" CssClass="ControlPanelTextInput" rows="3" MaxLength="256" />
		    <div>
		        <asp:customvalidator id="DescriptionValidator" runat="server" controltovalidate="Description" font-bold="True">
				    <CP:ResourceControl runat="server" ResourceName="CP_DescriptionLengthValidation" /></asp:customvalidator>
			</div>
		</div>
	</div>
	<p class="PanelSaveButton DetailsFixedWidth">
			<cp:ResourceLinkButton id="SaveButton" runat="Server" CssClass="CommonTextButton" ResourceName="Save"></cp:ResourceLinkButton>
		</p>
</asp:Content>