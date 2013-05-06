<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Groups._default" MasterPageFile="~/ControlPanel/Masters/Groups.master" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <script type="text/javascript" src="../charts/swfobject.js"></script>
	<table style="width: 100%">
        <tr>
            <td style="width: 300px; padding: 20px" valign="top">
                <div class="CommonListArea">
                   <table width="100%" cellpadding="0">
                   <tr>
                        <td>
                            <div style="float: left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/blog-post.gif" />
                            </div>
                            
                            <strong>
                            <TEControl:SiteUrl runat="server" UrlName="myGroup_ControlPanel_Applications" Parameter1='<%#CurrentGroup.ID %>' ResourceName="CP_Groups_ApplicationsTab" ResourceFile="ControlPanelResources.xml" />
	                        </strong>
	                    </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/control-panel.gif" />
                            </div>
                            
                            <strong>
                            <TEControl:SiteUrl runat="server" UrlName="myGroup_ControlPanel_Edit" Parameter1='<%#CurrentGroup.ID %>' ResourceName="CP_Groups_GroupSetupTab" ResourceFile="ControlPanelResources.xml" />
	                        </strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/themes.gif" />
                            </div>
                            
                            <strong>
                            <TEControl:SiteUrl runat="server" UrlName="myGroup_ControlPanel_EditTheme" Parameter1='<%#CurrentGroup.ID %>' ResourceName="CP_Groups_ThemeTab" ResourceFile="ControlPanelResources.xml" />
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