<%@ Page language="c#" Codebehind="ManagePluginGroup.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Settings.ManagePluginGroup" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>


<asp:Content ContentPlaceHolderId="bcr" runat="Server">	
	
    <script type = "text/javascript">
        function updateConfigured(r, e)
        {
            if (r === true)
            {
                <%= Page.ClientScript.GetPostBackEventReference(new System.Web.UI.PostBackOptions(Page)) %>
            }
        }
		function onResize() {
			$('#plugins').height($(parent.document).find('iframe').height() - ($.browser.mozilla ? 55 : 85));
		}
		$(function() { onResize(); });
		$(window).resize(onResize);
	</script>

    <div class="CommonContentArea">
	<div class="CommonContent">
	    <div class="CommonFormArea">
            <div class="CommonFormField" id="plugins" style="height: 400px; overflow: auto;">
		        <asp:repeater id="PluginList" runat="server">
			        <headertemplate>
				        <table cellspacing="0" cellpadding="0" border="0" width="100%">
				        <tr>
					        <th class="CommonListHeader" colspan="2"><cp:resourcecontrol runat="Server" resourcename="ManagePlugins_PluginList_Name" /></th>
				        </tr>
			        </headertemplate>
			        <itemtemplate>
				        <tr>
					        <td class="CommonListCell">
						        <strong><asp:literal id="PluginName" runat="Server" /></strong><br />
						        <asp:literal id="PluginDesc" runat="Server" />
                                <asp:literal id="PluginID" runat="Server" visible="false" />
					        </td>
                            <td class="CommonListCell" align="right">
                                &nbsp;<cp:ResourceLinkButton runat="server" ResourceName="ManagePlugins_PluginList_Configure" ID="ConfigurePlugin" cssclass="CommonTextButton" />
                                &nbsp;<CP:ResourceLinkButton runat="server" ResourceName="ManagePlugins_PluginList_ViewGroup" ID="ViewGroup" CssClass="CommonTextButton" />
                            </td>
				        </tr>
			        </itemtemplate>
			        <AlternatingItemTemplate> 
				        <tr style="background-color: #f0f0f0;">
					        <td class="CommonListCell">
						        <strong><asp:literal id="PluginName" runat="Server" /></strong><br />
						        <asp:literal id="PluginDesc" runat="Server" />
                                <asp:literal id="PluginID" runat="Server" visible="false" />
					        </td>
                            <td class="CommonListCell" align="right">
                                &nbsp;<cp:ResourceLinkButton runat="server" ResourceName="ManagePlugins_PluginList_Configure" ID="ConfigurePlugin" cssclass="CommonTextButton" />
                                &nbsp;<CP:ResourceLinkButton runat="server" ResourceName="ManagePlugins_PluginList_ViewGroup" ID="ViewGroup" CssClass="CommonTextButton" />
                            </td>
				        </tr>
			        </AlternatingItemTemplate>
			        <footertemplate>
				        </table>
			        </footertemplate>
		        </asp:repeater>
	        </div>
        </div>
    </div>
	</div>
</asp:Content>