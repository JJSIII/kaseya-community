<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>

<script runat="server">
    public void AnonymousUserAction(Control sender, object parameter)
    {
		Telligent.Evolution.Components.Globals.RedirectToLoginOrThrowException(Telligent.Evolution.Components.CSExceptionType.AccessDenied);
    }
</script>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:ConditionalAction runat="server">
        <Conditions><TEControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></Conditions>
        <Actions><TEControl:CustomAction runat="server" OnCustomEvent="AnonymousUserAction" /></Actions>
    </TEControl:ConditionalAction>
    
    <TEControl:SiteThemeContentFragmentPage runat="server" PageName="user-edituser" ID="UserEditUserFragment" />
</asp:Content>