<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:SiteThemeContentFragmentPage runat="server" PageName="common-error-notfound" />
</asp:Content>

<script language="C#" runat="server">

    void Page_Load()
    {
        Page.Response.StatusCode = 404;
    }

</script>