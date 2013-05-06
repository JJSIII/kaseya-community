<%@ Page language="c#" Codebehind="PostList.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.PostListPage" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>
<%@ Register TagPrefix="BlogPanel" TagName = "PostList" Src = "~/ControlPanel/Blogs/PostListControl.ascx" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="server" ResourceName="CP_Blog_PostList" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Posts" runat="server" id="SelectedNavigation1" />
	<DIV class="CommonDescription">
		<CP:ResourceControl runat="server" ResourceName="CP_Blog_PostList_SubTitle" />
	</DIV>
	
	<BlogPanel:PostList id="PostList1" runat="server" />
</asp:Content>