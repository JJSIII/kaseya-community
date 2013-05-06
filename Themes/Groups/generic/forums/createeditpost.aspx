<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="forums.Master" %>
<%@ Import Namespace="Telligent.Common" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.Discussions.Components" %>
<%@ Import Namespace="Telligent.Evolution.Discussions" %>

<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        CSContext csContext = CSContext.Current;
        var post = csContext.GetCurrent<ForumPost>() ?? csContext.GetCurrent<Thread>();
        var parentPost = ((ForumsContext)csContext.ApplicationContexts[ApplicationType.Forum]).CurrentParentForumPost;
        if (post != null)
        {
            if (!Services.Get<ISecurityService>().For(post).Does(csContext.User).Have(ForumPermission.ModifyPost))
                Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        }
        else if (parentPost != null)
        {
            if (!Services.Get<ISecurityService>().For(parentPost).Does(csContext.User).Have(ForumPermission.CreateReply))
                Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        }
        else if (!Services.Get<ISecurityService>().For(csContext.GetCurrent<Forum>()).Does(csContext.User).Have(ForumPermission.CreatePost))
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
        
        base.OnInit(e);
    }

</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:GroupThemeContentFragmentPage runat="server" PageName="forums-createeditpost" />
</asp:Content>