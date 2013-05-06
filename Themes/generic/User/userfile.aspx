<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>
<%@ Import Namespace="Telligent.Common" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        CSContext csContext = CSContext.Current;
        if (!Services.Get<ISecurityService>().For(csContext.GetCurrent<User>()).Does(csContext.User).Have(SitePermission.ReadProfiles))
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        
        base.OnInit(e);
    }

</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:SiteThemeContentFragmentPage runat="server" PageName="user-userfile" />
</asp:Content>