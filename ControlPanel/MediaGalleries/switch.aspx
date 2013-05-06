<%@ Page language="c#" Codebehind="switch.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries._switch" MasterPageFile="~/ControlPanel/Masters/MediaGalleries.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.MediaGalleries.Components" %>

<asp:Content ContentPlaceHolderID="PanelNavigation" runat="server">
    <div class="DashboardMenuAreaFull">
        <CP:NavigationDropDownList CssClass="DashboardMenu" OpenCssClass="DashboardMenuOpen" runat="server" FileName="~/ControlPanel/DashboardMenu.config" MenuGroupCssClass="DashboardContextMenuGroup" MenuItemCssClass="DashboardContextMenuItem" MenuItemSelectedCssClass="DashboardContextMenuItemHover" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="Down" />
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation id="SelectedNavigation1" runat="server" SelectedTab="MediaGalleries" />
	
	<TEControl:JQuery runat="server" />
    <script type="text/javascript">
        
        var searchForMediaText = '<%= ResourceManager.GetString("CP_MediaGalleryAdmin_MediaGalleries_SearchForGallery", "ControlPanelResources.xml") %>';
        
        $(document).ready(function() {
            var mediaSearchElement = document.getElementById('<%= MediaSearch.ClientID %>');
            
            $(mediaSearchElement).val('<%= Telligent.Evolution.Components.JavaScript.Encode(Request.QueryString["q"]) %>');
                
            if ($(mediaSearchElement).val() == '')
            {
                $(mediaSearchElement).css({'color': '#777', 'font-style': 'italic'});
                $(mediaSearchElement).val(searchForMediaText);
            }
        
            $(mediaSearchElement).focus(function() {
                if ($(this).val() == searchForMediaText)
                {
                    $(this).css({'color': '#000', 'font-style': 'normal'});
                    $(this).val('');
                }
            }).blur(function() {
                if ($(this).val() == '')
                {
                    $(this).css({'color': '#777', 'font-style': 'italic'});
                    $(this).val(searchForMediaText);
                }
            });

			$(mediaSearchElement).keydown(function (e, data) {
				if (e.which === 13) {
					e.preventDefault();
					$(this).next().click();
				}
			});
        });
        
    </script>
	
	<DIV class="CommonDescription">
		<CP:ResourceControl id="ResourceControl3" runat="server" ResourceName="CP_MediaGalleries_Switch_Description"></CP:ResourceControl></DIV>
	
	<h3><CP:CSLiteral runat="server" ID="message" /></h3>
    <table border="0" cellpadding="3" cellspacing="0" width="100%">
        <tr>
            <td><cp:AlphaPicker runat = "Server" id = "picker" /></td>
            <td align="right" style="width: 420px;">
                <asp:TextBox runat="server" ID="MediaSearch" CssClass="SearchBox" />
                <TEControl:ResourceButton runat="server" ResourceName="Search" OnClick="SearchButton_Click" CssClass="SearchButton" />
            </td>
        </tr>
    </table>
    			
    <div class="CommonListArea" style="clear:both">
    <CP:RepeaterPlusNone runat="server" ID="theMediaGalleries" ShowHeaderFooterOnNone="false">
        <HeaderTemplate>
            <table id="BlogLists" cellSpacing="0" cellPadding="0" border="0" width="100%">
            <thead>
            <tr>
                <th class="CommonListHeaderLeftMost" ><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_AppKey" /></th>
                <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_Name" /></th>
                <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_Owners" /></th>
                <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_Group" /></th>
                <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_Enabled" /></th>    
            </tr>
            </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td class="CommonListCellLeftMost"><a href="<%# MediaGalleryUrls.Instance().ControlPanel_Home((int)DataBinder.Eval(Container.DataItem, "SectionID"))%>"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem,"ApplicationKey").ToString(), 50) %></a></td>
                <td class="CommonListCell"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem,"Name").ToString(), 50)%></td>
                <td class="CommonListCell"><%# FormatOwners(DataBinder.Eval(Container.DataItem,"Owners")) %>&nbsp;</td>
                <td  class="CommonListCell" nowrap="nowrap"><%# DataBinder.Eval(Container.DataItem,"GroupName") %></td>
	            <td class="CommonListCell" align="center"><img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/<%# DataBinder.Eval(Container.DataItem,"IsActive").ToString() %>.gif" width="16" height="15" /></td>    
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr class="AltListRow">
                <td class="CommonListCellLeftMost"><a href="<%# MediaGalleryUrls.Instance().ControlPanel_Home((int)DataBinder.Eval(Container.DataItem, "SectionID"))%>"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem,"ApplicationKey").ToString(), 50) %></a></td>
                <td class="CommonListCell"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem,"Name").ToString(), 50)%></td>
                <td class="CommonListCell"><%# FormatOwners(DataBinder.Eval(Container.DataItem,"Owners")) %>&nbsp;</td>
                <td  class="CommonListCell" nowrap="nowrap"><%# DataBinder.Eval(Container.DataItem,"GroupName") %></td>
	            <td class="CommonListCell" align="center"><img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/<%# DataBinder.Eval(Container.DataItem,"IsActive").ToString() %>.gif" width="16" height="15" /></td>    
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
        <NoneTemplate>
            <CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_MediaGalleries_NoMediaGalleriesExist" CssClass="CommonMessageError" />
        </NoneTemplate>
    </CP:RepeaterPlusNone>
    <TEControl:Pager runat="server" ID="galleryPager" />
    </div>					
</asp:Content>