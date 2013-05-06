<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Settings.SettingsHomePage" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
	<CP:ControlPanelSelectedNavigation SelectedNavItem="Settings" runat="server" />
	
	<table style="width:100%">
        <tr>
            <td style="width:300px; padding:20px" valign="top">
                <div class="CommonListArea">
                   <table width="100%" cellpadding="0">
                   <tr>
                        <td>
                            <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/blog-post.gif" />
                            </div>
                            
                            <strong>
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/Settings/Setup.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_Settings_Setup" />
	                        </asp:HyperLink>
	                        </strong>                        
	                    </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/comments.gif" />
                            </div>
                            
                            <strong>
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/tools/ManageLicenses.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_Dashboard_License_Action" />
	                        </asp:HyperLink>
	                        </strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/control-panel.gif" />
                            </div>
                            
                            <strong>
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/Settings/AdvancedConfiguration.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_Settings_AdvancedConfiguration" />
	                        </asp:HyperLink>
	                        </strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/themes.gif" />
                            </div>
                            
                            <strong>
                                <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/Settings/ThemeConfiguration.aspx">
	                                <CP:ResourceControl runat="server" ResourceName="CP_Settings_ThemeConfigurationSettings" />
                                </asp:HyperLink>
                            </strong>
                        </td>
                    </tr>
                    </table>
                    
                </div>
            </td>
        </tr>
    </table>
	
	<div style="float:none; clear: both;"></div>
</asp:Content>

