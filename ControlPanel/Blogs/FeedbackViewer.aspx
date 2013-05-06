<%@ Page language="c#" Codebehind="FeedbackViewer.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.FeedbackViewer" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
    <script type = "text/javascript">
        function closeModal()
        {
            window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(true);
        }
    </script>
	<div class="CommonContentArea">
		<div class="CommonContent">
			<div class="CommonFormFieldName">
				Subject:
			</div>
			<div class="CommonFormField">
				<strong><asp:Literal runat="server" ID="TitleLiteral" /></strong>
			</div>
			<div class="CommonFormFieldName">
			    Message Body:
			</div>
			<div class="CommonFormField">
				<strong><asp:Literal runat="server" ID="BodyLiteral" /></strong>
			</div>
			<div class="CommonFormFieldName">
				By:  <strong><asp:Literal runat="server" ID="AuthorLiteral" /></strong> on
				<strong><asp:Literal runat="server" ID="CreationDateLiteral" /></strong>
			</div>
	        <div class="CommonFormField PanelSaveButton">
	            <a class="CommonTextButton" href="javascript: closeModal();"><%= Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Feedback_Ok", "ControlPanelResources.xml")%></a>
	        </div>
	        
		</div>
	</div>
</asp:Content>