<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfigureAddon.aspx.cs" Inherits="Telligent.EvolutionWeb.ControlPanel.Settings.ConfigureAddon" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">

	<div class="CommonContentArea">
	<div class="CommonContent">
	        <TEControl:ConfigureAddonForm runat="server" ID="ConfigurableAddonForm"
	                ConfigurableAddonNameTextId="AddonName" 
	                SaveButtonId="Save" 
	                RestoreDefaultsButtonId="RestoreDefaultsButton"
	                AddonConfigurationFormId="ConfigurationForm">
                <FormTemplate>
        	        <div class="CommonFormArea">
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
		                    <tr>
		                        <td colspan="2">
                                    <div class="CommonFormSubTitle"><TEDynConfig:PropertySubGroupData Property="Name" runat="server" /></div>
                                </td>
                            </tr>
		                </PropertyFormSubGroupHeaderTemplate>
		                <PropertyFormPropertyTemplate>
		                    <tr valign="top">
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
	                </TEDynConfig:ConfigurationForm>
                </FormTemplate>
            </TEControl:ConfigureAddonForm>
        </div>
        <div class="CommonFormField PanelSaveButton">
            <asp:Button ID="RestoreDefaultsButton" runat="server" />
            <asp:Button ID="Save" runat="server" />
        </div>
        
    </div>
</asp:Content>