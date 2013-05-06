<%@ Page CodeBehind="Views.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.Referrals" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>
<%@ Register TagPrefix="CP" TagName = "ViewsList" Src = "~/ControlPanel/Blogs/ViewsListControl.ascx" %>
<%@ Import Namespace="Telligent.Evolution.Blogs.Components" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server"><asp:literal id="PageTitle" runat="server" /></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Posts" runat="server" id="SelectedNavigation1" />
    <script type="text/javascript" src="../charts/swfobject.js"></script>
	<div class="CommonDescription">
		<cp:resourcelabel id="Resourcelabel1" runat="server" resourcename="CP_Blogs_Referrals_SubTitle"></cp:resourcelabel>
	</div>
    <h3><cp:resourcelabel id="Resourcelabel3" runat="server" resourcename="CP_Blogs_Referrals_Chart"/></h3>
    <div id="linechart">
        <strong><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_ChartError" /></strong>
    </div>

    <script type="text/javascript">
        // <![CDATA[		
        var so = new SWFObject("../charts/amline.swf", "amline", "100%", "200", "8", "#FFFFFF");
        so.addVariable("path", "../charts/");
        so.addVariable("settings_file", encodeURIComponent("../charts/settings_ViewsByDay.xml"));
        so.addVariable("data_file", encodeURIComponent("../charts/charts.ashx?report=ViewsByDay&sid=<%= CSContext.Current.GetIntFromQueryString(WeblogQueryStringProperties.WeblogID, -1) %>&pid=<%= CSContext.Current.GetIntFromQueryString(WeblogQueryStringProperties.PostID, -1) %>&appType=<%= Telligent.Evolution.Components.ApplicationType.Weblog %>"));
        so.addVariable("preloader_color", "#999999");
        so.write("linechart");
        // ]]>
    </script>
	<CP:ViewsList id="ReferalsList1" runat="Server"></CP:ViewsList>
</asp:Content>