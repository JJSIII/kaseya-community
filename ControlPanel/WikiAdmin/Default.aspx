<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.WikiAdmin.WikiHome" MasterPageFile="~/ControlPanel/Masters/WikiAdmin.master" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Wiki" runat="server" />
	
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
                            
                            <strong><TEControl:SiteUrl runat="server" UrlName="wiki_ControlPanel_NewWiki" ResourceName="CP_Wiki_NavBar_CreateWiki" ResourceFile="ControlPanelResources.xml" /></strong>
                            <br />
                            
                        </td>
                    </tr>
                        
                    <tr>
                        <td>
                            <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/comments.gif" />
                            </div>
                            
                            <strong><TEControl:SiteUrl runat="server" UrlName="wiki_ControlPanel_WikiList" ResourceName="CP_Wiki_NavBar_WikiList" ResourceFile="ControlPanelResources.xml" /></strong>
                            <br />
                            
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