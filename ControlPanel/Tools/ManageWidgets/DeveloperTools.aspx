<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.Master" AutoEventWireup="True" CodeBehind="DeveloperTools.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Tools.DeveloperTools" %>
<%@ Register TagPrefix="scf" Namespace="Telligent.Evolution.ScriptedContentFragments.Controls" Assembly="Telligent.Evolution.ScriptedContentFragments" %>

<asp:Content ContentPlaceHolderID="TaskRegion" runat="server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ToolsListWidgets" />    
    <CP:StatusMessage ID="StatusMessage" runat="server" />   

    <div class="CommonDescription">		
        <cp:resourcecontrol runat="Server" resourcename="CP_Tools_DeveloperTools_SubTitle" /><br />
	</div>     

    <table width="100%">
        <tr>
            <td class="CommonFormFieldName">
                <label><strong><cp:resourcecontrol runat="Server" resourcename="CP_Tools_DeveloperTools_ClearCache" /></strong><br /><cp:resourcecontrol runat="Server" resourcename="CP_Tools_DeveloperTools_ClearCache_Desc" /></label>
            </td>
            <td class="CommonFormField">
                <CP:ResourceLinkButton runat="server" ID="ClearCacheButton" ResourceName="CP_Tools_DeveloperTools_ClearCache" CssClass="CommonTextButton" />                    
            </td>
        </tr>  
        <tr>
            <td class="CommonFormFieldName">
                <label><strong><cp:resourcecontrol runat="Server" resourcename="CP_Tools_DeveloperTools_GenerateGuid" /></strong><br /><cp:resourcecontrol runat="Server" resourcename="CP_Tools_DeveloperTools_GenerateGuid_Desc" /></label>
            </td>
            <td class="CommonFormField">
                <CP:ResourceLinkButton runat="server" ID="CreateGuidButton" ResourceName="CP_Tools_DeveloperTools_GenerateGuid" CssClass="CommonTextButton" />
                <asp:Label runat="server" ID="NewGuidLabel" class="GuidDisplay"></asp:Label>
            </td>
        </tr>  
        <tr>
            <td class="CommonFormFieldName">
                <label><strong><cp:resourcecontrol runat="Server" resourcename="CP_Tools_DeveloperTools_LookupContext" /></strong><br /><cp:resourcecontrol runat="Server" resourcename="CP_Tools_DeveloperTools_LookupContext_Desc" /></label>
            </td>
            <td class="CommonFormField">
                <scf:ContextLookUpTextBox runat="server" ID="ContextLookupTextBox" Width="300" EnableDuplicates="false" MaximumSelections="1" OnChangeClientFunction="ContextItemSelected" />
                <span id="ContextDisplay" class="GuidDisplay"></span>
            </td>
        </tr>  
        <tr>
            <td class="CommonFormFieldName">
                <label><strong><cp:resourcecontrol runat="Server" resourcename="CP_Tools_DeveloperTools_ApiDocumention" /></strong><br /><cp:resourcecontrol runat="Server" resourcename="CP_Tools_DeveloperTools_ApiDocumention_Desc" /></label>
            </td>
            <td class="CommonFormField">
                <a href="#" runat="server" id="ApiDocumentationAnchor" class="CommonTextButton help" />
            </td>
        </tr>  
    </table>


    <TEControl:JQuery runat="server" />
    <script type="text/javascript">
        (function ($) {
            $('a.help').bind('click', function (e) {
                e.preventDefault();
                window.open($(e.target).attr('href'), "ApiHelp", 'width=960,height=700,scrollbars=yes,toolbar=yes,location=yes,menubar=false');
            });

            window.ContextItemSelected = function (lookupTextBox) {
                var guid = '';
                var selectedCount = lookupTextBox.GetSelectedLookUpCount();
                if (selectedCount > 0) {
                    var contextItem = lookupTextBox.GetSelectedLookUpByIndex(0);
                    if (contextItem !== null) {
                        guid = contextItem.Value.split(':', 2)[1].replace(/-/gi, '');
                    }
                }
                $('#ContextDisplay').html(guid);
            };

        } (jQuery));
    </script>
</asp:Content>
