<%@ Page language="c#" Codebehind="ThemeConfiguration.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Groups.ThemeConfiguration" MasterPageFile="~/ControlPanel/Masters/Groups.master" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="ThemeOptions" runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <TEControl:JQueryUI ID="JQueryUI1" runat="server" />
    <div class="CommonDescription">
	    <CP:ResourceControl runat="server" ResourceName="CP_Groups_ThemeConfiguration_Desc" />
	</div>
	<CP:StatusMessage id="StatusMessage" runat="server" />
    <TEControl:GroupThemeConfigurationForm runat="server" 
        EndPreviewButtonId="EndPreview" 
        ExportButtonId="Export" 
        ImportModalButtonId="Import" 
        RestoreDefaultsButtonId="RevertButton" 
        SaveButtonId="Save" 
        ThemeConfigurationFormId="ConfigurationForm" 
        ThemeDescriptionTextId="ThemePreviewText" 
        ThemeDropDownListId="Themes" 
        ThemeNameTextId="ThemeName" 
        ThemePreviewImageId="ThemePreviewImage" 
        UpdatePreviewButtonId="UpdatePreview"
        StartPreviewButtonId="StartPreview"
        >
        <SaveSuccessfulActions>
            <TEControl:GoToModifiedUrlAction runat="server" QueryStringModification="Success=True" />
        </SaveSuccessfulActions>
        <PreviewUpdatedActions>
        
        </PreviewUpdatedActions>
        <PreviewEndedActions>
        
        </PreviewEndedActions>
        <DefaultsRestoredActions>
        
        </DefaultsRestoredActions>
        <FormTemplate>
            <TEControl:PlaceHolder runat="server" CssClass="CommonContentBoxHeaderForm">
                <DisplayConditions><TEControl:ControlVisibilityCondition runat="server" ControlId="Themes" ControlVisibilityEquals="true" /></DisplayConditions>
                <ContentTemplate>
                    <div class="CommonFormArea">
                        <div class="CommonFormFieldName">
                            <TEControl:ResourceControl runat="server" ResourceName="EditProfile_Theme"/>: <TWC:DropDownList runat="server" ID="Themes" ShowHtmlWhenSelected="false" SelectListWidth="440" SelectListHeight="375" />
                        </div>
                    </div>
                </ContentTemplate>
            </TEControl:PlaceHolder>

            <div class="CommonContentBoxContent">
                <TEControl:PlaceHolder runat="server">
                    <DisplayConditions><TEControl:ControlVisibilityCondition runat="server" ControlId="ConfigurationForm" ControlVisibilityEquals="true" /></DisplayConditions>
                    <ContentTemplate>
                        <h2>
                            <asp:Image runat="server" id="ThemePreviewImage" Width="60" Height="40" BorderWidth="1" ImageAlign="AbsMiddle" />
                            <asp:Literal runat="server" id="ThemeName" />
                        </h2>
                        <p>
                            <asp:Literal runat="server" id="ThemePreviewText" />
                        </p>
                    </ContentTemplate>
                </TEControl:PlaceHolder>
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
		                    <td class="CommonFormFieldName" style="width:50%">
                                <strong><TEDynConfig:PropertyData Property="Name" runat="server" /></strong><br />
                                <TEDynConfig:PropertyData Property="Description" runat="server" />
                            </td>
		                    <td class="CommonFormField">
                                <TEDynConfig:PropertyControl runat="server" />
                            </td>
		                </tr>
                    </PropertyFormPropertyTemplate>
                    <PropertyFormSubGroupFooterTemplate>
		                <tr><td colspan="2">&nbsp;</td></tr>
                    </PropertyFormSubGroupFooterTemplate>
		            <PropertyFormGroupFooterTemplate>
		                </table>
		            </PropertyFormGroupFooterTemplate>
                    <AppendedTabbedPanes>
                        <TWC:TabbedPane runat="server" ID="PreviewPane">
                            <Tab><TEControl:ResourceControl runat="server" ResourceName="CreateEditPost_Tab_Preview" /></Tab>
                            <Content>
                                <div class="CommonFormFieldDescription">
                                    <p>
                                        Ready to see what your new theme looks like? 
                                    </p>
                                    <p>
                                        Just click 'Enter Preview Mode' you can then browse and preview the changes that you've made -- your changes won't become live until you click 'Save' (so don't forget to save!) 
                                    </p>
                                </div>
    		                    
                                <asp:Button ID="StartPreview" runat="server" />
                                <asp:Button ID="UpdatePreview" runat="server"/>
                                <asp:Button ID="EndPreview" runat="server" />
                            </Content>
                        </TWC:TabbedPane>
                    </AppendedTabbedPanes>
                </TEDynConfig:ConfigurationForm>
    	
                <p>
                    <asp:Button ID="Save" runat="server"  />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <TEControl:Modal ModalType="Button" ID="Import" runat="server" ResourceName="Hubs_Import" Width="500" Height="300" />
                    <asp:Button ID="Export" runat="server"  />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <CP:ResourceButton runat="server" ID="RevertButton" ResourceName="CP_RevertThemes_Revert" ResourceFile="ControlPanelResources.xml" />
                </p>
            </div>
        </FormTemplate>
    </TEControl:GroupThemeConfigurationForm>

</asp:Content>