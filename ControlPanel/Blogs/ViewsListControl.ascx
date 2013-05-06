<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewsListControl.ascx.cs" Inherits="Telligent.Evolution.ControlPanel.Blogs.ReferralsListControl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="CSControl" Namespace="Telligent.Evolution.Controls" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<div class="CommonListArea">
	<TEControl:WrappedRepeater ShowHeaderFooterOnNone="false" Runat="server" ID="referrals">
		<HeaderTemplate>
			<table id="ReferralListing" border="0" cellspacing="0" cellpadding="0" width="100%">
				<thead>
					<tr>
						<th class="CommonListHeaderLeftMost">
							<cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_ReferralUrl" />
						</th>
						<th class="CommonListHeader">
							<cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Hits" />
						</th>
						<th class="CommonListHeader">
							<cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_LastDate" />
						</th>
					</tr>
				</thead>
		</HeaderTemplate>

		<ItemTemplate>
			<tr>
				<td class="CommonListCellLeftMost">
					<a href='<%# DataBinder.Eval(Container.DataItem, "Url") %>'>
						<%# Formatter.MaxLength(DataBinder.Eval(Container.DataItem, "Url").ToString(), 50) %>...
					</a>
				</td>
				<td class="CommonListCell">
					<%# DataBinder.Eval(Container.DataItem, "Hits") %>
				</td>
				<td class="CommonListCell">
					<%# ((DateTime)DataBinder.Eval(Container.DataItem, "LastDate")).ToString("MMM d yyyy") %>
				</td>
			</tr>
		</ItemTemplate>
            <AlternatingItemTemplate>
            <tr class="AltListRow">
				<td class="CommonListCellLeftMost">
					<a href='<%# DataBinder.Eval(Container.DataItem, "Url") %>'>
						<%# Formatter.MaxLength(DataBinder.Eval(Container.DataItem, "Url").ToString(), 50)%>...
					</a>
				</td>
				<td class="CommonListCell">
					<%# DataBinder.Eval(Container.DataItem, "Hits") %>
				</td>
				<td class="CommonListCell">
					<%# ((DateTime)DataBinder.Eval(Container.DataItem, "LastDate")).ToString("MMM d yyyy") %>
				</td>
			</tr>
		</AlternatingItemTemplate>		

		<FooterTemplate>
			</table>
		</FooterTemplate>
	</TEControl:WrappedRepeater>

	<TEControl:Pager Runat="Server" ID="pager" />
</div>
