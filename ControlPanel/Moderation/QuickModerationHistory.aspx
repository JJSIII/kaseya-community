<%@ Page Language="C#" Codebehind="QuickModerationHistory.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Moderation.QuickModerationHistory" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
	<cp:PostModerationHistory runat="server">
	    <SkinTemplate>
	        <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 90%">
                <tr>
                    <td>
		                <h4 class="CommonListTitle"><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_Moderation_ModerationHistory" /></h4>
                        <cp:RepeaterPlusNone EnableViewState="false" runat="server" id="AuditHistoryRepeater">
                            <HeaderTemplate>
				                <table cellpadding="0" cellspacing="0" border="0" width="100%">
					                <thead>
                                <tr> 
							                <th class="CommonListHeaderLeftMost"><cp:resourcecontrol runat="server" resourcename="ModerationHistory_Date" /></th>
							                <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="ModerationHistory_Moderator" /></th>
							                <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="ModerationHistory_Action" /></th>
							                <th class="CommonListHeader"><cp:resourcelabel runat="server" resourcename="ModerationHistory_Notes" /></th>
                                </tr>
					                </thead>
					                <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
		                              <tr valign="top">
							                <td class="CommonListCellLeftMost"><asp:Label runat="server" id="ItemDate" />&nbsp;</td>
							                <td class="CommonListCell"><asp:HyperLink runat="server" Id="ItemUsernameLink" />&nbsp;</td>
							                <td class="CommonListCell"><asp:Label runat="server" id="ItemAction" />&nbsp;</td>
							                <td class="CommonListCell"><asp:Label runat="server" id="ItemNotes" />&nbsp;</td>
		                              </tr>            			            			
                            </ItemTemplate>
			                <FooterTemplate>
					                </tbody>
				                </table>
			                </FooterTemplate>
						                <NoneTemplate>
								                  <tr>
							                <td align="center" colspan="4" class="CommonListCellLeftMost"><cp:resourcecontrol runat="server" resourcename="ForumMembers_NoRecords" ID="Resourcecontrol1" NAME="Resourcecontrol1"/></td>
								                  </tr>
						                </NoneTemplate>
                        </cp:RepeaterPlusNone>
                        
					                <table cellpadding="0" cellspacing="0" width="100%">
						                <tr>
							                <td valign="top" align="right">
								                <asp:Panel id="DisplayPager" Runat="server">					
									                <div style="padding-top: 12px; padding-bottom: 12px;">
										                <table cellpadding="0" cellspacing="0">
											                <tr>
												                <td>
													                <table width="100%" cellpadding="2" cellspacing="0">
														                <tr>
															                <td valign="middle" nowrap="nowrap">
																                &nbsp;<cp:CurrentPage id="CurrentPage" runat="server" />
															                </td>
															                <td valign="middle" align="right" nowrap="nowrap">
																                <cp:ForumPager id="Pager" runat="server" />
															                </td>
														                </tr>
													                </table>
												                </td>
											                </tr>
										                </table>
									                </div>
								                </asp:Panel>
							                </td> 
						                </tr>
					                </table>
                    </td>
                </tr>
            </table>            
        </SkinTemplate>
	</cp:PostModerationHistory>
</asp:Content>