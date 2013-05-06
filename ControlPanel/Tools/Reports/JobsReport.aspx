<%@ Page language="c#" Codebehind="JobsReport.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Tools.JobsReport" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="CP_Tools_JobsReport_Title"></cp:resourcecontrol>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="JobsReport" />
	<DIV class="CommonDescription">
		<cp:resourcecontrol runat="Server" resourcename="CP_Tools_JobsReport_Description"></cp:resourcecontrol></DIV>
	<cp:statusmessage id="Status" runat="server" />

	<div class="CommonGroupedContentArea">
		<h3 class="CommonSubTitle"><CP:ResourceControl runat="Server" ResourceName="CP_Tools_JobsReport_ConfiguredJobs"></CP:ResourceControl></h3>

				<asp:repeater id="JobsRepeater" runat="server">
					<headertemplate>
						<div class="CommonListArea">
							<table id="Listing" cellspacing="0" cellpadding="0" border="0" width="100%">
								<thead>
									<tr>
										<th class="CommonListHeaderLeftMost"><CP:ResourceControl runat="Server" ResourceName="CP_Tools_JobsReport_CronExpression"></CP:ResourceControl></th>
										<th class="CommonListHeader"><CP:ResourceControl runat="Server" ResourceName="CP_Tools_JobsReport_Process"></CP:ResourceControl></th>
										<th class="CommonListHeader"><CP:ResourceControl runat="Server" ResourceName="CP_Tools_JobsReport_JobNameType"></CP:ResourceControl></th>
										<th class="CommonListHeader"><CP:ResourceControl runat="Server" ResourceName="CP_Tools_JobsReport_PreviousRunTime"></CP:ResourceControl></th>
										<th class="CommonListHeader"><CP:ResourceControl runat="Server" ResourceName="CP_Tools_JobsReport_PreviousRunDuration"></CP:ResourceControl></th>
										<th class="CommonListHeader"><CP:ResourceControl runat="Server" ResourceName="CP_Tools_JobsReport_NextRunTime"></CP:ResourceControl></th>
									</tr>
								</thead>
					</headertemplate>
					<itemtemplate>
						<tr>
							<td class="CommonListCellLeftMost"><tt><asp:Literal ID="CronExpression" runat="server" /></tt></td>
							<td class="CommonListCell"><asp:Literal ID="Process" runat="server" /></td>
                            <td class="CommonListCell"><asp:Literal ID="JobName" runat="server" /></td>
							<td class="CommonListCell"><asp:Literal ID="PreviousRunTime" runat="server" /></td>
							<td class="CommonListCell"><asp:Literal ID="PreviousRunDuration" runat="server" /></td>
							<td class="CommonListCell"><asp:Literal ID="NextRunTime" runat="server" /></td>
						</tr>
					</itemtemplate>
					<AlternatingItemTemplate>
						<tr class="AltListRow">
							<td class="CommonListCellLeftMost"><tt><asp:Literal ID="CronExpression" runat="server" /></tt></td>
							<td class="CommonListCell"><asp:Literal ID="Process" runat="server" /></td>
                            <td class="CommonListCell"><asp:Literal ID="JobName" runat="server" /></td>
							<td class="CommonListCell"><asp:Literal ID="PreviousRunTime" runat="server" /></td>
							<td class="CommonListCell"><asp:Literal ID="PreviousRunDuration" runat="server" /></td>
							<td class="CommonListCell"><asp:Literal ID="NextRunTime" runat="server" /></td>
						</tr>
					</AlternatingItemTemplate>
					<footertemplate>
						</table>
						</div>
					</footertemplate>
				</asp:repeater>

	</div>

	<div class="CommonGroupedContentArea">
		<h3 class="CommonSubTitle"><CP:ResourceControl runat="Server" ResourceName="CP_Tools_JobsReport_CurrentlyRunningJobs"></CP:ResourceControl></h3>


				<asp:repeater id="RunningJobsRepeater" runat="server">
					<headertemplate>
						<div class="CommonListArea">
							<table id="Listing" cellspacing="0" cellpadding="0" border="0" width="100%">
								<thead>
									<tr>
										<th class="CommonListHeaderLeftMost"><CP:ResourceControl runat="Server" ResourceName="CP_Tools_JobsReport_Process"></CP:ResourceControl></th>
										<th class="CommonListHeader"><CP:ResourceControl runat="Server" ResourceName="CP_Tools_JobsReport_JobNameType"></CP:ResourceControl></th>
										<th class="CommonListHeader"><CP:ResourceControl runat="Server" ResourceName="CP_Tools_JobsReport_StartedAtUTC"></CP:ResourceControl></th>
										<th class="CommonListHeader"><CP:ResourceControl runat="Server" ResourceName="CP_Tools_JobsReport_RunningDuration"></CP:ResourceControl></th>
									</tr>
								</thead>
					</headertemplate>
					<itemtemplate>
						<tr>
							<td class="CommonListCellLeftMost"><asp:Literal ID="Process" runat="server" /></td>
                            <td class="CommonListCell"><asp:Literal ID="JobName" runat="server" /></td>
							<td class="CommonListCell"><asp:Literal ID="StartedAt" runat="server" /></td>
							<td class="CommonListCell"><asp:Literal ID="Duration" runat="server" /></td>
						</tr>
					</itemtemplate>
					<AlternatingItemTemplate>
						<tr class="AltListRow">
							<td class="CommonListCellLeftMost"><asp:Literal ID="Process" runat="server" /></td>
                            <td class="CommonListCell"><asp:Literal ID="JobName" runat="server" /></td>
							<td class="CommonListCell"><asp:Literal ID="StartedAt" runat="server" /></td>
							<td class="CommonListCell"><asp:Literal ID="Duration" runat="server" /></td>
						</tr>
					</AlternatingItemTemplate>
					<footertemplate>
						</table>
						</div>
					</footertemplate>
				</asp:repeater>

	</div>

</asp:Content>

