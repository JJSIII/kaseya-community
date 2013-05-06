<%@ Page language="c#" Codebehind="CategoryForm.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.CategoryForm" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
	<script type="text/javascript">
	function closeModal()
	{
	    window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(true);
	}
	</script>
	
	<div class="CommonContentArea">
		<div class="CommonContent">
			<p>
			<div class="CommonFormFieldName">
				<CP:FormLabel id="tt" runat="Server" ResourceName="CP_MediaGalleries_CategoryForm_Name" ControlToLabel="CategoryName"></CP:FormLabel>
				<asp:RequiredFieldValidator id="RequiredFieldValidator1"  Display="Dynamic" ControlToValidate="CategoryName"
					Runat="server"></asp:RequiredFieldValidator>
			</div>
			<div class="CommonFormField">
				<asp:TextBox id="CategoryName" Runat="server" MaxLength="256"></asp:TextBox>
			</div>
			</p>
			<p>
				<div class="CommonFormField">
					<CP:ResourceButton id="Button1" ResourceName="Save" Runat="server" />
				</div>
			</p>
		</DIV>
	</DIV>
</asp:Content>