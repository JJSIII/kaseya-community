<%@ Page language="c#" Codebehind="BlogFeeds.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.BlogFeeds" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Blogs.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="SectionDescription" runat="server" resourcename="CP_Blogs_Feeds_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <cp:controlpanelselectednavigation selectednavitem="BlogFeeds" runat="server" id="SelectedNavigation1" />
	<script language = "javascript" type="text/javascript">
		function checkReload(res) {
			if (res) {
				refresh();
			}
		}
	</script>

	<div class="CommonFormDescription">
		<ASP:Literal id="ExistingMessage" runat="Server" />
	</div>

	<div class="PanelSaveButton">
		<CP:ModalLink CssClass="CommonTextButtonBig" ModalType="Link" Height="300" Width="600" runat="Server" ResourceName="CP_Blogs_Feeds_CreateNewFeed" Callback="checkReload" id="NewFeed" />
	</div>

	<TEControl:WrappedRepeater runat="server" id="mirrorFeeds" ShowHeaderFooterOnNone="false">
		<HeaderTemplate>
			<div class="CommonListArea">
			<table id="BlogLists" cellspacing="0" cellpadding="0" border="0" width="100%">
			<thead>
			<tr>
				<th class="CommonListHeaderLeftMost"><CP:ResourceControl runat="server" ResourceName="CP_Blogs_Feeds_List_Name" /></th>
				<th class="CommonListHeader"><CP:ResourceControl runat="server" ResourceName="CP_Blogs_Feeds_List_Url" /></th>
				<th class="CommonListHeader"><CP:ResourceControl runat="server" ResourceName="CP_Blogs_Feeds_List_PullInterval" /></th>
				<th class="CommonListHeader"><CP:ResourceControl runat="server" ResourceName="CP_Blogs_Feeds_List_LastPull" /></th>    
				<th class="CommonListHeader"><CP:ResourceControl runat="server" ResourceName="CP_Blogs_Feeds_List_Actions" /></th>    
			</tr>
			</thead>
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td class="CommonListCellLeftMost"><%#  Globals.HtmlEncode(DataBinder.Eval(Container.DataItem,"Title").ToString()) %></td>
				<td class="CommonListCell"><a href="<%# Globals.HtmlEncode(DataBinder.Eval(Container.DataItem,"Url").ToString()) %>" target="_blank"><%# Globals.HtmlEncode(DataBinder.Eval(Container.DataItem,"Url").ToString()) %></a></td>
				<td  class="CommonListCell"><%# DataBinder.Eval(Container.DataItem,"IntervalMinutes") %></td>
				<td  class="CommonListCell"><%# DataBinder.Eval(Container.DataItem,"LastUpdateDate") %></td>
				<td class="CommonListCell" nowrap="nowrap">
				    <input type="button" onclick="javascript:Telligent_Modal.Open('<%# BlogUrls.Instance().ControlPanel_BlogFeedsForm((int)DataBinder.Eval(Container.DataItem,"SectionId"), (int)DataBinder.Eval(Container.DataItem,"FeedId")) %>', 625, 475, checkReload);" value="Edit" />
					<cp:ResourceButton ID="DeleteButton" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "FeedId") %>' CommandName="Delete" runat="server" ResourceName="Delete" />
				</td>    
			</tr>
		</ItemTemplate>
		<AlternatingItemTemplate>
			<tr class="AltListRow">
				<td class="CommonListCellLeftMost"><%#  Globals.HtmlEncode(DataBinder.Eval(Container.DataItem,"Title").ToString()) %></td>
				<td class="CommonListCell"><a href="<%# Globals.HtmlEncode(DataBinder.Eval(Container.DataItem,"Url").ToString()) %>" target="_blank"><%# Globals.HtmlEncode(DataBinder.Eval(Container.DataItem, "Url").ToString()) %></a></td>
				<td  class="CommonListCell"><%# DataBinder.Eval(Container.DataItem,"IntervalMinutes") %></td>
				<td  class="CommonListCell"><%# DataBinder.Eval(Container.DataItem,"LastUpdateDate") %></td>
				<td class="CommonListCell" nowrap="nowrap">
				    <input type="button" onclick="javascript:Telligent_Modal.Open('<%# BlogUrls.Instance().ControlPanel_BlogFeedsForm((int)DataBinder.Eval(Container.DataItem,"SectionId"), (int)DataBinder.Eval(Container.DataItem,"FeedId")) %>', 625, 475, checkReload);" value="Edit" />
					<cp:ResourceButton ID="DeleteButton" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "FeedId") %>' CommandName="Delete" runat="server" ResourceName="Delete" />
				</td>
			</tr>
		</AlternatingItemTemplate>
		<FooterTemplate>
			</table>
			</div>
		</FooterTemplate>
	</TEControl:WrappedRepeater>

</asp:Content>