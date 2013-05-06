<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="ListWidgets.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Tools.ListWidgets" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="Telligent.Evolution.ControlPanel.Components"%>

<asp:Content ID="Content1" ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="CP_Tools_ManageWidgets_Title" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation ID="ControlPanelSelectedNavigation1" runat="server" SelectedNavItem="ToolsListWidgets" />    
    <CP:StatusMessage ID="StatusMessage" runat="server" />   

    <div class="WidgetManager">
        <div class="DockWrapper">
            <div class="Dock">
                <div class="DockSegment">
                    <h4><cp:resourcecontrol runat="Server" resourcename="CP_Tools_ListWidgets_Action" /></h4>
                    <CP:Hyperlink runat="server" UrlName="tools_ControlPanel_WidgetEditor" CssClass="CommonTextButton" ResourceName="CP_Tools_ListWidgets_CreateNewWidget" />
                    <CP:Modal runat="server" ID="Import" Width="940" Height="700"
                        Url="<%# Telligent.Evolution.Components.SiteUrls.Instance().ImportWidgets() %>" 
                        CssClass="CommonTextButton" ResourceName="CP_Tools_ListWidgets_ImportWidgets" 
                        ModalType="Link" Callback="widgetsImported"  ></CP:Modal>
                    <CP:Modal runat="server" ID="Modal1" Width="940" Height="700"
                        Url="<%# Telligent.Evolution.Components.SiteUrls.Instance().ImportResources() %>" 
                        CssClass="CommonTextButton" ResourceName="CP_Tools_ListWidgets_ImportResources"
                        ModalType="Link" Callback="resourcesImported"  ></CP:Modal>
                    <CP:Hyperlink runat="server" UrlName="tools_ControlPanel_DeveloperTools" CssClass="CommonTextButton" ResourceName="CP_Tools_ListWidgets_DeveloperTools" />
                    <a class="CommonTextButton" href="http://telligent.com/r.ashx?7L" target="_blank"><CP:ResourceControl runat="server" ResourceName="CP_Tools_ListWidgets_Marketplace" /></a>
                </div>
                <div class="DockSegment MultiWidgetActions">
                    <input type="hidden" id="SelectedWidgetIdentifiers" runat="server" />
                    <h4 class="SelectionMessage"></h4>
                    <cp:ResourceLinkButton runat="server" ResourceName="CP_Tools_ListWidgets_ExportSelected" ID="ExportSelectedWidgets" cssclass="export CommonTextButton" />
                    <cp:ResourceLinkButton runat="server" ResourceName="CP_Tools_ListWidgets_ExportSelected_Resources" ID="ExportSelectedWidgetResources" cssclass="exportResources CommonTextButton" />
                    <a href="#" class="CommonTextButton delete"><cp:resourcecontrol runat="Server" resourcename="CP_Tools_ListWidgets_DeleteSelected" /></a>
                </div>
            </div>
        </div>
        <div class="WidgetList">
			<table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <th class="CommonListHeaderLeftMost">
                    <input type="checkbox" />
                </th>
                <th class="CommonListHeader" colspan="3">
                    <CP:ResourceControl ResourceName="CP_Tools_ListWidgets_Filter_Viewing" runat="server" />
                    <select runat="server" id="ProviderSelect" class="WidgetFilter"></select>
                    <CP:ResourceControl ResourceName="CP_Tools_ListWidgets_Filter_Widgets" runat="server" />
                    <select runat="server" id="ThemeSelect" class="WidgetFilter"></select>                    
                    <CP:ResourceControl ResourceName="CP_Tools_ListWidgets_Filter_With" runat="server" />
                    <input type="text" name="WidgetFilter" class="WidgetFilter" data-placeholder="<cp:resourcecontrol runat="Server" resourcename="CP_Tools_ListWidgets_FilterInput" />" />
                </th>
            </tr>
		    <asp:repeater id="WidgetList" runat="server">
			    <itemtemplate>
				    <tr runat="server" id="WidgetRow" class="WidgetRow">
					    <td class="CommonListCellLeftMost">
                            <asp:checkbox id="WidgetSelection" runat="Server" />
                        </td>
					    <td class="CommonListCell">
						    <strong class="name"><a href="#" runat="server" id="WidgetLink" class="edit"><asp:literal id="WidgetName" runat="Server" /></a></strong> <br />
						    <span class="description"><asp:literal id="WidgetDescription" runat="Server" /></span>
					    </td>
                        <td class="CommonListCell">
                            <div class="WidgetActions">
                                <a href="#" class="CommonTextButton edit" runat="server" id="EditWidget"><cp:resourcecontrol runat="Server" resourcename="CP_Tools_ListWidgets_Edit" /></a>
                                <a href="#" class="CommonTextButton export"><cp:resourcecontrol runat="Server" resourcename="CP_Tools_ListWidgets_Export" /></a>
                                <a href="#" class="CommonTextButton revert" runat="server" id="RevertWidget"><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetEditor_Revert" /></a>
                                <a href="#" class="CommonTextButton delete" runat="server" id="DeleteWidget"><cp:resourcecontrol runat="Server" resourcename="CP_Tools_ListWidgets_Delete" /></a>
                            </div>
                        </td>
                        <td class="CommonListCell flags">
                            <div class="flags" runat="server" id="Flags">
                                <CP:ResourceControl runat="server" ID="CustomFlag" Tag="Span" CssClass="flag custom" ResourceName="CP_Tools_ListWidgets_Custom" />
                                <CP:ResourceControl runat="server" ID="ThemedFlag" Tag="Span" CssClass="flag themed" ResourceName="CP_Tools_ListWidgets_Themed" />
                            </div>
                        </td>
				    </tr>
			    </itemtemplate>
		    </asp:repeater>
            </table>
			<div id="WidgetsNotFound" class="CommonMessageWarning" style="display:none;"><CP:ResourceControl runat="server" ResourceName="CP_Tools_ListWidgets_WidgetsNotFound" /></div>
        </div>  
        <div style="clear:both;"></div>
    </div>

    <TEControl:JQuery ID="JQuery1" runat="server" />
    <script type="text/javascript" src="<%= ResolveUrl("~/ControlPanel/Utility/ManageWidgets/plugins.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveUrl("~/ControlPanel/Utility/ManageWidgets/ListWidgets.js") %>"></script>
    <script type="text/javascript">        
        jQuery(function ($) {
            $('div.WidgetManager').widgetManager({                
                revertUrl: '<%# Telligent.Evolution.Components.SiteUrls.Instance().RevertWidgets(null, null) %>',
			    selectedMessage: '<cp:resourcecontrol runat="Server" resourcename="CP_Tools_ListWidgets_SelectedMessage" encoding="JavaScript" />',
                resourceImportSuccessMessage:"<cp:resourcecontrol runat="Server" resourcename="CP_ImportResources_Success" encoding="JavaScript" />",
                widgetImportSuccessMessage:"<cp:resourcecontrol runat="Server" resourcename="CP_Tools_ListWidgets_ImportWidgetsSuccess" encoding="JavaScript" />",
                widgetDeleteSuccessMessage:"<cp:resourcecontrol runat="Server" resourcename="CP_Tools_ListWidgets_DeleteWidgetsSuccess" encoding="JavaScript" />",
                // resources
                text_Fragment_Header_NonColliding_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_Header_NonColliding_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Fragment_Header_Colliding_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_Header_Colliding_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Fragment_ActionOption_Merge_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ActionOption_Merge_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Fragment_ActionOption_Import_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ActionOption_Import_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Fragment_ImplementationOption_Existing_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ImplementationOption_Existing_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Fragment_ImplementationOption_New_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ImplementationOption_New_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Fragment_ResourcesOption_New_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ResourcesOption_New_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Fragment_ResourcesOption_Merge_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ResourcesOption_Merge_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Resources_NewHeader_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_NewHeader_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Resources_NewOption_Add_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_NewOption_Add_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Resources_NewOption_Ignore_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_NewOption_Ignore_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Resources_ExistingHeader_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ExistingHeader_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Resources_ExistingOption_Keep_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ExistingOption_Keep_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Resources_ExistingOption_Remove_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ExistingOption_Remove_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Resources_ConflictHeader_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ConflictHeader_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Resources_ConflictOption_Existing_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ConflictOption_Existing_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Resources_ConflictOption_New_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ConflictOption_New_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Resources_Unchanged_ScriptedContentFragmentImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_Unchanged_ScriptedContentFragmentImport" encoding="JavaScript" />',
                text_Fragment_Header_NonColliding_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_Header_NonColliding_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Fragment_Header_Colliding_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_Header_Colliding_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Fragment_ActionOption_Merge_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ActionOption_Merge_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Fragment_ActionOption_Import_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ActionOption_Import_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Fragment_ImplementationOption_Existing_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ImplementationOption_Existing_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Fragment_ImplementationOption_New_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ImplementationOption_New_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Fragment_ResourcesOption_New_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ResourcesOption_New_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Fragment_ResourcesOption_Merge_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ResourcesOption_Merge_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Resources_NewHeader_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_NewHeader_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Resources_NewOption_Add_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_NewOption_Add_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Resources_NewOption_Ignore_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_NewOption_Ignore_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Resources_ExistingHeader_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ExistingHeader_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Resources_ExistingOption_Keep_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ExistingOption_Keep_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Resources_ExistingOption_Remove_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ExistingOption_Remove_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Resources_ConflictHeader_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ConflictHeader_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Resources_ConflictOption_Existing_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ConflictOption_Existing_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Resources_ConflictOption_New_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ConflictOption_New_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Resources_Unchanged_ScriptedContentFragmentRevert: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_Unchanged_ScriptedContentFragmentRevert" encoding="JavaScript" />',
                text_Fragment_Header_Colliding_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_Header_Colliding_ResourceImport" encoding="JavaScript" />',
                text_Fragment_ResourcesOption_New_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ResourcesOption_New_ResourceImport" encoding="JavaScript" />',
                text_Fragment_ResourcesOption_Merge_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ResourcesOption_Merge_ResourceImport" encoding="JavaScript" />',
                text_Resources_NewHeader_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_NewHeader_ResourceImport" encoding="JavaScript" />',
                text_Resources_NewOption_Add_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_NewOption_Add_ResourceImport" encoding="JavaScript" />',
                text_Resources_NewOption_Ignore_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_NewOption_Ignore_ResourceImport" encoding="JavaScript" />',
                text_Resources_ExistingHeader_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ExistingHeader_ResourceImport" encoding="JavaScript" />',
                text_Resources_ExistingOption_Keep_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ExistingOption_Keep_ResourceImport" encoding="JavaScript" />',
                text_Resources_ExistingOption_Remove_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ExistingOption_Remove_ResourceImport" encoding="JavaScript" />',
                text_Resources_ConflictHeader_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ConflictHeader_ResourceImport" encoding="JavaScript" />',
                text_Resources_ConflictOption_Existing_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ConflictOption_Existing_ResourceImport" encoding="JavaScript" />',
                text_Resources_ConflictOption_New_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ConflictOption_New_ResourceImport" encoding="JavaScript" />',
                text_Resources_Unchanged_ResourceImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_Unchanged_ResourceImport" encoding="JavaScript" />',
                text_Theme_Header_Install_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Theme_Header_Install_ThemeImport" encoding="JavaScript" />',
                text_Theme_Header_Pages_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Theme_Header_Pages_ThemeImport" encoding="JavaScript" />',
                text_Theme_Header_Files_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Theme_Header_Files_ThemeImport" encoding="JavaScript" />',
                text_Theme_Header_Configuration_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Theme_Header_Configuration_ThemeImport" encoding="JavaScript" />',
                text_Theme_ImportHeader_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Theme_ImportHeader_ThemeImport" encoding="JavaScript" />',
                text_Theme_ImportFooter_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Theme_ImportFooter_ThemeImport" encoding="JavaScript" />',
                text_Theme_ImportConfiguration_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Theme_ImportConfiguration_ThemeImport" encoding="JavaScript" />',
                text_Fragment_Header_NonColliding_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_Header_NonColliding_ThemeImport" encoding="JavaScript" />',
                text_Fragment_Header_Colliding_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_Header_Colliding_ThemeImport" encoding="JavaScript" />',
                text_Fragment_ActionOption_Merge_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ActionOption_Merge_ThemeImport" encoding="JavaScript" />',
                text_Fragment_ActionOption_Import_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ActionOption_Import_ThemeImport" encoding="JavaScript" />',
                text_Fragment_ImplementationOption_Existing_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ImplementationOption_Existing_ThemeImport" encoding="JavaScript" />',
                text_Fragment_ImplementationOption_New_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ImplementationOption_New_ThemeImport" encoding="JavaScript" />',
                text_Fragment_ResourcesOption_New_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ResourcesOption_New_ThemeImport" encoding="JavaScript" />',
                text_Fragment_ResourcesOption_Merge_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Fragment_ResourcesOption_Merge_ThemeImport" encoding="JavaScript" />',
                text_Resources_NewHeader_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_NewHeader_ThemeImport" encoding="JavaScript" />',
                text_Resources_NewOption_Add_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_NewOption_Add_ThemeImport" encoding="JavaScript" />',
                text_Resources_NewOption_Ignore_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_NewOption_Ignore_ThemeImport" encoding="JavaScript" />',
                text_Resources_ExistingHeader_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ExistingHeader_ThemeImport" encoding="JavaScript" />',
                text_Resources_ExistingOption_Keep_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ExistingOption_Keep_ThemeImport" encoding="JavaScript" />',
                text_Resources_ExistingOption_Remove_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ExistingOption_Remove_ThemeImport" encoding="JavaScript" />',
                text_Resources_ConflictHeader_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ConflictHeader_ThemeImport" encoding="JavaScript" />',
                text_Resources_ConflictOption_Existing_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ConflictOption_Existing_ThemeImport" encoding="JavaScript" />',
                text_Resources_ConflictOption_New_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_ConflictOption_New_ThemeImport" encoding="JavaScript" />',
                text_Resources_Unchanged_ThemeImport: '<cp:resourcecontrol runat="Server" resourcename="CP_Merge_Resources_Unchanged_ThemeImport" encoding="JavaScript" />'
            });
        });
    </script>
  
</asp:Content>