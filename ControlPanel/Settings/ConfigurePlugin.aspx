<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="ConfigurePlugin.aspx.cs" Inherits="Telligent.Evolution.ControlPanel.Settings.ConfigurePlugin" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Register Src="~/ControlPanel/Utility/LanguageResourceEditor.ascx" TagName="ResourceEditor" TagPrefix="CP" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
<script type="text/javascript">
// <![CDATA[
    function closeModal()
    {
        window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(true);
    }
// ]]>
</script>
<div class="CommonContentArea">
	<div class="CommonContent">
	
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
                    <TWC:TabbedPane runat="server" ID="TranslationTab">
                        <Tab><CP:ResourceControl runat="server" ResourceName="ConfigurePlugin_Translate" /></Tab>
                        <Content>
                            <CP:ResourceEditor runat="server" ID="TranslationEditor" />
                        </Content>
                    </TWC:TabbedPane>                
                </AppendedTabbedPanes>
	        </TEDynConfig:ConfigurationForm>
	        <p class="PanelSaveButton">
                <cp:resourcelinkbutton id="SaveButton" runat="server" resourcename="Save" cssclass="CommonTextButton" />
	        </p>
        </div>

	</div>
</div>
</asp:Content>
