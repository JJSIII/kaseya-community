<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="WidgetAddFiles.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Tools.WidgetAddFiles" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ID="Content1" ContentPlaceHolderId="bcr" runat="server">

	<TEControl:JQuery ID="JQuery1" runat="server" /> 	
    <script type="text/javascript">
        (function ($) {
            $.extend(this, {
                uploadError: function (error) { alert(error); },
                uploadComplete: function () {
                    window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close('<%= MultiUpload.UploadContext %>');
                },
                uploadStarted: function () { }
            });
        } (jQuery));        
    </script>

	<div class="field-list-header"></div>
	<fieldset class="field-list">        
		<ul class="field-list">
			<li class="field-item file" id="LocalLinkArea" runat="server">
                <cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_UploadAttachment_Description" />
				<span class="field-item-input">
                    <TWC:MultipleFileUpload ID="MultiUpload" runat="server" OnUploadErrorClientFunction="uploadError" OnUploadingCompleteClientFunction="uploadComplete" OnUploadingStartedClientFunction="uploadStarted" AutoUpload="true" Width="600" Height="200" />
				</span>
				<span class="field-item-validation" style="display: none;"></span>
			</li>
		</ul>
	</fieldset>
	<div class="field-list-footer"></div>

</asp:Content>