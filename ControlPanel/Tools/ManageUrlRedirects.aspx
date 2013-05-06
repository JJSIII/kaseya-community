<%@ Page language="c#" Codebehind="ManageUrlRedirects.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Tools.ManageUrlRedirects" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="UrlRedirects_Title"></cp:resourcecontrol>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
	<CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ToolsRedirects" />
	<DIV class="CommonDescription">
		<cp:resourcecontrol id="Resourcecontrol1" runat="Server" resourcename="UrlRedirects_SubTitle"></cp:resourcecontrol></DIV>
	<asp:datalist id="ManageRedirects" runat="server" width="100%">
		<headertemplate>
			<table id="tblManageUrlRedirects" cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr>
					<td class="CommonListHeaderLeftMost">
						<cp:resourcelabel runat="server" resourcename="UrlRedirect_ID" id="Resourcelabel2" />
					</td>
					<td class="CommonListHeader">
						<cp:resourcelabel runat="server" resourcename="UrlRedirect_Url" id="Resourcelabel3" />
					</td>
					<td class="CommonListHeader">
						<cp:resourcelabel runat="server" resourcename="UrlRedirect_Description" id="Resourcelabel4" />
					</td>
					<td class="CommonListHeader">
						<cp:resourcelabel runat="server" resourcename="UrlRedirect_Impressions" id="Resourcelabel1" />
					</td>
					<td class="CommonListHeader" nowrap="nowrap">
						<cp:resourcelabel runat="server" resourcename="Actions" id="Resourcelabel5" />
					</td>
				</tr>
		</headertemplate>
		<itemtemplate>
			<tr>
				<td class="CommonListCellLeftMost">
					<asp:label runat="server" id="ID" />
				</td>
				<td class="CommonListCell">
					<asp:label runat="server" id="Url" />
				</td>
				<td class="CommonListCell">
					<asp:label runat="server" id="Description" />
				</td>
				<td class="CommonListCell">
					<asp:label runat="server" id="Impressions" />
				</td>
				<td class="CommonListCell" nowrap="nowrap">
					<asp:Hyperlink id="ViewUrlRedirect" runat="server" cssclass="CommonTextButton" />
					<asp:LinkButton id="EditUrlRedirect" commandname="Edit" runat="server" CssClass="CommonTextButton"></asp:LinkButton>
					<asp:LinkButton id="DeleteUrlRedirect" commandname="Delete" runat="server" CssClass="CommonTextButton" OnClientClick="return confirm('Are you sure you want to delete this redirect?');"></asp:LinkButton>
				</td>
			</tr>
		</itemtemplate>
		<AlternatingItemTemplate>
		    <tr class="AltListRow">
				<td class="CommonListCellLeftMost">
					<asp:label runat="server" id="ID" />
				</td>
				<td class="CommonListCell">
					<asp:label runat="server" id="Url" />
				</td>
				<td class="CommonListCell">
					<asp:label runat="server" id="Description" />
				</td>
				<td class="CommonListCell">
					<asp:label runat="server" id="Impressions" />
				</td>
				<td class="CommonListCell" nowrap="nowrap">
					<asp:Hyperlink id="ViewUrlRedirect" runat="server" cssclass="CommonTextButton" />
					<asp:LinkButton id="EditUrlRedirect" commandname="Edit" runat="server" CssClass="CommonTextButton"></asp:LinkButton>
					<asp:LinkButton id="DeleteUrlRedirect" commandname="Delete" runat="server" CssClass="CommonTextButton" OnClientClick="return confirm('Are you sure you want to delete this redirect?');"></asp:LinkButton>
				</td>
			</tr>
		</AlternatingItemTemplate>
		<edititemtemplate>
			<tr>
				<td class="CommonListCellLeftMost">
					<asp:label runat="server" id="ID" />
				</td>
				<td class="CommonListCell">
					<asp:textbox id="UrlRedirectUrl" size="40" runat="server"></asp:textbox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="UrlRedirectUrl" ErrorMessage="*" ValidationGroup="EditValidationGroup" />
				</td>
				<td class="CommonListCell">
					<asp:textbox id="UrlRedirectDescription" size="35" runat="server"></asp:textbox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="UrlRedirectDescription" ErrorMessage="*" ValidationGroup="EditValidationGroup" />
				</td>
				<td class="CommonListCell">
					<asp:label runat="server" id="Impressions" />
				</td>
				<td class="CommonListCell">
					<asp:LinkButton id="UpdateUrlRedirect" runat="server" commandname="Update" CssClass="CommonTextButton" ValidationGroup="EditValidationGroup"></asp:LinkButton>
					<asp:LinkButton id="CancelUrlRedirect" runat="server" commandname="Cancel" CssClass="CommonTextButton"></asp:LinkButton>
				</td>
			</tr>
		</edititemtemplate>
		<footertemplate>
				<tr>
				<td class="CommonListCellLeftMost">
					&nbsp;
				</td>
				<td class="CommonListCell">
					<asp:textbox runat="server" size="40" id="NewUrlRedirectUrl"></asp:textbox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="NewUrlRedirectUrl" ErrorMessage="*" ValidationGroup="CreateValidationGroup" />
				</td>
				<td class="CommonListCell">
					<asp:textbox runat="server" size="35" id="NewUrlRedirectDescription"></asp:textbox>
					<asp:RequiredFieldValidator runat="server" ControlToValidate="NewUrlRedirectDescription" ErrorMessage="*" ValidationGroup="CreateValidationGroup" />
				</td>
				<td class="CommonListCell">
					&nbsp;
				</td>
				<td class="CommonListCell">
					<asp:LinkButton id="CreateUrlRedirect" commandname="Create" runat="server" CssClass="CommonTextButton" ValidationGroup="CreateValidationGroup" />
				</td>
			</tr>
			</table>
		</footertemplate>
	</asp:datalist>
</asp:Content>

