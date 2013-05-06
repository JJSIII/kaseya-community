<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="mediagalleries.Master" %>
<%@ Import Namespace="Telligent.Common" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.MediaGalleries.Components" %>
<%@ Import Namespace="Telligent.Evolution.MediaGalleries" %>

<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        CSContext csContext = CSContext.Current;
        var post = csContext.GetCurrent<MediaGalleryPost>();
        if (post != null)
        {
            if (!Services.Get<ISecurityService>().For(post).Does(csContext.User).Have(MediaGalleryPermission.ModifyPost))
                Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        }
        else if (!Services.Get<ISecurityService>().For(csContext.GetCurrent<MediaGallery>()).Does(csContext.User).Have(MediaGalleryPermission.CreatePost))
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        
        base.OnInit(e);
    }

</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:GroupThemeContentFragmentPage runat="server" PageName="media-createeditpost" />
</asp:Content>