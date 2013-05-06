<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.Master" AutoEventWireup="true" CodeBehind="ReplaceWidgets.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Tools.ReplaceWidgets" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="Telligent.Evolution.ControlPanel.Components"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TopLeft" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="CP_Tools_ManageWidgets_Title" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TaskRegion" runat="server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ToolsReplaceWidgets" />
    <CP:StatusMessage ID="StatusMessage" runat="server" />
    
	<div class="CommonDescription">
		<cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_SubTitle" /><br />
	</div>     
    
    <div class="WidgetReplacer">

        <div class="WidgetSelection">
            <table width="100%" class="WidgetSelection">
                <tr class="TargetThemeList">
                    <td class="CommonFormFieldName">
                        <label><strong><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_TargetTheme" /></strong><br /><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_TargetTheme_Desc" /></label>
                    </td>                                
                    <td class="CommonFormField">
                        <TWC:DropDownList runat="server" ID="TargetThemeList" ShowHtmlWhenSelected="false" SelectListWidth="440" SelectListHeight="375" OnChangeClientFunction="jQuery.fn.widgetSelector.raiseThemeChange"  />
                    </td>
                </tr>
                <tr class="TargetWidgetList">
                    <td class="CommonFormFieldName">
                        <label><strong><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_TargetWidget" /></strong><br /><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_TargetWidget_Desc" /></label>
                    </td>
                    <td class="CommonFormField">
                        <asp:DropDownList runat="server" ID="TargetWidgetList"></asp:DropDownList>
                    </td>
                </tr>  

                <tr class="ReplacementWidgetList ContainerSelection">
                    <td class="CommonFormFieldName">
                        <label class="Description">
                            <strong><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_Containers" /></strong><br />
                            <cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_Containers_Desc" />
                        </label>
                    </td>
                    <td class="CommonFormField">
                        <div class="SelectAll">
                            <input type="checkbox" name="ContainedTemplate" id="all" value="all" />
                            <label for="all"><cp:resourcecontrol ID="Resourcecontrol1" runat="Server" resourcename="CP_Tools_WidgetReplacer_SelectAll" /></label>
                        </div>
                        <div class="Containers"></div>
                        <ul class="Pager"></ul>
                        <div class="NoContainers" style="display:none">
                            <cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_Containers_None" />
                        </div>
                    </td>
                </tr>  


                <tr class="ReplacmentSelection">
                    <td class="CommonFormFieldName">
                        <label>
                            <strong><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_ReplacementWidget" /></strong><br />
                            <cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_ReplacementWidget_Desc" />                            
                        </label>
                    </td>
                    <td class="CommonFormField">
                        <asp:DropDownList runat="server" ID="ReplacementWidgetList"></asp:DropDownList>
                    </td>
                </tr>  

                <tr class="ReplacementConfiguration">
                    <td class="CommonFormFieldName">
                        <label>
                            <strong><cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_ReplacementConfiguration" /></strong><br />
                            <cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_ReplacementConfiguration_Desc" />                        
                        </label>
                    </td>
                    <td class="CommonFormField">
                        <iframe id="ReplacementConfigurationFrame" frameborder="0"></iframe>
                    </td>
                </tr>

            </table>
        </div>

    </div>


    <script type="text/html" id="ContainersTemplate">    
    <div>
        <input type="checkbox" name="ContainedTemplate" id="{%: DisplayID %}" value="{%: DisplayID %}" />
        <label for="{%: Name %},{%: ID %}">{%: DisplayName %}</label>
    </div>
    </script>
    <TEControl:JQuery runat="server" />
    <script type="text/javascript" src="<%= ResolveUrl("~/ControlPanel/Utility/ManageWidgets/plugins.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveUrl("~/ControlPanel/Utility/ManageWidgets/ReplaceWidgets.js") %>"></script>

    <script type="text/javascript">
    jQuery(function ($) {
        $('div.WidgetReplacer').widgetReplacer({
            configurationUrl: '<%= Telligent.Evolution.Components.JavaScript.Encode(Telligent.Evolution.Components.SiteUrls.Instance().ReplacementWidgetConfiguration("TYPEID",ThemeName)) %>',
			replacementConfirmationMessage: "<cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_ReplacementConfirmation" encoding="JavaScript" />",
			replacementSuccessMessage: "<cp:resourcecontrol runat="Server" resourcename="CP_Tools_WidgetReplacer_Success" encoding="JavaScript" />"
        });
    });
    </script>

</asp:Content>
