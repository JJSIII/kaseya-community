<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.BlogAdmin.HomePage" MasterPageFile="~/ControlPanel/Masters/BlogAdmin.master" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <cp:controlpanelselectednavigation selectednavitem="Blogs" runat="server" id="SelectedNavigation1" />
	
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
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/BlogAdmin/sectionedit.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_CreateNewBlog" />
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
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/BlogAdmin/Blogs.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_Blogs" />
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
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/BlogAdmin/Options/GeneralOptions.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_GeneralSettings" />
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
                            <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/BlogAdmin/Options/SkinOptions.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_ThemeSettings" />
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