<%@ Page language="c#" Codebehind="PostEditor.aspx.cs" AutoEventWireup="true" Inherits="Telligent.Evolution.ControlPanel.Blogs.PostEditorPage" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>
<%@Import Namespace="Telligent.Evolution.Blogs.Components" %>
<%@Import Namespace="Telligent.Evolution.Blogs.Controls" %>

<script runat="server">
    
    protected override void  OnLoad(EventArgs e)
    {
 	    base.OnLoad(e);

        WeblogConfiguration config = WeblogConfiguration.Instance();
        Literal defaultTags = WeblogControlUtility.Instance().FindControl(this, "DefaultTags") as Literal;
        Control defaultTagsContainer = WeblogControlUtility.Instance().FindControl(this, "DefaultTagsContainer");
        if (config.DefaultAggregateTags != null && config.DefaultAggregateTags.Length > 0)
        {
            defaultTagsContainer.Visible = true;
            foreach (string tag in config.DefaultAggregateTags)
            {
                if (defaultTags.Text.Length > 0)
                    defaultTags.Text += "; ";

                defaultTags.Text += tag;
            }
        }
        else
        {
            defaultTagsContainer.Visible = false;
        }

        WeblogPost post = WeblogControlUtility.Instance().GetCurrentWeblogPost(this);
        if (post != null && post.IsApproved)
            SaveDraftButton.Text = Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Blogs_CreateEditBlogPost_UnpublishAndSaveAsDraft");
        else
            SaveDraftButton.Text = Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Blogs_CreateEditBlogPost_SaveAsDraft");
    }

    public void PostSaved(Control sender, object parameter)
    {
        WeblogPost post = parameter as WeblogPost;
        CheckBox continueWriting = WeblogControlUtility.Instance().FindControl(this, "ContinueWriting") as CheckBox;
		if (continueWriting != null && continueWriting.Checked)
        {
			Response.Redirect(BlogUrls.Instance().PostEditor(CurrentWeblog.SectionID, post.PostID));
        }
        else if (post != null && post.IsApproved)
        {
        	Response.Redirect(BlogUrls.Instance().Post(post));
        }
		else
		{
			Response.Redirect(BlogUrls.Instance().ControlPanel_PostList(CurrentWeblog.SectionID));
		}
    }
    
</script>


