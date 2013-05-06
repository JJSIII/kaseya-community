<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfigureDynamicNavigationItem.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Utility.ConfigureDynamicNavigationItem" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">

    <TEControl:Title runat="server" ResourceName="CP_DynamicNavigationItem_Title" ResourceFile="ControlPanelResources.xml" IncludeSiteName="false" IncludeSectionOrHubName="false" />

	<div class="CommonContentArea">
	    <div class="CommonContent">
            <TEControl:ConfigureDynamicNavigationItemForm runat="server" TitleTextBoxId="NavTitle" UrlTextBoxId="NavURL" RolesTextBoxId="NavRoles" SelectedOnLocationsTextBoxId="Locations" SelectedOnUrlPatternTextBoxId="UrlPattern" SaveButtonId="Save">
                <FormTemplate>
                    <div class="CommonDescription">
                        <CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigationItem_Description" />
                    </div>
                    <TWC:TabbedPanes id="EditorTabs" runat="server"
                        PanesCssClass="CommonPane"
                        TabSetCssClass="CommonPaneTabSet"
                        TabCssClasses="CommonPaneTab"
                        TabSelectedCssClasses="CommonPaneTabSelected"
                        TabHoverCssClasses="CommonPaneTabHover"
                        >
                        <TWC:TabbedPane runat="server">
	                        <Tab><CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigation_Tab_TitleAndUrl" /></Tab>
	                        <Content>
                    
    	                        <div class="CommonFormArea">
        	                        <table cellspacing="0" border="0" cellpadding="0">
        	                            <tr>
        	                                <td class="CommonFormFieldName">
        	                                    <strong><CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigationItem_LinkTitle" /></strong><br />
        	                                    <CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigationItem_LinkTitle_Description" />
        	                                </td>
        	                                <td class="CommonFormField"><asp:TextBox runat="server" ID="NavTitle" Columns="35" /></td>
        	                            </tr>
        	                            <tr>
        	                                <td class="CommonFormFieldName">
        	                                    <strong><CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigationItem_URL" /></strong><br />
        	                                    <CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigationItem_URL_Description" />
        	                                </td>
        	                                <td class="CommonFormField"><asp:TextBox runat="server" ID="NavURL" Columns="50" /></td>
        	                            </tr>
        	                        </table>
        	                    </div>
        	                    
        	                </Content>
        	            </TWC:TabbedPane>
        	            <TWC:TabbedPane runat="server">
	                        <Tab><CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigation_Tab_Security" /></Tab>
	                        <Content>
	                        
	                            <div class="CommonFormArea">
        	                        <table cellspacing="0" border="0" cellpadding="0">
        	                            <tr>
        	                                <td class="CommonFormFieldName">
        	                                    <strong><CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigationItem_Roles" /></strong><br />
        	                                    <CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigationItem_Roles_Description" />
        	                                </td>
        	                                <td class="CommonFormField"><asp:TextBox runat="server" ID="NavRoles" Columns="50" /></td>
        	                            </tr>
        	                        </table>
        	                    </div>
	                        
	                        </Content>
	                    </TWC:TabbedPane>
	                    <TWC:TabbedPane runat="server">
	                        <Tab><CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigation_Tab_Selection" /></Tab>
	                        <Content>

                                <div class="CommonFormArea">
                                    <CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigation_Tab_Selection_Description" Tag="Div" CssClass="CommonFormDescription" />
                                
        	                        <table cellspacing="0" border="0" cellpadding="0">
        	                            <tr>
        	                                <td class="CommonFormFieldName">
        	                                    <strong><CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigationItem_SelectedUrlPattern" /></strong><br />
        	                                    <CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigationItem_SelectedUrlPattern_Description" />
        	                                </td>
        	                                <td class="CommonFormField"><asp:TextBox runat="server" ID="UrlPattern" Columns="50" /></td>
        	                            </tr>
        	                            <tr>
        	                                <td class="CommonFormFieldName">
        	                                    <strong><CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigationItem_SelectedLocations" /></strong><br />
        	                                    <CP:ResourceControl runat="server" ResourceName="CP_DynamicNavigationItem_SelectedLocations_Description" />
        	                                </td>
        	                                <td class="CommonFormField"><asp:TextBox runat="server" ID="Locations" Columns="50" /></td>
        	                            </tr>
        	                        </table>
        	                    </div>
	                        
	                        </Content>
	                    </TWC:TabbedPane>
	                </TWC:TabbedPanes>
        	                    
        	        <div class="CommonFormArea">
                        <div class="CommonFormField PanelSaveButton">
                            <asp:Button ID="Save" runat="server" />
                        </div>
                    </div>
                </FormTemplate>
            </TEControl:ConfigureDynamicNavigationItemForm>
        </div>
    </div>
</asp:Content>