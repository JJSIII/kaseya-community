<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>
<%@ Import Namespace="Telligent.Common" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        CSContext csContext = CSContext.Current;
        if (!Services.Get<ISecurityService>().For(csContext.GetCurrent<User>()).Does(csContext.User).Have(SitePermission.ReadProfiles))
            Globals.RedirectToLoginOrThrowException(CSExceptionType.AccessDenied);

		if (csContext.SiteSettings.EnableUserFileStorage)
		{
			UserFolder currentFolder = csContext.GetCurrent<UserFolder>();
			UserFolder parentFolder = UserFiles.GetParentUserFolder(currentFolder);
			if (parentFolder != null)
			{
				List<UserFolder> folders = UserFiles.GetUserFolders(parentFolder);
				bool exist = false;
				foreach (UserFolder item in folders)
				{
					if (item.Path == currentFolder.Path)
					{
						exist = true;
						break;
					}
				}
				if (!exist)
				{
					WebHelper.Return404(Context);
				}
			}
		}
		
        base.OnInit(e);
    }

</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:SiteThemeContentFragmentPage runat="server" PageName="user-userfilelist" />
</asp:Content>