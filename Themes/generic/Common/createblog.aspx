<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="master.Master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.Blogs.Components" %>
<%@ Import Namespace="Telligent.Evolution.Blogs.Controls" %>

<script runat="server">

    protected static readonly ISecurityService SecurityService = Telligent.Common.Services.Get<ISecurityService>();

    protected override void OnInit(EventArgs e)
    {
        CSContext csContext = WeblogControlUtility.Instance().GetCurrentCSContext(this.Page);
        var group = WeblogControlUtility.Instance().GetCurrentGroup(this) ?? Groups.GroupService.GetRootGroup();
        var defaultGroup = Groups.GroupService.GetGroup(WeblogConfiguration.Instance().DefaultGroupID);
        if (!SecurityService.For(group).Does(csContext.User).Have(GroupPermission.CreateBlog) && !SecurityService.For(defaultGroup).Does(csContext.User).Have(GroupPermission.CreateBlog))
        {
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        }
        
        base.OnInit(e);
    }
    
</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:SiteThemeContentFragmentPage runat="server" PageName="common-createblog" />
</asp:Content>