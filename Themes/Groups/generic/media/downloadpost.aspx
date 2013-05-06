<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="mediagalleries.Master" %>

<%@ Import Namespace="Telligent.Common" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.MediaGalleries" %>
<%@ Import Namespace="Telligent.Evolution.MediaGalleries.Components" %>

<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        CSContext csContext = CSContext.Current;
        if (!Services.Get<ISecurityService>().For(csContext.GetCurrent<MediaGalleryPost>()).Does(csContext.User).Have(MediaGalleryPermission.DownloadPost))
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        
        base.OnInit(e);
    }

</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:GroupThemeContentFragmentPage runat="server" PageName="media-downloadpost" />
</asp:Content>