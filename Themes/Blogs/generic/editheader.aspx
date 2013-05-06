<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" %>

<asp:Content ContentPlaceHolderID="header" runat="server">
    <TEBlog:WeblogThemeHeaderFragments runat="server" EnableAdministrativeOptions="true" />
</asp:Content>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEBlog:WeblogThemeContentFragmentPage runat="server" IsPlaceHolder="true" />
</asp:Content>