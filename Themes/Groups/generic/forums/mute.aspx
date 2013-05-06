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
            Response.Redirect(ForumUrls.Instance().Thread(thread));
        base.OnInit(e);
    }
</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:GroupThemeContentFragmentPage runat="server" PageName="forums-mute" />
</asp:Content>