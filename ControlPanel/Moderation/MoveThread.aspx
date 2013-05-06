<%@ Page language="c#" Codebehind="MoveThread.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Moderation.MoveThread" MasterPageFile="~/ControlPanel/Masters/ForumModeration.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="server" resourcename="CP_Moderation_MoveThread" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="CommonTasks" runat="server" />
	<div class="CommonFormArea">
		<cp:ThreadMove runat="server">
		    <SkinTemplate>
		        <table cellPadding="0" cellspacing="0" border="0">
                    <tr> 
	                    <td class="CommonFormFieldName">
		                    <cp:ResourceLabel runat="server" ResourceName="MovePost_Subject"/>
	                    </td>
	                    <td class="CommonFormField">
		                    <asp:Label runat="server" id="Subject" />
	                    </td>
                    </tr>
                    <tr> 
	                    <td class="CommonFormFieldName">
		                    <cp:ResourceLabel runat="server" ResourceName="MovePost_HasReplies"/>
	                    </td>
	                    <td class="CommonFormField">
		                    <asp:Label runat="server" id="HasReplies" />
	                    </td>
                    </tr>
                    <tr> 
	                    <td class="CommonFormFieldName">
		                    <cp:ResourceLabel runat="server" ResourceName="MovePost_PostedBy"/>
	                    </td>
	                    <td class="CommonFormField">
		                    <asp:Label runat="server" id="PostedBy" />
	                    </td>
                    </tr>
                    <tr> 
	                    <td valign="top" class="CommonFormFieldName">
		                    <cp:ResourceLabel runat="server" ResourceName="MovePost_MoveTo"/>
		                    <asp:RequiredFieldValidator runat="server" ErrorMessage="*" Font-Bold="True" ControlToValidate="MoveTo" id="MoveToValidator" EnableClientScript="False" />
	                    </td>
	                    <td class="CommonFormField">
	                        <TEForum:ForumOrGroupLookUpTextBox runat="server" ID="MoveTo" MaximumSelections="1" IncludeGroupsInSuggestions="false" />
	                    </td>
                    </tr>
                    <tr> 
	                    <td colspan="2" class="CommonFormField">
		                    <asp:CheckBox Checked="true" id="SendUserEmail" runat="server" />
	                    </td>
                    </tr>
                    <tr>
	                    <td colspan="2" class="CommonFormField">
		                    <asp:Button id="MovePost" runat="server" /> 
		                    <asp:Button id="CancelMove" runat="server" />
	                    </td>
                    </tr>
                </table>
		    </SkinTemplate>
		</cp:ThreadMove>
	</div>
</asp:Content>