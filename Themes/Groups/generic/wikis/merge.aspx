<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/modal.Master" %>
<%@ Import Namespace="Telligent.Evolution.Wikis.Components"%>
<%@ Import Namespace="Telligent.Evolution.Components"%>

<script runat="server">
	
	void Page_Load(object sender, EventArgs e)
	{
		CSContext cntx = CSContext.Current;

		int revA = cntx.GetIntFromQueryString("revA", -1);
		int revB = cntx.GetIntFromQueryString("revB", -1);

		PageMerger1.RevisionA = revA;
		PageMerger1.RevisionB = revB;
	}
	
</script>

<asp:Content ContentPlaceHolderId="content" runat="Server">

	<TEWiki:PageMerger ID="PageMerger1" TitleTag="h1" TitleCssClass="title" runat="server" />
	
</asp:Content>