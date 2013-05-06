<%@ Page language="c#" Codebehind="default.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries._default" MasterPageFile="~/ControlPanel/Masters/MediaGalleries.master" EnableViewState="false" %>
<%@ Register TagPrefix="CP" TagName = "FileList" Src = "~/ControlPanel/MediaGalleries/FileList.ascx" %>

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

                            <strong><TEControl:SiteUrl runat="server" UrlName="mediaGalleries_ControlPanel_FileEditor" Parameter1='<%#CurrentMediaGallery.SectionID %>' ResourceName="CP_MediaGalleries_Upload_File" ResourceFile="ControlPanelResources.xml" /></strong>
	                    </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/comments.gif" />
                            </div>
                            
                            <strong><TEControl:SiteUrl runat="server" UrlName="mediaGalleries_ControlPanel_Comments" Parameter1='<%#CurrentMediaGallery.SectionID %>' ResourceName="CP_MediaGalleries_Review_Comments" ResourceFile="ControlPanelResources.xml" /></strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/control-panel.gif" />
                            </div>
                            
                            <strong><TEControl:SiteUrl runat="server" UrlName="mediaGalleries_ControlPanel_Options_Files" Parameter1='<%#CurrentMediaGallery.SectionID %>' ResourceName="CP_MediaGalleries_AdvancedFileSettings" ResourceFile="ControlPanelResources.xml" /></strong>
                        </td>
                    </tr>
                    </table>
                    
                </div>
            </td>
        </tr>
    </table>
	
	<div style="float:none; clear: both;"></div>
</asp:Content>