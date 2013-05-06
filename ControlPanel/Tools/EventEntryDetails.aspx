<%@ Page language="c#" Codebehind="EventEntryDetails.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Tools.EventEntryDetails" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
	<DIV class="CommonContentArea">
		<DIV class="CommonContent">
			<P>
				<div class="CommonListArea">
					<h4 class="CommonListTitle">
						<CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_EntryDetails" />
					</h4>
					<table cellpadding="0" cellspacing="0" width="100%" rules="rows">
					<tr>
						<td width="15%" class="CommonFormFieldName CommonListCellLeftMost">
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_EntryID" />
						</td>
						<td width="15%" class="CommonFormField CommonListCell"><asp:label id="EntryID" runat="server" /></td>
						<td width="15%" class="CommonFormFieldName CommonListCell">
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_Category" />
						</td>
						<td width="20%" class="CommonFormField CommonListCell"><asp:label id="Category" runat="server" /></td>
						<td width="15%" class="CommonFormFieldName CommonListCell">
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_EventDate" />
						</td>
						<td width="20%" class="CommonFormField CommonListCell"><asp:label id="EventDate" runat="server" /></td>
					</tr>
					<tr>
						<td class="CommonFormFieldName CommonListCellLeftMost">
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_EventID" />
						</td>
						<td class="CommonFormField CommonListCell"><asp:label id="EventID" runat="server" /></td>
						<td class="CommonFormFieldName CommonListCell">
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_EventType" />
						</td>
						<td class="CommonFormField CommonListCell"><asp:label id="EventType" runat="server" /></td>
						<td class="CommonFormFieldName CommonListCell">
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_MachineName" />
						</td>
						<td class="CommonFormField CommonListCell"><asp:label id="MachineName" runat="server" /></td>
					</tr>
					<tr>
						<td class="CommonFormFieldName CommonListCellLeftMost">
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_SettingsID" />
						</td>
						<td class="CommonFormField CommonListCell"><asp:label id="SettingsID" runat="server" /></td>
						<td class="CommonFormField CommonListCell" colspan="4">&nbsp;</td>
					</tr>
					</table>
				</div>
				<div class="CommonFormFieldName">
					<CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_Message" />
				</div>
				<div class="CommonFormField">
					<asp:label id="EventMessage" runat="server" />
				</div>
			</P>
		</DIV>
	</DIV>
</asp:Content>