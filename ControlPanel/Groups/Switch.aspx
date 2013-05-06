<%@ Page language="c#" Codebehind="Switch.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Groups._switch" MasterPageFile="~/ControlPanel/Masters/Groups.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderID="PanelNavigation" runat="server">
    <div class="DashboardMenuAreaFull">
        <CP:NavigationDropDownList CssClass="DashboardMenu" OpenCssClass="DashboardMenuOpen" runat="server" FileName="~/ControlPanel/DashboardMenu.config" MenuGroupCssClass="DashboardContextMenuGroup" MenuItemCssClass="DashboardContextMenuItem" MenuItemSelectedCssClass="DashboardContextMenuItemHover" MenuItemIconWidth="20" MenuItemIconHeight="20" MenuDirection="Down" />
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    
    <TEControl:JQuery runat="server" />
    <script type="text/javascript">

        var searchForGroupText = '<%= ResourceManager.GetString("CP_Dashboard_MyGroups_SearchForGroup", "ControlPanelResources.xml") %>';
        
        $(document).ready(function() {
            var groupSearchElement = document.getElementById('<%= GroupSearch.ClientID %>');
            
            $(groupSearchElement).val('<%= Telligent.Evolution.Components.JavaScript.Encode(Request.QueryString["q"]) %>');
                
            if ($(groupSearchElement).val() == '')
            {
                $(groupSearchElement).css({'color': '#777', 'font-style': 'italic'});
                $(groupSearchElement).val(searchForGroupText);
            }
        
            $(groupSearchElement).focus(function() {
                if ($(this).val() == searchForGroupText)
                {
                    $(this).css({'color': '#000', 'font-style': 'normal'});
                    $(this).val('');
                }
            }).blur(function() {
                if ($(this).val() == '')
                {
                    $(this).css({'color': '#777', 'font-style': 'italic'});
                    $(this).val(searchForGroupText);
                }
            });

			$(groupSearchElement).keydown(function (e, data) {
				if (e.which === 13) {
					e.preventDefault();
					$(this).next().click();
				}
			});
        });
        
    </script>
    
    <CP:ControlPanelSelectedNavigation runat="server" SelectedTab="Groups" />
	<DIV class="CommonDescription">
		<CP:ResourceControl runat="server" ResourceName="CP_Groups_Switch_Description"></CP:ResourceControl></DIV>
	<CP:StatusMessage id="Status" runat="server" Visible="false"></CP:StatusMessage>
	<h3><CP:CSLiteral runat="server" ID="message" /></h3>

    <table border="0" cellpadding="3" cellspacing="0" width="100%">
        <tr>
            <td>
                <cp:AlphaPicker runat = "Server" id = "picker" />
                <TEControl:GroupData LinkTo="CreateGroup" runat="server" LinkCssClass="internal-link create-group">
	                <ContentTemplate><span></span><TEControl:ResourceControl runat="server" ResourceName="Groups_Links_CreateNewGroup" /></ContentTemplate>
                </TEControl:GroupData>
            </td>
            <td align="right" style="width: 420px;">
                <asp:TextBox runat="server" ID="GroupSearch" CssClass="SearchBox" />
                <TEControl:ResourceButton runat="server" ResourceName="Search" OnClick="SearchButton_Click" CssClass="SearchButton" />
            </td>
        </tr>
    </table>
    			
    <div class="CommonListArea" style="clear:both">
    <TEControl:WrappedRepeater runat="server" ID="theGroups">
        <HeaderTemplate>
            <table cellSpacing="0" cellPadding="0" border="0" width="100%">
                <thead>
                    <tr>
                        <th class="CommonListHeaderLeftMost"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_Name" /></th>
                        <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_Owners" /></th>
                        <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_Path" /></th>
                    </tr>
                </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td class="CommonListCellLeftMost"><TEControl:GroupData runat="server" LinkTo="Edit"><ContentTemplate><%# Formatter.RemoveHtml(Eval("Name").ToString(), 50)%></ContentTemplate></TEControl:GroupData></td>
                <td class="CommonListCell"><%# FormatOwners(Container.DataItem)%>&nbsp;</td>
                <td class="CommonListCell"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem, "GroupPath").ToString(), 50)%></td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr class="AltListRow">
                <td class="CommonListCellLeftMost"><TEControl:GroupData runat="server" LinkTo="Edit"><ContentTemplate><%# Formatter.RemoveHtml(Eval("Name").ToString(), 50)%></ContentTemplate></TEControl:GroupData></td>
                <td class="CommonListCell"><%# FormatOwners(Container.DataItem)%>&nbsp;</td>
                <td class="CommonListCell"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem, "GroupPath").ToString(), 50)%></td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </TEControl:WrappedRepeater>
    <TEControl:Pager runat="server" ID="groupPager" />
    </div>					
</asp:Content>