<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/modal.Master" %>
<%@ Import Namespace="Telligent.Evolution.Components"%>

<asp:Content ContentPlaceHolderID="content" runat="server">
	<TEControl:JQuery runat="server" />
	<TEControl:JQueryValidate runat="server" />

<TEControl:Title runat="server" IncludeSiteName="false" ResourceName="InsertMedia_Title" EnableRendering="false" Tag="H1" CssClass="title" />

<script type="text/javascript">
	// <![CDATA[
	var isUploaded = false;
	var isUploading = false;
	var uploadValidation, selectValidation;
	$(document).ready(function() {
		var selector = '#<%= CSControlUtility.Instance().FindControl(this, "Insert").ClientID %>';
		var validation = new Telligent_Validation(selector, { validateOnLoad: false, onValidatedFunction: function(isValid, buttonClicked, context) { if (isValid) $(selector).removeClass('disabled'); else $(selector).addClass('disabled'); }, onSuccessfulClickFunction: function(e) { $('.processing', $(selector).parent()).css("visibility", "visible"); $(selector).addClass('disabled'); } });
		validation.AddField('#<%= CSControlUtility.Instance().FindControl(this, "UploadWidth").ClientID %>', { number: true, min: 0, messages: { number: '<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_HeightWidthError")) %>', min: '<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_HeightWidthError")) %>'} }, '.field-item.file-upload-width .field-item-validation', null);
		validation.AddField('#<%= CSControlUtility.Instance().FindControl(this, "UploadHeight").ClientID %>', { number: true, min: 0, messages: { number: '<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_HeightWidthError")) %>', min: '<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_HeightWidthError")) %>'} }, '.field-item.file-upload-height .field-item-validation', null);
		uploadValidation = validation.AddCustomValidation('fileUpload', function() { if (!isUploading) return isUploaded; return "processing"; }, '<%= ResourceManager.GetString("Media_Insert_ClickToBrowse") %>', '.field-item.file-upload .field-item-validation', null);

		var selectorSelect = '#<%= CSControlUtility.Instance().FindControl(this, "SelectButton").ClientID %>';
		var validationSelect = new Telligent_Validation(selectorSelect, { validateOnLoad: false, onValidatedFunction: function (isValid, buttonClicked, context) { if (isValid) $(selectorSelect).removeClass('disabled'); else $(selectorSelect).addClass('disabled'); }, onSuccessfulClickFunction: function (e) { $('.processing', $(selectorSelect).parent()).css("visibility", "visible"); $(selectorSelect).addClass('disabled'); } });
		validationSelect.AddField('#<%= CSControlUtility.Instance().FindControl(this, "SelectWidth").ClientID %>', { number: true, min: 0, messages: { number: '<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_HeightWidthError")) %>', min: '<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_HeightWidthError")) %>'} }, '.field-item.select-width .field-item-validation', null);
		validationSelect.AddField('#<%= CSControlUtility.Instance().FindControl(this, "SelectHeight").ClientID %>', { number: true, min: 0, messages: { number: '<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_HeightWidthError")) %>', min: '<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_HeightWidthError")) %>'} }, '.field-item.select-height .field-item-validation', null);
		selectValidation = validationSelect.AddCustomValidation('fileSearch', function() { return window.<%= CSControlUtility.Instance().FindControl(this, "frmSearchForMediaGalleryPost").ClientID %>.CurrentSelectedItem != null; }, '<%= ResourceManager.GetString("InsertMedia_Error") %>', '.field-item.select-file .field-item-validation', null);

		var selectorUrl = '#<%= CSControlUtility.Instance().FindControl(this, "UrlInsert").ClientID %>';
		var validationUrl = new Telligent_Validation(selectorUrl, { validateOnLoad: false, onValidatedFunction: function(isValid, buttonClicked, context) { if (isValid) $(selectorUrl).removeClass('disabled'); else $(selectorUrl).addClass('disabled'); }, onSuccessfulClickFunction: function(e) { $('.processing', $(selectorUrl).parent()).css("visibility", "visible"); $(selectorUrl).addClass('disabled'); } });
		validationUrl.AddField('#<%= CSControlUtility.Instance().FindControl(this, "UrlWidth").ClientID %>', { number: true, min: 0, messages: { number: '<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_HeightWidthError")) %>', min: '<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_HeightWidthError")) %>'} }, '.field-item.url-width .field-item-validation', null);
		validationUrl.AddField('#<%= CSControlUtility.Instance().FindControl(this, "UrlHeight").ClientID %>', { number: true, min: 0, messages: { number: '<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_HeightWidthError")) %>', min: '<%= JavaScript.Encode(ResourceManager.GetString("Media_Insert_HeightWidthError")) %>'} }, '.field-item.url-height .field-item-validation', null);
		validationUrl.AddField('#<%= CSControlUtility.Instance().FindControl(this, "Url").ClientID %>', { required: true, url: true, messages: { required: '<%= JavaScript.Encode(ResourceManager.GetString("InsertMedia_Error")) %>'} }, '.field-item.url .field-item-validation', null);

		$('#<%= CSControlUtility.Instance().FindControl(this, "ItemsArea").ClientID %>').click(function() {
			selectValidation();
		});
	});
	
