<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" CodeBehind="CustomPageManagement.aspx.cs" Inherits="Telligent.Evolution.ControlPanel.Blogs.CustomPageManagement" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Blogs.Components" %>


<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
    <CP:ResourceControl ResourceName="CP_Settings_CustomPageManagement" runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="CustomPageManagement" />

    <script type="text/javascript">
    // <![CDATA[
    function confirmDelete() 
    {
        return confirm('<%= ResourceManager.GetString("CP_Settings_DeleteCustomPage_Confirm", "ControlPanelResources.xml") %>');
    }

    function redirectSearch() {
        var result = 'q=' + document.getElementById('<%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "SearchText").ClientID %>').value;
        var customPageUrl = '<%= Globals.FullPath(BlogUrls.Instance().CustomPageManagement(CurrentWeblog.SectionID)) %>'
        window.location = customPageUrl + '&' + result;
    }

    $(function () {
        $('#<%# Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "SearchText").ClientID %>').keydown(function (e, data) {
            if (e.which === 13) {
                e.preventDefault();
                redirectSearch();
            }
        });
    });
    // ]]>
    </script>

	<TEControl:PlaceHolder runat="server" ID="ManageContentPages_HavePermission" >
        <ContentTemplate>
	<div class="CommonDescription">
	    <CP:ResourceControl runat="server" ResourceName="CP_Settings_CustomPageManagement_Desc" />
	</div>
	<CP:StatusMessage id="StatusMessage" runat="server" />
	<table cellpadding="0" cellspacing="0" border="0"  width="100%">
        <tr>
            <td align="left">
                <asp:TextBox runat="server" ID="SearchText" /> <a href="#" onclick="redirectSearch()" class="CommonTextButton"><TEControl:ResourceControl runat="server" ResourceName="Search" /></a>
            </td>
	        <td align="right">
	            <div class="PanelSaveButton">
	                <a href="#" onclick="javascript:Telligent_Modal.Open('<%# BlogUrls.Instance().ConfigureCustomPage((int)CurrentWeblog.SectionID) %>', 380, 350, refresh);" class="CommonTextButton"><CP:ResourceControl runat="server" ResourceName="CP_Add_Page" /></a>
	            </div>
	        </td>
	    </tr>
	</table>
	<div class="CommonListArea">
	<div class="CommonFormArea">
         <TEControl:WrappedRepeater runat="server" ID="PagesRepeater" ShowHeaderFooterOnNone="false">
            <HeaderTemplate>
                <table cellSpacing="0" cellPadding="0" border="0" width="100%">
	                <thead>
		                <tr>
			                <th class="CommonListHeaderLeftMost"><TEControl:ResourceControl runat="server" ResourceName="Name" /></th>
			                <th class="CommonListHeaderLeftMost"><TEControl:ResourceControl runat="server" ResourceName="URL" /></th>
			                <th class="CommonListHeader" style="width: 40px;"></th>
			                <th class="CommonListHeader" style="width: 25px;"></th>
			                <th class="CommonListHeader" style="width: 25px;"></th>										
			                <th class="CommonListHeader" style="width: 30px;"><TEControl:ResourceControl runat="server" ResourceName="Options" /></th>
		                </tr>
	                </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
	                <td class="CommonListCellLeftMost">
	                    <a href='<%# BlogUrls.Instance().CustomPage(CurrentWeblog, Eval("Name").ToString()) %>'><%# Eval("Title") %></a>
	                </td>
	                <td class="CommonListCellLeftMost">
	                    <a href='<%# BlogUrls.Instance().CustomPage(CurrentWeblog, Eval("Name").ToString()) %>'>/<%# Eval("Name") %>.aspx</a>
	                </td>
	                <td class="CommonListCell">
	                    <CP:ModalLink Visible='<%# Eval("ThemeContextID").ToString() != "-1" %>' runat="server" ResourceName="Rename" Height="320" Width="550" callback="refresh" Url='<%# "ConfigureCustomPage.aspx?WeblogID=" + CurrentWeblog.SectionID + "&PageName=" + Eval("Name").ToString() %>' CssClass="CommonTextButton" />
	                </td>
	                <td class="CommonListCell">
	                    <a href='<%# BlogUrls.Instance().EditFragmentPage(CurrentWeblog, Eval("Name").ToString(), true, -1, false, true, Globals.FullPath(BlogUrls.Instance().CustomPageManagement(CurrentWeblog.SectionID))) %>' class="CommonTextButton"><TEControl:ResourceControl runat="server" ResourceName="Layout" /></a>
	                </td>
	                <td class="CommonListCell">
	                    <CP:ModalLink Visible='<%# Eval("ThemeContextID").ToString() != "-1" %>' runat="server" ResourceName="Copy" Height="320" Width="550" callback="refresh" Url='<%# "CopyCustomPage.aspx?PageName=" + Eval("Name").ToString() + "&WeblogID=" + CurrentWeblog.SectionID %>' CssClass="CommonTextButton" />
	                </td>
	                <td class="CommonListCell">
	                    <CP:ResourceLinkButton Visible='<%# Eval("ThemeContextID").ToString() != "-1" %>' ID="DeleteButton" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Name") %>' OnClientClick="return confirmDelete();" CommandName="Delete" runat="server" ResourceName="Delete" CssClass="CommonTextButton" />
	                </td>
	            </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="AltListRow">
	                <td class="CommonListCellLeftMost">
	                    <a href='<%# BlogUrls.Instance().CustomPage(CurrentWeblog, Eval("Name").ToString()) %>'><%# Eval("Title") %></a>
	                </td>
	                <td class="CommonListCellLeftMost">
	                    <a href='<%# BlogUrls.Instance().CustomPage(CurrentWeblog, Eval("Name").ToString()) %>'>/<%# Eval("Name") %>.aspx</a>
	                </td>
	                <td class="CommonListCell">
	                    <CP:ModalLink Visible='<%# Eval("ThemeContextID").ToString() != "-1" %>' runat="server" ResourceName="Rename" Height="320" Width="550" callback="refresh" Url='<%# "ConfigureCustomPage.aspx?WeblogID=" + CurrentWeblog.SectionID + "&PageName=" + Eval("Name").ToString() %>' CssClass="CommonTextButton" />
	                </td>
	                <td class="CommonListCell">
	                    <a href='<%# BlogUrls.Instance().EditFragmentPage(CurrentWeblog, Eval("Name").ToString(), true, false, Globals.FullPath(BlogUrls.Instance().CustomPageManagement(CurrentWeblog.SectionID))) %>' class="CommonTextButton"><TEControl:ResourceControl runat="server" ResourceName="Layout" /></a>
	                </td>
	                <td class="CommonListCell">
	                    <CP:ModalLink Visible='<%# Eval("ThemeContextID").ToString() != "-1" %>' runat="server" ResourceName="Copy" Height="320" Width="550" callback="refresh" Url='<%# "CopyCustomPage.aspx?PageName=" + Eval("Name").ToString() + "&WeblogID=" + CurrentWeblog.SectionID %>' CssClass="CommonTextButton" />
	                </td>
	                <td class="CommonListCell">
	                    <CP:ResourceLinkButton Visible='<%# Eval("ThemeContextID").ToString() != "-1" %>' ID="DeleteButton" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Name") %>' OnClientClick="return confirmDelete();" CommandName="Delete" runat="server" ResourceName="Delete" CssClass="CommonTextButton" />
	                </td>
	            </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
            <NoneTemplate>
                <div class="CommonMessageWarning">
                    <TEControl:ConditionalContent runat="server">
                        <ContentConditions><TEControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="q" Operator="IsSetOrTrue" /></ContentConditions>
                        <TrueContentTemplate>
                            <CP:ResourceControl runat="server" ResourceName="CP_Blogs_CustomPageManagement_NoSearchPages" />
                        </TrueContentTemplate>
                        <FalseContentTemplate>
                            <CP:ResourceControl runat="server" ResourceName="CP_Blogs_CustomPageManagement_NoPages" />
                        </FalseContentTemplate>
                    </TEControl:ConditionalContent>
                </div>
            </NoneTemplate>
        </TEControl:WrappedRepeater>
        
        
        <div style="margin-top: 5px">
        <table cellpadding="0" cellspacing="0" border="0"  width="100%">
            <tr>
	            <td align="right">
	                <TEControl:Pager runat="server" ID="CustomPagesPager" />
	            </td>
            </tr>
        </table>
        </div>
    </div>
    </div>
	</ContentTemplate>
    </TEControl:PlaceHolder>
    <TEControl:PlaceHolder runat="server" ID="ManageContentPages_NoPermission">
        <ContentTemplate>
            <div class="CommonMessageWarning">
                <CP:ResourceControl runat="server" ResourceName="CP_Settings_ConfigureCustomPage_NoPermission" />
            </div>
        </ContentTemplate>
    </TEControl:PlaceHolder>
</asp:Content>
