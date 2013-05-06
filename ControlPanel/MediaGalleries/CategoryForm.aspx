<%@ Page language="c#" Codebehind="CategoryForm.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.CategoryForm" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
	<script type="text/javascript">
	// <![CDATA[
	function closeModal()
	{
	    window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(true);
	}
	// ]]>
	</script>
	<div class="CommonContentArea">
		<div class="CommonContent">
			<div class="CommonFormFieldName">
				<strong><CP:FormLabel id="tt" runat="Server" ResourceName="CP_MediaGalleries_CategoryForm_Name" ControlToLabel="CategoryName"></CP:FormLabel></strong>
				<asp:RequiredFieldValidator id="RequiredFieldValidator1"  Display="Dynamic" ControlToValidate="CategoryName"
					Runat="server"></asp:RequiredFieldValidator></div>
			<div class="CommonFormField">
				<asp:TextBox id="CategoryName" Runat="server" MaxLength="256" CssClass="ControlPanelTextInput"></asp:TextBox></div>
				<div class="CommonFormField PanelSaveButton">
					<CP:ResourceLinkButton id="Button1" ResourceName="Save" Runat="server"  CssClass="CommonTextButton"></CP:ResourceLinkButton></div>
		</div>
	</div>
</asp:Content>