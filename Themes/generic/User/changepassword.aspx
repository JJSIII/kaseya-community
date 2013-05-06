<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script runat="server">

	protected override void OnInit(EventArgs e)
	{
		base.OnInit(e);
		CSContext csContext = CSControlUtility.Instance().GetCurrentCSContext(this.Page);
		csContext.AllowTokenRequests(true);

		if (csContext.User.IsAnonymous && !csContext.IsPrivateTokenRequest)
			Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);
	}

</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
	<TEControl:SiteThemeContentFragmentPage runat="server" PageName="user-changepassword" />
</asp:Content>