<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
    <script type="text/javascript" src="<%= ResolveUrl("~/ControlPanel/Utility/autoresize.jquery.min.js") %>"></script>
    <script type="text/javascript">
        jQuery(function ($) {
            var subjectInput = $('[id$="PostSubject"]');
            var saveButtons = $('.PanelSaveButton a');
            if (subjectInput.length > 0 && saveButtons.length > 0) {
                subjectInput.attr('maxlength',256);
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
	<CP:ResourceControl id="PageTitle" runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation id="SelectedNavigation1" runat="server" SelectedNavItem="Posts" />
    <div class="CommonDescription" style="display: none;">
		<CP:ResourceControl id="Description" runat="server" />
    </div>
    
	<TEControl:JQuery runat="server" />
	
	<TEBlog:CreateEditWeblogPostForm runat="server" ID="CreatePost" 
	    CommentModerationDropDownListId="ModerationDDL" 
	    CustomValidatorId="PostValidator" 
	    EnableAllOwnerNotificationCheckBoxId="ynNotifyAllOwners" 
	    EnableCrossPostingCheckBoxId="ynEnableCrossPosting" 
	    EnableRatingsCheckBoxId="ynEnableRatings" 
	    EnableTrackBacksCheckBoxId="ynEnableTrackbacks" 
	    FeedbackNotificationDropDownListId="NotificationType" 
	    IsAggregatedCheckBoxId="ynAggregatePost" 
	    IsCommunityAggregatedCheckBoxId="ynCommunity" 
	    EnableCommentsCheckBoxId="ynEnableReplies" 
	    IsPublishedCheckBoxId="Publish" 
	    PostBodyEditorId="PostBody" 
	    PostDateDateTimeSelectorId="DatePicker" 
	    PostExcerptEditorId="postExcerpt" 
	    PostNameTextBoxId="postName" 
	    PostSubjectTextBoxId="PostSubject" 
	    PreviewWeblogPostListId="PreviewList" 
	    SubFormIds="PostTags,PostAttachment" 
	    SubmitButtonId="SaveButton" 
	    SyndicateExcerptCheckBoxId="ynSyndicateExcerpt"
	    FeaturedContentCheckBoxId="FeaturedPost"
	    FeaturedImageUrlControlId="FeaturedImage">
	    <SuccessActions>
	        <TEControl:CustomAction runat="server" OnCustomEvent="PostSaved" />
	    </SuccessActions>
	    <FormTemplate>
	        <div style="display: none;">
	            <asp:CheckBox runat="server" ID="ContinueWriting" />
	            <asp:CheckBox runat="server" ID="Publish" />
	        </div>
	
            <asp:ValidationSummary Runat = "server" ID="valSummary" HeaderText='<%# Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Blogs_CreateEditBlogPost_Errors") %>' />

            <TWC:TabbedPanes id="EditorTabs" runat="server"
                PanesCssClass="CommonPane"
                TabSetCssClass="CommonPaneTabSet"
                TabCssClasses="CommonPaneTab"
                TabSelectedCssClasses="CommonPaneTabSelected"
                TabHoverCssClasses="CommonPaneTabHover"
                >
                <TWC:TabbedPane runat="server">
	                <Tab><CP:ResourceControl resourcename="CP_BlogContentEditor_Write" runat = "Server" /></Tab>
	                <Content>
		                <div class="CommonFormField">
			                <strong><cp:formlabel id="tt" runat="Server" controltolabel="PostSubject" resourcename="Weblog_CreateEditBlogPost_Title" /></strong> &nbsp;
			                <asp:textbox id="PostSubject" cssclass="ControlPanelTextInputBig" maxlength="256" runat="server" TextMode="MultiLine" Rows="1" />
			                <asp:requiredfieldvalidator id="postSubjectValidator" runat="server" controltovalidate="PostSubject" Display ="Dynamic" ErrorMessage ="A post title is required" >*</asp:requiredfieldvalidator>
		                </div>
		                <div class="CommonFormFieldName">
			                <asp:requiredfieldvalidator id="postBodyValidator" display="Dynamic" runat="server"
				                controltovalidate="PostBody" ErrorMessage="Please add some content">*<br /></asp:requiredfieldvalidator>
		                </div>
		                <div class="CommonFormField">
			                <TEControl:editor runat="Server" id="PostBody" width="100%" />
		                </div>
		                
		                <TEBlog:WeblogPostTagsSubForm ID="PostTags" runat="server" 
		                    SelectTagsModalButtonId="SelectTags" 
		                    TagsTextBoxId="Tags">
		                    <FormTemplate>
                                <p />
                                <div class="CommonFormFieldName post-tags">
                                    <cp:formlabel id="Formlabel3" runat="Server" resourcename="Weblog_CreateEditBlogPost_Categories" />
                                </div>
                                <div class="CommonFormField">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                    <tr valign="top">
                                    <td>
                                        <asp:TextBox Columns="50" ID="Tags" runat="server" />
                                        &nbsp;&nbsp;<CP:Modal modaltype="Button" width="400" height="300" runat="server" id="SelectTags" ResourceName="TagEditor_SelectTags" />
                                    </td>
                                    </tr>
                                    </table>
                                </div>
                                <p id="DefaultTagsContainer" runat="server">
                                    <cp:resourcecontrol runat="server" resourcename="CP_Blogs_CreateEditBlogPost_DefaultTagsNotice" /><br />
                                    <asp:literal id="DefaultTags" runat="server" />
                                </p>
		                    </FormTemplate>
		                </TEBlog:WeblogPostTagsSubForm>
		                
		               
                        <TEBlog:WeblogPostAttachmentSubForm ID="PostAttachment" runat="server"
                            AddUpdateAttachmentModalId="AttachmentModal"
                            FilenameLabelId="serverfilename"
                            RemoveAttachmentButtonId="RemoveAttachment">
                            <FormTemplate>
                                <p>
                                <div class="CommonFormFieldName">
                                    <strong><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_Blogs_PostFileAttachment" /></strong>
                                    <br />
                                    <CP:ResourceControl runat="server" ResourceName="CP_Blogs_PostFileAttachmentDesc" />
                                </div>
                                
                                <div class="CommonFormField">
                                    <asp:Label Columns="50" ID="serverfilename" runat="server" />&nbsp;&nbsp;
                                    <CP:Modal modaltype="Button" url='<%# BlogUrls.Instance().UploadAttachment(CurrentWeblog.SectionID) %>' width="640" height="240" runat="Server" callback="getAttachmentData" resourcename="CP_Blogs_CreateEditBlogPost_File" id="AttachmentModal" />
                                    <CP:resourcebutton runat="server" id="RemoveAttachment" ResourceName="CP_Blogs_CreateEditBlogPost_RemoveAttachement"/>
                                </div>
                                </p>                                
                            </FormTemplate>
                        </TEBlog:WeblogPostAttachmentSubForm>
                        
		                <p />
	                </Content>
                </TWC:TabbedPane>

                <TWC:TabbedPane runat="server">
	                <Tab><CP:ResourceControl resourcename="CP_BlogContentEditor_Options" runat="Server" /></Tab>
	                <Content>
            		    
                        <table width="100%">
                            <tr>
                                <td colspan="2">
                                    <div class="CommonFormSubTitle"><cp:resourcecontrol ID="Resourcecontrol11" runat="server" resourcename="CP_Blogs_SubTitle_Reader_Feedback" /></div>
                                </td>
                            </tr>

                            <tr>
                                <td class="CommonFormFieldName">
			                            <cp:formlabel ID="Formlabel6" runat="Server" controltolabel="ynEnableReplies" resourcename="Weblog_CreateEditBlogPost_AllowReplies" />
                                </td>
                                
                                <td class="CommonFormField">
		                                <TEControl:YesNoCheckBox ID="ynEnableReplies" runat="server" />
	                            </td>
                            </tr>
                            
                            <tr>
                                <td class="CommonFormFieldName">
			                            <cp:formlabel ID="Formlabel5" runat="Server" controltolabel="ModerationDDL" resourcename="Weblog_CreateEditBlogPost_ModerateComments" />
                                </td>
                                
                                <td class="CommonFormField">
		                                <asp:DropDownList runat="server" id="ModerationDDL" />
                                </td>
                            </tr>

                            <tr>
                                <td class="CommonFormFieldName">
			                            <cp:formlabel ID="Formlabel7" runat="Server" controltolabel="ynEnableRatings" resourcename="Weblog_CreateEditBlogPost_EnableRatings" />
                                </td>
                                
                                <td class="CommonFormField">
		                                <TEControl:YesNoCheckBox ID="ynEnableRatings" runat="server" />
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">
                                    <div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_Email_Notifications" /></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="CommonFormFieldName">
			                            <cp:formlabel runat="Server" controltolabel="NotificationType" resourcename="CP_Blogs_CreateEditBlogPost_FeedbackNotify" />
                                </td>
                                
                                <td class="CommonFormField">
		                                <asp:DropDownList runat="server" id="NotificationType" runat="server" />
                                </td>
                            </tr>

                            <tr>
                                <td class="CommonFormFieldName">
			                            <cp:formlabel runat="Server" controltolabel="ynNotifyAllOwners" resourcename="CP_Blogs_CreateEditBlogPost_NotifyAllOwners" />
                                </td>

                                <td class="CommonFormField">
		                                <TEControl:YesNoCheckBox ID="ynNotifyAllOwners" runat="server" />
                                </td>
                            </tr>
                            
                            <tr>
                                <td colspan="2">
                                    <div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_Reader_Trackbacks" /></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="CommonFormFieldName">
			                            <cp:formlabel runat="Server" controltolabel="ynEnableTrackbacks" resourcename="Weblog_CreateEditBlogPost_EnableTrackBacks" />
                                </td>
                                
                                <td class="CommonFormField">
		                                <TEControl:YesNoCheckBox ID="ynEnableTrackbacks" runat="server" />
                                </td>
                            </tr>

                        </table>
            				
	                </Content>
                </TWC:TabbedPane>

                <TWC:TabbedPane runat="server">
	                <Tab><CP:ResourceControl resourcename="CP_BlogContentEditor_Write_Options" runat = "Server" /></Tab>
	                <Content>
	                    <table width="100%">
	                            <tr>
                                    <td colspan="2">
                                        <div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_Post_Publication" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="CommonFormFieldName">
			                            <cp:formlabel runat="Server" controltolabel="postDate" resourcename="Weblog_CreateEditBlogPost_PostDate" />
		                            </td>
		                            <td class="CommonFormField">
			                            <TWC:DateTimeSelector runat="server" id="DatePicker" AllowBlankValues="false" DateTimeFormat="MMMM d yyyy hh:mm tt" ShowCalendarPopup="true" />
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2">
                                        <div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_Post_Summary" /></div>
                                    </td>
                                </tr>
								<asp:PlaceHolder id="RssNotAllowedLicensingHolder" runat="Server">
									<tr>
										<td class="CommonFormFieldName">&nbsp;</td>
										<td class="CommonFormField"><cp:resourcecontrol id="RssNotAllowedLicensing" visible="false" runat="server" Tag="div" CssClass="CommonLicenseRestrictionMessage" resourcename="CP_Settings_RssNotAllowedLicensing" /></td>
									</tr>
								</asp:PlaceHolder>
                                <tr>
                                    <td class="CommonFormFieldName">
				                        <cp:formlabel runat="Server" controltolabel="ynSyndicateExcerpt" resourcename="Weblog_CreateEditBlogPost_SyndicateExcerpt" />
                                    </td>
                                    
                                    <td class="CommonFormField">
			                            <TEControl:YesNoCheckBox ID="ynSyndicateExcerpt" runat="server" />
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
			                            <div class="CommonFormFieldName">
			                                <cp:formlabel runat="Server" controltolabel="postExcerpt" resourcename="Weblog_CreateEditBlogPost_Excerpt" />
		                                </div>
		                                <div class="CommonFormField">
                			                <TEControl:editor runat="Server" id="postExcerpt" Width="90%" Height="200" />
		                                </div>
                                    </td>
                                </tr>
                            </table>
	                </Content>
                </TWC:TabbedPane>
            	
                <TWC:TabbedPane runat="server">
	                <Tab><CP:ResourceControl resourcename="CP_BlogContentEditor_Advanced_Options" runat = "Server" /></Tab>
	                <Content>
		                <div id="AdvancedProperties">
                            <table width="100%">
                                <TEControl:PlaceHolder runat="server">
                                    <DisplayConditions><TEControl:ControlVisibilityCondition runat="server" ControlId="FeaturedPost" ControlVisibilityEquals="true" /></DisplayConditions>
                                    <ContentTemplate>
										<tr>
											<td colspan="2">
												<div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_Post_Display" /></div>
											</td>
										</tr>
                                        <tr>
                                            <td class="CommonFormFieldName">
				                                <TEControl:FormLabel runat="server" LabelForId="FeaturedPost" ResourceName="Weblog_CreateEditBlogPost_FeaturedPost" />
				                            </td>
				                            <td class="CommonFormField">
				                                <TEControl:YesNoCheckBox ID="FeaturedPost" runat="server" />
				                            </td>
				                        </tr>
				                        <tr id="trFeaturedContentImage" runat="server">
                                            <td class="CommonFormFieldName">
				                                <TEControl:FormLabel runat="server" LabelForId="FeaturedPost" ResourceName="Weblog_CreateEditBlogPost_FeaturedPostImage" />
				                            </td>
				                            <td class="CommonFormField">
				                                <TEControl:UserFileHtmlControl runat="server" ID="FeaturedImage" />
				                            </td>
				                        </tr>
				                        <script type="text/javascript">
				                        	$(document).ready(function() {
				                        		var fc_yes = $('#<%= CSControlUtility.Instance().FindControl(this, "FeaturedPost").ClientID %>_Yes');
				                        		var fc_no = $('#<%= CSControlUtility.Instance().FindControl(this, "FeaturedPost").ClientID %>_No');
				                        		var fi = $('#<%= CSControlUtility.Instance().FindControl(this, "trFeaturedContentImage").ClientID %>');

				                        		if (fc_yes && fc_no && fi) {
				                        			fi.css("display", "none");
				                        			if (fc_yes.is(":checked"))
				                        				fi.show("fast");

				                        			fc_yes.click(function() {
				                        				fi.show();
				                        			});
				                        			fc_no.click(function() {
				                        				fi.hide();
				                        			});
				                        		}
				                        	});
										</script>
				                    </ContentTemplate>
				                </TEControl:PlaceHolder>
				            
                                <tr>
                                    <td colspan="2">
                                        <div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_Post_SEO" /></div>
                                    </td>
                                </tr>


                                <tr>
                                    <td colspan="2">
			                            <div class="CommonFormFieldName">
			                                <cp:formlabel runat="Server" controltolabel="postName" resourcename="Weblog_CreateEditBlogPost_Name" />
			                                <asp:regularexpressionvalidator id="vRegexPostName" controltovalidate="postName" runat="server" display="Dynamic" ValidationExpression='<%# WeblogPosts.PostNamePattern %>'>*</asp:RegularExpressionValidator>
		                                </div>
		                                <div class="CommonFormField">
			                                <asp:textbox id="postName" cssclass="ControlPanelTextInput" maxlength="256" runat="server" />
		                                </div>
                                    </td>
                                </tr>

                                <asp:PlaceHolder runat="server" ID="CrossPostingPanel">
                                <tr>
                                    <td colspan="2">
                                        <div class="CommonFormSubTitle"><cp:resourcecontrol runat="server" resourcename="CP_Blogs_SubTitle_Post_Advanced_Options" /></div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="CommonFormFieldName">
				                            <cp:formlabel runat="Server" controltolabel="ynEnableCrossPosting" resourcename="CP_Blogs_CreateEditBlogPost_EnableCrossPosting" />
                                    </td>
                                    
                                    <td class="CommonFormField">
			                                <TEControl:YesNoCheckBox ID="ynEnableCrossPosting" runat="server" />
                                    </td>
                                </tr>
	                            </asp:PlaceHolder>
                            </table>
		                </div>
	                </Content>
                </TWC:TabbedPane>
            	
                <TWC:TabbedPane runat="server">
	                <Tab OnClickClientFunction="Preview" ><CP:ResourceControl resourcename="CP_BlogContentEditor_Preview" runat = "Server" /></Tab>
	                <Content>
		                <script type="text/javascript">
	                    // <![CDATA[
	                        function Preview()
	                        {
	                            document.getElementById('previewloading').style.display = 'block';
	                            <%# ((CreateEditWeblogPostForm) WeblogControlUtility.Instance().FindControl(this, "CreatePost")).GetPreviewScript("PreviewCallback();") %>
	                        }
		                    
	                        function PreviewCallback()
	                        {
	                            document.getElementById('previewloading').style.display = 'none';
	                        }
	                    // ]]>
	                    </script>
                    
                        <div id="previewloading" style="display:none"><CP:ResourceControl runat=server ResourceName="Loading" /> <img src = "<%=Telligent.Evolution.Components.SiteUrls.Instance().LoadingImageUrl%>"/></div>
                        <TEBlog:WeblogPostList runat="server" ID="PreviewList">
                            <ItemTemplate>
                                <h3><TEBlog:WeblogPostData runat="server" Property="Subject" /></h3>
                                <TEBlog:WeblogPostData Property="FormattedBody" runat="server" />
                            </ItemTemplate>
                        </TEBlog:WeblogPostList>
		                
		                
	                </Content>
                </TWC:TabbedPane>
            </TWC:TabbedPanes>

            <div id="ErrorPanel" class="CommonMessageError" runat="server" visible="False">
                <asp:CustomValidator runat="server" id="PostValidator" />
            </div>
            <div id="Post" runat="server" visible="true">
            </div>

            <p class="PanelSaveButton">
                <script type="text/javascript">
                // <![CDATA[
                    function SaveAndContinue(continueFlag, element)
                    {
						element.clicked = true;
						window.setTimeout(function () { element.clicked = false }, 2000);

                        if (bypassCheck)
                            bypassCheck();

                        var continueCB = $('#<%# WeblogControlUtility.Instance().FindControl(this, "ContinueWriting").ClientID %>');
                        var saveB = document.getElementById('<%# WeblogControlUtility.Instance().FindControl(this, "SaveButton").ClientID %>');
                        var publish = $('#<%= CSControlUtility.Instance().FindControl(this, "Publish").ClientID %>');

                        if (element != saveB || !saveB.ignoreFlags) {
                        	if (continueFlag != null)
                        		continueCB.attr("checked", continueFlag);
                        }

                        if (element == saveB) {
                        	publish.attr("checked", true);
                        } else {
                        	publish.attr("checked", false);
                            saveB.ignoreFlags = true;
                            eval(decodeURIComponent(saveB.href));
                            saveB.ignoreFlags = false;
                        }
                    }

					$(function () {
						$('#<%# WeblogControlUtility.Instance().FindControl(this, "PostSubject").ClientID %>').keydown(function (e, data) {
							if (e.which === 13)
								e.preventDefault();
						});
					});
                // ]]>
                </script>
            
            <asp:LinkButton runat="server" id="SaveDraftButton" CssClass="CommonTextButtonBig" OnClientClick="if (this.clicked) return false; SaveAndContinue(false, this); return false;" />
            <strong><CP:resourcelinkbutton id="SaveButton" runat="server" resourcename="CP_Blogs_CreateEditBlogPost_Publish" CssClass="CommonTextButtonBig" OnClientClick="if (this.clicked) return false; SaveAndContinue(false, this); return true;" /></strong>
            </p>
	    </FormTemplate>
	</TEBlog:CreateEditWeblogPostForm>
	
</asp:Content>