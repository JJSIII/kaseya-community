<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.GroupAdmin.HomePage" MasterPageFile="~/ControlPanel/Masters/GroupAdmin.master" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <script type="text/javascript" src="../charts/swfobject.js"></script>
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Hubs" runat="server" />
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
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/GroupAdmin/creategroup.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_Hub_NavBar_CreateHubLink" />
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
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/GroupAdmin/groups.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_Hub_NavBar_HubList" />
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
                            <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/GroupAdmin/Options/ThemeOptions.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_Hub_NavBar_ThemeOptions" />
	                        </asp:HyperLink>
	                        </strong>
                        </td>
                    </tr>
                    </table>
                    
                </div>
            </td>
            
            <td valign="top" style="padding-left:20px;">
            </td>
        </tr>
    </table>
	
	<div style="float:none; clear: both;"></div>
</asp:Content>
