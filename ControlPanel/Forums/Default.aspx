<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Forums.ForumsHome" MasterPageFile="~/ControlPanel/Masters/ForumAdmin.master" %>
<%@ Import Namespace="Telligent.Evolution.ControlPanel.Controls" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.Discussions.Components" %>
<%@ Import Namespace="Telligent.Evolution.Controls" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Forums" runat="server" />
	
	<table style="width:100%">
        <tr>
            <td style="width:300px; padding:20px" valign="top">
                <div class="CommonListArea">
                   <table width="100%" cellpadding="0">
                   <tr>
                        <td>
                            <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/blog-post.gif" />
                            </div>
                            
                            <strong>
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/forums/SectionEdit.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_Forums_NavBar_ForumCreate" />
	                        </asp:HyperLink>
	                        </strong>
	                    </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/comments.gif" />
                            </div>
                            
                            <strong>
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/forums/Forums.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_Forums_NavBar_Forums" />
	                        </asp:HyperLink>
	                        </strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <div style="float:left; height: 60px; width: 30px; text-align:right; padding-right: 10px;">
                                <img src="../images/icons/control-panel.gif" />
                            </div>
                            
                            <strong>
	                        <asp:HyperLink runat="server" NavigateUrl="~/controlpanel/forums/options/PostOptions.aspx">
	                            <CP:ResourceControl runat="server" ResourceName="CP_Forums_NavBar_PostSettings" />
	                        </asp:HyperLink>
	                        </strong>
                        </td>
                    </table>
                    
                </div>
            </td>
            
            <td valign="top" style="padding-left:20px;">
				<div class="CommonFormDescription"><CP:ResourceControl runat="server" ResourceName="CP_Moderation_Forums" /></div>
                <cp:statusmessage id="status" runat="server" visible="false"></cp:statusmessage>
				<div class="CommonFormArea">
					<div class="CommonListArea">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tbody>
								<cp:ForumGroupView id="forums" runat="server" Mode="Moderator">
									<SkinTemplate>
										<asp:Repeater EnableViewState="false" runat="server" id="forumGroupRepeater">
											<ItemTemplate>
												<tr> 
													<th class="CommonListHeaderLeftMost" style="border-bottom: 3px solid #fff;"><%# DataBinder.Eval(Container.DataItem, "Name") %></td>
													<th class="CommonListHeader" style="border-bottom: 3px solid #fff;"><cp:ResourceLabel runat="server" ResourceName="ForumGroupView_Moderation_Column_PostsToModerate" /></td>
												</tr>
												<cp:ForumRepeater GroupID='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Mode="Moderator" runat="server">
													<ItemTemplate>
														<tr>
															<td class="CommonListCellLeftMost" width="75%" style="padding-bottom: 20px;">
																<div style="padding-left: 15px;">
																	<div style="font-weight: bold;"><%# DataBinder.Eval(Container.DataItem, "Name") %></div>
																	<%# DataBinder.Eval(Container.DataItem, "Description") %><%# ForumFormatter.FormatSubForum( (Forum) Container.DataItem ) %>
																</div>
															</td>
															<td class="CommonListCell" width="25%" style="padding-bottom: 20px;">
																<a href="<%# Globals.GetSiteUrls().ModerateForum( ((Forum) Container.DataItem).SectionID ) %>"><%# string.Format(ResourceManager.GetString("ForumGroupView_Moderation_Count"), DataBinder.Eval(Container.DataItem, "PostsToModerate" )) %></a>
															</td>
														</tr>
													</ItemTemplate>
												</cp:ForumRepeater>
											</ItemTemplate>
										</asp:Repeater>
									</SkinTemplate>
								</cp:ForumGroupView>
							</tbody>
						</table>
					</div>
				</div>
            </td>
        </tr>
    </table>

	
	<div style="float:none; clear: both;"></div>
</asp:Content>