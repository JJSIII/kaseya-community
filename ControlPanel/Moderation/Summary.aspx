<%@ Page language="c#" Codebehind="Summary.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Moderation.Summary" MasterPageFile="~/ControlPanel/Masters/ForumModeration.master" %>
<%@ Import Namespace="Telligent.Evolution.Controls" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl id="ResourceControl1" runat="server" resourcename="CP_Moderation_Summary"></CP:ResourceControl>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="Summary" />
	
	<DIV class="CommonFormArea">
		<asp:literal id="ModerationSummary" runat="server"></asp:literal>

		<cp:ModerationStats id="ModerationStats1" runat="server">
		    <SkinTemplate>
		        <script runat="server">
                    int i = 1;
                </script>

                <h4 class="CommonSubTitle">
                    <cp:ResourceLabel runat="server" ResourceName="Moderator_Statistics_Title" />
                </h4>

                <div>
                    <%= string.Format(ResourceManager.GetString("Moderator_Statistics_Format"), CSContext.Current.Statistics.TotalModerators.ToString("n0"), CSContext.Current.Statistics.TotalModeratedPosts.ToString("n0"), CSContext.Current.Statistics.AverageModeratedPostsPerModerator.ToString("n0"))%>
                </div>

                <div>
                    <asp:Repeater id="TopModerators" runat="server" Visible="False">
	                    <HeaderTemplate>
		                    <p /><cp:ResourceLabel runat="server" ResourceName="Moderator_Statistics_TopModerators" /><br>
	                    </HeaderTemplate>
	                    <ItemTemplate>
		                    <%# (i++).ToString() %>.
		                    <a href='<%# Globals.GetSiteUrls().UserProfile( (string) DataBinder.Eval(Container.DataItem, "Username") ) %>'><%# DataBinder.Eval(Container.DataItem, "DisplayName")%></a>
		                    (<%# ((Int32)DataBinder.Eval(Container.DataItem, "PostsModerated")).ToString("n0") %>)<br>
	                    </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div>
                    <asp:Repeater id="ModerationAction" runat="server" Visible="True">
	                    <HeaderTemplate>
		                    <p /><cp:ResourceLabel runat="server" ResourceName="Moderator_Statistics_Actions" /><br>
	                    </HeaderTemplate>
	                    <ItemTemplate>
		                    &nbsp;<%# DataBinder.Eval(Container.DataItem, "Action") %>
		                    (<%# ((Int32)DataBinder.Eval(Container.DataItem, "Total")).ToString("n0") %>)<br>
	                    </ItemTemplate>
                    </asp:Repeater>
                </div>
		    </SkinTemplate>
		</cp:ModerationStats>
	</DIV>
</asp:Content>