<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.MembershipHomePage" MasterPageFile="~/ControlPanel/Masters/MembershipAdmin.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Membership" runat="server" />
	

		<cp:statusmessage runat="server" id="AddUserStatus" Visible="false" />

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
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/membership/UserAdd.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_Membership_NavBar_CreateMember" />
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
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/membership/membersearch.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_Membership_NavBar_SearchMember" />
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
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/membership/AccountSettings.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_Account_Title" />
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
	
	
</asp:Content>