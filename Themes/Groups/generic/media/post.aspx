<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="mediagalleries.Master" %>
<%@ Import Namespace="Telligent.Evolution.MediaGalleries.Controls" %>
<%@ Import Namespace="Telligent.Evolution.MediaGalleries.Components" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script runat="server" type="text/C#">
    protected override void OnInit(EventArgs e)
    {
        MediaGalleryPost post = MediaGalleryControlUtility.Instance().GetCurrentMediaGalleryPost(this);
        
        if (post != null && (post.SectionID != MediaGalleryControlUtility.Instance().GetCurrentMediaGallery(this).SectionID || post.Section.ApplicationKey != Request.QueryString[MediaGalleryQueryStringProperties.ApplicationKey]))
            Response.Redirect(MediaGalleryUrls.Instance().ViewMediaGalleryPost(post));
        base.OnInit(e);
    }
</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:GroupThemeContentFragmentPage runat="server" PageName="media-post" />
</asp:Content>