<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script runat="server">

	protected static readonly ISecurityService SecurityService = Telligent.Common.Services.Get<ISecurityService>();
	
    protected override void OnInit(EventArgs e)
    {
    	CSContext csContext = CSContext.Current;
		AccountActivation activation = csContext.SiteSettings.AccountActivation;

		if (!SecurityService.For(Node.Root).Does(csContext.User).Have(SitePermission.ManageMembership))
		{
			if (!csContext.SiteSettings.AllowNewUserRegistration)
				throw new CSException(CSExceptionType.UserAccountRegistrationDisabled);

			if (activation == AccountActivation.InvitationOnly && CSControlUtility.Instance().GetCurrentUserInvitation(this.Page) == null)
			{
				throw new CSException(CSExceptionType.UserAccountRequiresValidInvitation);
			}
		}
        base.OnInit(e);
    }

</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:SiteThemeContentFragmentPage runat="server" PageName="user-createuser" />
</asp:Content>