function ProcessContent(content)
{
    var opener = window.parent.Telligent_Modal.GetWindowOpener(window);

    if (opener.ContentSelectorCallbackFunction)
        opener.ContentSelectorCallbackFunction(content);

    setTimeout(function () {
        opener.Telligent_Modal.Close();
    }, 250);
}

function CloseModal()
{
    var opener = window.parent.Telligent_Modal.GetWindowOpener(window);

    opener.location = opener.location;
    setTimeout(function () {
        opener.Telligent_Modal.Close();
    }, 250);
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
    <TWC:TabbedPane runat="server" ID="UploadTab">
        <Tab><TEControl:ResourceControl runat="server" ResourceName="InsertMedia_FromComputer" /></Tab>
        <Content>
            <TEControl:InsertMediaForm runat="server" 
            WidthTextBoxId="UploadWidth" 
            HeightTextBoxId="UploadHeight" 
            SelectButtonId="Insert"
            FileUploadId="FileUpload"
            MessageTextId="UploadMessage"
            MediaInsertedClientFunction="ProcessContent">
                <FormTemplate>
                    <TEControl:WrappedLiteral runat="server" ID="UploadMessage" CssClass="message error" Tag="Div" />
                    <div class="field-list-header"></div>
                    <fieldset class="field-list">
                        <ul class="field-list">
                            <li class="field-item file-upload">
                                <TEControl:FormLabel runat="server" LabelForId="file" ResourceName="InsertMedia_UploadMedia" LabelCssClass="field-item-header" />
                                <span class="field-item-description"><TEControl:ResourceControl runat="server" ResourceName="InsertMedia_UploadMedia_Desc" /></span>
                                <span class="field-item-input"><TWC:FileUpload ID="FileUpload" runat="server" OnUploadErrorClientFunction="UploadError" OnUploadingCompleteClientFunction="UploadComplete" OnUploadingStartedClientFunction="UploadStarted" /></span>
                                <span class="field-item-validation" style="display: none;"></span>
                            </li>
                            <li class="field-item file-upload-width">
                                <TEControl:FormLabel runat="server" LabelForId="UploadWidth" ResourceName="Maxwidth" LabelCssClass="field-item-header" />
                                <span class="field-item-input"><asp:TextBox ID="UploadWidth" Columns="4" runat="server" /></span>
                                <span class="field-item-validation" style="display: none;"></span>
                            </li>
                            <li class="field-item file-upload-height">
                                <TEControl:FormLabel runat="server" LabelForId="UploadHeight" ResourceName="Maxheight" LabelCssClass="field-item-header" />
                                <span class="field-item-input"><asp:TextBox ID="UploadHeight" Columns="4" runat="server" /></span>
                                <span class="field-item-validation" style="display: none;"></span>
                            </li>
                            <li class="field-item">
                                <span class="field-item-input">
									<asp:LinkButton ID="Insert" runat="server" CssClass="internal-link upload-file disabled"><span></span><TEControl:ResourceControl runat="server" ResourceName="InsertMedia_UploadMedia_Button" /></asp:LinkButton>
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
        <Tab runat="server" ID="SelectTab"><TEControl:ResourceControl runat="server" ResourceName="InsertMedia_FromSite" /></Tab>
        <Content>
            <div class="message directions"><TEControl:ResourceControl runat="server" ResourceName="InsertMedia_SelectMedia_Desc" /></div>
            
            <TEMedia:SearchForMediaGalleryPostForm runat="server" 
				ID="frmSearchForMediaGalleryPost"
                ContentSelectedClientFunction="ProcessContent" 
                ContentUrlSelectedClientFunction="ProcessContent" 
                HeightTextBoxId="SelectHeight" 
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
                WidthTextBoxId="SelectWidth">
                <FormTemplate>
                    <div class="field-list-header"></div>
                    <fieldset class="field-list">
                        <ul class="field-list">
                            <li class="field-item">
                                <TEControl:FormLabel runat="server" LabelForId="SearchText" LabelCssClass="field-item-header" ResourceName="Search" />
                                <span class="field-item-input"><asp:TextBox runat="server" ID="SearchText" Columns="40" /></span>
                            </li>
                            <li class="field-item select-file">
                                <div runat="server" ID="ItemsArea" style="height: 230px; overflow: auto; padding: 6px; border: solid 1px #ccc; margin-top: 1em;"></div>
								<span class="field-item-validation" style="display: none;"></span>
                            </li>
                            <li class="field-item select-width">
                                <TEControl:FormLabel runat="server" LabelForId="SelectWidth" LabelCssClass="field-item-header" ResourceName="Maxwidth" />
                                <span class="field-item-input"><asp:TextBox ID="SelectWidth" Columns="4" runat="server" /></span>
								<span class="field-item-validation" style="display: none;"></span>
                            </li>
                            <li class="field-item select-height">
                                <TEControl:FormLabel runat="server" LabelForId="SelectHeight" LabelCssClass="field-item-header" ResourceName="Maxheight" />
                                <span class="field-item-input"><asp:TextBox ID="SelectHeight" Columns="4" runat="server" /></span>
								<span class="field-item-validation" style="display: none;"></span>
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
    <TWC:TabbedPane runat="server" ID="UrlTab">
        <Tab><TEControl:ResourceControl runat="server" ResourceName="InsertMedia_FromUrl" /></Tab>
        <Content>
            <TEControl:InsertMediaForm runat="server" 
            UrlTextBoxId="Url" 
            WidthTextBoxId="UrlWidth" 
            HeightTextBoxId="UrlHeight" 
            SelectButtonId="UrlInsert"
            MediaInsertedClientFunction="ProcessContent">
            <FormTemplate>
                <div class="field-list-header"></div>
                <fieldset class="field-list">
                    <ul class="field-list">
                        <li class="field-item url">
                            <TEControl:FormLabel runat="server" LabelForId="Url" LabelCssClass="field-item-header" ResourceName="InsertMedia_LinkMedia" />
                            <span class="field-item-description"><TEControl:ResourceControl runat="server" ResourceName="InsertMedia_LinkMedia_Desc" /></span>
                            <span class="field-item-input"><asp:TextBox ID="Url" Columns="30" runat="server" /></span>
                            <span class="field-item-validation" style="display: none;"></span>
                        </li>
                        <li class="field-item url-width">
                            <TEControl:FormLabel runat="server" LabelForId="UrlWidth" LabelCssClass="field-item-header" ResourceName="Maxwidth" />
                            <span class="field-item-input"><asp:TextBox ID="UrlWidth" Columns="4" runat="server" /></span>
							<span class="field-item-validation" style="display: none;"></span>
                        </li>
                        <li class="field-item url-height">
                            <TEControl:FormLabel runat="server" LabelForId="UrlHeight" LabelCssClass="field-item-header" ResourceName="Maxheight" />
                            <span class="field-item-input"><asp:TextBox ID="UrlHeight" Columns="4" runat="server" /></span>
							<span class="field-item-validation" style="display: none;"></span>
                        </li>
                        <li class="field-item save-url">
                            <span class="field-item-input">
								<asp:LinkButton ID="UrlInsert" runat="server" CssClass="internal-link upload-file disabled"><span></span><TEControl:ResourceControl runat="server" ResourceName="InsertMedia_LinkMedia_Button" /></asp:LinkButton>
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
</TWC:TabbedPanes>

</asp:Content>