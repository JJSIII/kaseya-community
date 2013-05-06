<%@ Page language="c#" Codebehind="BlogByEmail.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.BlogByEmail" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="NewPostByEmail" runat="server" />
    <div class="CommonDescription">
	    <CP:ResourceControl runat="server" ResourceName="CP_Blog_PostByEmailInfo" />
    </div>
    
    <div class="CommonMessageWarning">
        <table>
            <tr>
                <td style="width:35px">
		            <img src="../images/icons/blog-post.gif" />
                </td>
                
                <td>
                    <asp:Literal runat="server" ID="mailToLiteral" />
                </td>
            </tr>
        </table>
    </div>
    
</asp:Content>