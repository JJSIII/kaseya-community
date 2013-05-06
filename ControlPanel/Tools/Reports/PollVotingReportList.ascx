<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PollVotingReportList.ascx.cs" Inherits="Telligent.EvolutionWeb.ControlPanel.Tools.Reports.PollVotingReportList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<div class="CommonListArea">
	<TEControl:WrappedRepeater runat="Server" ShowHeaderFooterOnNone="false" id = "theReport">
	<HeaderTemplate>
	<table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
	<thead>
		<tr>
		    <th class="CommonListHeaderLeftMost"><cp:resourcecontrol runat="server" resourcename="CP_Tools_PollVotingGrid_User" /></th>
			<th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Tools_PollVotingGrid_UserDisplayName" /></th>
			<th class="CommonListHeader PostHeader"><CP:ResourceControl runat="server" ResourceName="CP_Tools_PollVotingGrid_UserEmail" /></th>
            <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Tools_PollVotingGrid_Vote" /></th>
		</tr>
	</thead>
	</HeaderTemplate>
		<ItemTemplate>
		<tr>
		    <td class="CommonListCellLeftMost">
		        <a href="<%# Eval("ViewUserURL") %>"><%# Eval("Username")%></a>
		    </td>
		    <td class="CommonListCell">
		       <%# Eval("UserDisplayName")%>
		    </td>
		    <td class="CommonListCell">
		        <%# Eval("UserEmail")%>
		    </td>
		    <td class="CommonListCell">
		        <%# Eval("Answer")%>
		    </td>
		  </tr>
		</ItemTemplate>
        <AlternatingItemTemplate>
          <tr class="AltListRow">
            <td class="CommonListCellLeftMost">
		        <a href="<%# Eval("ViewUserURL") %>"><%# Eval("Username")%></a>
		    </td>
		    <td class="CommonListCell">
		       <%# Eval("UserDisplayName")%>
		    </td>
		    <td class="CommonListCell">
		        <%# Eval("UserEmail")%>
		    </td>
		    <td class="CommonListCell">
		        <%# Eval("Answer")%>
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
                            <CP:ResourceControl runat="server" ResourceName="CP_Tools_PollVotingReport_NoVotes" />
                        </td>
                    </tr>
                </table>
            </div>
        </NoneTemplate>		
    </TEControl:WrappedRepeater>
		
    <TEControl:Pager runat = "Server" id = "thePager" />
    
</div>	
