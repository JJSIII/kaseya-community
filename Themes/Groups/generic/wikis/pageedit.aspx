<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="wikis.Master" %>
<%@ Import Namespace="Telligent.Common" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.Wikis.Components" %>
<%@ Import Namespace="Telligent.Evolution.Wikis" %>

<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        CSContext csContext = CSContext.Current;
        var page = csContext.GetCurrent<Telligent.Evolution.Wikis.Components.Page>();
        if (page != null)
        {
            if (!Services.Get<ISecurityService>().For(page).Does(csContext.User).Have(WikiPermission.ModifyPage))
                Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        }
        else if (!Services.Get<ISecurityService>().For(csContext.GetCurrent<Wiki>()).Does(csContext.User).Have(WikiPermission.CreatePage))
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        
        base.OnInit(e);
    }

</script>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:GroupThemeContentFragmentPage runat="server" PageName="wikis-pageedit" />
</asp:Content>