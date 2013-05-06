<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" CodeBehind="CustomPageManagement.aspx.cs" Inherits="Telligent.Evolution.ControlPanel.Settings.CustomPageManagement" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>

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
        var customPageUrl = '<%= Globals.FullPath(SiteUrls.Instance().UrlData.FormatUrl("settings_ControlPanel_CustomPageManagement", null)) %>'
        window.location = customPageUrl + '?' + result;
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
	                <CP:ModalLink runat="server" ResourceName="CP_Add_Page" Height="320" Width="550" callback="refresh" Url="ConfigureCustomPage.aspx" CssClass="CommonTextButton" />
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
	                    <a href='<%# SiteUrls.Instance().CustomPage(Eval("Name").ToString()) %>'><%# Eval("Title") %></a>
	                </td>
	                <td class="CommonListCellLeftMost">
	                    <a href='<%# SiteUrls.Instance().CustomPage(Eval("Name").ToString()) %>'>/<%# Eval("Name") %>.aspx</a>
	                </td>
	                <td class="CommonListCell">
	                    <CP:ModalLink runat="server" Visible='<%# Eval("ThemeContextID").ToString() != "-2" %>' ResourceName="Rename" Height="320" Width="550" callback="refresh" Url='<%# "ConfigureCustomPage.aspx?PageName=" + Eval("Name").ToString() %>' CssClass="CommonTextButton" />
	                </td>
	                <td class="CommonListCell">
	                    <a href='<%# SiteUrls.Instance().EditFragmentPage(Eval("Name").ToString(), true, -1, false, true, Globals.FullPath(SiteUrls.Instance().UrlData.FormatUrl("settings_ControlPanel_CustomPageManagement", null))) %>' class="CommonTextButton"><TEControl:ResourceControl runat="server" ResourceName="Layout" /></a>
	                </td>
	                <td class="CommonListCell">
	                    <CP:ModalLink runat="server" Visible='<%# Eval("ThemeContextID").ToString() != "-2" %>' ResourceName="Copy" Height="320" Width="550" callback="refresh" Url='<%# "CopyCustomPage.aspx?PageName=" + Eval("Name").ToString() %>' CssClass="CommonTextButton" />
	                </td>
	                <td class="CommonListCell">
	                    <CP:ResourceLinkButton ID="DeleteButton" Visible='<%# Eval("ThemeContextID").ToString() != "-2" %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Name") %>' OnClientClick="return confirmDelete();" CommandName="Delete" runat="server" ResourceName="Delete" CssClass="CommonTextButton" />
	                </td>
	            </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="AltListRow">
	                <td class="CommonListCellLeftMost">
	                    <a href='<%# SiteUrls.Instance().CustomPage(Eval("Name").ToString()) %>'><%# Eval("Title") %></a>
	                </td>
	                <td class="CommonListCellLeftMost">
	                    <a href='<%# SiteUrls.Instance().CustomPage(Eval("Name").ToString()) %>'>/<%# Eval("Name") %>.aspx</a>
	                </td>
	                <td class="CommonListCell">
	                    <CP:ModalLink runat="server" Visible='<%# Eval("ThemeContextID").ToString() != "-2" %>' ResourceName="Rename" Height="320" Width="550" callback="refresh" Url='<%# "ConfigureCustomPage.aspx?PageName=" + Eval("Name").ToString() %>' CssClass="CommonTextButton" />
	                </td>
	                <td class="CommonListCell">
	                    <a href='<%# SiteUrls.Instance().EditFragmentPage(Eval("Name").ToString(), true, false, Globals.FullPath(SiteUrls.Instance().UrlData.FormatUrl("settings_ControlPanel_CustomPageManagement", null))) %>' class="CommonTextButton"><TEControl:ResourceControl runat="server" ResourceName="Layout" /></a>
	                </td>
	                <td class="CommonListCell">
	                    <CP:ModalLink runat="server" Visible='<%# Eval("ThemeContextID").ToString() != "-2" %>' ResourceName="Copy" Height="320" Width="550" callback="refresh" Url='<%# "CopyCustomPage.aspx?PageName=" + Eval("Name").ToString() %>' CssClass="CommonTextButton" />
	                </td>
	                <td class="CommonListCell">
	                    <CP:ResourceLinkButton ID="DeleteButton" Visible='<%# Eval("ThemeContextID").ToString() != "-2" %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Name") %>' OnClientClick="return confirmDelete();" CommandName="Delete" runat="server" ResourceName="Delete" CssClass="CommonTextButton" />
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
                            <CP:ResourceControl runat="server" ResourceName="CP_Settings_CustomPageManagement_NoSearchPages" />
                        </TrueContentTemplate>
                        <FalseContentTemplate>
                            <CP:ResourceControl runat="server" ResourceName="CP_Settings_CustomPageManagement_NoPages" />
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
