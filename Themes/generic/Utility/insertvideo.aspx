<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/modal.Master" %>
<%@ Import Namespace="Telligent.Evolution.Components"%>

<asp:Content ContentPlaceHolderID="content" runat="server">
	<TEControl:JQuery runat="server" />
	<TEControl:JQueryValidate runat="server" />

<TEControl:Title runat="server" IncludeSiteName="false" ResourceName="InsertVideo_Title" EnableRendering="false" Tag="H1" CssClass="title" />

<script type="text/javascript">
	// <![CDATA[
	var isUploaded = false;
	var isUploading = false;
	var uploadValidation;
	$(document).ready(function() {

		var selectorUrl = '#<%= CSControlUtility.Instance().FindControl(this, "UrlInsert").ClientID %>';
		var validationUrl = new Telligent_Validation(selectorUrl, { validateOnLoad: false, onValidatedFunction: function(isValid, buttonClicked, context) { if (isValid) $(selectorUrl).removeClass('disabled'); else $(selectorUrl).addClass('disabled'); }, onSuccessfulClickFunction: function(e) { $('.processing', $(selectorUrl).parent()).css("visibility", "visible"); $(selectorUrl).addClass('disabled'); } });
		validationUrl.AddField('#<%= CSControlUtility.Instance().FindControl(this, "Url").ClientID %>', { required: true, url: true, messages: { required: '<%= JavaScript.Encode(ResourceManager.GetString("InsertMedia_Error")) %>'} }, '.field-item.url .field-item-validation', null);

		var selectorUpload = '#<%= CSControlUtility.Instance().FindControl(this, "Insert").ClientID %>';
		var validationUpload = new Telligent_Validation(selectorUpload, { validateOnLoad: false, onValidatedFunction: function(isValid, buttonClicked, context) { if (isValid) $(selectorUpload).removeClass('disabled'); else $(selectorUpload).addClass('disabled'); }, onSuccessfulClickFunction: function(e) { $('.processing', $(selectorUpload).parent()).css("visibility", "visible"); $(selectorUpload).addClass('disabled'); } });
		uploadValidation = validationUpload.AddCustomValidation('fileUpload', function() { if (!isUploading) return isUploaded; return "processing"; }, '<%= ResourceManager.GetString("Media_Insert_ClickToBrowse") %>', '.field-item.file-upload .field-item-validation', null);

	});

	function ProcessContent(content) {
		var opener = window.parent.Telligent_Modal.GetWindowOpener(window);

		if (opener.ContentSelectorCallbackFunction)
			opener.ContentSelectorCallbackFunction(content);

		opener.Telligent_Modal.Close();
	}

	function CloseModal() {
		var opener = window.parent.Telligent_Modal.GetWindowOpener(window);

		opener.location = opener.location;
		opener.Telligent_Modal.Close();
	}


	function UploadError() {
		isUploaded = false;
		isUploading = false;
		uploadValidation();
		$('.field-item.file-upload .field-item-validation').html('<%= ResourceManager.GetString("Media_Insert_FileUpload_Error") %>').show();
	}

	function UploadComplete() {
		isUploaded = true;
		isUploading = false;
		uploadValidation();
	}

	function UploadStarted() {
		isUploaded = false;
		isUploading = true;
		uploadValidation();
	}
	// ]]>
</script>

<TEControl:ConditionalAction runat="server">
    <Conditions>
        <TEControl:ControlVisibilityCondition runat="server" ControlId="FileUpload" ControlVisibilityEquals="false" />
    </Conditions>
    <Actions>
        <TEControl:SetControlPropertyAction runat="server" ControlId="UploadTab" Property="Visible" Value="false" />
    </Actions>
</TEControl:ConditionalAction>

