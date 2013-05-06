<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.Controls" %>

<script runat="server">

    protected static readonly ISecurityService SecurityService = Telligent.Common.Services.Get<ISecurityService>();

    protected override void OnInit(EventArgs e)
    {
        CSContext csContext = CSControlUtility.Instance().GetCurrentCSContext(this.Page);
        if (csContext.User.IsAnonymous)
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        
        var group = CSControlUtility.Instance().GetCurrentGroup(this) ?? Groups.GroupService.GetRootGroup();
        if (!SecurityService.For(group).Does(csContext.User).Have(GroupPermission.ModifyMembership))
        {
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        }
        
        base.OnInit(e);
    }
    
</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:GroupThemeContentFragmentPage runat="server" PageName="contact-requests" />
</asp:Content>