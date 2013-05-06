<%@ Page Language="c#" CodeBehind="ExceptionsReport.aspx.cs" AutoEventWireup="false"
	Inherits="Telligent.Evolution.ControlPanel.Tools.ExceptionsReport" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderID="DescriptionRegion" runat="server">
	<CP:ResourceControl ID="RegionTitle" runat="Server" ResourceName="CP_Tools_ExceptionsReport_Title" />
</asp:Content>
<asp:Content ContentPlaceHolderID="TaskRegion" runat="Server">
	<CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ExceptionsReport" />
	<fieldset>
		<legend>
			<CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_Criteria" />
		</legend>
		<table cellspacing="0" cellpadding="2" width="90%" border="0">
		<tr>
			<td>
				<CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_ExceptionType" />
			</td>
			<td>
				<asp:DropDownList ID="ExceptionType" runat="server" />
			</td>
			<td align="center" rowspan="4">
				<CP:ResourceButton ID="SelectDomain" runat="server" ResourceName="CP_Tools_ExceptionsReport_Go">
				</CP:ResourceButton>
			</td>
		</tr>
		<tr>
			<td>
				<CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_MinFrequency" />
			</td>
			<td>
				<asp:DropDownList ID="MinFrequency" runat="server" />
			</td>
		</tr>
		<tr>
			<td>
				<CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_SortBy" />
			</td>
			<td>
				<asp:DropDownList ID="SortBy" runat="server" />
			</td>
		</tr>
		<tr>
			<td>
				<CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_IncludeUnknown" />
			</td>
			<td>
				<asp:CheckBox ID="IncludeUnknown" runat="server" EnableViewState="true" />
			</td>
		</tr>
		</table>
	</fieldset>
	<asp:Repeater ID="ReportRepeater" runat="server">
		<HeaderTemplate>
			<div class="CommonListArea">
				<table id="Listing" cellspacing="0" cellpadding="0" border="0" width="100%">
					<thead>
					<tr>
						<th class="CommonListHeaderLeftMost" width="2%">
							&nbsp;
						</th>
						<th class="CommonListHeader">
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_ExceptionType" />
						</th>
						<th class="CommonListHeader">
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_IPAddress" />
						</th>
						<th class="CommonListHeader">
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_LastOccurred" />
						</th>
						<th class="CommonListHeader">
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_Total" />
						</th>
					</tr>
					</thead>
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td class="CommonListCellLeftMost">
					<asp:CheckBox ID="BulkEdit" runat="Server" /><asp:Literal ID="ExceptionID" runat="Server" Visible="false" />
				</td>
				<td class="CommonListCell">
					<strong><asp:Literal ID="ExceptionType" runat="Server" /></strong>&nbsp;
				</td>
				<td class="CommonListCell">
					<asp:Literal ID="IPAddress" runat="Server" />&nbsp;
				</td>
				<td class="CommonListCell">
					<asp:Literal ID="DateLastOccurred" runat="Server" />&nbsp;
				</td>
				<td class="CommonListCell">
					<asp:Literal ID="Frequency" runat="Server" />&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="5" align="left" class="CommonListCellLeftMost">
					<b><CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_UserAgent" /></b>
					<asp:Literal ID="UserAgent" runat="Server" /><br />
					<b><CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_ServerName" /></b>
					<asp:Literal ID="ServerName" runat="Server" /><br />
					<b><CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_Path" /></b>
					<asp:Literal ID="Path" runat="Server" />
					<CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_AsHttp" />
					<asp:Literal ID="HttpVerb" runat="Server" /><br />
					<b><CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_Referrer" /></b>
					<asp:Literal ID="HttpReferrer" runat="Server" /><br />
					<b><CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_Message" /></b>
					<asp:Literal ID="Message" runat="Server" /><br />
					<asp:Literal ID="LoggedStackTrace" runat="Server" />
				</td>
			</tr>
		</ItemTemplate>
		<AlternatingItemTemplate>
			<tr class="AltListRow">
				<td class="CommonListCellLeftMost">
					<asp:CheckBox ID="BulkEdit" runat="Server" /><asp:Literal ID="ExceptionID" runat="Server" Visible="false" />
				</td>
				<td class="CommonListCell">
					<strong><asp:Literal ID="ExceptionType" runat="Server" /></strong>&nbsp;
				</td>
				<td class="CommonListCell">
					<asp:Literal ID="IPAddress" runat="Server" />&nbsp;
				</td>
				<td class="CommonListCell">
					<asp:Literal ID="DateLastOccurred" runat="Server" />&nbsp;
				</td>
				<td class="CommonListCell">
					<asp:Literal ID="Frequency" runat="Server" />&nbsp;
				</td>
			</tr>
			<tr class="AltListRow">
				<td colspan="5" align="left" class="CommonListCellLeftMost">
					<b><CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_UserAgent" /></b>
					<asp:Literal ID="UserAgent" runat="Server" /><br />
					<b><CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_ServerName" /></b>
					<asp:Literal ID="ServerName" runat="Server" /><br />
					<b><CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_Path" /></b>
					<asp:Literal ID="Path" runat="Server" />
					<CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_AsHttp" />
					<asp:Literal ID="HttpVerb" runat="Server" /><br />
					<b><CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_Referrer" /></b>
					<asp:Literal ID="HttpReferrer" runat="Server" /><br />
					<b><CP:ResourceControl runat="server" ResourceName="CP_Tools_ExceptionsReport_Message" /></b>
					<asp:Literal ID="Message" runat="Server" /><br />
					<asp:Literal ID="LoggedStackTrace" runat="Server" />
				</td>
			</tr>
		</AlternatingItemTemplate>
		<FooterTemplate>
			</table></div>
		</FooterTemplate>
	</asp:Repeater>
	<div align="CommonPagingArea">
		<TEControl:Pager ID="pager" runat="server" PageSize="10" />
	</div>
	<p class="PanelSaveButton">
		<CP:ResourceButton ID="DeleteSelected" runat="server" ResourceName="CP_Tools_ExceptionsReport_Delete_All" />
		<CP:ResourceButton ID="DeleteAll" runat="server" ResourceName="CP_Tools_ExceptionsReport_Delete_Selected" />
	</p>
</asp:Content>