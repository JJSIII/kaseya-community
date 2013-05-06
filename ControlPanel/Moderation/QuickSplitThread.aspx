<%@ Page language="c#" Codebehind="QuickSplitThread.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Moderation.QuickSplitThread" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
	<cp:QuickThreadSplit runat="server">
	    <SkinTemplate>
	        <table cellspacing="0" cellpadding="0" border="0">
                <tr>
	                <td class="CommonFormDescription" colspan="2">
		                <cp:ResourceLabel runat="server" ResourceName="ThreadSplit_Description" />
	                </td>
                </tr>
                <tr> 
	                <td class="CommonFormFieldName">
		                <cp:ResourceLabel runat="server" ResourceName="MovePost_Subject" />
	                </td>
	                <td class="CommonFormField">
		                <asp:TextBox columns="60" runat="server" id="Subject" />
	                </td>
                </tr>
                <tr> 
	                <td class="CommonFormFieldName">
		                <cp:ResourceLabel runat="server" ResourceName="MovePost_HasReplies" />
	                </td>
	                <td class="CommonFormField">
		                <asp:Label runat="server" id="HasReplies" />
	                </td>
                </tr>
                <tr> 
	                <td class="CommonFormFieldName">
		                <cp:ResourceLabel runat="server" ResourceName="MovePost_PostedBy" />
	                </td>
	                <td class="CommonFormField">
		                <asp:Label runat="server" id="PostedBy" />
	                </td>
                </tr>
                <tr> 
	                <td class="CommonFormFieldName" valign="top">
		                <cp:ResourceLabel runat="server" ResourceName="MovePost_Body"/>
	                </td>
	                <td class="CommonFormField">
		                <asp:Label runat="server" id="Body" CssClass="PostBody" />
	                </td>
                </tr>
                <tr> 
	                <td class="CommonFormFieldName" valign="top">
		                <cp:ResourceLabel runat="server" ResourceName="MovePost_MoveTo"/>
		                <asp:RequiredFieldValidator runat="server" ErrorMessage="*" Font-Bold="True" ControlToValidate="MoveTo" id="MoveToValidator" />
	                </td>
	                <td class="CommonFormField">
		                <cp:ForumListBox id="MoveTo" runat="server">
		                    <SkinTemplate>
                                <TWC:Tree runat="server" ID="ForumTree" />
		                    </SkinTemplate>
		                </cp:ForumListBox>
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
    </cp:QuickThreadSplit>
</asp:Content>