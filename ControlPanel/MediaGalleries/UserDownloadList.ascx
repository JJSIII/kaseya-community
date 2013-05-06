<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserDownloadList.ascx.cs" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.UserDownloadList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="Panel" TagName = "ActivityQueryControl" Src = "~/ControlPanel/Tools/Reports/ActivityQueryControl.ascx" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<table cellSpacing="0" cellPadding="2" width="100%" border="0">
	<tr>
		<td>
			<panel:ActivityQueryControl id="ActivityQuery" runat="Server" ></panel:ActivityQueryControl>
		</td>
	</tr>
</table>
<p />


    <div class="CommonListArea">
		<TEControl:WrappedRepeater runat="Server" ShowHeaderFooterOnNone="false" id = "theReport">
		<HeaderTemplate>
		<table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
		<thead>
			<tr>
			    <th class="CommonListHeaderLeftMost"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleries_UserDownloadGrid_User" /></th>
				<th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleries_UserDownloadGrid_UserDisplayName" /></th>
				<th class="CommonListHeader PostHeader"><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_UserDownloadGrid_UserEmail" /></th>
                <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleries_UserDownloadGrid_TotalDownloads" /></th>
				<th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleries_UserDownloadGrid_LatestDownloadDate" /></th>
			</tr>
		</thead>
		</HeaderTemplate>
			<ItemTemplate>
			<tr>
			    <td class="CommonListCellLeftMost">
			        <a href="<%# Eval("ViewUserURL") %>"><%# Eval("Username") %></a>
			    </td>
			    <td class="CommonListCell">
			       <%# Eval("UserDisplayName")%>
			    </td>
			    <td class="CommonListCell">
			        <%# Eval("UserEmail")%>
			    </td>
			    <td class="CommonListCell">
			        <%# Eval("TotalDownloads")%>
			    </td>
			    <td class="CommonListCell">
			        <%# ((DateTime) Eval("LatestDownloadDate")).ToString("MMM dd yyyy, hh:mm tt") %>
			    </td>			    			    			    
			  </tr>
			</ItemTemplate>
            <AlternatingItemTemplate>
              <tr class="AltListRow">
                <td class="CommonListCellLeftMost">
			        <a href="<%# Eval("ViewUserURL") %>"><%# Eval("Username") %></a>
			    </td>
			    <td class="CommonListCell">
			       <%# Eval("UserDisplayName")%>
			    </td>
			    <td class="CommonListCell">
			        <%# Eval("UserEmail")%>
			    </td>
			    <td class="CommonListCell">
			        <%# Eval("TotalDownloads")%>
			    </td>
			    <td class="CommonListCell">
			        <%# ((DateTime) Eval("LatestDownloadDate")).ToString("MMM dd yyyy, hh:mm tt") %>
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
                                <CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_MediaGalleries_UserDownloadGrid_NoDownloads" />
                            </td>
                        </tr>
                    </table>
                </div>
            </NoneTemplate>		
        </TEControl:WrappedRepeater>
			
        <TEControl:Pager runat = "Server" id = "thePager" />
        
	</div>	