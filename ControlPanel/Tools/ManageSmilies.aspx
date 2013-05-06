<%@ Page language="c#" Codebehind="ManageSmilies.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Tools.ManageSmilies" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="Smiley_Title"></cp:resourcecontrol>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
	<cp:controlpanelselectednavigation selectednavitem="CommonTasks" runat="server" id="SelectedNavigation1" />
	<DIV class="CommonDescription">
		<cp:resourcecontrol id="Resourcecontrol1" runat="Server" resourcename="Smiley_SubTitle"></cp:resourcecontrol></DIV>
	<DIV class="FixedWidthContainer">
		<asp:datalist id="SmiliesList" runat="server" height="100%" width="100%">
			<headertemplate>
				<table id="tblManageSmilies" cellspacing="1" cellpadding="3" width="100%"
					border="0">
					<tr>
						<td width="75px">
							<cp:resourcelabel runat="server" resourcename="ID" id="Resourcelabel3" name="Resourcelabel3" /></td>
						<td width="100px">
							<cp:resourcelabel runat="server" resourcename="Smiley_Code" id="Resourcelabel4" name="Resourcelabel4" /></td>
						<td width="100%">
							<cp:resourcelabel runat="server" resourcename="Url" id="Resourcelabel5" name="Resourcelabel5" /></td>
						<td width="100px">
							<cp:resourcelabel runat="server" resourcename="Image" id="Resourcelabel6" name="Resourcelabel6" /></td>
						<td width="100px">
							<cp:resourcelabel runat="server" resourcename="Description" id="Resourcelabel7" name="Resourcelabel7" /></td>
						<td width="140px" nowrap="nowrap">
							<cp:resourcelabel runat="server" resourcename="Actions" id="Resourcelabel8" name="Resourcelabel8" /></td>
					</tr>
			</headertemplate>
			<itemtemplate>
				<tr>
					<td>
						<asp:label runat="server" id="SmileyId" /></td>
					<td>
						<asp:label runat="server" id="SmileyCode" /></td>
					<td>
						<asp:label runat="server" id="SmileyUrl" /></td>
					<td>
						<asp:image runat="server" id="SmileyImage" height="19" width="19" /></td>
					<td>
						<asp:label runat="server" id="SmileyText" /></td>
					<td nowrap="nowrap">
						<asp:LinkButton id="Edit" commandname="Edit" runat="server" CssClass="CommonTextButton"></asp:LinkButton>
						<asp:LinkButton id="Delete" commandname="Delete" runat="server" CssClass="CommonTextButton"></asp:LinkButton>
					</td>
				</tr>
			</itemtemplate>
			<edititemtemplate>
				<tr>
					<td>
						<asp:label runat="server" id="SmileyIdEdit" /></td>
					<td>
						<asp:textbox id="SmileyCodeEdit" runat="server"></asp:textbox></td>
					<td>
						<asp:textbox id="SmileyUrlEdit" runat="server"></asp:textbox></td>
					<td>&nbsp;</td>
					<td>
						<asp:textbox id="SmileyTextEdit" runat="server"></asp:textbox></td>
					<td nowrap="nowrap">
						<asp:LinkButton id="Update" runat="server" commandname="Update" CssClass="CommonTextButton"></asp:LinkButton>
						<asp:LinkButton id="Cancel" runat="server" commandname="Cancel" CssClass="CommonTextButton"></asp:LinkButton>
					</td>
				</tr>
			</edititemtemplate>
			<footertemplate>
				<tr>
					<td>
						<cp:resourcelabel runat="server" resourcename="ID" id="Resourcelabel9" name="Resourcelabel9" /></td>
					<td>
						<asp:textbox runat="server" id="NewSmileyCode"></asp:textbox></td>
					<td>
						<asp:textbox runat="server" id="NewSmileyUrl"></asp:textbox></td>
					<td>&nbsp;</td>
					<td>
						<asp:textbox runat="server" id="NewSmileyText"></asp:textbox></td>
					<td nowrap="nowrap">
						<asp:LinkButton runat="server" id="Create" commandname="Create" CssClass="CommonTextButton"></asp:LinkButton></td>
				</tr>
			</table>
		</footertemplate>
		</asp:datalist></DIV>
</asp:Content>