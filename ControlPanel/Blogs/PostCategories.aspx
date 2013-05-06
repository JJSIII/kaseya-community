<%@ Page language="c#" Codebehind="PostCategories.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.PostCategoriesListPage" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Blogs.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server"><CP:ResourceControl id="Resourcecontrol1" runat="server" ResourceName="CP_Blog_PostCategories_Title" /></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="PostCategories" runat="server" id="SelectedNavigation1" />
    <script language = "javascript" type="text/javascript">
      function reloadCategories(res)
      {
        if(res)
        {
	        refresh();
	    }
      }
      
    </script>	
    	
    <DIV class="CommonDescription">
	    <CP:ResourceControl runat="server" ResourceName="CP_Blog_PostCategories_SubTitle" />
    </DIV>

    <table cellpadding="0" cellspacing="0" border="0"  width="100%">
		<tr>
			<td align="right">
        	    <cp:ModalButton ModalType="Link" Height="300" Width="400" runat="Server" Callback="reloadCategories" id="NewCategory" ResourceName="CP_MediaGalleries_FileCategoryList_New" />
            </td>
        </tr>
    </table>

    <div class="CommonListArea">

	    <table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
	    <thead>
	    <tr>
		    <th class="CommonListHeaderLeftMost" >
		    <cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_TagName" /></th>
		    <th class="CommonListHeader PostHeader">
		    <cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Posts" /></th>																																	
		    <th class="CommonListHeader">&nbsp;</th>											
	    </tr>
	    </thead>
        
	    <asp:Repeater runat = "Server" id="theTags">
	    <ItemTemplate>
		    <tr>
			    <td class="CommonListCellLeftMost">
			        <span>
			            <a href='<%# Telligent.Evolution.Blogs.Components.BlogUrls.Instance().TagsBrowser(CurrentWeblog, new string[] { Eval("Name").ToString() })%>'><%# DataBinder.Eval(Container.DataItem,"Name")%></a>
			        </span>
			    </td>
			    <td class="CommonListCell PostViewsCell">
			        <cp:LiteralOrLink runat = "Server" NavigateUrl='<%# BlogUrls.Instance().ControlPanel_PostList(CurrentWeblog.SectionID, Server.UrlEncode(DataBinder.Eval(Container.DataItem, "Name").ToString())) %>' Text = '<%# DataBinder.Eval(Container.DataItem,"RelatedContentCount") %>' ID="PostsLink" />
			    </td>			    			    			    
			    <td class="CommonListCell">
			        <input type="button"  onclick="javascript:Telligent_Modal.Open('<%# BlogUrls.Instance().ControlPanel_CategoryForm(CurrentWeblog.SectionID, Server.UrlEncode(DataBinder.Eval(Container.DataItem,"Name").ToString())) %>', 400, 300, reloadCategories);" value="<%# Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_GridCol_Edit", "ControlPanelResources.xml") %>" />
				    <cp:ResourceButton CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Name")%>' CommandName="Delete" Runat="server" ID = "DeleteButton" ResourceName="CP_Blog_GridCol_Delete" />
			    </td>
		      </tr>
	    </ItemTemplate>
        <AlternatingItemTemplate>
		    <tr class="AltListRow">
			    <td class="CommonListCellLeftMost">
			        <span>
			            <a href='<%# Telligent.Evolution.Blogs.Components.BlogUrls.Instance().TagsBrowser(CurrentWeblog, new string[] { Eval("Name").ToString() })%>'><%# DataBinder.Eval(Container.DataItem,"Name")%></a>
			        </span>
			    </td>
			    <td class="CommonListCell PostViewsCell">
			        <cp:LiteralOrLink runat = "Server" NavigateUrl='<%# BlogUrls.Instance().ControlPanel_PostList(CurrentWeblog.SectionID, Server.UrlEncode(DataBinder.Eval(Container.DataItem, "Name").ToString())) %>' Text = '<%# DataBinder.Eval(Container.DataItem,"RelatedContentCount") %>' ID="PostsLink" />
			    </td>			    			    			    
			    <td class="CommonListCell">
			        <input type="button" id="editButton" onclick="javascript:Telligent_Modal.Open('<%# BlogUrls.Instance().ControlPanel_CategoryForm(CurrentWeblog.SectionID, Server.UrlEncode(DataBinder.Eval(Container.DataItem,"Name").ToString())) %>', 400, 300, reloadCategories);" value="<%# Telligent.Evolution.Components.ResourceManager.GetString("CP_Blog_GridCol_Edit", "ControlPanelResources.xml") %>" />
				    <cp:ResourceButton CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Name")%>' CommandName="Delete" Runat="server" ID = "DeleteButton" ResourceName="CP_Blog_GridCol_Delete" />
			    </td>
		      </tr>
	    </AlternatingItemTemplate>			
	    <FooterTemplate>
	        </table>
	    </FooterTemplate>
	    </asp:Repeater>
        <TEControl:Pager runat = "Server" id = "thePager" />  	    	
    </div>			
</asp:Content>