<TWC:TabbedPanes id="MediaTabs" runat="server"
	PanesCssClass="tab-pane"
	TabSetCssClass="tab-set"
	TabCssClasses="tab"
	TabSelectedCssClasses="tab selected"
	TabHoverCssClasses="tab hover">
	<TWC:TabbedPane runat="server" ID="UrlTab">
        <Tab><TEControl:ResourceControl runat="server" ResourceName="InsertVideo_FromUrl" /></Tab>
        <Content>
            <TEControl:InsertMediaForm runat="server" PreviewWidth="300" PreviewHeight="200"
            UrlPreviewWrappedLiteralId="UrlPreview" 
            UrlTextBoxId="Url" 
            SelectButtonId="UrlInsert"
            MediaInsertedClientFunction="ProcessContent">
            <FormTemplate>
                <TEControl:ResourceControl runat="server" ResourceName="InsertVideo_LinkMedia_Instructions" Tag="Div" CssClass="message instructions" />                
            
                <div class="field-list-header"></div>
                <fieldset class="field-list">
                    <ul class="field-list">
                        <li class="field-item url">
                            <span class="field-item-input"><asp:TextBox ID="Url" Columns="30" runat="server" /></span>
                            <span class="field-item-validation" style="display: none;"></span>
                            <TEControl:WrappedLiteral ID="UrlPreview" Tag="Div" style="padding-top: 6px;" Text="&amp;nbsp;" runat="server" />                        
                        </li>
                        <li class="field-item upload-file">
                            <span class="field-item-input">
								<asp:LinkButton ID="UrlInsert" runat="server" CssClass="internal-link upload-file disabled"><span></span><TEControl:ResourceControl runat="server" ResourceName="InsertVideo_LinkMedia_Button" /></asp:LinkButton>
								<span class="processing" style="visibility: hidden;"></span>
								<asp:LinkButton runat="server" CssClass="internal-link cancel" OnClientClick="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(); return false;"><span></span><TEControl:ResourceControl runat="server" ResourceName="Cancel" /></asp:LinkButton>
                            </span>
                        </li>
                    </ul>
                </fieldset>
                <div class="field-list-footer"></div>
            </FormTemplate>
        </TEControl:InsertMediaForm>
        </Content>
    </TWC:TabbedPane>
    <TWC:TabbedPane runat="server" ID="UploadTab">
        <Tab><TEControl:ResourceControl runat="server" ResourceName="InsertVideo_FromComputer" /></Tab>
        <Content>
            <TEControl:InsertMediaForm runat="server" 
            SelectButtonId="Insert"
            FileUploadId="FileUpload"
            MessageTextId="UploadMessage"
            MediaInsertedClientFunction="ProcessContent">
                <FormTemplate>
                    <TEControl:WrappedLiteral runat="server" ID="UploadMessage" CssClass="message error" Tag="Div" />
                    <TEControl:ResourceControl runat="server" ResourceName="InsertVideo_UploadMedia_Instructions" Tag="Div" CssClass="message instructions" />
                    
                    <div class="field-list-header"></div>
                    <fieldset class="field-list">
                        <ul class="field-list">
                            <li class="field-item file-upload">
                                <span class="field-item-input"><TWC:FileUpload ID="FileUpload" runat="server" OnUploadErrorClientFunction="UploadError" OnUploadingCompleteClientFunction="UploadComplete" OnUploadingStartedClientFunction="UploadStarted" /></span>
                                <span class="field-item-validation" style="display: none;"></span>
                            </li>
                            <li class="field-item">
                                <span class="field-item-input">
									<asp:LinkButton ID="Insert" runat="server" CssClass="internal-link upload-file"><span></span><TEControl:ResourceControl runat="server" ResourceName="InsertVideo_UploadMedia_Button" /></asp:LinkButton>
									<span class="processing" style="visibility: hidden;"></span>
									<asp:LinkButton runat="server" CssClass="internal-link cancel" OnClientClick="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(); return false;"><span></span><TEControl:ResourceControl runat="server" ResourceName="Cancel" /></asp:LinkButton>
                                </span>
                            </li>
                        </ul>
                    </fieldset>
                    <div class="field-list-footer"></div>
                </FormTemplate>
            </TEControl:InsertMediaForm>
        </Content>
    </TWC:TabbedPane>
    <TWC:TabbedPane runat="server">
        <Tab runat="server" ID="SelectTab"><TEControl:ResourceControl runat="server" ResourceName="InsertVideo_FromSite" /></Tab>
        <Content>
            <div class="message directions"><TEControl:ResourceControl runat="server" ResourceName="InsertVideo_SelectMedia_Desc" /></div>
            <TEMedia:SearchForMediaGalleryPostForm runat="server" 
                ContentSelectedClientFunction="ProcessContent" 
                ContentUrlSelectedClientFunction="ProcessContent" 
                ItemAreaCssClass="content-selector-item-wrapper" 
                ItemCssClass="content-selector-item" 
                ItemNameCssClass="content-selector-item-name" 
                ItemsAreaHtmlGenericControlId="ItemsArea" 
                LoadingCssClass="message loading" 
                LoadingResourceName="Loading" 
                SearchTextBoxId="SearchText" 
                SelectButtonId="SelectButton" 
                SelectedItemCssClass="content-selector-item selected" 
                SelectedItemNameCssClass="content-selector-item-name selected" 
                >
                <FormTemplate>
                    <div class="field-list-header"></div>
                    <fieldset class="field-list">
                        <ul class="field-list">
                            <li class="field-item">
                                <TEControl:FormLabel runat="server" LabelForId="SearchText" LabelCssClass="field-item-header" ResourceName="Search" />
                                <span class="field-item-input"><asp:TextBox runat="server" ID="SearchText" Columns="40" /></span>
                            </li>
                            <li class="field-item">
                                <div runat="server" ID="ItemsArea" style="height: 230px; overflow: auto; padding: 6px; border: solid 1px #ccc; margin-top: 1em;"></div>        
                            </li>
                            <li class="field-item">
                                <span class="field-item-input">
								    <asp:LinkButton ID="SelectButton" runat="server" CssClass="internal-link upload-file"><span></span><TEControl:ResourceControl runat="server" ResourceName="InsertMedia_SelectMedia_Button" /></asp:LinkButton>
								    <span class="processing" style="visibility: hidden;"></span>
								    <asp:LinkButton runat="server" CssClass="internal-link cancel" OnClientClick="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(); return false;"><span></span><TEControl:ResourceControl runat="server" ResourceName="Cancel" /></asp:LinkButton>
                                </span>
                            </li>
                        </ul>
                    </fieldset>
                    <div class="field-list-footer"></div>
                </FormTemplate>
            </TEMedia:SearchForMediaGalleryPostForm>
        </Content>
    </TWC:TabbedPane>
</TWC:TabbedPanes>

</asp:Content>