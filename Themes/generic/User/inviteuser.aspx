<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script runat="server" type="text/C#">
    protected override void OnInit(EventArgs e)
    {
        CSContext csContext = CSControlUtility.Instance().GetCurrentCSContext(this.Page);
        if (csContext.User.IsAnonymous)
        {
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
            return;
        }
        base.OnInit(e);
    }
</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:SiteThemeContentFragmentPage runat="server" PageName="user-inviteuser" />
</asp:Content>