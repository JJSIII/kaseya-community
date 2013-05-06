<%@ Page language="c#" EnableViewState="False" Codebehind="switch.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.BlogSwitchPage" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Blogs.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderID="PanelNavigation" runat="server">
    <div class="DashboardMenuAreaFull">
        <CP:NavigationDropDownList CssClass="DashboardMenu" OpenCssClass="DashboardMenuOpen" runat="server" FileName="~/ControlPanel/DashboardMenu.config" MenuGroupCssClass="DashboardContextMenuGroup" MenuItemCssClass="DashboardContextMenuItem" MenuItemSelectedCssClass="DashboardContextMenuItemHover" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="Down" />
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    
    <TEControl:JQuery runat="server" />
    <script type="text/javascript">
	    // <![CDATA[
	    function closeModal(redirectUrl)
	    {
	        window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(redirectUrl);
	    }
	    // ]]>
        
        var searchForBlogText = '<%= ResourceManager.GetString("CP_BlogAdmin_Blogs_SearchForBlog", "ControlPanelResources.xml") %>';
        
        $(document).ready(function() {
            var blogSearchElement = document.getElementById('<%= BlogSearch.ClientID %>');
            
            $(blogSearchElement).val('<%= Telligent.Evolution.Components.JavaScript.Encode(Request.QueryString["q"]) %>');
                
            if ($(blogSearchElement).val() == '')
            {
                $(blogSearchElement).css({'color': '#777', 'font-style': 'italic'});
                $(blogSearchElement).val(searchForBlogText);
            }
        
            $(blogSearchElement).focus(function() {
                if ($(this).val() == searchForBlogText)
                {
                    $(this).css({'color': '#000', 'font-style': 'normal'});
                    $(this).val('');
                }
            }).blur(function() {
                if ($(this).val() == '')
                {
                    $(this).css({'color': '#777', 'font-style': 'italic'});
                    $(this).val(searchForBlogText);
                }
            });

			$(blogSearchElement).keydown(function (e, data) {
				if (e.which === 13) {
					e.preventDefault();
					$(this).next().click();
				}
			});
        });
	
	</script>
	
	
	    <div class="CommonDescription">
		    <cp:resourcecontrol runat="server" resourcename="CP_Blog_Switch_Description" />
	    </div>
	    <cp:statusmessage id="Status" runat="server" visible="false"></cp:statusmessage>
		
	    <h4><CP:CSLiteral runat="server" ID="message" /></h4>

        <table border="0" cellpadding="3" cellspacing="0" width="100%">
            <tr>
                <td><cp:AlphaPicker runat = "Server" id = "picker" /></td>
                <td align="right" style="width: 420px;">
                    <asp:TextBox runat="server" ID="BlogSearch" CssClass="SearchBox" />
                    <TEControl:ResourceButton runat="server" ResourceName="Search" OnClick="SearchButton_Click" CssClass="SearchButton" />
                </td>
            </tr>
        </table>			

			
        <div class="CommonListArea" style="clear:both">
        <asp:Repeater runat = "Server" id = "theBlogs">
        <HeaderTemplate>
        <table id="BlogLists" cellSpacing="0" cellPadding="0" border="0" width="100%">
        <thead>
        <tr>
            <th class="CommonListHeaderLeftMost" ><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_BlogTitle" /></th>
            <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_BlogAddress" /></th>
            <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Group" /></th>
            <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Enabled" /></th>
        </tr>
        </thead>
        </HeaderTemplate>
        <ItemTemplate>
        <tr>
            <td class="CommonListCellLeftMost">
                <strong><a onclick="window.parent.location = '<%# BlogUrls.Instance().ControlPanel_Blogs((int)DataBinder.Eval(Container.DataItem,"SectionID")) %>';" href="<%# BlogUrls.Instance().ControlPanel_Blogs((int)DataBinder.Eval(Container.DataItem,"SectionID")) %>"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem, "Name").ToString(), 50)%></a></strong>
            </td>
            <td class="CommonListCell">
                <a onclick="window.parent.location = '<%# BlogUrls.Instance().HomePage((Weblog) Container.DataItem) %>'" href="<%# BlogUrls.Instance().HomePage((Weblog) Container.DataItem) %>"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem, "ApplicationKey").ToString(), 50)%></a>
            </td>
            <td class="CommonListCell">
                <%# DataBinder.Eval(Container.DataItem, "Group.GroupPath")%>
            </td>
            <td class="CommonListCell" align="center">
                <img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsActive").ToString()) ? "published" : "unpublished" %>.gif"/>
            </td>
        </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
        <tr class="AltListRow">
            <td class="CommonListCellLeftMost">
                <strong><a onclick="window.parent.location = '<%# BlogUrls.Instance().ControlPanel_Blogs((int)DataBinder.Eval(Container.DataItem,"SectionID")) %>';" href="<%# BlogUrls.Instance().ControlPanel_Blogs((int)DataBinder.Eval(Container.DataItem,"SectionID")) %>"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem, "Name").ToString(), 50)%></a></strong>
            </td>
            <td class="CommonListCell">
                <a onclick="window.parent.location = '<%# BlogUrls.Instance().HomePage((Weblog) Container.DataItem) %>'" href="<%# BlogUrls.Instance().HomePage((Weblog) Container.DataItem) %>"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem, "ApplicationKey").ToString(), 50)%></a>
            </td>
            <td class="CommonListCell">
                <%# DataBinder.Eval(Container.DataItem, "Group.GroupPath")%>
            </td>
            <td class="CommonListCell" align="center">
                <img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/<%# Boolean.Parse(DataBinder.Eval(Container.DataItem,"IsActive").ToString()) ? "published" : "unpublished" %>.gif"/>
            </td>
        </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
        </table>
        </FooterTemplate>
        </asp:Repeater>
        </div>				

</asp:Content>