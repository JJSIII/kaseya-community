<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>
<script runat="server">
	protected override void OnInit(EventArgs e)
	{
		Telligent.Evolution.Components.CSContext context = Telligent.Evolution.Components.CSContext.Current;
		if (!context.User.IsAnonymous && !string.IsNullOrEmpty(context.ReturnUrl))
		{
			context.Context.Response.Redirect(context.ReturnUrl);
		}
		base.OnInit(e);
	}

</script>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:SiteThemeContentFragmentPage runat="server" PageName="common-login" />
</asp:Content>