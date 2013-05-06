<%@ Page language="c#" Codebehind="MoveThreads.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Moderation.MoveThreads" MasterPageFile="~/ControlPanel/Masters/ForumModeration.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="server" resourcename="CP_Moderation_MoveThreads" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="CommonTasks" runat="server" />
	<div class="CommonFormArea">
		<cp:ThreadsMove runat="server">
		    <SkinTemplate>
		        <table cellPadding="0" cellspacing="0" border="0">
                    <tr>
	                    <td valign="top" class="CommonFormFieldName">
		                    <cp:ResourceLabel runat="server" ResourceName="MovePost_MoveTo" id="Resourcelabel4" NAME="Resourcelabel4"/>
		                    <asp:RequiredFieldValidator runat="server" ErrorMessage="*" Font-Bold="True" ControlToValidate="MoveTo" id="MoveToValidator" EnableClientScript="False" />
	                    </td>
	                    <td class="CommonFormField">
		                    <TEForum:ForumOrGroupLookUpTextBox runat="server" ID="MoveTo" MaximumSelections="1" IncludeGroupsInSuggestions="false" />
	                    </td>
                    </tr>
                    <tr> 
	                    <td colspan="2" class="CommonFormField">
		                    <asp:CheckBox Checked="false" id="SendUserEmail" runat="server" />
	                    </td>
                    </tr>
                    <tr>
	                    <td colspan="2" class="CommonFormField">
		                    <asp:Button id="MovePost" runat="server" /> <asp:Button id="CancelMove" runat="server" />
	                    </td>
                    </tr>
                </table>
		    </SkinTemplate>
		</cp:ThreadsMove>
	</div>
</asp:Content>