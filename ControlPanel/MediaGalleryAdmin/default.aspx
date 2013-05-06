<%@ Page language="c#" Codebehind="default.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleryAdmin._default" MasterPageFile="~/ControlPanel/Masters/MediaGalleryAdmin.master" %>
<%@ Register TagPrefix="CP" TagName = "RecentPosts" Src = "~/ControlPanel/MediaGalleryAdmin/RecentPosts.ascx" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="MediaGallery" runat="server" />
	
	<table style="width:100%">
        <tr>
            <td style="width:250px; padding:20px" valign="top">
                <div class="CommonListArea">
                   <table width="100%" cellpadding="0">
                   <tr>
                        <td>
                            <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/blog-post.gif" />
                            </div>
                            
                            <strong>
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/MediaGalleryAdmin/CreateEditMediaGallery.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_CreateNewMediaGallery" />
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
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/MediaGalleryAdmin/MediaGalleries.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_MediaGalleries" />
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
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/MediaGalleryAdmin/Quotas.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_GlobalQuotas" />
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