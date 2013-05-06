<%@ Page language="c#" AutoEventWireup="true" EnableViewState="false" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<script language="C#" runat="server">
void Page_Load(object sender, EventArgs e)
{
	string msg = this.Request.QueryString["msg"];
    if (!string.IsNullOrEmpty(msg))
        this.message.Text = HttpUtility.UrlDecode(HttpUtility.HtmlEncode(msg));
    else
        this.message.Text = Telligent.Evolution.Components.ResourceManager.GetString("CP_LoadingWithEllipse", "ControlPanelResources.xml");
    
}
</script>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
    <div class="CommonContentArea">
	    <div class="CommonContent">
		    <table cellspacing="0" cellpadding="4" border="0">
		    <tr>
			    <td><img src="<%=SiteUrls.Instance().LoadingImageUrl %>" width="16" height="16" border="0"></td>
			    <td><asp:literal id="message" runat="server" /></td>
		    </tr>
		    </table>
	    </div>
    </div>
</asp:Content>