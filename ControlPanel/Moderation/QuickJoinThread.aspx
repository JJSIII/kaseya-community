<%@ Page language="c#" Codebehind="QuickJoinThread.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Moderation.QuickJoinThread" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
	<cp:QuickThreadJoin runat="server">
	    <SkinTemplate>
	        <table cellSpacing="1" cellPadding="3">
                <tr>
                  <td align="left" colspan="2">
                    <table>
                      <tr> 
                        <td align="left" colspan="2">
                          <span><cp:ResourceLabel runat="server" ResourceName="ThreadJoin_Select" /></span>
                        </td>
                      </tr>

                      <tr> 
                        <td align="right">
                          <span><cp:ResourceLabel runat="server" ResourceName="ThreadJoin_ParentID" /></span>
                        </td>
                        <td align="left">
                          <asp:TextBox columns="20" runat="server" id="ParentThreadID" />
                          <asp:RequiredFieldValidator runat="server" ErrorMessage="*" Font-Bold="True" ControlToValidate="ParentThreadID" />
                          <asp:Button id="ValidateParentThread" runat="server" />
                        </td>
                      </tr>

                      <tr> 
                        <td align="left" colspan="2">
                          <asp:Checkbox runat="server" id="ParentThreadIsValid" />
                        </td>
                      </tr>

                      <tr> 
                        <td align="left" colspan="2">
                          &nbsp;
                        </td>
                      </tr>

                      <tr>
                        <td align="left" colspan="2">
                          <asp:HyperLink Target="_blank" runat="server" id="ChildThread" /> <span><cp:ResourceLabel runat="server" ResourceName="ThreadJoin_JoinRelationship" /></span> <asp:HyperLink Target="_blank" runat="server" id="ParentThread" />
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2" valign="top" align="left">
                    <span><asp:CheckBox Checked="true" id="SendUserEmail" runat="server" /></span>
                  </td>
                </tr>
                <tr>
                  <td vAlign="top" colspan="2" nowrap="nowrap" align="right"><asp:LinkButton id="CancelMove" runat="server" CausesValidation="False" /> &nbsp; <asp:LinkButton id="MovePost" runat="server" CausesValidation="false" /></td>
                </tr>
              </table>
	    </SkinTemplate>
	</cp:QuickThreadJoin>
</asp:Content>