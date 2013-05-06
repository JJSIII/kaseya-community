<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/master.Master" %>

<asp:Content ContentPlaceHolderID="adminbar" runat="server">
    <TEControl:UserThemeContentFragmentPageAdministration runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:UserThemeContentFragmentPage runat="server" IsCustompage="true" />
</asp:Content>