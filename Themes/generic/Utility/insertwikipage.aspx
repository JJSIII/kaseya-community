<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/modal.Master" %>
<%@ Import Namespace="Telligent.Evolution.Components"%>

<asp:Content ContentPlaceHolderID="content" runat="server">
	<TEControl:JQuery runat="server" />
	<TEControl:JQueryValidate runat="server" />

<script type="text/javascript">
	// <![CDATA[

	$(document).ready(function() {
		var selector = '#<%= CSControlUtility.Instance().FindControl(this, "Insert").ClientID %>';
		var validation = new Telligent_Validation(selector, { onValidatedFunction: function(isValid, buttonClicked, context) { if (isValid) $(selector).removeClass('disabled'); else $(selector).addClass('disabled'); }, onSuccessfulClickFunction: function(e) { $('.processing', $(selector).parent()).css("visibility", "visible"); $(selector).addClass('disabled'); } });
		validation.AddField('#<%= CSControlUtility.Instance().FindControl(this, "Url").ClientID %>', { required: true, messages: { required: '<%= JavaScript.Encode(ResourceManager.GetString("Wikis_PageLink_Error")) %>'} }, '.field-item.url .field-item-validation', null);

	});
	
function ProcessContent(content)
{
    var opener = window.parent.Telligent_Modal.GetWindowOpener(window);

    if (opener.ContentSelectorCallbackFunction)
        opener.ContentSelectorCallbackFunction(content);

    opener.Telligent_Modal.Close();		
}

// ]]>
</script>

    <TEControl:Title runat="server" IncludeSiteName="false" ResourceName="Wiki_PageLink_Title" EnableRendering="false" />

    <TEWiki:InsertPageLinkForm runat="server"
         LinkNameTextBoxId="LinkName"
         UrlPageTextBoxId="Url"
         SelectButtonId="Insert"
         LinkInsertedClientFunction="ProcessContent">
        <FormTemplate>
            <div class="field-list-header"></div>
            <fieldset class="field-list">
                <ul class="field-list">
                    <li class="field-item">
                        <TEControl:FormLabel runat="server" LabelCssClass="field-item-header" LabelForId="LinkName" ResourceName="Wikis_PageLink_LinkText" />
                        <span class="field-item-input"><asp:TextBox ID="LinkName" Columns="30" runat="server" /></span>
                    </li>
                    <li class="field-item url">
                        <TEControl:FormLabel runat="server" LabelCssClass="field-item-header" LabelForId="Url" ResourceName="Wikis_PageLink_PageText" />
                        <span class="field-item-description"><TEControl:ResourceControl runat="server" ResourceName="Wikis_PageLink_PageText_Desc" /></span>
                        <span class="field-item-input"><asp:TextBox ID="Url" Columns="30" runat="server" /></span>
                        <span class="field-item-validation" style="display: none;"></span>
                    </li>
                    <li class="field-item">
                        <span class="field-item-input">
                            <TEControl:ResourceButton runat="server" ResourceName="Wikis_PageLink_CreateLink" ID="Insert" />
                            <TEControl:ResourceButton runat="server" ResourceName="Cancel" OnClientClick="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(); return false;" />
                            <span class="processing" style="visibility: hidden;"></span>
                        </span>
                    </li>
                </ul>
            </fieldset>
            <div class="field-list-footer"></div>
        </FormTemplate>
    </TEWiki:InsertPageLinkForm>

<script type="text/javascript">
    // <![CDATA[
var wo = window.parent.Telligent_Modal.GetWindowOpener(window);
var ed = wo.tinyMCE_Telligent.EvolutionOptions._currentEditor;
var urlInput = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "Url").ClientID %>');
var titleInput = document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "LinkName").ClientID %>');
var sel = ed.selection.getNode();
var content = wo.tinyMCE_Telligent.EvolutionOptions._currentEditor.selection.getContent({ format: 'text' });

if(sel.nodeName == "A" && urlInput)
{
    urlInput.value = ed.dom.getAttrib(sel, 'href', '');
    if (titleInput)
        titleInput.value = ed.dom.get(sel).innerHTML;
}
else if (urlInput)
{
    urlInput.value = content;
        
    if (titleInput)
        titleInput.value = content;
}
else if (titleInput)
    titleInput.value = content;
// ]]>
</script>
</asp:Content>