<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="theme.Master" %>

<asp:Content ContentPlaceHolderID="header" runat="server">
    <TEControl:GroupThemeHeaderFragments runat="server" EnableAdministrativeOptions="true" />
</asp:Content>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:GroupThemeContentFragmentPage runat="server" IsPlaceHolder="true" />
</asp:Content>