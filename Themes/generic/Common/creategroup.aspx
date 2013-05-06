<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="master.Master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.Controls" %>

<script runat="server">

    protected static readonly ISecurityService SecurityService = Telligent.Common.Services.Get<ISecurityService>();

    protected override void OnInit(EventArgs e)
    {
        CSContext csContext = CSControlUtility.Instance().GetCurrentCSContext(this.Page);
        var group = CSControlUtility.Instance().GetCurrentGroup(this) ?? Groups.GroupService.GetRootGroup();
        if (!SecurityService.For(group).Does(csContext.User).Have(GroupPermission.CreateGroup))
        {
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        }
        
        base.OnInit(e);
    }
    
</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:SiteThemeContentFragmentPage runat="server" PageName="common-creategroup" />
</asp:Content>