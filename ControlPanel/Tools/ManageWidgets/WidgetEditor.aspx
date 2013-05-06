<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="WidgetEditor.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Tools.WidgetEditor" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="Telligent.Evolution.ControlPanel.Components"%>
<%@ Register TagPrefix="te" Namespace="Telligent.Evolution.Controls" Assembly="Telligent.Evolution.Controls" %>
<%@ Register Src="~/ControlPanel/Tools/ManageWidgets/WidgetEditorContentPane.ascx" TagName="EditorContentPane" TagPrefix="CP" %>
<%@ Register Src="~/ControlPanel/Utility/LanguageResourceEditor.ascx" TagName="ResourceEditor" TagPrefix="CP" %>
<%@ Register TagPrefix="glow" Namespace="Telligent.Glow" Assembly="Telligent.Glow" %>
<%@ Register TagPrefix="scf" Namespace="Telligent.Evolution.ScriptedContentFragments.Controls" Assembly="Telligent.Evolution.ScriptedContentFragments" %>

<asp:Content ID="Content1" ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="CP_Tools_WidgetEditor_Title" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation ID="ControlPanelSelectedNavigation1" runat="server" SelectedNavItem="ToolsListWidgets" />    
    <CP:StatusMessage ID="StatusMessage" runat="server" />   

    <asp:ValidationSummary runat="server" />

    <div class="WidgetEditorWrapper">
        <input type="hidden" runat="server" id="TabbedPanesClientIdHolder" />
        <input type="hidden" runat="server" id="SerializedEditableFileDataInput" />
        <input type="hidden" runat="server" id="SaveAsName" />
        <input type="hidden" runat="server" id="SerializedNonEditableFileDataInput" />
        <input type="hidden" runat="server" id="SaveForTheme" />
        <input type="hidden" runat="server" id="ThemeName" />
        <input type="hidden" runat="server" id="SelectedTabText" />
        <div class="DockWrapper">
            <div class="Dock">
                <div class="DockSegment">
                    <h4><cp:resourcecontrol ID="Resourcecontrol1" runat="Server" resourcename="CP_Tools_WidgetEditor_ActionTitle" /></h4>
                    <a href="#" class="CommonTextButton addfile"><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_AddNewFile" /></a>
                    <CP:Modal runat="server" ID="Upload" Width="640" Height="340" Url="<%= Telligent.Evolution.Components.SiteUrls.Instance().WidgetAddFiles() %>" ResourceName="CP_Tools_WidgetEditor_UploadAttachment" ModalType="Link" Callback="uploadComplete" CssClass="CommonTextButton"></CP:Modal>
                    <cp:resourcelinkbutton id="DeleteButton" runat="server" resourcename="CP_Tools_WidgetEditor_Delete" CssClass="CommonTextButton" />
                    <cp:resourcelinkbutton id="RevertButton" runat="server" resourcename="CP_Tools_WidgetEditor_Revert_To_Default" CssClass="CommonTextButton" />
                    <cp:resourcelinkbutton id="ExportButton" runat="server" resourcename="CP_Tools_WidgetEditor_Export" CssClass="CommonTextButton" />
                    <cp:resourcelinkbutton id="SaveButton" runat="server" resourcename="Save" CssClass="CommonTextButton save"  />                    
                    <asp:PlaceHolder runat="server" ID="ExtendedSaveOptions" Visible="false">
                        <a href="#" class="CommonTextButton options" onclick="if(<%= SavePopup.ClientID %>.IsShown()) { <%= SavePopup.ClientID %>.Hide(); } else { <%= SavePopup.ClientID %>.ShowAtElement(this); } return false;">...</a>
                        <glow:PopupPanel ID="SavePopup" runat="server" PopupDirection="Down" HideOnDocumentClick="true">
                            <cp:resourcelinkbutton id="SaveAsButton" runat="server" resourcename="CP_Tools_WidgetEditor_SaveAs" CssClass="CommonTextButton subOption"  />
                            <a href="#" class="CommonTextButton savefortheme subOption" runat="server" id="SaveForThemeLink"><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_SaveForTheme" /></a>
                        </glow:PopupPanel>
                    </asp:PlaceHolder>
                </div>
                <div class="DockSegment" runat="server" id="EnabledThemesDockSegment">                    
                    <asp:Label runat="server" ID="WidgetVersionLabel" />                        
                    <TEControl:WrappedLiteral runat="server" ID="EnabledThemes">
                        <LeaderTemplate>
                            <CP:ResourceControl runat="server" ResourceName="CP_Tools_WidgetEditor_EnabledMessage" />
                            <ul>
                        </LeaderTemplate>
                        <TrailerTemplate>
                            </ul>
                            <a href="<%= Telligent.Evolution.Components.SiteUrls.Instance().EnableWidgets() %>" class="CommonTextButton">
                                <CP:ResourceControl runat="server" ResourceName="CP_Tools_WidgetEditor_EnableDisableWidgets" />
                            </a>
                        </TrailerTemplate>
                    </TEControl:WrappedLiteral>
                </div>
                <div class="DockSegment">
                    <a href="#" class="CommonTextButton help"><cp:resourcecontrol ID="Resourcecontrol17" runat="Server" resourcename="CP_Tools_WidgetEditor_ApiDocumentation" /></a>
                    <a href="#" class="CommonTextButton editorSettings" onclick="if(<%= SettingsPopupPanel.ClientID %>.IsShown()) { <%= SettingsPopupPanel.ClientID %>.Hide(); } else { <%= SettingsPopupPanel.ClientID %>.ShowAtElement(this); } return false;"><cp:resourcecontrol ID="Resourcecontrol18" runat="Server" resourcename="CP_Tools_WidgetEditor_EditorSettings" /></a>
                    <glow:PopupPanel ID="SettingsPopupPanel" runat="server" PopupDirection="Down" HideOnDocumentClick="false" CssClass="EditorSettings">
                        <fieldset class="setting-list editorSettings">
	                        <ul class="setting-list">
		                        <li class="setting-item">
                                    <label><cp:resourcecontrol ID="Resourcecontrol15" runat="Server" resourcename="CP_Tools_WidgetEditor_Theme" /></label>
                                    <select runat="server" id="EditorThemeSelect" class="editorTheme">
                                        <option value="Cobalt">Cobalt</option>
                                        <option value="Eclipse">Eclipse</option>
                                        <option value="Monokai">Monokai</option>
                                        <option value="MonoIndustrial">Mono Industrial</option>
                                        <option value="Twilight">Twilight</option>
                                        <option value="VisualStudio" selected="selected">Visual Studio</option>
                                    </select>
		                        </li>
		                        <li class="setting-item">
                                    <label><cp:resourcecontrol ID="Resourcecontrol3" runat="Server" resourcename="CP_Tools_WidgetEditor_ShowGutter" /></label>
                                    <input type="checkbox" runat="server" id="ShowGutterCheckbox" class="editorGutter" checked="checked" />
		                        </li>
		                        <li class="setting-item">
                                    <label><cp:resourcecontrol ID="Resourcecontrol6" runat="Server" resourcename="CP_Tools_WidgetEditor_HighlightLine" /></label>
                                    <input type="checkbox" runat="server" id="Checkbox1" class="editorHighlightLine" checked="checked" />
		                        </li>
		                        <li class="setting-item">
                                    <label><cp:resourcecontrol ID="Resourcecontrol8" runat="Server" resourcename="CP_Tools_WidgetEditor_ShowInvisibles" /></label>
                                    <input type="checkbox" runat="server" id="Checkbox2" class="editorShowInvisibles" />
		                        </li>
	                        </ul>
                        </fieldset>
                    </glow:PopupPanel>
                </div>                
            </div>
        </div>
        <div class="WidgetEditor">

            <table width="100%" class="MainWidgetProperties">
                <tr class="WidgetName">
                    <td class="CommonFormFieldName">
                        <cp:formlabel runat="Server" controltolabel="WidgetName" resourcename="CP_Tools_WidgetEditor_Name" />
                    </td>
                    <td class="CommonFormField">
                        <te:ContentFragmentTokenStringControl runat="server" ID="WidgetName" />
                        <span style="display: none;" class="field-item-validation"></span>
                    </td>
                </tr>  
                <tr runat="server" id="ThemeVersionRow">
                    <td class="CommonFormFieldName">
                        <cp:formlabel runat="Server" controltolabel="ThemeVersion" resourcename="CP_Tools_WidgetEditor_ThemeVersion" />
                    </td>
                    <td class="CommonFormField">
                        <asp:DropDownList runat="server" ID="ThemeVersion" />
                    </td>
                </tr>  
                <tr>
                    <td class="CommonFormFieldName">
                        <cp:formlabel runat="Server" controltolabel="WidgetDescription" resourcename="CP_Tools_WidgetEditor_Description" />
                    </td>                                
                    <td class="CommonFormField">
                        <te:ContentFragmentTokenStringControl runat="server" ID="WidgetDescription" />
                    </td>
                </tr>
            </table>                          

	        <TWC:TabbedPanes ID="WidgetTabs" runat="server"
	            PanesCssClass="CommonPane"
	            TabSetCssClass="CommonPaneTabSet"
	            TabCssClasses="CommonPaneTab"
	            TabSelectedCssClasses="CommonPaneTabSelected"
	            TabHoverCssClasses="CommonPaneTabHover">	    
	            <TWC:TabbedPane runat="server">
	                <Tab CssClass="SystemTab"><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_WidgetTabTitle" /></Tab>
	                <Content>
                        <div class="TabContent">
                            <table width="100%">
                                <tr>
                                    <td colspan="2">
                                        <div class="TabContent">
                                            <CP:EditorContentPane runat="server" id="WidgetContentPane" TextMode="velocity" Height="600px" FieldNameResource="CP_Tools_WidgetEditor_Content" FieldDescriptionResource="CP_Tools_WidgetEditor_Content_Description" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
	                </Content>
                </TWC:TabbedPane>
	            <TWC:TabbedPane runat="server">
	                <Tab CssClass="SystemTab"><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_ConfigurationTabTitle" /></Tab>
	                <Content>                            
                        <div class="TabContent">
                            <table width="100%">
                                <tr>
                                    <td colspan="2"><div class="CommonFormSubTitle"><cp:resourcecontrol ID="Resourcecontrol4" runat="Server" resourcename="CP_Tools_WidgetEditor_Header" /></div></td>
                                </tr>
                                <tr>
                                    <td class="CommonFormFieldName">
                                        <cp:formlabel ID="Formlabel3" runat="Server" controltolabel="WidgetHeaderShownByDefault" resourcename="CP_Tools_WidgetEditor_ShowHeaderByDefault" /><br />                                        
                                        <cp:resourcecontrol ID="Resourcecontrol5" runat="Server" resourcename="CP_Tools_WidgetEditor_ShowHeaderByDefault_Description" />
                                    </td>                                
                                    <td class="CommonFormField"><TEControl:YesNoCheckBox ID="WidgetHeaderShownByDefault" runat="server" /></td>
                                </tr>    
                                <tr>
                                    <td colspan="2">
                                        <CP:EditorContentPane runat="server" id="WidgetHeaderPane" TextMode="velocity" Height="200px" FieldNameResource="CP_Tools_WidgetEditor_HeaderScript" FieldDescriptionResource="CP_Tools_WidgetEditor_HeaderScript_Description"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"><div class="CommonFormSubTitle"><cp:resourcecontrol ID="Resourcecontrol7" runat="Server" resourcename="CP_Tools_WidgetEditor_Configuration" /></div></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <CP:EditorContentPane runat="server" id="WidgetConfigurationPane" TextMode="xml" Height="400px" FieldNameResource="CP_Tools_WidgetEditor_ConfigurationContent" FieldDescriptionResource="CP_Tools_WidgetEditor_ConfigurationContent_Description" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="CommonFormFieldName">
                                        <cp:formlabel ID="Formlabel9" runat="Server" controltolabel="WidgetContextIds" resourcename="CP_Tools_WidgetEditor_Contexts" /><br />                                        
                                        <cp:resourcecontrol ID="Resourcecontrol9" runat="Server" resourcename="CP_Tools_WidgetEditor_Contexts_Description" />
                                    </td>                                
                                    <td class="CommonFormField">
                                        <scf:ContextLookUpTextBox runat="server" ID="ContextLookup" EnableDuplicates="false" Width="300" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"><div class="CommonFormSubTitle"><cp:resourcecontrol ID="Resourcecontrol10" runat="Server" resourcename="CP_Tools_WidgetEditor_Caching" /></div></td>
                                </tr>
                                <tr>
                                    <td class="CommonFormFieldName">
                                        <cp:formlabel ID="Formlabel1" runat="Server" controltolabel="WidgetIsCacheable" resourcename="CP_Tools_WidgetEditor_IsCacheable" /><br />                                        
                                        <cp:resourcecontrol ID="Resourcecontrol11" runat="Server" resourcename="CP_Tools_WidgetEditor_IsCacheable_Description" />
                                    </td>                                
                                    <td class="CommonFormField"><TEControl:YesNoCheckBox ID="WidgetIsCacheable" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td class="CommonFormFieldName">
                                        <cp:formlabel ID="Formlabel2" runat="Server" controltolabel="WidgetCacheVariesByUser" resourcename="CP_Tools_WidgetEditor_VaryCacheByUser" /><br />
                                        <cp:resourcecontrol ID="Resourcecontrol12" runat="Server" resourcename="CP_Tools_WidgetEditor_VaryCacheByUser_Description" />
                                    </td>
                                    <td class="CommonFormField"><TEControl:YesNoCheckBox ID="WidgetCacheVariesByUser" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><div class="CommonFormSubTitle"><cp:resourcecontrol ID="Resourcecontrol13" runat="Server" resourcename="CP_Tools_WidgetEditor_Css" /></div></td>
                                </tr>
                                <tr>
                                    <td class="CommonFormFieldName">
                                        <cp:formlabel ID="Formlabel7" runat="Server" controltolabel="WidgetCssClass" resourcename="CP_Tools_WidgetEditor_CssClass" /><br />                                        
                                        <cp:resourcecontrol ID="Resourcecontrol14" runat="Server" resourcename="CP_Tools_WidgetEditor_CssClass_Description" />
                                    </td>                                
                                    <td class="CommonFormField"><asp:TextBox runat="server" ID="WidgetCssClass" MaxLength="200" Columns="40" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <CP:EditorContentPane runat="server" id="WidgetCssPane" TextMode="css" Height="200px" FieldNameResource="CP_Tools_WidgetEditor_AdditionalCss" FieldDescriptionResource="CP_Tools_WidgetEditor_AdditionalCss_Description"  />
                                    </td>
                                </tr>
                            </table>
                        </div>                                                
	                </Content>
                </TWC:TabbedPane>
                <TWC:TabbedPane ID="TabbedPane1" runat="server">
	                <Tab CssClass="SystemTab"><cp:resourcecontrol ID="Resourcecontrol16" runat="Server" resourcename="CP_Tools_WidgetEditor_Attachments" /></Tab>
	                <Content>
                        <div class="TabContent">
                            <table width="100%" class="NonEditableAttachmentList">
                                <tr>
                                    <td colspan="2"><div class="CommonFormSubTitle"><CP:ResourceControl runat="server" ResourceName="CP_Tools_WidgetEditor_Attached_Files" /></div></td>
                                </tr>
                                <asp:Repeater runat="server" runat="server" ID="NonEditableAttachments">
                                    <ItemTemplate>
                                        <tr data-filename="<%# DataBinder.Eval(Container.DataItem, "Name")%>" class="AttachmentRow">
                                            <td colspan="2" class="CommonFormField">
                                                <a href="#" class="delete"><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_Tools_WidgetEditor_Delete" /></a>
                                                <div>
                                                    <%# FileViewerService.Render(new Uri(((AttachedFile)(Container.DataItem)).DownloadUrl), Telligent.Evolution.Extensibility.UI.Version1.FileViewerViewType.Preview, 400, 200, false) %>
                                                </div>
                                                <a href="<%# DataBinder.Eval(Container.DataItem, "DownloadUrl")%>" target="_blank"><%# DataBinder.Eval(Container.DataItem, "Name")%></a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <tr id="NoAttachmentsMessage" runat="server" class="NoAttachments">
                                    <td colspan="2">
                                        <CP:ResourceControl runat="server" ResourceName="CP_Tools_WidgetEditor_NoAttachments" />
                                        <a href="#" class="attach">Upload Files.</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
	                </Content>
                </TWC:TabbedPane>
                <TWC:TabbedPane runat="server">
	                <Tab CssClass="SystemTab"><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_Resources" /></Tab>
	                <Content>
                        <div class="TabContent">
                            <CP:ResourceEditor runat="server" ID="ResourceEditor" />
                        </div>
	                </Content>
                </TWC:TabbedPane>
            </TWC:TabbedPanes>
        </div>
        <div style="clear:both;"></div>
    </div>
	
    <script type="text/html" id="NewFileTabTemplate">
        <div class="EditableFile">
            <table width="100%" class="EditableContent">
                <tr id="FileNameRow">
                    <td class="CommonFormFieldName">
                        <label for="FileName{%= fileIndex %}"><CP:ResourceControl runat="server" ResourceName="CP_Tools_WidgetEditor_FileName" /></label>
                    </td>
                    <td class="CommonFormField">
                        <a href="#" class="delete" title="<CP:ResourceControl runat="server" ResourceName="CP_Tools_WidgetEditor_Delete" />"><CP:ResourceControl runat="server" ResourceName="CP_Tools_WidgetEditor_Delete" /></a>
                        <input type="text" name="FileName{%= fileIndex %}" class="fileName" value="{%: fileName %}" size="40" maxlength="40" />.
                        <!-- TODO: Make this list data-driven -->
                        <select name="FileType{%= fileIndex %}" class="fileType">
                            <option value="html" {% if(textMode == "html"){ %} selected="selected" {% } %}>html</option>
                            <option value="javascript" {% if(textMode == "javascript"){ %} selected="selected" {% } %}>js</option>
                            <option value="css" {% if(textMode == "css"){ %} selected="selected" {% } %}>css</option>
                            <option value="velocity" {% if(textMode == "velocity"){ %} selected="selected" {% } %}>vm</option>
                            <option value="xml" {% if(textMode == "xml"){ %} selected="selected" {% } %}>xml</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="EditorLabel">
                            <label><CP:ResourceControl runat="server" ResourceName="CP_Tools_WidgetEditor_FileContent" /></label><br />
                            <CP:ResourceControl runat="server" ResourceName="CP_Tools_WidgetEditor_FileContent_Description" />
                        </div>
                        <textarea name="FileContent{%= fileIndex %}" class="editor" data-default-mode="{%: textMode %}" style="height:600px">{%: fileContent %}</textarea>
                    </td>
                </tr>
            </table>
        </div>
    </script>
    <script type="text/html" id="NewNonEditableFileTemplate">
        <tr data-upload-context="{%: uploadContext %}" data-filename="{%: fileName %}"  class="AttachmentRow">
            <td colspan="2">
                {%: fileName %}<a href="#" class="delete"><CP:ResourceControl runat="server" ResourceName="CP_Tools_WidgetEditor_Delete" /></a>
            </td>
        </tr>
    </script>
    <TEControl:JQuery ID="JQuery1" runat="server" />
    <TEControl:JQueryAutoResize ID="AutoResize" runat="server" />
    <script type="text/javascript" src="<%= ResolveUrl("~/ControlPanel/Utility/ManageWidgets/ace.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveUrl("~/ControlPanel/Utility/ManageWidgets/plugins.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveUrl("~/ControlPanel/Utility/ManageWidgets/WidgetEditor.js") %>"></script>
    <script type="text/javascript">
        jQuery(function ($) {
            $('div.WidgetEditorWrapper').widgetEditor({
			    newFileDefaultName: '<cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_NewFileName" encoding="JavaScript" />',
			    saveAsMessage: '<cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_SaveAsMessage" encoding="JavaScript" />',
			    fileDeleteConfirmMessage: "<cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_AttachmentDeleteConfirm" encoding="JavaScript" />",                
			    widgetDeleteVersionConfirmMessage: "<cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_WidgetDeleteVersionConfirm" encoding="JavaScript" />",
			    widgetDeleteConfirmMessage: "<cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_WidgetDeleteConfirm" encoding="JavaScript" />",
			    widgetRevertConfirmMessage: "<cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_WidgetRevertConfirm" encoding="JavaScript" />",
                spinnerPath: '<%= Telligent.Evolution.Components.JavaScript.Encode(Context.Response.ApplyAppPathModifier("~/utility/spinner.gif")) %>',
                helpPath: '<%= Telligent.Evolution.Components.JavaScript.Encode(Telligent.Evolution.Components.SiteUrls.Instance().ApiDocumentation("widget")) %>',
                themeSelectorPath: '<%= Telligent.Evolution.Components.JavaScript.Encode(Telligent.Evolution.Components.SiteUrls.Instance().SelectWidgetTheme("THEMENAME")) %>',
                themedWidgetEditorPath: '<%= Telligent.Evolution.Components.JavaScript.Encode(Telligent.Evolution.Components.SiteUrls.Instance().EditWidget(Widget.InstanceIdentifier, "THEMENAME", "")) %>',                
                currentTheme: '<%= Telligent.Evolution.Components.JavaScript.Encode(CurrentTheme) %>',                
                editorPopUpPanel: <%= SettingsPopupPanel.ClientID %>
            });
        });
    </script>

</asp:Content>