<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" %>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:GroupThemeContentFragmentPage runat="server" IsPlaceHolder="true" />
</asp:Content>
<asp:Content ContentPlaceHolderID="footer" runat="server">
    <TEControl:GroupThemeFooterFragments runat="server" EnableAdministrativeOptions="true" />
</asp:Content>