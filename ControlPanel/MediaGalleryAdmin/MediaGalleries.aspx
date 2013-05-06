<%@ Page language="c#" Codebehind="MediaGalleries.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleryAdmin.MediaGalleries" MasterPageFile="~/ControlPanel/Masters/MediaGalleryAdmin.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl id="ResourceControl1" runat="server" ResourceName="CP_MediaGalleryAdmin_MediaGalleries_Title"></CP:ResourceControl>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="MediaGalleries" />
    
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
        });
    </script>

	<div class="CommonDescription">
	    <TEControl:ConditionalContent runat="server">
            <ContentConditions>
                <TEControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="MediaGalleryID" Operator="GreaterThan" ComparisonValue="-1" />
                <TEMedia:MediaGalleryPropertyValueComparison runat="server" ComparisonProperty="Name" Operator="IsSetOrTrue" />
            </ContentConditions>
            <TrueContentTemplate>
                <CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_NewMediaGalleryMessage">
                    <Parameter1Template><TEMedia:MediaGalleryData runat="server" Property="Name" LinkTo="MediaGalleryHome" /></Parameter1Template>
                </CP:ResourceControl>
            </TrueContentTemplate>
            <FalseContentTemplate>
                <CP:ResourceControl runat="server" ResourceName="CP_MediaGalleryAdmin_MediaGalleries_Description" />
            </FalseContentTemplate>
        </TEControl:ConditionalContent>
	</div>
	
	<h3><CP:CSLiteral runat="server" ID="message" /></h3>
    <h4><CP:CSLiteral runat="server" ID="deletedMessage" /></h4>
    
    <table border="0" cellpadding="3" cellspacing="0" width="100%">
        <tr>
            <td><cp:AlphaPicker runat = "Server" id = "picker" /></td>
            <td align="right" style="width: 420px;">
                <div style="float: left; text-align: left;">
                    <TEControl:GroupLookUpTextBox ID="GroupLookUp" runat="server" RequiredGroupPermission="Group_CreateBlog" MaximumSelections="1"
                        Width="164" EmptyHtml='<%# ResourceManager.GetString("CP_MediaGalleryAdmin_MediaGalleries_FilterToGroup", "ControlPanelResources.xml") %>' />
                </div>
                <asp:TextBox runat="server" ID="MediaSearch" CssClass="SearchBox" />
                <TEControl:ResourceButton runat="server" ResourceName="Search" OnClick="SearchButton_Click" CssClass="SearchButton" />
            </td>
        </tr>
    </table>
    
    <div class="CommonListArea" style="clear:both">
    <asp:Repeater runat = "Server" id = "theMediaGalleries">
    <HeaderTemplate>
    <table id="BlogLists" cellSpacing="0" cellPadding="0" border="0" width="100%">
    <thead>
    <tr>
        <th class="CommonListHeaderLeftMost" ><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_MG" /></th>
        <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_Name" /></th>
        <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_Owners" /></th>
        <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_Group" /></th>
        <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryGrid_Enabled" /></th>    
        <th class="CommonListHeader">&nbsp;</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
        <td class="CommonListCellLeftMost"><TEMedia:MediaGalleryData runat="server" LinkTo="MediaGalleryHome" Property="ApplicationKey" /></td>
        <td class="CommonListCell"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem,"Name").ToString(), 50)%></td>
        <td class="CommonListCell"><%# FormatOwners(DataBinder.Eval(Container.DataItem,"Owners")) %>&nbsp;</td>
        <td  class="CommonListCell" nowrap="nowrap"><%# DataBinder.Eval(Container.DataItem, "Group.GroupPath")%></td>
	    <td class="CommonListCell" align="center"><img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/<%# DataBinder.Eval(Container.DataItem,"IsActive").ToString() %>.gif" width="16" height="15" /></td>    
	    <td class ="CommonListCell" nowrap="nowrap">
		    <input type="button" onclick="window.location = 'CreateEditMediaGallery.aspx?SelectedNavItem=MediaGalleries&amp;MediaGalleryID=<%# DataBinder.Eval(Container.DataItem,"SectionID") %>&amp;ReturnUrl=/controlpanel/mediagalleryadmin/mediagalleries.aspx%3FGroupID=<%# CSContext.Current.GetIntFromQueryString(CommonQueryStringProperties.GroupID, -1) %>';" value="Edit" />
            <input type="button" onclick="window.location = '../mediagalleries/default.aspx?MediaGalleryID=<%# DataBinder.Eval(Container.DataItem,"SectionID") %>';" value="Manage" /> 
            <CP:ResourceButton runat="server" ID="DeleteButton" CommandArgument='<%# Eval("SectionID") %>' CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this media gallery?');" ResourceName="CP_PermissionList_Delete" />
	    </td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr class="AltListRow">
        <td class="CommonListCellLeftMost"><TEMedia:MediaGalleryData runat="server" LinkTo="MediaGalleryHome" Property="ApplicationKey" /></td>
        <td class="CommonListCell"><%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem,"Name").ToString(), 50)%></td>
        <td class="CommonListCell"><%# FormatOwners(DataBinder.Eval(Container.DataItem,"Owners")) %>&nbsp;</td>
        <td  class="CommonListCell" nowrap="nowrap"><%# DataBinder.Eval(Container.DataItem, "Group.GroupPath")%></td>
	    <td class="CommonListCell" align="center"><img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/<%# DataBinder.Eval(Container.DataItem,"IsActive").ToString() %>.gif" width="16" height="15" /></td>    
	    <td class ="CommonListCell" nowrap="nowrap">
		    <input type="button" onclick="window.location = 'CreateEditMediaGallery.aspx?SelectedNavItem=MediaGalleries&amp;MediaGalleryID=<%# DataBinder.Eval(Container.DataItem,"SectionID") %>&amp;ReturnUrl=/controlpanel/mediagalleryadmin/mediagalleries.aspx%3FGroupID=<%# CSContext.Current.GetIntFromQueryString(CommonQueryStringProperties.GroupID, -1) %>';" value="Edit" />
            <input type="button" onclick="window.location = '../mediagalleries/default.aspx?MediaGalleryID=<%# DataBinder.Eval(Container.DataItem,"SectionID") %>';" value="Manage" /> 
            <CP:ResourceButton runat="server" ID="DeleteButton" CommandArgument='<%# Eval("SectionID") %>' CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this media gallery?');" ResourceName="CP_PermissionList_Delete" />
	    </td>	
    </tr>
    </AlternatingItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
    </asp:Repeater>
    </div>					
</asp:Content>