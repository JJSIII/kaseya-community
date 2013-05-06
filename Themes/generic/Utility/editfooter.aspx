<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:SiteThemeContentFragmentPage runat="server" IsPlaceHolder="true" />
</asp:Content>
<asp:Content ContentPlaceHolderID="footer" runat="server">
    <TEControl:SiteThemeFooterFragments runat="server" EnableAdministrativeOptions="true" />
</asp:Content>