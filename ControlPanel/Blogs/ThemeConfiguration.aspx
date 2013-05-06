<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="ThemeConfiguration.aspx.cs" Inherits="Telligent.Evolution.ControlPanel.Blogs.ThemeConfiguration" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
    <CP:ResourceControl ResourceName="CP_Blog_ThemeConfiguration_Title" runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <TEControl:JQueryUI ID="JQueryUI1" runat="server" />
    <cp:controlpanelselectednavigation selectednavitem="ThemeConfiguration" runat="server" id="SelectedNavigation1" />

    <script type="text/javascript">
    // <![CDATA[
    function refresh(shouldRefresh)
    {
        if (shouldRefresh)
            window.location = window.location;
    }
    // ]]>
    </script>

	<CP:StatusMessage id="StatusMessage" runat="server" />
	
	<DIV class="CommonDescription">
	    <CP:ResourceControl runat="server" ResourceName="CP_Blog_ThemeConfiguration_Description" />
	</DIV>
	
	<DIV class="CommonFormArea">
	<div style="margin-bottom: 1em;" id="ThemeSelectionArea" runat="server">
        <div class="CommonFormFieldName">
            <strong><CP:ResourceControl runat="server" ResourceName="CP_Blog_ThemeConfiguration_ThemeName" /></strong>
        </div>
        <div class="CommonFormField">
            <TWC:DropDownList runat="server" ID="Themes" onchange="return confirm('Are you sure you want to change themes? Any personalization you've made to the current theme will be lost');" ShowHtmlWhenSelected="false" SelectListWidth="440" SelectListHeight="375" />
        </div>
    </div>
    <asp:PlaceHolder ID="ThemeConfigurationArea" runat="server">
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
		        <table cellspacing="0" cellpadding="0" border="0" width="100%">
		    </PropertyFormGroupHeaderTemplate>
		    <PropertyFormSubGroupHeaderTemplate>
		        <tr><td colspan="2">
                    <div class="CommonFormSubTitle"><TEDynConfig:PropertySubGroupData Property="Name" runat="server" /></div>
                </td></tr>
		    </PropertyFormSubGroupHeaderTemplate>
		    <PropertyFormPropertyTemplate>
		        <tr class="field-item <%# Eval("ID") %>">
		            <td class="CommonFormFieldName" style="width:50%"><strong><TEDynConfig:PropertyData Property="Name" runat="server" /></strong><br /><TEDynConfig:PropertyData Property="Description" runat="server" /></td>
		            <td class="CommonFormField"><TEDynConfig:PropertyControl runat="server" /></td>
		        </tr>
		    </PropertyFormPropertyTemplate>
		    <PropertyFormSubGroupFooterTemplate>
		        <tr><td colspan="2">&nbsp;</td></tr>
		    </PropertyFormSubGroupFooterTemplate>
		    <PropertyFormGroupFooterTemplate>
		        </table>
		    </PropertyFormGroupFooterTemplate>
		    <AppendedTabbedPanes>
		        <TWC:TabbedPane runat="server">
		            <Tab><CP:ResourceControl ResourceName="CP_Blog_ThemeConfiguration_Preview_Title" runat="server" /></Tab>
		            <Content>
		                <asp:Literal runat="server" id="PreviewMessage" />
	                    <p />
	                    <asp:HyperLink runat="server" id="OpenPreview" Target="_blank" runat="server" CssClass="CommonTextButton"><cp:ResourceControl runat="server" ResourceName="CP_Blog_ThemeConfiguration_OpenNewPreviewWindow" /></asp:HyperLink>
	                    <cp:resourcelinkbutton id="UpdatePreviewButton" runat="server" ResourceName="CP_Blog_ThemeConfiguration_StartPreview" cssclass="CommonTextButton" />
                        <cp:resourcelinkbutton id="EndPreviewButton" runat="server" ResourceName="CP_Blog_ThemeConfiguration_EndPreview" Visible="false" cssclass="CommonTextButton" />
		            </Content>
		        </TWC:TabbedPane>
		    </AppendedTabbedPanes>
	    </TEDynConfig:ConfigurationForm>
    </asp:PlaceHolder>
	<div class="DetailsFixedWidth BlogThemeConfigurationButtonArea">
	    <div class="PanelSaveButton">
            <div style="float:left;">
                <CP:ModalButton runat="server" ID="RevertButton" Width="550" Height="400" Callback="refresh" ResourceName="CP_RevertThemes_Revert" ResourceFile="ControlPanelResources.xml" />
                &nbsp;
                <cp:ModalButton runat="server" id="ImportButton" Width="550" Height="200" Callback="refresh" />
                &nbsp;
                <asp:Button runat="server" id="ExportConfiguration" />
            </div>
            <div style="float: right; margin-right: 27px;">
                <cp:resourcebutton id="SaveButton" runat="server" resourcename="Save"  />
            </div>
            <div style="clear: both;"></div>
        </div>
	</div>
    </DIV>
</asp:Content>