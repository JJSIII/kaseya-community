<%@ Page language="c#" Codebehind="ManagePlugins.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Settings.ManagePlugins" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl id="SectionDescription" runat="server" ResourceName="ManagePlugins_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">	
    <cp:controlpanelselectednavigation selectednavitem="ManagePlugins" runat="server" />
	<div class="CommonDescription">
        <cp:resourcecontrol runat="server" resourcename="ManagePlugins_SubTitle" />
    </div>

    <script type = "text/javascript">
        function checkAll(cb, parent)
        {
            var inputs = $('#' + parent).find("input[type='checkbox']");
            if($(cb).is(':checked')) {
                inputs.attr('checked', 'checked');
            } else {
                inputs.removeAttr('checked');
            }
        }

        function updateConfigured(r, e)
        {
            if (r === true)
            {
                <%= Page.ClientScript.GetPostBackEventReference(new System.Web.UI.PostBackOptions(Page)) %>
            }
        }
	</script>

    <cp:statusmessage runat="server" id="Status" />

    <div class="CommonFormField" id="plugins">
		<asp:repeater id="PluginList" runat="server">
			<headertemplate>
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tr>
					<th class="CommonListHeaderLeftMost"><input type="checkbox" name="master" id="master" onclick="checkAll(this,'plugins');" /></th>
					<th class="CommonListHeader" colspan="2"><cp:resourcecontrol runat="Server" resourcename="ManagePlugins_PluginList_Name" /></th>
				</tr>
			</headertemplate>
			<itemtemplate>
				<tr>
					<td class="CommonListCellLeftMost"><asp:checkbox id="PluginEnabled" value runat="Server" /><asp:literal id="PluginID" runat="Server" visible="false" /></td>
					<td class="CommonListCell">
						<strong><asp:literal id="PluginName" runat="Server" /></strong><br />
						<asp:literal id="PluginDesc" runat="Server" />
					</td>
                    <td class="CommonListCell" align="right">
                        &nbsp;<cp:ResourceLinkButton runat="server" ResourceName="ManagePlugins_PluginList_Configure" ID="ConfigurePlugin" cssclass="CommonTextButton" />
                        &nbsp;<CP:ResourceLinkButton runat="server" ResourceName="ManagePlugins_PluginList_ViewGroup" ID="ViewGroup" CssClass="CommonTextButton" />
                    </td>
				</tr>
			</itemtemplate>
			<AlternatingItemTemplate> 
				<tr style="background-color: #f0f0f0;">
					<td class="CommonListCellLeftMost"><asp:checkbox id="PluginEnabled" value runat="Server" /><asp:literal id="PluginID" runat="Server" visible="false" /></td>
					<td class="CommonListCell">
						<strong><asp:literal id="PluginName" runat="Server" /></strong><br />
						<asp:literal id="PluginDesc" runat="Server" />
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

	<div class="PanelSaveButton">
        <div style="float: left;">
            <cp:ResourceButton ID="ExportResources" runat="server" resourceName="ManagePlugins_ExportResources" />
            <CP:ResourceButton ID="ImportResources" runat="server" ResourceName="ManagePlugins_ImportResources" />
        </div>
	    <cp:resourcebutton id="SaveButton" runat="server" resourcename="Save" />
	</div>

</asp:Content>