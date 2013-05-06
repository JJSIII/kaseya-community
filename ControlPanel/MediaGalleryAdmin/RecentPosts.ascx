<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecentPosts.ascx.cs" Inherits="Telligent.Evolution.ControlPanel.MediaGalleryAdmin.RecentPosts" %>
<%@ Import Namespace="Telligent.Evolution.MediaGalleries.Components"%>
<%@ Import Namespace="Telligent.Evolution.Components"%>

<script type="text/javascript">
// <!--
function ValidateDelete(multiple)
{
	if (multiple)
		return confirm('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_MediaGalleries_FileList_DeleteSelected") %>');
	else
		return confirm('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_MediaGalleries_FileList_DeletePostConfirm") %>');
}

function checkAll(isChecked)
{
	var pa = document.getElementsByName('FileCheck');
	for(var i=0; i<pa.length; i++)
	{
		pa[i].checked = isChecked;
	}
}

// -->
</script>


<div class="CommonListArea">
	<TEControl:WrappedRepeater runat="Server" ShowHeaderFooterOnNone="false" id = "PostList" OnItemCommand="PostList_ItemCommand">
	<HeaderTemplate>
	<table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
	<thead>
		<tr>
			<th class="CommonListHeaderLeftMost"><input type="checkbox" name="master" id="master" onclick="checkAll(this.checked);" /></th>
			<th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleries_FileGrid_Title" /></th>
			<th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleries_FileGrid_Views" /></th>
			<th class="CommonListHeader PostHeader"><CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_FileGrid_Downloads" /></th>
			<th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleries_FileGrid_Comments" /></th>
			<th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleries_FileGrid_Published" /></th>
			<th class="CommonListHeader">&nbsp;</th>
		</tr>
	</thead>
	</HeaderTemplate>
		<ItemTemplate>
		<tr>
			<td class="CommonListCellLeftMost">
				<input type="checkbox" name="FileCheck" value="<%# Eval("PostID") %>" />
			</td>
			<td class="CommonListCell">
				<TEMedia:MediaGalleryPostViewer runat="server" ViewType="Preview" Width="32" Height="32" style="float: left; width: 40px;" />
				<a href="<%# DataBinder.Eval(Container.DataItem, "ViewPostURL")%>">
					<%# ShorterTitle((string)DataBinder.Eval(Container.DataItem,"Subject"), 90)%></a>
				<div style="font-size:.8em; color:#959595; display: inline; display: inline-table;">
					<CP:ResourceControl runat="Server" resourcename="CP_Published_By" /> <%# DataBinder.Eval(Container.DataItem,"DisplayName") %>
					<CP:ResourceControl runat="server" ResourceName="CP_On"/>
					<%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "PostDate")).ToString("MMM d, yyyy")%>
					<CP:ResourceControl runat="server" ResourceName="CP_At" />
					<%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "PostDate")).ToString("h:mm tt")%>
					<CP:ResourceControl runat="server" ResourceName="CP_In" />
					<a href='<%# GroupUrls.Instance().HomePage(((Section)Eval("Section")).Group)%>'><%# ((Section) Eval("Section")).GroupName %></a>
					&gt;
					<a href='<%# MediaGalleryUrls.Instance().ViewMediaGallery((MediaGallery)Eval("Section")) %>'><%# ((Section) Eval("Section")).Name %></a>
				</div>
			</td>
			<td class="CommonListCell PostViewsCell">
				<%# Eval("Views")%>
			</td>
			<td class="CommonListCell PostViewsCell">
				<a href="<%#  MediaGalleryUrls.Instance().ControlPanel_UserDownloads((int)Eval("SectionID"), (int)Eval("PostID"))%>"><%# DataBinder.Eval(Container.DataItem, "Downloads")%></a>
			</td>
			<td class="CommonListCell PostCommentsCell">
				<a href="<%#  MediaGalleryUrls.Instance().ControlPanel_Comments((int)Eval("SectionID"), (int)Eval("PostID"))%>"><%# DataBinder.Eval(Container.DataItem,"Replies") %></a>
			</td>			    			    			    
			<td class="CommonListCell PostImageStatusCell">
				<img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? "published" : "unpublished" %>.gif"
					title="<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? "Published" : "Unpublished" %>"/>
			</td>
			<td  class="CommonListCell" nowrap="nowrap">
				<input type="button" onclick="window.location='<%#  MediaGalleryUrls.Instance().ControlPanel_FileEditor((int)Eval("SectionID"), (int)Eval("PostID"))%>'; return false;" value="<%# ResourceManager.GetString("CP_MediaGalleries_FileList_Edit", "ControlPanelResources.xml") %>" />
				<input type="button" onclick="window.location='<%#  MediaGalleryUrls.Instance().ControlPanel_Home((int)Eval("SectionID"))%>'; return false;" value="<%# ResourceManager.GetString("CP_MediaGalleries_ManageGallery", "ControlPanelResources.xml") %>" />
				<cp:ResourceButton OnClientClick="return ValidateDelete(false);" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PostID")%>' CommandName="Delete" Runat="server" ID = "DeleteButton" ResourceName="CP_MediaGalleries_FileList_Delete" />
			</td>
		  </tr>
		</ItemTemplate>
		<AlternatingItemTemplate>
		<tr class="AltListRow">
			<td class="CommonListCellLeftMost">
				<input type="checkbox" name="FileCheck" value="<%# Eval("PostID") %>" />
			</td>
			<td class="CommonListCell">
				<TEMedia:MediaGalleryPostViewer runat="server" ViewType="Preview" Width="32" Height="32" style="float: left; width: 40px;" />
				<a href="<%# DataBinder.Eval(Container.DataItem, "ViewPostURL")%>">
					<%# ShorterTitle((string)DataBinder.Eval(Container.DataItem,"Subject"), 90)%></a>
				<div style="font-size:.8em; color:#959595; display: inline; display: inline-table;">
					<CP:ResourceControl runat="Server" resourcename="CP_Published_By" /> <%# DataBinder.Eval(Container.DataItem,"DisplayName") %>
					<CP:ResourceControl runat="server" ResourceName="CP_On"/>
					<%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "PostDate")).ToString("MMM d, yyyy")%>
					<CP:ResourceControl runat="server" ResourceName="CP_At" />
					<%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "PostDate")).ToString("h:mm tt")%>
					<CP:ResourceControl runat="server" ResourceName="CP_In" />
					<a href='<%# GroupUrls.Instance().HomePage(((Section)Eval("Section")).Group)%>'><%# ((Section) Eval("Section")).GroupName %></a>
					&gt;
					<a href='<%# MediaGalleryUrls.Instance().ViewMediaGallery((MediaGallery)Eval("Section")) %>'><%# ((Section) Eval("Section")).Name %></a>
				</div>
			</td>
			<td class="CommonListCell PostViewsCell">
				<%# Eval("Views") %>
			</td>
			<td class="CommonListCell PostViewsCell">
				<a href="<%#  MediaGalleryUrls.Instance().ControlPanel_UserDownloads((int)Eval("SectionID"), (int)Eval("PostID"))%>"><%# DataBinder.Eval(Container.DataItem, "Downloads")%></a>
			</td>
			<td class="CommonListCell PostCommentsCell">
				<a href="<%#  MediaGalleryUrls.Instance().ControlPanel_Comments((int)Eval("SectionID"), (int)Eval("PostID"))%>"><%# DataBinder.Eval(Container.DataItem,"Replies") %></a>
			</td>			    			    			    
			<td class="CommonListCell PostImageStatusCell">
				<img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? "published" : "unpublished" %>.gif"
					title="<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? "Published" : "Unpublished" %>"/>
			</td>
			<td  class="CommonListCell" nowrap="nowrap">
				<input type="button" onclick="window.location='<%#  MediaGalleryUrls.Instance().ControlPanel_FileEditor((int)Eval("SectionID"), (int)Eval("PostID"))%>'; return false;" value="<%# ResourceManager.GetString("CP_MediaGalleries_FileList_Edit", "ControlPanelResources.xml") %>" />
				<input type="button" onclick="window.location='<%#  MediaGalleryUrls.Instance().ControlPanel_Home((int)Eval("SectionID"))%>'; return false;" value="<%# ResourceManager.GetString("CP_MediaGalleries_ManageGallery", "ControlPanelResources.xml") %>" />
				<cp:ResourceButton OnClientClick="return ValidateDelete(false);" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PostID")%>' CommandName="Delete" Runat="server" ID = "DeleteButton" ResourceName="CP_MediaGalleries_FileList_Delete" />
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
							<CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_MediaGalleries_FileList_NoFiles" />
						</td>
					</tr>
				</table>
			</div>
		</NoneTemplate>		
	</TEControl:WrappedRepeater>
    
	<asp:PlaceHolder ID="ActionButtons" runat="server">
		<CP:ResourceButton ID="PublishSelected" runat="server" ResourceName="CP_MediaGalleries_PublishSelected" OnClick="PublishSelected_Click" />
		<CP:ResourceButton ID="UnpublishSelected" runat="server" ResourceName="CP_MediaGalleries_UnpublishSelected" OnClick="UnpublishSelected_Click" />
		<CP:ResourceButton ID="DeleteSelected" runat="server" ResourceName="CP_MediaGalleries_DeleteSelected" OnClientClick="return ValidateDelete(true);" OnClick="DeleteSelected_Click" />
	</asp:PlaceHolder>
</div>