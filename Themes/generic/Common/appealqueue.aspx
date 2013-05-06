<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>
<%@ Import Namespace="Telligent.Common" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script runat="server">

    protected static readonly ISecurityService SecurityService = Telligent.Common.Services.Get<ISecurityService>();
    protected static readonly IContextService ContextService = Telligent.Common.Services.Get<IContextService>();

    protected override void OnInit(EventArgs e)
    {
        var context = ContextService.GetExecutionContext();

        var rawGroupId = Request.QueryString["ContainerId"];
        Guid? groupId = !String.IsNullOrEmpty(rawGroupId) ? Guid.Parse(rawGroupId) : (Guid?)null;

        var group = groupId == null ?
            context.GetCurrent<Telligent.Evolution.Components.Group>() :
            Telligent.Evolution.Components.Groups.GroupService.GetGroup(groupId.Value);

        if (!SecurityService.For(group).Does(context.User).Have(GroupPermission.ReviewAbuseAppeals))
        {
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        }
        
        base.OnInit(e);
    }
    
</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:SiteThemeContentFragmentPage runat="server" PageName="content-appealqueue" />
</asp:Content>