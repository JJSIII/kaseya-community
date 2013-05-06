<%@ Page language="c#" Codebehind="Setup.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Setup" MasterPageFile="~/ControlPanel/Masters/Setup.master" %>

<asp:Content ContentPlaceHolderID="PanelNavigation" runat="server">
    <div class="DashboardMenuAreaFull">
        <CP:NavigationDropDownList CssClass="DashboardMenu" OpenCssClass="DashboardMenuOpen" runat="server" FileName="~/ControlPanel/DashboardMenu.config" MenuGroupCssClass="DashboardContextMenuGroup" MenuItemCssClass="DashboardContextMenuItem" MenuItemSelectedCssClass="DashboardContextMenuItemHover" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="Down" />
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedTab="setup" runat="server" id="SelectedNavigation1" />
	
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
    <td id="DashboardMainContentArea">
    
        <div class="CommonDescription" style="margin-right: 20px; margin-top: 0;">
            <CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_DashboardSetup_ChooseWhatToDo" />
        </div>
    
		<div runat="server" id="BlogAdministrationArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/BlogAdmin/"><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_BlogAdministration" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
						<CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_DashboardSetup_CreateAndManageBlogs" />
					</div>
					<ul class="CommonDashboardActionList">
						<li><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/BlogAdmin/sectionedit.aspx"><CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_CreateNewBlog" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/BlogAdmin/Blogs.aspx"><CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_Blogs" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/BlogAdmin/Options/GeneralOptions.aspx"><CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_GeneralSettings" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/BlogAdmin/"><CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_DashboardSetup_EnterBlogAdminWithEllipse" /></asp:HyperLink>
				</div>
			</div>
		</div>

		<div runat="server" id="MediaGalleryAdministrationArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/MediaGalleryAdmin/"><CP:ResourceControl runat="server" ResourceName="CP_Dashboard_MediaGalleryAdministration" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
						<CP:ResourceControl ID="ResourceControl4" runat="server" ResourceName="CP_DashboardSetup_CreateAndManageMediaGalleries" />
					</div>
					<ul class="CommonDashboardActionList">
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/MediaGalleryAdmin/CreateEditMediaGallery.aspx"><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_CreateNewMediaGallery" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/MediaGalleryAdmin/MediaGalleries.aspx"><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_MediaGalleries" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/MediaGalleryAdmin/Settings.aspx"><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_Settings" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/MediaGalleryAdmin/"><CP:ResourceControl ID="ResourceControl5" runat="server" ResourceName="CP_DashboardSetup_EnterMediaAdminWithEllipse" /></asp:HyperLink>
				</div>
			</div>
		</div>

		<div runat="server" id="ForumAdministrationArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Forums/"><CP:ResourceControl runat="server" ResourceName="CP_Forums_NavBar_Forums" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
						<CP:ResourceControl ID="ResourceControl6" runat="server" ResourceName="CP_DashboardSetup_CreateAndManageForums" />
					</div>
					<ul class="CommonDashboardActionList">
						<li><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Forums/SectionEdit.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Forums_NavBar_ForumCreate" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/forums/Forums.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Forums_NavBar_ForumList" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/forums/options/PostOptions.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Forums_NavBar_PostSettings" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Forums/"><CP:ResourceControl ID="ResourceControl7" runat="server" ResourceName="CP_DashboardSetup_EnterForumAdminWithEllipse" /></asp:HyperLink>
				</div>
			</div>
		</div>

		<div runat="server" id="GroupsAdministrationArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/GroupAdmin/"><CP:ResourceControl runat="server" ResourceName="CP_Hub_NavBar_Hubs" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
						<CP:ResourceControl runat="server" ResourceName="CP_Hub_NavBar_Description" />
					</div>
					<ul class="CommonDashboardActionList">
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/GroupAdmin/CreateGroup.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Hub_NavBar_CreateHub" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/GroupAdmin/groups.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Hub_NavBar_HubList" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/Membership/SiteRoles.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Membership_NavBar_ManageSiteRoles" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/GroupAdmin/"><CP:ResourceControl runat="server" ResourceName="CP_Hub_NavBar_EnterLink" /></asp:HyperLink>
				</div>
			</div> 
		</div>
		
		<div runat="server" id="WikiAdministrationArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/WikiAdmin/"><CP:ResourceControl runat="server" ResourceName="CP_Wiki_NavBar_Wikis" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
					    <CP:ResourceControl runat="server" ResourceName="CP_Wiki_MainDescription" />
					</div>
					<ul class="CommonDashboardActionList">
						<li><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/WikiAdmin/WikiEdit.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Wiki_NavBar_CreateWiki" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/WikiAdmin/Wikis.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Wiki_NavBar_WikiList" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/WikiAdmin/"><CP:ResourceControl runat="server" ResourceName="CP_Wiki_EnterLink" /></asp:HyperLink>
				</div>
			</div>
		</div>


		<div runat="server" id="MembershipArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Membership/membersearch.aspx"><CP:ResourceControl ID="ResourceControl8" runat="server" ResourceName="CP_Membership_NavBar_Membership" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
						<CP:ResourceControl ID="ResourceControl9" runat="server" ResourceName="CP_DashboardSetup_CreateAndManageUsers" />
					</div>
					<ul class="CommonDashboardActionList">
						<li><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Membership/membersearch.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Membership_NavBar_SearchMember" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/membership/SiteRoles.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Membership_NavBar_ManageSiteRoles" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/membership/AccountSettings.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Membership_Settings_Account_Title" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Membership/membersearch.aspx"><CP:ResourceControl ID="ResourceControl10" runat="server" ResourceName="CP_DashboardSetup_EnterMembershipAdminWithEllipse" /></asp:HyperLink>
				</div>
			</div>  
		</div>

		<div runat="server" id="SetupArea" class="CommonDashboardAreaContainer">
			<div class="CommonDashboardArea">
				<div class="DashboardTileTitle">
					<strong><asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Settings/default.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Settings_NavBar_Settings" /></asp:HyperLink></strong>
				</div>
				<div class="CommonDashboardContent">
					<div class="DashboardTileDescription">
						<CP:ResourceControl ID="ResourceControl11" runat="server" ResourceName="CP_DashboardSetup_ManageSiteWideConfigSettings" />
					</div>
					<ul class="CommonDashboardActionList">
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/Settings/Setup.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Settings_Setup" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/tools/managelicenses.aspx"><CP:ResourceControl ID="ResourceControl13" runat="server" ResourceName="CP_Dashboard_License_Action" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/Settings/ThemeConfiguration.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Settings_ThemeConfigurationSettings" /></asp:HyperLink></li>
						<li><asp:HyperLink runat="server" NavigateUrl="~/controlpanel/tools/EventLogViewer.aspx"><CP:ResourceControl runat="server" ResourceName="CP_Tools_NavBar_EventLog" /></asp:HyperLink></li>
					</ul>
				</div>
				<div class="CommonDashboardContentFooter">
					<asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Settings/default.aspx"><CP:ResourceControl ID="ResourceControl12" runat="server" ResourceName="CP_DashboardSetup_EnterSiteAdminWithEllipse" /></asp:HyperLink>
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
                    <strong><asp:Literal runat="server" id="BuildName" /></strong>
                </div>
                <div class="CommonDashboardContent">
		            <ul class="CommonDashboardActionList">
		            <li>
		                <asp:HyperLink runat="server" id="NewVersionAvailable" />
		                <div id="License" runat="Server">
                            <asp:HyperLink runat="server" NavigateUrl="~/ControlPanel/Tools/ManageLicenses.aspx"><CP:ResourceControl ID="ResourceControl33" runat="server" ResourceName="CP_Dashboard_License_Action" /></asp:HyperLink>
                        </div>
                    </li>
                    </ul>
	            </div>
	            <div class="CommonDashboardContentFooter">
                    <asp:Literal runat="server" id="Version" />
                </div>
            </div>
        </asp:PlaceHolder>
    </td>
    </tr>
    </table>
</asp:Content>