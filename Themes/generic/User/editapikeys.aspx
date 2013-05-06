<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>

<script runat="server">
    public void AccessDeniedAction(Control sender, object parameter)
    {
        throw new Telligent.Evolution.Components.CSException(Telligent.Evolution.Components.CSExceptionType.AccessDenied);
    }
</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:ConditionalAction runat="server">
        <Conditions>
            <TEControl:UserPropertyValueComparison runat="server" UseAccessingUser="true" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" />
        </Conditions>
        <Actions><TEControl:CustomAction runat="server" OnCustomEvent="AccessDeniedAction" /></Actions>
    </TEControl:ConditionalAction>
    <TEControl:SiteThemeContentFragmentPage runat="server" PageName="user-editapikeys" />
</asp:Content>