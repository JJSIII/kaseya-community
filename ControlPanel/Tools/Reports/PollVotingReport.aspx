<%@ Page language="c#" Codebehind="PollVotingReport.aspx.cs" AutoEventWireup="false" Inherits="Telligent.EvolutionWeb.ControlPanel.Tools.Reports.PollVotingReport" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>
<%@ Register TagPrefix="CP" TagName = "VoteList" Src = "~/ControlPanel/Tools/Reports/PollVotingReportList.ascx" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<asp:Literal runat="server" id="PollTitle" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
	<div class="CommonDescription">
		<CP:ResourceControl runat="server" ResourceName="CP_Tools_PollVotingReport_Description" />
	</div>
	<CP:VoteList id="VoteList1" runat="Server" />
	<p />
	<asp:HyperLink runat="server" id="DownloadCSV" CssClass="CommonImageTextButton" style="background-image: url(../../images/excel.gif);" />
</asp:Content>

