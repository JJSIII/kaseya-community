<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>
<%@ Import Namespace="Telligent.Common" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        var context = CSContext.Current;
        var abuseService = Services.Get<Telligent.Evolution.CoreServices.Abuse.Interfaces.IAbuseService>();
        
        var currentUser = context.User;
        if (currentUser == null)
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        var currentContextualAppeal = context.GetCurrent<AbuseAppeal>();
        if (currentContextualAppeal != null)
        {
            var abuseAppeal = abuseService.GetAppeal(currentContextualAppeal.AppealId);
            if (currentUser == null || abuseAppeal == null || currentUser.UserID != abuseAppeal.AuthorUserId)
                Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        }

        base.OnInit(e);
    }    

</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:SiteThemeContentFragmentPage runat="server" PageName="content-abuseappeal" />
</asp:Content>