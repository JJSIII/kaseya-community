<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="ThemeConfiguration.aspx.cs" Inherits="Telligent.Evolution.ControlPanel.Settings.ThemeConfiguration" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
    <CP:ResourceControl ResourceName="CP_ThemeConfiguration_Title" runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ThemeConfigurationSettings" />
	<TEControl:JQuery ID="JQuery1" runat="server" />
	<TEControl:JQueryUI ID="JQueryUI1" runat="server" />
	<TEControl:JQueryGlow ID="JQueryGlow1" runat="server" />
	<TEControl:JQueryEvolution ID="JQueryEvolution1" runat="server" />
	<TEControl:Script ID="Script1" runat="server" Src="~/ControlPanel/Settings/tooltip.js" EnableFileDateVersioning="true" />

    <script type="text/javascript">
    // <![CDATA[
    function refresh(shouldRefresh)
    {
        if (shouldRefresh)
            window.location = window.location;
    }
    // ]]>
    </script>

	<DIV class="CommonDescription">
	    <CP:ResourceControl runat="server" ResourceName="CP_ThemeConfiguration_Description" />
	</DIV>
	<CP:StatusMessage id="StatusMessage" runat="server" />
	<DIV class="CommonFormArea">
        <div style="margin-bottom: 1em;">
            <div class="CommonFormFieldName">
                    <strong><CP:ResourceControl runat="server" ResourceName="CP_ThemeConfiguration_ThemeName" /></strong>
            </div>
            <div class="CommonFormField">
                    <TWC:DropDownList runat="server" ID="Themes" ShowHtmlWhenSelected="false" SelectListWidth="440" SelectListHeight="375" />
            </div>
        </div>
        
	    <div style="float: left;"><asp:Image runat="server" id="ThemePreviewImage" Width="100" Height="75" BorderWidth="1" style="margin-right: 1em;" /></div>
	    <h4 class="CommonFormTitle"><asp:Literal runat="server" id="ThemeName" /></h4>
	    <div class="CommonFormDescription">
	        <asp:Literal runat="server" id="ThemePreviewText" />
	    </div>
	    <div style="clear: both; padding-bottom: 1em;"></div>
	
	    <TEDynConfig:ConfigurationForm runat="server" id="ConfigurationForm"
	        RenderGroupsInTabs="true" 
	        PanesCssClass="CommonPane"
		    TabSetCssClass="CommonPaneTabSet"
		    TabCssClasses="CommonPaneTab"
		    TabSelectedCssClasses="CommonPaneTabSelected"
		    TabHoverCssClasses="CommonPaneTabHover"
		    >
		    <PropertyFormGroupHeaderTemplate>
		        <div class="CommonFormDescription">
		            <TEDynConfig:PropertyGroupData Property="Description" runat="server" />
		        </div>
		        <table cellspacing="0" cellpadding="2" border="0" width="100%">
		    </PropertyFormGroupHeaderTemplate>
		    <PropertyFormSubGroupHeaderTemplate>
		        <tr><td colspan="2">
                    <div class="CommonFormSubTitle"><TEDynConfig:PropertySubGroupData Property="Name" runat="server" /></div>
                </td></tr>
		    </PropertyFormSubGroupHeaderTemplate>
		    <PropertyFormPropertyTemplate>
		        <tr valign="top" class="field-item <%# Eval("ID") %>">
		            <td class="CommonFormFieldName" style="width:50%"><strong><TEDynConfig:PropertyData Property="Name" runat="server" /></strong><br /><TEDynConfig:PropertyData Property="Description" runat="server" /></td>
		            <td class="CommonFormField"><TEDynConfig:PropertyControl runat="server" /></td>
		        </tr>
		    </PropertyFormPropertyTemplate>
		    <PropertyFormSubGroupFooterTemplate>
		        <tr><td colspan="2"><div style="height: .5em;"></div></td></tr>
		    </PropertyFormSubGroupFooterTemplate>
		    <PropertyFormGroupFooterTemplate>
		        </table>
		    </PropertyFormGroupFooterTemplate>
		    <AppendedTabbedPanes>
		        <TWC:TabbedPane runat="server">
		            <Tab><CP:ResourceControl ResourceName="CP_ThemeConfiguration_Preview_Title" runat="server" /></Tab>
		            <Content>
		                <asp:Literal runat="server" id="PreviewMessage" />
	                    <p />
   	                    <asp:HyperLink runat="server" id="OpenPreview" Target="_blank" runat="server" CssClass="CommonTextButton"><cp:ResourceControl runat="server" ResourceName="CP_ThemeConfiguration_OpenNewPreviewWindow" /></asp:HyperLink>
	                    <cp:resourcelinkbutton id="UpdatePreviewButton" runat="server" ResourceName="CP_ThemeConfiguration_StartPreview" cssclass="CommonTextButton" />
                        <cp:resourcelinkbutton id="EndPreviewButton" runat="server" ResourceName="CP_ThemeConfiguration_EndPreview" Visible="false" cssclass="CommonTextButton" />
		            </Content>
		        </TWC:TabbedPane>
		    </AppendedTabbedPanes>
	    </TEDynConfig:ConfigurationForm>
	<p class="PanelSaveButton">
	    <CP:ModalLink runat="server" ID="RevertButton" Width="550" Height="400" Callback="refresh" CssClass="CommonTextButton" ResourceName="CP_RevertThemes_Revert" ResourceFile="ControlPanelResources.xml" />
        &nbsp;&nbsp;
        <cp:ModalLink runat="server" id="ImportButton" Width="550" Height="200" Callback="refresh" CssClass="CommonTextButton" />
        <asp:HyperLink runat="server" id="ExportConfiguration" CssClass="CommonTextButton"><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="Export" /></asp:HyperLink>
        &nbsp;&nbsp;	        
        <cp:resourcelinkbutton id="SaveButton" runat="server" resourcename="Save" cssclass="CommonTextButton" />
	</p>
</DIV>

<script type="text/javascript">
    // <![CDATA[
	jQuery(function ($) {
		$('#<%= RevertButton.ClientID %>').cpToolTip({
			tooltip: '<div class="tooltip-outer"><div class="tooltip"><CP:ResourceControl runat="Server" ResourceName="CP_SiteTheme_Revert_ToolTip" /></div></div>'
		});
		$('#<%= ImportButton.ClientID %>').cpToolTip({
			tooltip: '<div class="tooltip-outer"><div class="tooltip"><CP:ResourceControl runat="Server" ResourceName="CP_SiteTheme_Import_ToolTip" /></div></div>'
		});
		$('#<%= ExportConfiguration.ClientID %>').cpToolTip({
			tooltip: '<div class="tooltip-outer"><div class="tooltip"><CP:ResourceControl runat="Server" ResourceName="CP_SiteTheme_Export_ToolTip" /></div></div>'
		});
		$('#<%= SaveButton.ClientID %>').cpToolTip({
			tooltip: '<div class="tooltip-outer"><div class="tooltip"><CP:ResourceControl runat="Server" ResourceName="CP_SiteTheme_Save_ToolTip" /></div></div>'
		});
	});
    // ]]>
    </script>

</asp:Content>
