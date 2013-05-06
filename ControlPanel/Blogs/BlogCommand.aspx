<%@ Page language="c#" Codebehind="BlogCommand.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.BlogCommandPage" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
	<DIV class="CommonContentArea">
		<DIV class="CommonContent">
			<asp:Literal id="CommandMessage" Runat="server"></asp:Literal>
			<P>
				<DIV align="center">
					<asp:Button id="OK_Button" Runat="server" />
					&nbsp;
					<INPUT id="Cancel_Button" onclick="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(false); return false;" type="button" value="Cancel" runat="server" />
				</DIV>
		</DIV>
	</DIV>
</asp:Content>