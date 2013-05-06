<%@ Page language="c#" Codebehind="RenameTag.aspx.cs" AutoEventWireup="false" Inherits="Telligent.EvolutionWeb.ControlPanel.Moderation.RenameTag" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
	<script type="text/javascript">
	// <![CDATA[
	function closeModal()
	{
	    window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(true);
	}
	// ]]>
	</script>
	<div class="CommonContentArea">
		<div class="CommonContent">
		
		<TABLE cellSpacing="0" cellPadding="0" border="0">
		<TR>
			<TD class="CommonFormFieldName">
				<CP:ResourceControl runat="server" ResourceName="CP_Moderation_RenameTag_OldName" />
			</TD>
			<TD class="CommonFormField">
				<asp:Literal runat="server" id="OldName" />
			</TD>
		</TR>
		<TR>
			<TD class="CommonFormFieldName">
				<cp:formlabel runat="Server" resourcename="CP_Moderation_RenameTag_NewName" controltolabel="NewName" />
			</TD>
			<TD class="CommonFormField">
				<asp:textbox id="NewName" runat="Server" style="width: 300px;" cssclass="ControlPanelTextInput" />
				<asp:RequiredFieldValidator Runat="server" ControlToValidate="NewName" Display="Dynamic" Text="*" />
			</TD>
		</TR>
		<TR>
			<TD class="CommonFormFieldName">&nbsp;</TD>
			<TD class="CommonFormField" align="right">
				<cp:ResourceLinkButton id="RenameButton" runat="Server" cssclass="CommonTextButton" resourcename="CP_Rename" />
			</TD>
		</TR>
		</TABLE>

			
		</div>
	</div>
</asp:Content>