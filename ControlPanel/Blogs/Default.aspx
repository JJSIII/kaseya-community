<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.BlogEditorHomePage" EnableViewstate="false" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <div class="CommonDescription" style="display: none;">
	    <CP:ResourceControl ID="ResourceControl6" runat="server" ResourceName="CP_Blog_Home_TitleDesc" />
    </div>

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
                            
                            <strong><TEControl:SiteUrl runat="server" UrlName="blog_posteditor" Parameter1='<%#CurrentWeblog.SectionID %>' ResourceName="CP_Blog_NavBar_NewPost" ResourceFile="ControlPanelResources.xml" /></strong>
                            <br />
                            <cp:resourcecontrol runat="server" resourcename="CP_Blog_Home_WriteDesc" />
                        </td>
                    </tr>
                        
                    <tr>
                        <td>
                            <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/comments.gif" />
                            </div>
                            
                            <strong><TEControl:SiteUrl runat="server" UrlName="blog_feedback" Parameter1='<%#CurrentWeblog.SectionID %>' ResourceName="CP_Blog_NavBar_ReviewComments" ResourceFile="ControlPanelResources.xml" /></strong>
                            <br />
                            <cp:resourcecontrol runat="server" resourcename="CP_Blog_Home_ReviewCommentsDesc" />
                        </td>
                    </tr>

                    <tr runat="server" id="ThemeOptionsRow">
                        <td>
                            <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/themes.gif" />
                            </div>
                            
                            <strong><TEControl:SiteUrl runat="server" UrlName="blog_ControlPanel_Options_ThemeConfiguration" Parameter1='<%#CurrentWeblog.SectionID %>' ResourceName="CP_Blog_SkinOptions_Title" ResourceFile="ControlPanelResources.xml" /></strong>
                            <br />
                            <cp:resourcecontrol runat="server" resourcename="CP_Blog_Home_ThemeDesc" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/control-panel.gif" />
                            </div>
                            <strong><TEControl:SiteUrl runat="server" ResourceName="CP_Blog_NavBar_DescOptions" urlname="blog_ControlPanel_Options_BlogSetup" Parameter1='<%#CurrentWeblog.SectionID %>' ResourceFile="ControlPanelResources.xml" /></strong>
                            <br />
                            <cp:resourcecontrol runat="server" resourcename="CP_Blog_Home_SetupDesc" />
                        </td>
                    </tr>
                </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>