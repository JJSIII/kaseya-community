<%@ Page language="c#" Codebehind="EventLogViewer.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Tools.EventLogViewer" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script runat="server">
string ShowMessage(string message)
{
	int maxLength = 255;
	string output = message;
	if (message.Length > maxLength + 3)
		output = message.Substring(0, maxLength) + "...";

	return Context.Server.HtmlEncode(output);
}
</script>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
    <cp:resourcecontrol id=RegionTitle runat="Server" resourcename="CP_Tools_EventLogViewer_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ToolsEvents" />
    
	<fieldset>
		<legend>
			<CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_Criteria" />
		</legend>
		<table cellspacing="0" cellpadding="2" width="90%" border="0">
			<tr>
				<td><CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_StartDate" /></td>
				<td><TWC:DateTimeSelector runat="server" id="dtsStartDate" AllowBlankValues="true" DateTimeFormat="MMMM d yyyy hh:mm tt" ShowCalendarPopup="true" /></td>
				<td align="center" rowspan="4">
					<CP:ResourceButton ID="btnSelect" runat="server" ResourceName="CP_Tools_EventLogViewer_Go"></CP:ResourceButton>
				</td>
			</tr>
			<tr>
				<td><CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_EndDate" /></td>
				<td><TWC:DateTimeSelector runat="server" id="dtsEndDate" AllowBlankValues="true" DateTimeFormat="MMMM d yyyy hh:mm tt" ShowCalendarPopup="true" /></td>
			</tr>
			<tr>
				<td><CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_EventType" /></td>
				<td><asp:DropDownList ID="ddlEventType" runat="server"></asp:DropDownList></td>
			</tr>
		</table>
	</fieldset>
    <div class="CommonListArea">
	    <TEControl:WrappedRepeater runat="Server" ShowHeaderFooterOnNone="false" id = "theReport">
	    <HeaderTemplate>
	    <table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
	    <thead>
		    <tr>
		        <th class="CommonListHeaderLeftMost"><cp:resourcecontrol runat="server" resourcename="CP_Tools_EventLogViewer_GridCol_ID" /></th>
			    <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Tools_EventLogViewer_GridCol_Message" /></th>
			    <th class="CommonListHeader PostHeader"><CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_GridCol_Category" /></th>
                <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Tools_EventLogViewer_GridCol_EventDate" /></th>
                <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Tools_EventLogViewer_GridCol_MachineName" /></th>
                <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Tools_EventLogViewer_GridCol_EventID" /></th>
                <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Tools_EventLogViewer_GridCol_EventType" /></th>
                <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Tools_EventLogViewer_GridCol_SettingsID" /></th>
		    </tr>
	    </thead>
	    </HeaderTemplate>
		    <ItemTemplate>
		    <tr>
		        <td class="CommonListCellLeftMost">
		            <a href="javascript:Telligent_Modal.Open('EventEntryDetails.aspx?EntryID=<%# Eval("EntryID")%>', 600, 400, null);"><%# Eval("EntryID")%></a>
		        </td>
		        <td class="CommonListCell" style="font-size: 80%;">
		           <%# Eval("Message")%>
		        </td>
		        <td class="CommonListCell">
		            <%# Eval("Category")%>
		        </td>
		        <td class="CommonListCell">
		            <%# Eval("EventDate")%>
		        </td>
		        <td class="CommonListCell">
		            <%# Eval("MachineName")%>
		        </td>
		        <td class="CommonListCell">
		            <%# Eval("EventID")%>
		        </td>
		        <td class="CommonListCell">
		            <%# Eval("EventType")%>
		        </td>
		        <td class="CommonListCell">
		            <%# Eval("SettingsID")%>
		        </td>
		      </tr>
		    </ItemTemplate>
            <AlternatingItemTemplate>
              <tr class="AltListRow">
                <td class="CommonListCellLeftMost">
		            <a href="javascript:Telligent_Modal.Open('EventEntryDetails.aspx?EntryID=<%# Eval("EntryID")%>', 600, 400, null);"><%# Eval("EntryID")%></a>
		        </td>
		        <td class="CommonListCell" style="font-size: 80%;">
		           <%# Eval("Message")%>
		        </td>
		        <td class="CommonListCell">
		            <%# Eval("Category")%>
		        </td>
		        <td class="CommonListCell">
		            <%# Eval("EventDate")%>
		        </td>
		        <td class="CommonListCell">
		            <%# Eval("MachineName")%>
		        </td>
		        <td class="CommonListCell">
		            <%# Eval("EventID")%>
		        </td>
		        <td class="CommonListCell">
		            <%# Eval("EventType")%>
		        </td>
		        <td class="CommonListCell">
		            <%# Eval("SettingsID")%>
		        </td>
		      </tr>
		    </AlternatingItemTemplate>			
    		
		    <FooterTemplate>
		        </table>
		    </FooterTemplate>

            <NoneTemplate>
                <div class="CommonMessageWarning">
                    <table>
                        <tr>
                            <td style="width:35px">
        		                <img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/spam.gif" />
                            </td>
                            
                            <td>
                                <CP:ResourceControl runat="server" ResourceName="CP_Tools_EventLogViewer_NoLogs" />
                            </td>
                        </tr>
                    </table>
                </div>
            </NoneTemplate>		
        </TEControl:WrappedRepeater>
    		
        <TEControl:Pager runat = "Server" id = "thePager" PageSize="20" />
        
    </div>	
</asp:Content>