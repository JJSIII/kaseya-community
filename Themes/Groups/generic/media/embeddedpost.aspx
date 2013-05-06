<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" %>

<script language="C#" runat="server">
	void Page_Load()
	{
		Telligent.Evolution.Components.JavaScript.RenderAsJavaScript(this.Context);
        
        int v;

        if (!string.IsNullOrEmpty(Request.QueryString["width"]) && int.TryParse(Request.QueryString["width"], out v))
            PostViewer.Width = v;

        if (!string.IsNullOrEmpty(Request.QueryString["height"]) && int.TryParse(Request.QueryString["height"], out v))
            PostViewer.Height = v;
	}
</script>

<TEMedia:MediaGalleryPostViewer runat="server" ViewType="View" Width="400" Height="300" ID="PostViewer" />