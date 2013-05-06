<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Moderation.ModerationHomePage" MasterPageFile="~/ControlPanel/Masters/ForumModeration.master" %>
<%@ Import Namespace="Telligent.Evolution.ControlPanel.Controls" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.Discussions.Components" %>
<%@ Import Namespace="Telligent.Evolution.Controls" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ModerateForums" />
	<div class="CommonDescription">
		<cp:resourcecontrol runat="server" resourcename="CP_Moderation_SelectForum_Description" />
	</div>
	
	<div class="CommonFormArea">
	    <CP:RepeaterPlusNone runat="server" ID="GroupsRepeater">
	        <ItemTemplate>
	            <div class="CommonListArea">
	            <h4 class="CommonListTitle"><%# DataBinder.Eval(Container.DataItem, "Name") %></h4>
	            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <thead>
                    <tr> 
                        <th class="CommonListHeaderLeftMost"><cp:ResourceLabel runat="server" ResourceName="ForumGroupView_Moderation_Column_Forum" /></td>
                        <th class="CommonListHeader"><cp:ResourceLabel runat="server" ResourceName="ForumGroupView_Moderation_Column_PostsToModerate" /></td>
                    </tr>
                    </thead>
                    <tbody>
	                    <asp:Repeater runat="server" ID="ForumsRepeater">
	                        <ItemTemplate>
	                            <tr>
				                    <td class="CommonListCellLeftMost" width="75%">
					                    <div style="font-weight: bold;"><%# DataBinder.Eval(Container.DataItem, "Name") %></div>
					                    <%# DataBinder.Eval(Container.DataItem, "Description") %><%# ForumFormatter.FormatSubForum( (Forum) Container.DataItem ) %>
				                    </td>
				                    <td class="CommonListCell" width="25%">
					                    <a href="<%# Globals.GetSiteUrls().ModerateForum( ((Forum) Container.DataItem).SectionID ) %>"><%# string.Format(ResourceManager.GetString("ForumGroupView_Moderation_Count"), DataBinder.Eval(Container.DataItem, "PostsToModerate" )) %></a>
				                    </td>
			                    </tr>
	                        </ItemTemplate>
	                    </asp:Repeater>
	                </tbody>
	            </table>
	            </div>
	        </ItemTemplate>
	        <NoneTemplate>
	            <cp:statusmessage id="status" runat="server" Success="true" ResourceName="CP_Moderation_Switch_NoForumsExist"></cp:statusmessage>
	        </NoneTemplate>
	    </CP:RepeaterPlusNone>
	</div>
</asp:Content>