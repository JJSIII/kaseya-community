<%@ Page language="c#" Codebehind="ManageOAuthClients.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Settings.ManageOAuthClients" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl id="SectionDescription" runat="server" ResourceName="ManageOAuthClients_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <script type="text/javascript">
    // <![CDATA[
        function confirmDelete() 
        {
            return confirm('<%= ResourceManager.GetString("ManageOAuthClients_List_ConfirmDelete", "ControlPanelResources.xml") %>');
        }
    // ]]>
    </script>

    <cp:controlpanelselectednavigation selectednavitem="ManageOAuthClients" runat="server" />
	<div class="CommonDescription">
        <cp:resourcecontrol runat="server" resourcename="ManageOAuthClients_SubTitle" />
    </div>
    <cp:statusmessage runat="server" id="Status" />

    <table cellpadding="0" cellspacing="0" border="0"  width="100%">
        <tr>
            <td align="left">
            </td>
	        <td align="right">
	            <div class="PanelSaveButton">
                    <a href="ConfigureOAuthClient.aspx" class="CommonTextButton"><CP:ResourceControl runat="server" ResourceName="ManageOAuthClients_AddClient" /></a>
	            </div>
	        </td>
	    </tr>
	</table>

    <div id="clients">
		<CP:RepeaterPlusNone id="ClientList" runat="server" ShowHeaderFooterOnNone="false">
			<headertemplate>
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tr>
					<th class="CommonListHeader"><cp:resourcecontrol runat="Server" resourcename="ManageOAuthClients_List_Name" /></th>
                    <th class="CommonListHeader">ID</th>
					<th class="CommonListHeader" style="width: 1%;"></th>
			        <th class="CommonListHeader" style="width: 1%"></th>								
			        <th class="CommonListHeader" style="width: 1%"></th>
				</tr>
			</headertemplate>
			<itemtemplate>
				<tr>
					<td class="CommonListCellLeftMost">
						<strong><%# Globals.HtmlEncode(Eval("Name").ToString()) %></strong><br />
					</td>
                    <td class="CommonListCellLeftMost">
                        <%# Globals.HtmlEncode(Eval("Id").ToString()) %>
	                </td>
                    <td class="CommonListCell">
                        <a href='<%# "ConfigureOAuthClient.aspx?clientId=" + Eval("Id").ToString() %>' class="CommonTextButton"><CP:ResourceControl runat="server" ResourceName="ManageOAuthClients_List_Configure" /></a>
                    </td>
                    <td class="CommonListCell">
                        <a href='<%# "ConfigureOAuthClient.aspx?viewSecret=1&clientId=" + Eval("Id").ToString()%>' class="CommonTextButton"><CP:ResourceControl runat="server" ResourceName="ManageOAuthClients_List_ViewSecret" /></a>
                    </td>
                    <td class="CommonListCell">
                        <CP:ResourceLinkButton runat="server" ResourceName="ManageOAuthClients_List_Delete" ID="Delete" CssClass="CommonTextButton" CommandArgument='<%# Eval("Id").ToString() %>' OnClientClick="return confirmDelete();" CommandName="Delete" />
                    </td>
				</tr>
			</itemtemplate>
			<AlternatingItemTemplate>
				<tr style="background-color: #f0f0f0;">
					<td class="CommonListCellLeftMost">
						<strong><%# Globals.HtmlEncode(Eval("Name").ToString()) %></strong><br />
					</td>
                    <td class="CommonListCellLeftMost">
                        <%# Globals.HtmlEncode(Eval("Id").ToString())%>
	                </td>
                    <td class="CommonListCell">
                        <a href='<%# "ConfigureOAuthClient.aspx?clientId=" + Eval("Id").ToString() %>' class="CommonTextButton"><CP:ResourceControl runat="server" ResourceName="ManageOAuthClients_List_Configure" /></a>
                    </td>
                    <td class="CommonListCell">
                        <a href='<%# "ConfigureOAuthClient.aspx?viewSecret=1&clientId=" + Eval("Id").ToString()%>' class="CommonTextButton"><CP:ResourceControl runat="server" ResourceName="ManageOAuthClients_List_ViewSecret" /></a>
                    </td>
                    <td class="CommonListCell">
                        <CP:ResourceLinkButton runat="server" ResourceName="ManageOAuthClients_List_Delete" ID="Delete" CssClass="CommonTextButton" CommandArgument='<%# Eval("Id").ToString() %>' OnClientClick="return confirmDelete();" CommandName="Delete" />
                    </td>
				</tr>
			</AlternatingItemTemplate>
            <NoneTemplate>
                <div class="CommonMessageWarning">
                    <CP:ResourceControl runat="server" ResourceName="ManageOAuthClients_NoClients" />
                </div>
            </NoneTemplate>
			<FooterTemplate>
				</table>
			</FooterTemplate>
		</CP:RepeaterPlusNone>
	</div>
</asp:Content>