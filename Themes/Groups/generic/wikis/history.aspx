<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="wikis.Master" %>
<%@ Import Namespace="Telligent.Common" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        var context = CSContext.Current;
        var securityService = Services.Get<ISecurityService>();
        var abuseService = Services.Get<Telligent.Evolution.CoreServices.Abuse.Interfaces.IAbuseService>();
        var currentGroup = context.GetCurrent<Telligent.Evolution.Components.Group>();
        var currentWikiPage = context.GetCurrent<Telligent.Evolution.Wikis.Components.Page>();
        var currentUser = context.User;

        if (currentWikiPage != null && currentGroup != null)
        {
            var content = abuseService.GetAbusiveContent(currentWikiPage.ContentID, Telligent.Evolution.Wikis.Components.ContentTypes.WikiPage);
            if (content.IsAbusive && !securityService.For(currentGroup).Does(currentUser).Have(GroupPermission.ReviewAbuseAppeals))
                Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        }

        base.OnInit(e);
    }
</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:GroupThemeContentFragmentPage runat="server" PageName="wikis-history" />
</asp:Content>