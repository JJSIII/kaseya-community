<%@ Page language="c#" Codebehind="Default.aspx.cs" EnableViewState="false" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.ControlPanelHomePage" MasterPageFile="~/ControlPanel/Masters/ControlPanel.master" %>

<asp:Content ContentPlaceHolderID="PanelNavigation" runat="server">
    <div class="DashboardMenuAreaFull">
        <CP:NavigationDropDownList CssClass="DashboardMenu" OpenCssClass="DashboardMenuOpen" runat="server" FileName="~/ControlPanel/DashboardMenu.config" MenuGroupCssClass="DashboardContextMenuGroup" MenuItemCssClass="DashboardContextMenuItem" MenuItemSelectedCssClass="DashboardContextMenuItemHover" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="Down" />
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="PageTitleRegion" runat="server">
    <CP:ResourceControl runat="server" ResourceName="CP_Default_ControlPanelDashboard" />
</asp:Content>

<asp:Content ContentPlaceHolderID="PanelTitle" runat="server">
    <CP:ResourceControl runat="server" ResourceName="CP_Default_ControlPanelDashboard" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedTab="home" runat="server" id="SelectedNavigation1" />
    
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
    <td id="DashboardMainContentArea">
    
        <div class="CommonDescription" style="margin-right: 20px; margin-top: 0;">
            <CP:ResourceControl runat="server" ResourceName="CP_Default_ChooseWhatToManage" />
        </div>
    
		<div runat="server" id="MyBlogsArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Blogs/"><CP:ResourceControl runat="server" ResourceName="CP_Default_ManageMyBlogs" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
						<CP:ResourceControl ID="ResourceControl6" runat="server" ResourceName="CP_Default_ManageYourBlogContent" />
					</div>
					<ul class="CommonDashboardActionList">
						<li runat="server" id="MyBlogsNewPostArea"><asp:HyperLink id="MyBlogsNewPost" runat="server" /></li>
						<li runat="server" id="MyBlogsNewPostByEmailArea" visible="false"><asp:HyperLink id="MyBlogsNewPostByEmail" runat="server" /></li>
						<li runat="server" id="MyBlogsReviewCommentsArea"><asp:HyperLink id="MyBlogsReviewComments" runat="server" /></li>
						<li runat="server" id="MyBlogsManageArea"><asp:HyperLink id="MyBlogsManage" runat="server" /></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Blogs/switch.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_MyBlogs_Select" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Blogs/"><CP:ResourceControl ID="ResourceControl7" runat="server" ResourceName="CP_Default_StartManagingBlogsWithEllipse" /></asp:HyperLink>
				</div>
			</div>
		</div>

		<div runat="server" id="MyGalleriesArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/MediaGalleries/"><CP:ResourceControl ID="ResourceControl8" runat="server" ResourceName="CP_Default_ManageMyMediaGalleries" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
						<CP:ResourceControl runat="server" ResourceName="CP_Default_ManageYourMediaGalleriesContent" />
					</div>
					<ul class="CommonDashboardActionList">
						<li runat="server" id="MyMediaNewPostArea"><asp:HyperLink ID="MyMediaNewPost" runat="server" /></li>
						<li runat="server" id="MyMediaReviewCommentsArea"><asp:HyperLink ID="MyMediaReviewComments" runat="server" /></li>
						<li runat="server" id="MyMediaReviewPostsArea"><asp:HyperLink ID="MyMediaReviewPosts" runat="server" /></li>
						<li runat="server" id="MyMediaManageArea"><asp:HyperLink ID="MyMediaManage" runat="server" /></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/MediaGalleries/switch.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_MyMediaGalleries_Select" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/MediaGalleries/"><CP:ResourceControl ID="ResourceControl10" runat="server" ResourceName="CP_Default_StartingManagingMediaGalleriesWithEllipse" /></asp:HyperLink>
				</div>
			</div>
		</div>
		
		<div runat="server" id="MyGroupsArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Groups/"><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_MyGroups_Title" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
						<CP:ResourceControl runat="server" ResourceName="CP_Dashboard_MyGroups_Desc" />
					</div>
					<ul class="CommonDashboardActionList">
						<li><asp:HyperLink ID="MyGroupApplications" runat="server" /></li>
						<li><asp:HyperLink ID="MyGroupSetup" runat="server" /></li>
						<li><asp:HyperLink ID="MyGroupManage" runat="server" /></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Groups/switch.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_MyGroups_Select" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Groups/"><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_MyGroups_FooterDesc" /></asp:HyperLink>
				</div>
			</div>
		</div>

		<div runat="server" id="ForumModerationArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/Moderation/"><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_ForumsModeration" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
						<CP:ResourceControl ID="ResourceControl11" runat="server" ResourceName="CP_Default_ModerateForum" />
					</div>
					<ul class="CommonDashboardActionList">
						<li><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Moderation/"><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_ForumsModeration_Action" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Moderation/Summary.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Moderation_Summary" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Moderation/Tags.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Moderation_Tags" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink runat="server" NavigateUrl="~/controlpanel/Moderation/"><CP:ResourceControl ID="ResourceControl12" runat="server" ResourceName="CP_Default_StartModeratingWithEllipse" /></asp:HyperLink>
				</div>
			</div>
		</div>
		
		<div runat="server" id="MyWikiArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/wikis/default.aspx"><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_Dashboard_WikiAdministration" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
						<CP:ResourceControl runat="server" ResourceName="CP_Default_ManageYourWikis" />
					</div>
					<ul class="CommonDashboardActionList">
						<li><asp:HyperLink ID="MyWikiReviewComments" runat="server" /></li>
                        <li><asp:HyperLink ID="MyWikiPages" runat="server" /></li>
						<li><asp:HyperLink ID="MyWikis" runat="server" NavigateUrl="~/ControlPanel/wikis/switch.aspx"><CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_Dashboard_MyWikis_Select" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/controlpanel/wikis/default.aspx"><CP:ResourceControl ID="ResourceControl14" runat="server" ResourceName="CP_Default_StartManagingWikisWithEllipse" /></asp:HyperLink>
				</div>
			</div>
		</div>		
		

		<div runat="server" id="SystemAdministrationArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/Setup.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_SystemAdministration" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
						<CP:ResourceControl runat="server" ResourceName="CP_Default_ConfigureSiteWideSettings" />
					</div>
					<ul class="CommonDashboardActionList">
						<li><asp:HyperLink id="SysAdminBlogsLink" Visible="false" runat="server" NavigateUrl="~/controlpanel/BlogAdmin/"><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_BlogAdministration" /></asp:HyperLink></li>
						<li><asp:HyperLink id="SysAdminGalleriesLink" Visible="false" runat="server" NavigateUrl="~/controlpanel/MediaGalleryAdmin/"><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_MediaGalleryAdministration" /></asp:HyperLink></li>
						<li><asp:HyperLink id="SysAdminForumsLink" Visible="false" runat="server" NavigateUrl="~/controlpanel/Forums/"><CP:ResourceControl runat="server" ResourceName="CP_Forums_NavBar_Forums" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/GroupAdmin/"><CP:ResourceControl runat="server" ResourceName="CP_Hub_NavBar_Hubs" /></asp:HyperLink></li>
						<li><asp:HyperLink id="SysAdminWikisLink" Visible="false" runat="server" NavigateUrl="~/controlpanel/WikiAdmin/"><CP:ResourceControl runat="server" ResourceName="CP_Wiki_NavBar_Wikis" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/Membership/membersearch.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Membership_NavBar_Membership" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/Settings/"><CP:ResourceControl runat="server" ResourceName="CP_Settings_NavBar_Settings" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink runat="server" NavigateUrl="~/controlpanel/Setup.aspx"><CP:ResourceControl ID="ResourceControl16" runat="server" ResourceName="CP_Default_EnterSystemAdminWithEllipse" /></asp:HyperLink>
				</div>
			</div>
		</div>
		<div style="clear:both"></div>
	
	</td>
	<td id="DashboardSidebarArea">
	    <div class="CommonDashboardArea CommonDashboardSidebarArea">
            <div class="DashboardTileTitle">
                <strong><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_Announcements" /></strong>
            </div>
            <div class="CommonDashboardContent AnnouncementsContent">
                <cp:RepeaterPlusNone runat="server" id="Announcements" ShowHeaderFooterOnNone="false">
	                <HeaderTemplate>
	                    <ul class="CommonDashboardActionList">
	                </HeaderTemplate>
	                <ItemTemplate>
		                <li>
		                    <a href="<%# DataBinder.Eval(Container.DataItem, "Link")%>"><%#DataBinder.Eval(Container.DataItem, "Title")%></a>										
		                    <div><%#DataBinder.Eval(Container.DataItem, "Description")%></div>
		                </li>
	                </ItemTemplate>
	                <AlternatingItemTemplate>
		                <li>
		                    <a href="<%# DataBinder.Eval(Container.DataItem, "Link")%>"><%#DataBinder.Eval(Container.DataItem, "Title")%></a>										
		                    <div><%#DataBinder.Eval(Container.DataItem, "Description")%></div>
		                </li>
	                </AlternatingItemTemplate>
	                <FooterTemplate>
	                    </ul>
	                </FooterTemplate>
	                <NoneTemplate>
		                <div style="margin-bottom: 8px; margin-top: 8px;">
		                    <CP:ResourceControl runat="server" ResourceName="CP_Dashboard_NoAnnouncements" />
		                </div>
	                </NoneTemplate>
                </cp:RepeaterPlusNone>
            </div>
        </div>
        
        <asp:PlaceHolder runat="server" ID="VersionArea">
            <div class="CommonDashboardArea CommonDashboardSidebarArea">
                <div class="DashboardTileTitle">
					<strong><asp:HyperLink ID="BuildName" runat="server" /></strong>
                </div>
                <div class="CommonDashboardContent">
		            <ul class="CommonDashboardActionList">
		            <li>
		                <asp:HyperLink runat="server" id="NewVersionAvailable" />
                    </li>
                    </ul>
	            </div>
	            <div class="CommonDashboardContentFooter">
					<asp:Literal runat="server" ID="environmentType" />
                    <asp:Literal runat="server" id="Version" />
                </div>
            </div>
        </asp:PlaceHolder>
    </td>
    </tr>
    </table>
    
    <br />
</asp:Content>
