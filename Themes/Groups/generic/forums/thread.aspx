<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="forums.Master" %>
<%@ Import Namespace="Telligent.Evolution.Discussions.Controls" %>
<%@ Import Namespace="Telligent.Evolution.Discussions.Components" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script runat="server" type="text/C#">
    protected override void OnInit(EventArgs e)
    {
        Thread thread = ForumControlUtility.Instance().GetCurrentThread(this);
        CSContext csContext = ForumControlUtility.Instance().GetCurrentCSContext(this.Page);
        var currentForum = ForumControlUtility.Instance().GetCurrentForum(this);
        if (thread != null && thread.Forum != null && currentForum != null && (thread.Forum.SectionID != currentForum.SectionID || thread.Forum.SectionID != csContext.GetIntFromQueryString(ForumQueryStringProperties.SectionID, -1)))
        {
            if (Telligent.Common.Services.Get<ISecurityService>().For(thread.Forum).Does(csContext.User).Have(Telligent.Evolution.Discussions.ForumPermission.ReadForum))
                Response.Redirect(ForumUrls.Instance().Thread(thread));
            else
                throw new CSException(CSExceptionType.PostNotFound);
        }
        base.OnInit(e);
    }
</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:GroupThemeContentFragmentPage runat="server" PageName="forums-thread" />
</asp:Content>