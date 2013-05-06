<%@ Page language="c#" Codebehind="CommentEditor.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.CommentEditor" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
    <script type = "text/javascript">
        function closeModal()
        {
            window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(true);
        }
    </script>
	<div class="CommonContentArea">
		<div class="CommonContent">
			<div class="CommonFormField">
				<TEControl:editor runat="Server" id="Comment" width="500" height="125" />
			</div>
			<div class="CommonFormFieldName">
				<strong><CP:ResourceControl resourcename="CP_Blog_Comments_FeedbackEditor_By" runat="Server" id="FeedbackEditor_UserName" /></strong>
			</div>
			<div class="CommonFormField">
				<asp:textbox runat="server" id="UserName" cssclass="ControlPanelTextInput" width="500" />
			</div>
			<div class="CommonFormField">
				<asp:checkbox runat="Server" id="Approved" />
			</div>
	        <div class="CommonFormField PanelSaveButton">
	            <CP:ResourceLinkButton ResourceName="CP_Blog_Comments_FeedbackEditor_Save" id="PublishButton" runat="server" CssClass="CommonTextButton" />
	            <a class="CommonTextButton" href="javascript: closeModal();"><%= Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_Comments_FeedbackEditor_Cancel", "ControlPanelResources.xml")%></a>
	        </div>
	        
		</div>
	</div>
</asp:Content>