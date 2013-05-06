<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Merge.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Tools.Merge" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Web.ControlPanel.Tools" %>

<asp:Content ID="Content1" ContentPlaceHolderId="bcr" runat="server">
	<TEControl:JQuery runat="server" /> 	

    <script type="text/html" id="mergeTemplate">
        {% if (mode === "ThemeInstall") { %}
            <div class="CommonDescription"><%: GetModedResource("Theme_Header_Install", MergeMode.ThemeImport) %></div>
            <li class="field-item"><span class="field-item-input">
                {%= title %}
            </span></li>
        {% } else if (mode === "ThemeImport") { %}
            <div class="CommonDescription"><%: GetModedResource("Theme_Header_Configuration", MergeMode.ThemeImport) %> {%= title %}</div>
            <div class="HeaderDescription"><%: GetModedResource("Theme_Header_Configuration_Desc", MergeMode.ThemeImport) %></div>
            <li class="field-item"><span class="field-item-input">
                <input type="checkbox" id="theme-header" class="theme-header" checked="checked" /><label for="theme-header"><%: GetModedResource("Theme_ImportHeader", MergeMode.ThemeImport) %></label>
            </span></li>
            <li class="field-item"><span class="field-item-input">
                <input type="checkbox" id="theme-footer" class="theme-footer" checked="checked" /><label for="theme-footer"><%: GetModedResource("Theme_ImportFooter", MergeMode.ThemeImport) %></label>
            </span></li>
            <li class="field-item"><span class="field-item-input">
                <input type="checkbox" id="theme-configuration" class="theme-configuration" checked="checked" /><label for="theme-configuration"><%: GetModedResource("Theme_ImportConfiguration", MergeMode.ThemeImport) %></label>
            </span></li>
            {% if (pages.colliding.length > 0) { %}
                <div class="CommonDescription"><%: GetModedResource("Theme_Header_Pages", MergeMode.ThemeImport) %></div>
                <div class="HeaderDescription"><%: GetModedResource("Theme_Header_Pages_Desc", MergeMode.ThemeImport) %></div>
                <ul class="fragment-page">
                    {% if (pages.colliding.length > 1) { %}
                        <li class="all"><input type="checkbox" class="all" /><%: GetResource("All") %></li>
                    {% } %}
                    {% foreach(pages.colliding, function(page){ %}
                        <li class="fragment-page"><input type="checkbox" id="page-{%: page.Name %}" data-page="{%: page.Name %}" checked="checked" />{%: page.Name %}</li>
                    {% }); %}
                </ul>
            {% } %} 
            {% if (pages.nonColliding.length > 0) { %}
                <div class="CommonDescription"><%: GetModedResource("Theme_Header_Pages_New", MergeMode.ThemeImport) %></div>
                <div class="HeaderDescription"><%: GetModedResource("Theme_Header_Pages_New_Desc", MergeMode.ThemeImport) %></div>
                <ul class="fragment-page">
                    {% foreach(pages.nonColliding, function(page){ %}
                        <li class="fragment-page"><input type="hidden" id="Hidden1" data-page="{%: page.Name %}" value="true" />{%: page.Name %}</li>
                    {% }); %}
                </ul>
            {% } %} 
            {% if (files.length > 0) { %}
                <div class="CommonDescription"><%: GetModedResource("Theme_Header_Files", MergeMode.ThemeImport) %></div>
                <div class="HeaderDescription"><%: GetModedResource("Theme_Header_Files_Desc", MergeMode.ThemeImport) %></div>
                <ul class="file">
                    {% if (files.length > 1) { %}
                        <li class="all"><input type="checkbox" class="all" /><%: GetResource("All") %></li>
                    {% } %}
                    {% foreach(files, function(file){ %}
                        <li class="file"><input type="checkbox" id="file-{%: file.FileName %}" data-filename="{%: file.FileName %}" data-property="{%: file.Property %}" checked="checked" />{%: file.FileName %} ({%: file.PropertyName %})</li>
                    {% }); %}
                </ul>
            {% } %}
        {% } %}
        {% if (fragments.nonColliding.length > 0 && (mode === "ScriptedContentFragmentImport" || mode === "ScriptedContentFragmentRevert" || mode === "ThemeImport")) { %}
           <div class="CommonDescription"><%: GetModedResource("Fragment_Header_NonColliding", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></div>
           <div class="HeaderDescription"><%: GetModedResource("Fragment_Header_NonColliding_Desc") %></div>
           <ul class="fragment">
               {% if (mode !== "ScriptedContentFragmentRevert" && fragments.nonColliding.length > 1) { %}
                   <li class="all"><input type="checkbox" class="all" /><%: GetResource("All") %></li>
               {% } %}
               {% foreach(fragments.nonColliding, function(fragment, i) { %}
                   <li class="fragment noncolliding {% if(i === 0) { %} first {% } %}" data-fragmentid="{%: fragment.Identifier %}" data-themename="{%: fragment.ThemeName %}">
                       {% if (mode !== "ScriptedContentFragmentRevert") { %}<input type="checkbox" id="fragment-{%: fragment.Identifier %}-{%: fragment.ThemeName %}" data-identifier="{%: fragment.Identifier %}" data-theme="{%: fragment.ThemeName %}" checked="checked" />{% } %}<span class="fragmentname">{%: fragment.Name %}
                           {% if(fragment.ThemeTitle && fragment.ThemeTitle.length > 0) { %}<span>({%: fragment.ThemeTitle %})</span>{% } %}
                       </span>
                   </li>
               {% }); %}
           </ul>
        {% } %}
        {% if (fragments.colliding.length > 0 && mode !== "ThemeInstall") { %}
           <div class="CommonDescription"><%: GetModedResource("Fragment_Header_Colliding") %></div>
           <div class="HeaderDescription"><%: GetModedResource("Fragment_Header_Colliding_Desc") %></div>
           <ul class="fragment merged">
               {% if (fragments.colliding.length > 1) { %}
                   <li class="all 
                       {% if(mode !== "ScriptedContentFragmentRevert") { %} withMergeOptions {% } %} "> 
                       <span class="fragmentname"><%: GetResource("All") %></span>
                       {% if(mode === "ScriptedContentFragmentImport" || mode === "ScriptedContentFragmentRevert" || mode === "ThemeImport") { %}
                           <select class="widgetMergeOption all" data-affects="widgetMergeOption">
                               {% if(mode === "ScriptedContentFragmentRevert") { %}
                                   <option value="new"><%: GetModedResource("Fragment_ActionOption_Import", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></option>
                                   <option value="merge"><%: GetModedResource("Fragment_ActionOption_Merge", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></option>
                               {% } else { %}
                                   <option value="merge"><%: GetModedResource("Fragment_ActionOption_Merge", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></option>
                                   <option value="new"><%: GetModedResource("Fragment_ActionOption_Import", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></option>
                                   <option value="ignore"><%: GetModedResource("Fragment_ActionOption_Ignore", MergeMode.ScriptedContentFragmentImport, MergeMode.ThemeImport) %></option>
                               {% } %}
                           </select>
                       {% } %}
                       <div class="widgetMergeOptions">
                           {% if(mode === "ScriptedContentFragmentImport" || mode === "ScriptedContentFragmentRevert" || mode === "ThemeImport") { %}
                               <select class="widgetImplementationMergeOption all" data-affects="widgetImplementationMergeOption">
                                   <option value="new"><%: GetModedResource("Fragment_ImplementationOption_New", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></option>
                                   <option value="existing"><%: GetModedResource("Fragment_ImplementationOption_Existing", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></option>
                               </select>
                           {% } %}
                           <select class="widgetResourceMergeOption all" data-affects="widgetResourceMergeOption">
                               <option value="new"><%: GetModedResource("Fragment_ResourcesOption_New") %></option>
                               <option value="merge"><%: GetModedResource("Fragment_ResourcesOption_Merge") %></option>
                           </select>
                       </div>
                   </li>
               {% } %}
               {% foreach(fragments.colliding, function(fragment, i) { %}
                   <li id="fragment-{%= i %}" class="fragment merged 
                       {% if(i === 0) { %} first {% } %} 
                       {% if(mode !== "ScriptedContentFragmentRevert") { %} withMergeOptions {% } %} " 
                       data-fragmentid="{%: fragment.Identifier %}" 
                       data-themename="{%: fragment.ThemeName %}">
                       <span class="fragmentname">{%: fragment.Name %} {% if(fragment.ThemeTitle && fragment.ThemeTitle.length > 0) { %}<span>({%: fragment.ThemeTitle %})</span>{% } %}</span>
                       {% if(mode === "ScriptedContentFragmentImport" || mode === "ScriptedContentFragmentRevert" || mode === "ThemeImport") { %}
                           <select class="widgetMergeOption" data-fragment="fragment-{%= i %}">
                               {% if(mode === "ScriptedContentFragmentRevert") { %}
                                   <option value="new"><%: GetModedResource("Fragment_ActionOption_Import", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></option>
                                   <option value="merge"><%: GetModedResource("Fragment_ActionOption_Merge", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></option>
                               {% } else { %}
                                   <option value="merge"><%: GetModedResource("Fragment_ActionOption_Merge", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></option>
                                   <option value="new"><%: GetModedResource("Fragment_ActionOption_Import", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></option>
                                   <option value="ignore"><%: GetModedResource("Fragment_ActionOption_Ignore", MergeMode.ScriptedContentFragmentImport, MergeMode.ThemeImport) %></option>
                               {% } %}
                           </select>
                       {% } %}
                       <div class="widgetMergeOptions" >
                           {% if(mode === "ScriptedContentFragmentImport" || mode === "ScriptedContentFragmentRevert" || mode === "ThemeImport") { %}
                               <select class="widgetImplementationMergeOption" data-fragment="fragment-{%= i %}">
                                   <option value="new"><%: GetModedResource("Fragment_ImplementationOption_New", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></option>
                                   <option value="existing"><%: GetModedResource("Fragment_ImplementationOption_Existing", MergeMode.ScriptedContentFragmentImport, MergeMode.ScriptedContentFragmentRevert, MergeMode.ThemeImport) %></option>
                               </select>
                           {% } %}
                           <select class="widgetResourceMergeOption" data-fragment="fragment-{%= i %}">
                               <option value="new"><%: GetModedResource("Fragment_ResourcesOption_New") %></option>
                               <option value="merge"><%: GetModedResource("Fragment_ResourcesOption_Merge") %></option>
                           </select>
                           <a href="#" title="<%: GetResource("Details") %>" class="widgetResourceMergeSummary {% if(fragment.ResourcesColliding.length > 0) { %} conflicted {% } %}">
                                {%= fragment.ResourcesColliding.length %} <%: GetResource("Conflicts") %>
                           </a>
                       </div>
                        <div class="widgetResourceMergeOptions" style="display:none"></div>
                   </li>
               {% }); %}
           </ul>
        {% } %}
    </script>

    <script type="text/html" id="resourceMergeTemplate">
        {% if (resources.colliding.length > 0) { %}
           <div class="widgetResourceMergeOptionsConflicted">
               <div class="CommonDescription"><%: GetModedResource("Resources_ConflictHeader") %></div>
               <table class="resource">
                   <tr>
                       <th><%: GetModedResource("Resources_Language") %></th>
                       <th><%: GetModedResource("Resources_Name") %></th>
                       <th colspan="2"><%: GetModedResource("Resources_ConflictOption_Existing") %></th>
                       <th colspan="2"><%: GetModedResource("Resources_ConflictOption_New") %></th>
                   </tr>
                   {% foreach(resources.colliding, function(resource) { %}
                       <tr class="resource" data-language="{%: resource.Language %}" data-name="{%: resource.EncodedKey %}">
                           <td>{%: resource.LanguageName %}</td>
                           <td>{%: resource.Key %}</td>
                           <td class="resourceExisting">
                               <input type="radio" name="{%: fragmentId %}:{%: themeName %}:r:{%: resource.Language %}:{%: resource.EncodedKey %}" value="existing" id="{%: fragmentId %}:{%: themeName %}:r:{%: resource.Language %}:{%: resource.EncodedKey %}:existing" />
                           </td>
                           <td class="resourceExisting"><label for="{%: fragmentId %}:{%: themeName %}:r:{%: resource.Language %}:{%: resource.EncodedKey %}:existing">{%: resource.Value %}</label></td>
                           <td class="resourceNew">
                               <input type="radio" name="{%: fragmentId %}:{%: themeName %}:r:{%: resource.Language %}:{%: resource.EncodedKey %}" value="new" checked="checked" id="{%: fragmentId %}:{%: themeName %}:r:{%: resource.Language %}:{%: resource.EncodedKey %}:new" />
                           </td>
                           <td class="resourceNew"><label for="{%: fragmentId %}:{%: themeName %}:r:{%: resource.Language %}:{%: resource.EncodedKey %}:new">{%: resource.NewValue %}</label></td>
                       </tr>
                   {% }); %}
               </table>
           </div>
        {% } %}
        {% if (resources.added.length > 0) { %}
           <div class="widgetResourceMergeOptionsNew">
               <div class="CommonDescription"><%: GetModedResource("Resources_NewHeader") %></div>
               <table class="resource">
                   <tr>
                       <th><%: GetModedResource("Resources_Language") %></th>
                       <th><%: GetModedResource("Resources_Name") %></th>
                       <th colspan="2"><%: GetModedResource("Resources_Value") %></th>
                   </tr>
                   {% foreach(resources.added, function(resource) { %}
                       <tr class="resource" data-language="{%: resource.Language %}" data-name="{%: resource.EncodedKey %}">
                           <td>{%: resource.LanguageName %}</td>
                           <td>{%: resource.Key %}</td>
                           <td>{%: resource.Value %}</td>
                           <td>
                               <select>
                                   <option value="add"><%: GetModedResource("Resources_NewOption_Add") %></option>
                                   <option value="ignore"><%: GetModedResource("Resources_NewOption_Ignore") %></option>
                               </select>
                           </td>
                       </tr>
                   {% }); %}
               </table>
           </div>
        {% } %}
        {% if (resources.existing.length > 0) { %}
           <div class="widgetResourceMergeOptionsRemoved">
               <div class="CommonDescription"><%: GetModedResource("Resources_ExistingHeader") %></div>
               <table class="resource">
                   <tr>
                       <th><%: GetModedResource("Resources_Language") %></th>
                       <th><%: GetModedResource("Resources_Name") %></th>
                       <th colspan="2"><%: GetModedResource("Resources_Value") %></th>
                   </tr>
                   {% foreach(resources.existing, function(resource) { %}
                       <tr class="resource" data-language="{%: resource.Language %}" data-name="{%: resource.EncodedKey %}">
                           <td>{%: resource.LanguageName %}</td>
                           <td>{%: resource.Key %}</td>
                           <td>{%: resource.Value %}</td>
                           <td>
                               <select>
                                   <option value="keep"><%: GetModedResource("Resources_ExistingOption_Keep") %></option>
                                   <option value="remove"><%: GetModedResource("Resources_ExistingOption_Remove") %></option>
                               </select>
                           </td>
                       </tr>
                   {% }); %}
               </table>
           </div>
        {% } %}
        {% if (resources.unchanged.length > 0) { %}
           <div class="widgetResourceMergeOptionsUnchanged">
               <div class="CommonDescription">
                   {% if(resources.colliding.length > 0 || resources.existing.length > 0 || resources.added.length > 0) { %}
                       <%: GetModedResource("Resources_Unchanged") %>
                   {% } else { %}
                       <%: GetModedResource("Resources_Only_Unchanged") %>
                   {% } %}
               </div>
               {% foreach(resources.unchanged, function(resource){ %}
                   <span class="resource" data-language="{%: resource.Language %}" data-name="{%: resource.EncodedKey %}"></span>
               {% }); %}
           </div>
        {% } %}
    </script>

    <script type="text/javascript" src="<%= ResolveUrl("~/ControlPanel/Utility/ManageWidgets/plugins.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveUrl("~/ControlPanel/Tools/ManageWidgets/Merge.js") %>"></script>
    <script type="text/javascript">
        jQuery(function ($) {
            $('.mergeContainer').themeMerger({
                mode: '<%= Mode %>',
                uploadContext: '<%= FileUpload.UploadContext %>',
                uploadWrapperSelector: '.field-item.file',
                saveSelector: 'a.internal-link.merge',
                processingSelector: 'span.processing',
                callback: '<%= SavedCallback %>',
                revertibleFragmentsCallback: '<%= RevertibleFragmentsSelectionCallback %>',                
                selectorResources: {
                    text_UploadImportError: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_UploadImportError" encoding="JavaScript" />',
                    text_PersistImportError: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_PersistImportError" encoding="JavaScript" />',
                    text_ProcessRevertError: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_ProcessRevertError" encoding="JavaScript" />',
                    text_PersistRevertError: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_PersistRevertError" encoding="JavaScript" />'
                }
            });
        });
    </script>
	<div class="field-list-header"></div>
	<fieldset class="field-list">
		<ul class="field-list">
			<li class="field-item file" id="LocalLinkArea" runat="server">
				<TEControl:FormLabel ID="UploadLabel" LabelForId="File" LabelCssClass="field-item-header" runat="server" ResourceName="CP_Tools_Merger_Upload_Header_ScriptedContentFragment" ResourceFile="ControlPanelResources.xml" />
				<TEControl:ResourceControl ID="UploadDescription" ResourceName="CP_Tools_Merger_Upload_Description" runat="server" Tag="Span" CssClass="field-item-description" ResourceFile="ControlPanelResources.xml"  />
				<span class="field-item-input">
					<TWC:FileUpload ID="FileUpload" AllowedFileTypes="xml" runat="server" OnUploadErrorClientFunction="uploadError" OnUploadingCompleteClientFunction="uploadComplete" OnUploadingStartedClientFunction="uploadStarted" />
				</span>
				<span class="field-item-validation" style="display: none;"></span>
			</li>
			<li class="field-item">
                <div class="mergeContainer"></div>
			</li>
			<li class="field-item">
				<span class="field-item-input">
                    <a href="#" class="internal-link merge submit-form disabled button">
                        <span></span>
                        <TEControl:ResourceControl ID="SaveResource" ResourceName="CP_Tools_Merger_Import" runat="server" ResourceFile="ControlPanelResources.xml" />
                    </a>
					<span class="processing" style="display:none;"></span>
				</span>
			</li>
		</ul>
	</fieldset>
	<div class="field-list-footer"></div>

</asp:Content>