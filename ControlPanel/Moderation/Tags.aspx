<%@ Page language="c#" Codebehind="Tags.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Moderation.Tags" MasterPageFile="~/ControlPanel/Masters/ForumModeration.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server"><CP:ResourceControl id="Resourcecontrol1" runat="server" ResourceName="CP_Moderation_Tags" /></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="Tags" />

    <script language = "javascript" type="text/javascript">
     
      function reloadCallback(res)
      {
        if(res)
        {
	        refresh();
	    }
      }

    </script>	
    	
    <DIV class="CommonDescription"><CP:ResourceControl id="Resourcecontrol2" runat="server" ResourceName="CP_Moderation_Tags_Description" />
    </DIV>
    		
    <div class="CommonListArea">
	    <asp:Repeater runat="Server" id="theTags">
		    <HeaderTemplate>
			    <table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
				    <thead>
					    <tr>
						    <th class="CommonListHeaderLeftMost"><CP:ResourceControl runat="server" ResourceName="CP_Moderation_Tags_List_Name" /></th>
                            <th class="CommonListHeader" style="text-align: center;"><CP:ResourceControl runat="server" ResourceName="CP_Moderation_Tags_List_Posts" /></th>																																	
                            <th class="CommonListHeader">&nbsp;</th>
					    </tr>
				    </thead>
		    </HeaderTemplate>
		    <ItemTemplate>
			    <tr>
			        <td class="CommonListCellLeftMost">
					    <strong><a href='<%# Telligent.Evolution.Discussions.Components.ForumUrls.Instance().TagsBrowser(new string[] { Eval("Name").ToString() }) %>' title="View Tag"><%# DataBinder.Eval(Container.DataItem,"Name")%></a></strong>
			        </td>
			        <td class="CommonListCell" style="text-align: center;">
					    <strong><cp:LiteralOrLink runat="Server" NavigateUrl='<%# "TagPosts.aspx?Tags=" + Globals.UrlEncodePathComponent(DataBinder.Eval(Container.DataItem, "Name").ToString()) %>' Text='<%# DataBinder.Eval(Container.DataItem,"ContentCount") %>' ID="PostsLink" /></strong>
			        </td>			    			    			    
			        <td  class="CommonListCell" nowrap="nowrap">
					    <input type="button" onclick="Telligent_Modal.Open('RenameTag.aspx?Tags=<%# Globals.UrlEncodePathComponent(DataBinder.Eval(Container.DataItem, "Name").ToString()) %>', 450, 150, reloadCallback);" value="<CP:ResourceControl runat="server" resourcename="Rename" />" />
                        <asp:Button onclientclick="return confirm('Are you sure you want to delete this tag? \n(this action cannot be undone)');" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Name")%>' CommandName="Delete" Runat="server" ID="DeleteButton" Text='<%# Telligent.Evolution.Components.ResourceManager.GetString("Delete", "ControlPanelResources.xml") %>' />
			        </td>
			    </tr>
		    </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="AltListRow">
			        <td class="CommonListCellLeftMost">
					    <strong><a href='<%# Telligent.Evolution.Discussions.Components.ForumUrls.Instance().TagsBrowser(new string[] { Eval("Name").ToString() }) %>' title="View Tag"><%# DataBinder.Eval(Container.DataItem,"Name")%></a></strong>
			        </td>
			        <td class="CommonListCell" style="text-align: center;">
					    <strong><cp:LiteralOrLink runat="Server" NavigateUrl='<%# "TagPosts.aspx?Tags=" + Globals.UrlEncodePathComponent(DataBinder.Eval(Container.DataItem, "Name").ToString()) %>' Text='<%# DataBinder.Eval(Container.DataItem,"ContentCount") %>' ID="PostsLink" /></strong>
			        </td>			    			    			    
			        <td  class="CommonListCell" nowrap="nowrap">
					    <input type="button" onclick="Telligent_Modal.Open('RenameTag.aspx?Tags=<%# Globals.UrlEncodePathComponent(DataBinder.Eval(Container.DataItem, "Name").ToString()) %>', 450, 150, reloadCallback);" value="<CP:ResourceControl runat="server" resourcename="Rename" />" />
                        <asp:Button onclientclick="return confirm('Are you sure you want to delete this tag? \n(this action cannot be undone)');" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Name")%>' CommandName="Delete" Runat="server" ID="DeleteButton" Text='<%# Telligent.Evolution.Components.ResourceManager.GetString("Delete", "ControlPanelResources.xml") %>' />
			        </td>
			    </tr>
		    </AlternatingItemTemplate>			
		    <FooterTemplate>
			    </table>
		    </FooterTemplate>
	    </asp:Repeater>
    </div>			

    <TEControl:Pager id="pager" runat="server" PageSize="25" />

</asp:Content>