<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="forums.Master" %>
<%@ Import Namespace="Telligent.Common" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.Discussions.Components" %>
<%@ Import Namespace="Telligent.Evolution.Discussions" %>

<script runat="server">
	protected override void OnInit(EventArgs e)
	{
		CSContext csContext = CSContext.Current;
		var post = csContext.GetCurrent<ForumPost>();
		if (post != null)
		{
			if (!Services.Get<ISecurityService>().For(post).Does(csContext.User).Have(ForumPermission.DeletePost))
				throw new CSException(CSExceptionType.PostDeleteAccessDenied);
		}
		base.OnInit(e);
	}
</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:GroupThemeContentFragmentPage runat="server" PageName="forums-deletepost" />
</asp:Content>