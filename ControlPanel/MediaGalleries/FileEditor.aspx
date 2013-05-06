<%@ Page language="c#" Codebehind="FileEditor.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.FileEditor" MasterPageFile="~/ControlPanel/Masters/MediaGalleries.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server"><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_FileEditor_Title" /></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <script type="text/javascript" src="<%= ResolveUrl("~/ControlPanel/Utility/autoresize.jquery.min.js") %>"></script>
    <script type="text/javascript">
        jQuery(function ($) {
            var subjectInput = $('[id$="PostSubject"]');
            var saveButtons = $('.PanelSaveButton a');
            if (subjectInput.length > 0 && saveButtons.length > 0) {
                subjectInput.attr('maxlength', 256);
                subjectInput.evolutionComposer({
                    plugins: ['hashtags']
                });
                saveButtons.bind('click', function (e) {
                    subjectInput.val(subjectInput.evolutionComposer('val'));
                    if (typeof (console) !== "undefined" && console.log)
                        console.log(e);
                });
            }
        });
    </script>

    <CP:ControlPanelSelectedNavigation SelectedNavItem="Files" runat="server" id="SelectedNavigation1" />

    <TEMedia:CreateEditMediaGalleryPostForm runat="server" ID="CreatePost"
        AddUpdateAttachmentModalId="UploadFile" 
        FilenameLabelId="FileName" 
        MediaGalleryPostBodyEditorId="PostBody" 
        MediaGalleryPostSubjectTextBoxId="PostSubject" 
        NoFileErrorMessageControlId="NoFilePanel" 
        PreviewMediaGalleryPostListId="PreviewList" 
        SubFormIds="PostTags" 
        SubmitButtonId="PostButton" 
        FileStorageQuotaExceededErrorMessageControlId="StorageQuotaExceededPanel" 
        FileCountQuotaExceededErrorMessageControlId="CountQuotaExceededPanel" 
        PublishedCheckBoxId="IsApproved"
        PublishedParentControlId="OptionsTab">
        <ModeratedSuccessActions>
            <TEControl:GoToSiteUrlAction runat="server" UrlName="mediaGalleries_ControlPanel_FileList">
                <Parameter1Template><TEMedia:MediaGalleryData runat="server" Property="SectionID" /></Parameter1Template>
            </TEControl:GoToSiteUrlAction>
        </ModeratedSuccessActions>
        <UnmoderatedSuccessActions>
            <TEControl:GoToSiteUrlAction runat="server" UrlName="mediaGalleries_ControlPanel_FileList">
                <Parameter1Template><TEMedia:MediaGalleryData runat="server" Property="SectionID" /></Parameter1Template>
            </TEControl:GoToSiteUrlAction>
        </UnmoderatedSuccessActions>
        <FormTemplate>

            <div id="NoFilePanel" class="CommonMessageError" runat="server" visible="False">
	            <TEControl:ResourceControl ResourceName="MediaGalleryPostAdmin_NoFileUploaded" ResourceFile="MediaGallery.xml" runat="server" />
            </div>
            
            <div id="StorageQuotaExceededPanel" class="CommonMessageError" runat="server" visible="False">
	            <TEControl:ResourceControl ResourceName="MediaGalleryPostAdmin_StorageQuotaExceeded" ResourceFile="MediaGallery.xml" runat="server" />
            </div>
            
            <div id="CountQuotaExceededPanel" class="CommonMessageError" runat="server" visible="False">
	            <TEControl:ResourceControl ResourceName="MediaGalleryPostAdmin_FileCountQuotaExceeded" ResourceFile="MediaGallery.xml" runat="server" />
            </div>


            <TWC:TabbedPanes id="EditorTabs" runat="server"
	            PanesCssClass="CommonPane"
	            TabSetCssClass="CommonPaneTabSet"
	            TabCssClasses="CommonPaneTab"
	            TabSelectedCssClasses="CommonPaneTabSelected"
	            TabHoverCssClasses="CommonPaneTabHover"
	            >
	            <TWC:TabbedPane runat="server">
		            <Tab><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_FileEditor_Tab_File" /></Tab>
		            <Content>
			            <div class="CommonFormFieldName">
				            <strong><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_FileEditor_FileOrUrlField" ID="Resourcelabel2"/></strong>
			            </div>
			            <div class="CommonFormField">
				            <asp:Label ID="FileName" Runat="server" />
				            <TEControl:Modal resourcename="CP_MediaGalleries_FileEditor_FileOrUrl_Upload" ResourceFile="ControlPanelResources.xml" ModalType="Link" ID="UploadFile" Runat="server" CssClass="CommonTextButton" Width="500" Height="300" />
			            </div>
			            <p />
			            <div class="CommonFormFieldName">
				            <strong><CP:ResourceControl id="tt" runat="Server" ResourceName="CP_MediaGalleries_FileEditor_TitleField" /></strong>
				            <asp:requiredfieldvalidator id="postSubjectValidator" runat="server" ControlToValidate="PostSubject">*</asp:requiredfieldvalidator>
			            </div>
			            <div class="CommonFormField">
				            <asp:TextBox id="PostSubject" CssClass="ControlPanelTextInput" MaxLength="256" runat="server" TextMode="MultiLine" Rows="1" />
			            </div>
			            <p />
			            <div class="CommonFormFieldName">
				            <strong><CP:ResourceControl id="Formlabel1" runat="Server" ResourceName="CP_MediaGalleries_FileEditor_BodyField" /></strong>
			            </div>
			            <div class="CommonFormField">
				            <TEControl:Editor runat="Server" id="PostBody" width="100%" columns="110" />
			            </div>
			            
			            <TEMedia:MediaGalleryPostTagsSubForm ID="PostTags" runat="server" 
	                        SelectTagsModalButtonId="SelectTags" 
	                        TagsTextBoxId="Tags">
	                        <FormTemplate>
                                <p />
	                            <div class="CommonFormFieldName">
		                            <strong><CP:ResourceControl runat="Server" ResourceName="CP_MediaGalleries_FileEditor_CategoriesField" /></strong><br />
		                            <cp:ResourceControl runat="Server" resourcename="CP_MediaGalleries_FileEditor_CategoriesField_Detail" />
	                            </div>
	                            <div class="CommonFormField">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                    <tr valign="top">
                                    <td>
                                        <asp:TextBox Columns="50" ID="Tags" runat="server" />
                                        &nbsp;&nbsp;<CP:Modal modaltype="Button" width="400" height="300" runat="Server" id="SelectTags" ResourceName="TagEditor_SelectTags" />
                                    </td>
                                    </tr>
                                    </table>
                                </div>
	                        </FormTemplate>
	                    </TEMedia:MediaGalleryPostTagsSubForm>
		            </Content>
	            </TWC:TabbedPane>
	            <TWC:TabbedPane runat="server" ID="OptionsTab">
		            <Tab><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_FileEditor_Tab_Options" /></Tab>
		            <Content>
			            <table cellspacing="0" cellpadding="0" border="0">
				            <tr>
					            <td class="CommonFormFieldName">
						            <strong><cp:ResourceControl id="Formlabel6" runat="Server" resourcename="CP_MediaGalleries_FileEditor_Published" /></strong><br />
						            <cp:ResourceControl runat="Server" resourcename="CP_MediaGalleries_FileEditor_Published_Detail" />
					            </td>
					            <td class="CommonFormField">
					                <TEControl:YesNoCheckBox ID="IsApproved" runat="server" />
					            </td>
				            </tr>
			            </table>
		            </Content>
	            </TWC:TabbedPane>
	            <TWC:TabbedPane runat="server">
		            <Tab OnClickClientFunction="Preview"><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_FileEditor_Tab_Preview" /></Tab>
		            <Content>
			            <script type="text/javascript">
	                    // <![CDATA[
	                        function Preview()
	                        {
	                            document.getElementById('previewloading').style.display = 'block';
	                            <%# ((CreateEditMediaGalleryPostForm) MediaGalleryControlUtility.Instance().FindControl(this, "CreatePost")).GetPreviewScript("PreviewCallback();") %>
	                        }
		                    
	                        function PreviewCallback()
	                        {
	                            document.getElementById('previewloading').style.display = 'none';
	                        }
	                    // ]]>
	                    </script>
                    
                        <div id="previewloading" style="display:none"><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="Loading" /> <img src = "<%=Telligent.Evolution.Components.SiteUrls.Instance().LoadingImageUrl%>"/></div>
                        <TEMedia:MediaGalleryPostList runat="server" ID="PreviewList">
                            <ItemTemplate>
                                <h3><TEMedia:MediaGalleryPostData runat="server" Property="Subject" /></h3>
                                <TEMedia:MediaGalleryPostViewer runat="server" ViewType="View" Width="400" Height="300" Tag="Div" style="width: 400px; margin: 1em 0;" />
                                <TEMedia:MediaGalleryPostData Property="FormattedBody" runat="server" />
                            </ItemTemplate>
                        </TEMedia:MediaGalleryPostList>
		            </Content>
	            </TWC:TabbedPane>
            </TWC:TabbedPanes>

            <p class="PanelSaveButton DetailsFixedWidth">
	            <cp:ResourceLinkButton id="PostButton" runat="Server" CssClass="CommonTextButtonBig" ResourceName="Save"></cp:ResourceLinkButton>
            </p>
        </FormTemplate>
    </TEMedia:CreateEditMediaGalleryPostForm>

</asp:Content>