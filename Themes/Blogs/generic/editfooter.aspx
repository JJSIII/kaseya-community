<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" %>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEBlog:WeblogThemeContentFragmentPage runat="server" IsPlaceHolder="true" />
</asp:Content>
<asp:Content ContentPlaceHolderID="footer" runat="server">
    <TEBlog:WeblogThemeFooterFragments runat="server" EnableAdministrativeOptions="true" />
</asp:Content>