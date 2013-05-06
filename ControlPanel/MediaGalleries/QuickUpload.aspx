<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuickUpload.aspx.cs" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.QuickUpload" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>


<asp:Content ContentPlaceHolderId="bcr" runat="server">
	<div class="CommonContentArea">
		<div class="CommonContent">
		
		    <script type="text/javascript">
    		    
                function disableSave()
                {
                    document.getElementById('<%= Telligent.Evolution.MediaGalleries.Controls.MediaGalleryControlUtility.Instance().FindControl(this, "Save").ClientID  %>').disabled = true;
                }
    	        
                function enableSave()
                {
                    document.getElementById('<%= Telligent.Evolution.MediaGalleries.Controls.MediaGalleryControlUtility.Instance().FindControl(this, "Save").ClientID  %>').disabled = false;
                }
    	    
            </script>
		    
		    <TEMedia:CreateMultipleMediaGalleryPostsForm runat="server" 
		        FileCountQuotaExceededErrorMessageControlId="CountQuotaExceededPanel" 
		        FileStorageQuotaExceededErrorMessageControlId="StorageQuotaExceededPanel" 
		        MultipleFileUploadId="Files" 
		        NoFileErrorMessageControlId="NoFilePanel" 
		        SubmitButtonId="Save">
		        <ModeratedSuccessActions>
		            <TEControl:ExecuteScriptAction runat="server" Script="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(true);" />
		        </ModeratedSuccessActions>
		        <UnmoderatedSuccessActions>
		            <TEControl:ExecuteScriptAction runat="server" Script="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(true);" />
		        </UnmoderatedSuccessActions>
		        <FormTemplate>
		            <div class="CommonFormDescription">
		                <CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_MultipleUpload_Description" />
		            </div>
		        
		            <div id="NoFilePanel" class="CommonMessageError" runat="server" visible="False">
	                    <TEControl:ResourceControl ResourceName="MediaGalleryPostAdmin_NoFileUploaded" ResourceFile="MediaGallery.xml" runat="server" />
                    </div>
                    
                    <div id="StorageQuotaExceededPanel" class="CommonMessageError" runat="server" visible="False">
	                    <TEControl:ResourceControl ResourceName="MediaGalleryPostAdmin_StorageQuotaExceeded" ResourceFile="MediaGallery.xml" runat="server" />
                    </div>
                    
                    <div id="CountQuotaExceededPanel" class="CommonMessageError" runat="server" visible="False">
	                    <TEControl:ResourceControl ResourceName="MediaGalleryPostAdmin_FileCountQuotaExceeded" ResourceFile="MediaGallery.xml" runat="server" />
                    </div>

                    <div class="CommonFormFieldName">
		                <TWC:MultipleFileUpload runat="server" ID="Files" Width="95%" Height="130px" AutoUpload="true" OnUploadErrorClientFunction="enableSave" OnUploadingCompleteClientFunction="enableSave" OnUploadingStartedClientFunction="disableSave" AllowedNumberOfFiles="25" />
                    </div>
		        
		            <p class="PanelSaveButton DetailsFixedWidth">
		                <CP:ResourceButton runat="server" ResourceName="Save" ID="Save" />
		                <CP:ResourceButton runat="server" ResourceName="Cancel" OnClientClick="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close();" />
		            </p>
		        
		        </FormTemplate>
		    </TEMedia:CreateMultipleMediaGalleryPostsForm>
		
		</div>
	</div>
</asp:Content>