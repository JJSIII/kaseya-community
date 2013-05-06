<%@ Page language="c#" Codebehind="Blogs.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.BlogAdmin.BlogsPage" MasterPageFile="~/ControlPanel/Masters/BlogAdmin.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Blogs.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol runat="server" resourcename="CP_BlogAdmin_Blogs_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="BlogBlogs" />
	
	<TEControl:JQuery runat="server" />
    <script type="text/javascript">

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
        });
        
    </script>
    
    <div class="CommonDescription">
        <TEControl:ConditionalContent runat="server">
            <ContentConditions>
                <TEControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="WeblogID" Operator="GreaterThan" ComparisonValue="-1" />
            </ContentConditions>
            <TrueContentTemplate>
                <CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_NewBlog_Message">
                    <Parameter1Template><TEBlog:WeblogData runat="server" Property="Name" LinkTo="HomePage" /></Parameter1Template>
                </CP:ResourceControl>
            </TrueContentTemplate>
            <FalseContentTemplate>
                <cp:resourcecontrol runat="server" resourcename="CP_BlogAdmin_Blogs_Description" />
            </FalseContentTemplate>
        </TEControl:ConditionalContent>
    </div>
    
	<h3><CP:CSLiteral runat="server" ID="message" /></h3>

    <table border="0" cellpadding="3" cellspacing="0" width="100%">
        <tr>
            <td><cp:AlphaPicker runat = "Server" id = "picker" /></td>
            <td align="right" style="width: 420px;">
                <div style="float: left; text-align: left;">
                    <TEControl:GroupLookUpTextBox ID="GroupLookUp" runat="server" RequiredGroupPermission="Group_CreateBlog" MaximumSelections="1"
                        Width="164" EmptyHtml='<%# ResourceManager.GetString("CP_BlogAdmin_Blogs_FilterToGroup", "ControlPanelResources.xml") %>' />
                </div>
                <asp:TextBox runat="server" ID="BlogSearch" CssClass="SearchBox" />
                <TEControl:ResourceButton runat="server" ResourceName="Search" OnClick="SearchButton_Click" CssClass="SearchButton" />
            </td>
        </tr>
    </table>
    
    <div class="CommonListArea" style="clear:both">
    <asp:Repeater runat="Server" id="theBlogs">
        <HeaderTemplate>
            <TEControl:ConditionalContent runat="server">
                <DisplayConditions>
                    <TEControl:ControlPropertyValueComparison runat="server" ComparisonControlId="theBlogs" ComparisonProperty="Items" ComparisonValue="0" Operator="GreaterThan" />
                </DisplayConditions>
                <TrueContentTemplate>
                    <table id="BlogLists" cellSpacing="0" cellPadding="0" border="0" width="100%">
                        <thead>
                            <tr>
                                <th class="CommonListHeaderLeftMost"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Title" ID="Resourcecontrol6" NAME="Resourcecontrol4"/></th>
                                <th class="CommonListHeader" ><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Url" ID="Resourcecontrol5" NAME="Resourcecontrol3"/></th>
                                <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Group" ID="Resourcecontrol8" NAME="Resourcecontrol4"/></th>
                                <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Enabled" ID="Resourcecontrol9" NAME="Resourcecontrol4"/></th>
                                <th class="CommonListHeader">&nbsp;</th>
                            </tr>
                        </thead>
    	        </TrueContentTemplate>
	        </TEControl:ConditionalContent>
        </HeaderTemplate>
        <ItemTemplate>
        <tr>
            <td class="CommonListCellLeftMost"><TEBlog:WeblogData runat="server" Property="Name" LinkTo="HomePage" /></td>
            <td class="CommonListCell"><a href="SectionEdit.aspx?tab=blog&amp;WeblogID=<%# DataBinder.Eval(Container.DataItem,"SectionID") %>">/<%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem, "ApplicationKey").ToString(), 50)%>/</a></td>
            <td class="CommonListCell" nowrap="nowrap"><%# DataBinder.Eval(Container.DataItem, "Group.GroupPath")%></td>
            <td class="CommonListCell Status"><img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/<%# DataBinder.Eval(Container.DataItem,"IsActive").ToString() %>_large.gif" /></td>    
            <td class ="CommonListCell" nowrap="nowrap">
                <input type="button" onclick="javascript:window.location='SectionEdit.aspx?tab=blog&WeblogID=<%# DataBinder.Eval(Container.DataItem,"SectionID") %>'" value="Edit" />
                <input type="Button" onclick="javascript:window.location='../blogs/default.aspx?tab=manage&WeblogID=<%# DataBinder.Eval(Container.DataItem,"SectionID") %>'" value="Manage" />
                <CP:ResourceButton runat="server" ID="DeleteButton" CommandArgument='<%# Eval("SectionID") %>' CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this blog?');" ResourceName="CP_PermissionList_Delete" />
            </td>
        </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
        <tr class="AltListRow">
            <td class="CommonListCellLeftMost"><TEBlog:WeblogData runat="server" Property="Name" LinkTo="HomePage" /></td>
            <td class="CommonListCell"><a href="SectionEdit.aspx?tab=blog&amp;WeblogID=<%# DataBinder.Eval(Container.DataItem,"SectionID") %>">/<%# Formatter.RemoveHtml(DataBinder.Eval(Container.DataItem, "ApplicationKey").ToString(), 50)%>/</a></td>
            <td class="CommonListCell" nowrap="nowrap"><%# DataBinder.Eval(Container.DataItem, "Group.GroupPath")%></td>
            <td class="CommonListCell Status"><img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/<%# DataBinder.Eval(Container.DataItem,"IsActive").ToString() %>_large.gif" /></td>    
            <td class ="CommonListCell" nowrap="nowrap">
                <input type="button" onclick="javascript:window.location='SectionEdit.aspx?tab=blog&WeblogID=<%# DataBinder.Eval(Container.DataItem,"SectionID") %>'" value="Edit" />
                <input type="Button" onclick="javascript:window.location='../blogs/default.aspx?tab=manage&WeblogID=<%# DataBinder.Eval(Container.DataItem,"SectionID") %>'" value="Manage" />
                <CP:ResourceButton runat="server" ID="DeleteButton" CommandArgument='<%# Eval("SectionID") %>' CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this blog?');" ResourceName="CP_PermissionList_Delete" />
            </td>
        </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            <TEControl:ConditionalContent runat="server">
                <DisplayConditions>
                    <TEControl:ControlPropertyValueComparison runat="server" ComparisonControlId="theBlogs" ComparisonProperty="Items" ComparisonValue="0" Operator="GreaterThan" />
                </DisplayConditions>
                <TrueContentTemplate>
		            </table>
    	        </TrueContentTemplate>
	        </TEControl:ConditionalContent>
        </FooterTemplate>
    </asp:Repeater>
	<TEControl:Pager runat="server" ID="appPager" PageSize="10">
		<PagerUrlFormatTemplate>
			<TEControl:SiteUrl ID="SiteUrl1" runat="server" RenderRawUrl="true" UrlName="hub_ControlPanel_AdminBlogsPaged" Parameter2="false" Parameter3="{0}">
				<Parameter1Template><TEControl:QueryStringData ID="QueryStringData1" runat="server" Property="q" /></Parameter1Template>
				<Parameter2Template><TEControl:QueryStringData ID="QueryStringData2" runat="server" Property="a" /></Parameter2Template>
			</TEControl:SiteUrl>
		</PagerUrlFormatTemplate>
	</TEControl:Pager>
    </div>
	   
</asp:Content>