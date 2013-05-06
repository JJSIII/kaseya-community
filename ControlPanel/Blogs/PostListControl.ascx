<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PostListControl.ascx.cs" Inherits="Telligent.Evolution.ControlPanel.Blogs.PostListControl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Blogs.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>
<script language = "javascript" type="text/javascript">

</script>

<p>
	<table cellpadding="0" cellspacing="0" border="0"  width="100%">
		<tr>
			<td nowrap="nowrap">
				<CP:ResourceLinkButton visible="false" Runat="server" ResourceName="CP_Blog_CreatePost" ID="NewPost" CssClass="CommonTextButtonBig" resourcefile="ControlPanelResources.xml"/>
			</td>		
			<td align="right">
				<CP:ResourceControl resourcename="Feedback_Filter" runat="Server" id="FeedbackFilterLabel" />
				<asp:DropDownList id="MonthList" Runat="Server" />
				<asp:DropDownList id="CategoryList" Runat="Server" />
				<asp:dropdownlist id="filterPublished" runat="server"></asp:dropdownlist>&nbsp;
				<CP:ResourceButton runat="server" resourcename="CP_ApplyFilter" id="Button1" />
			</td>

		</tr>
	</table>
 </p>

		<div class="CommonListArea">
		<TEControl:WrappedRepeater runat="Server" ShowHeaderFooterOnNone="false" id = "theposts">
		<HeaderTemplate>
		<table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
		<thead>
			<tr>
				<th class="CommonListHeaderLeftMost"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Subject" ID="Resourcecontrol3" NAME="Resourcecontrol3"/></th>
				<th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Views" ID="Resourcecontrol1" NAME="Resourcecontrol4"/></th>
                <th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Comments" ID="Resourcecontrol7" NAME="Resourcecontrol4"/></th>
				<th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Approved" ID="Resourcecontrol5" NAME="Resourcecontrol5"/></th>
                <th class="CommonListHeader PostHeader">&nbsp;</th>
			</tr>
		</thead>
		</HeaderTemplate>
			<ItemTemplate>
			<tr>
			    <td class="CommonListCellLeftMost">
			        <span><a href="<%# DataBinder.Eval(Container.DataItem, "ViewPostURL")%>">
			            <%# ShorterTitle((string)DataBinder.Eval(Container.DataItem,"Subject"), 90)%></a></span>
	        	    <div style="font-size:.8em; color:#959595">
			        <%# Boolean.Parse(DataBinder.Eval(Container.DataItem, "IsApproved").ToString()) ? ResourceManager.GetString("CP_Published_By", "ControlPanelResources.xml") : ResourceManager.GetString("CP_Drafted_By", "ControlPanelResources.xml")%>
			        <%# DataBinder.Eval(Container.DataItem,"DisplayName") %>
			        <CP:ResourceControl runat="server" ResourceName="CP_On"/>
			        <%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "PostDate")).ToString("MMM d, yyyy")%>
			        <CP:ResourceControl runat="server" ResourceName="CP_At" />
			        <%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "PostDate")).ToString("h:mm tt")%>
			        </div>
			    </td>
			    <td class="CommonListCell PostViewsCell">
			        <a href="<%# BlogUrls.Instance().ReferralToPost((int)DataBinder.Eval(Container.DataItem,"SectionID"), (int)DataBinder.Eval(Container.DataItem,"PostID")) %>">
			            <%# (Int32.Parse(DataBinder.Eval(Container.DataItem, "Views").ToString()) + Int32.Parse(DataBinder.Eval(Container.DataItem, "AggViews").ToString())).ToString("N0") %></a>
			    </td>
			    <td class="CommonListCell PostCommentsCell">
			        <a href="<%# BlogUrls.Instance().AdminFeedback((int)DataBinder.Eval(Container.DataItem,"SectionID"), (int)DataBinder.Eval(Container.DataItem,"PostID")) %>">
			            <%# CommentCount(Guid.Parse(DataBinder.Eval(Container.DataItem, "ContentID").ToString())).ToString("N0") %></a>
			    </td>
			    <td class="CommonListCell PostImageStatusCell">
			        <img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? "published" : "unpublished" %>.gif"
			            title="<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? "Published" : "Unpublished" %>"/>
			    </td>
			    <td  class="CommonListCell" nowrap="nowrap">
			        <input type="button" onclick="window.location='<%#  BlogUrls.Instance().PostEditor((int)DataBinder.Eval(Container.DataItem,"SectionID"), (int)DataBinder.Eval(Container.DataItem,"PostID"), (BlogPostType) DataBinder.Eval(Container.DataItem,"BlogPostType")) %>';" value="<%# ResourceManager.GetString("CP_Blog_GridCol_Edit", "ControlPanelResources.xml")%>" />
			        <cp:ResourceButton CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PostID")%>' CommandName="Delete" Runat="server" ID = "DeleteButton" ResourceName="CP_Blog_GridCol_Delete" />
			    </td>
			  </tr>
			</ItemTemplate>
            <AlternatingItemTemplate>
            <tr class="AltListRow">
			    <td class="CommonListCellLeftMost">
			        <span><a href="<%# DataBinder.Eval(Container.DataItem, "ViewPostURL")%>">
			            <%# ShorterTitle((string)DataBinder.Eval(Container.DataItem,"Subject"), 90)%></a></span>
	        	    <div style="font-size:.8em; color:#959595">
	        	    <%# Boolean.Parse(DataBinder.Eval(Container.DataItem, "IsApproved").ToString()) ? ResourceManager.GetString("CP_Published_By", "ControlPanelResources.xml") : ResourceManager.GetString("CP_Drafted_By", "ControlPanelResources.xml")%>
                    <%# DataBinder.Eval(Container.DataItem,"DisplayName") %>
			        <CP:ResourceControl runat="server" ResourceName="CP_On"/>
			        <%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "PostDate")).ToString("MMM d, yyyy")%>
			        <CP:ResourceControl runat="server" ResourceName="CP_At" />
			        <%# UserTime.ConvertToUserTime((DateTime)DataBinder.Eval(Container.DataItem, "PostDate")).ToString("h:mm tt")%>
			        </div>
			    </td>
			    <td class="CommonListCell PostViewsCell">
			        <a href="<%#  BlogUrls.Instance().ReferralToPost((int)DataBinder.Eval(Container.DataItem,"SectionID"), (int)DataBinder.Eval(Container.DataItem,"PostID")) %>">
			            <%# (Int32.Parse(DataBinder.Eval(Container.DataItem, "Views").ToString()) + Int32.Parse(DataBinder.Eval(Container.DataItem, "AggViews").ToString())).ToString("N0") %></a>
			    </td>
			    <td class="CommonListCell PostCommentsCell">
			        <a href="<%# BlogUrls.Instance().AdminFeedback((int)DataBinder.Eval(Container.DataItem,"SectionID"), (int)DataBinder.Eval(Container.DataItem,"PostID")) %>">
			            <%# CommentCount(Guid.Parse(DataBinder.Eval(Container.DataItem, "ContentID").ToString())).ToString("N0")%></a>
			    </td>
			    <td class="CommonListCell PostImageStatusCell">
			        <img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? "published" : "unpublished" %>.gif"
			            title="<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsApproved").ToString()) ? "Published" : "Unpublished" %>"/>
			    </td>
			    <td  class="CommonListCell">
			        <input type="button" onclick="window.location='<%#  BlogUrls.Instance().PostEditor((int)DataBinder.Eval(Container.DataItem,"SectionID"), (int)DataBinder.Eval(Container.DataItem,"PostID"), (BlogPostType) DataBinder.Eval(Container.DataItem,"BlogPostType")) %>';" value="<%# ResourceManager.GetString("CP_Blog_GridCol_Edit", "ControlPanelResources.xml")%>" />
			        <cp:ResourceButton CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PostID")%>' CommandName="Delete" Runat="server" ID = "DeleteButton" ResourceName="CP_Blog_GridCol_Delete" />
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
                                <CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_Blog_Posts_NoComments" />
                            </td>
                        </tr>
                    </table>
                </div>
            </NoneTemplate>		
			</TEControl:WrappedRepeater>
			
		    <TEControl:Pager runat = "Server" id = "thePager" />
		</div>	
