<%@ Page language="c#" Codebehind="DeletePost.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Moderation.DeletePost" MasterPageFile="~/ControlPanel/Masters/ForumModeration.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.Controls" %>
<%@ Import Namespace="Telligent.Evolution.Discussions.Components" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="server" resourcename="CP_Moderation_DeletePost" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="CommonTasks" runat="server" />
	<div class="CommonFormArea">
		<cp:DeletePost runat="server">
		    <SkinTemplate>
                <div class="CommonContentArea">
                    <div class="CommonContent">
	                    <span id="Span1" runat="server">
		                    <h3 class="CommonSubTitle">
			                    <cp:ResourceLabel runat="server" ResourceName="DeletePost_Title" />
		                    </h3>
		                    <cp:PostFlatPreview id="PostPreview" LinkToParent="true" runat="server">
					        <SkinTemplate>
                                <asp:Repeater id="PostRepeater" Runat="server">
                                    <ItemTemplate>
                                        <div class="CommonCommentArea Normal">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td style="width: 140px; text-align: center;" valign="top">
                                                        <div class="CommonCommentUser">
                                                            <div><cp:UserAvatar runat="server" Border="1" PadImage="False" id="Avatar" /></div>
				                                            <div><cp:UserAttribute FormatString="{0}" Attribute="Joined" runat="server" id="JoinedAttribute" /></div>
				                                            <div><cp:UserAttribute FormatString="{0}" Attribute="Location" runat="server" id="LocationAttribute" /></div>
				                                            <div><cp:UserAttribute FormatString="{0}" Attribute="Posts" runat="server" id="PostsAttribute" /></div>
				                                            <div><cp:UserAttribute FormatString="{0}" Attribute="Points" runat="server" id="PointsAttribute" /></div>
				                                            <div><cp:RoleIcons runat="server" id="RoleIcon" EnablePadding="false" /></div>
		                                                </div>
                                                    </td>
                                                    <td style="width: 100%">
                                                        <div class="CommonCommentArrow"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div><div class="r5"></div><div class="r6"></div><div class="r7"></div><div class="r8"></div><div class="r9"></div><div class="r10"></div></div>
                                                        <div class="CommonCommentBubble">
                                                            <div class="CommonCommentBubbleRoundTop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                                                            <div class="CommonCommentContent">   
                                                                <div class="ForumPostTitle" style="width: 100%;">
                                                                    <a runat="server" id="PostAnchor"><asp:Image runat="server" border="0" ImageUrl="~/ControlPanel/images/icon_post_show.gif" style="float: left;" /></a>&nbsp;
                                                                    By: <asp:Literal runat="server" id="Username" /> <br />
				                                                    <div class="CommonMessageDate" style="clear: left;">
    				                                                    <asp:Literal runat="server" id="Emoticon" />
    				                                                    Posted: <%# Formatter.FormatAgoDate (((ForumPost) Container.DataItem).PostDate) %>
				                                                        <div><CP:ForumPostAttachment runat="server" id="PostAttachment" CssClass="ForumPostAttachment" /></div>
				                                                        <div class="ForumPostAttachment"></div>    				                                
    				                                                </div>
    				                                            </div>
				                                                <div class="ForumPostContentText" id="PostViewWrapper" runat="server">
					                                                <cp:TextPost runat="server" id="TextPost">
					                                                    <SkinTemplate>
						                                                    <asp:Literal id="Body" Runat="server" />
                                                                            <asp:Literal id="EditNotes" runat="server" />
                                                                            <asp:Literal id="Signature" Runat="server" />
    				                                                    </SkinTemplate>
					                                                </cp:TextPost>
				                                                </div>
				                                                <ul class="ForumPostStatistics" style="clear: both;">&nbsp;</ul>
                                                                <div class="CommonMessageDate">&nbsp;</div>
                                                            </div>
                                                            <div class="CommonCommentBubbleRoundBottom"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
	                                    </div>
                                    </ItemTemplate>
                                </asp:Repeater>
					        </SkinTemplate>
					        </cp:PostFlatPreview>
	                    </span>

	                    <div class="CommonFormArea">
		                    <asp:Label id="deleteChildrenExplanation" runat="server" />
		                    <div class="CommonFormFieldName">
			                    <cp:ResourceLabel runat="server" ResourceName="DeletePost_DeleteChildren" />
		                    </div>
		                    <div class="CommonFormField">
			                    <cp:YesNoRadioButtonList id="DeleteChildren" runat="server" RepeatDirection="Horizontal" />
			                    <asp:RequiredFieldValidator id="DeleteChildrenValidator" runat="server" Cssclass="CommonValidationWarning" ControlToValidate="DeleteChildren" />
		                    </div>
		                    <div class="CommonFormField">
                                <TEControl:FormLabel LabelForId="SendAuthorDeleteNotification" runat="server" ResourceName="DeletePost_SendAuthorDeleteNotification" />
			                    <asp:CheckBox id="SendAuthorDeleteNotification" runat="server" />
			                </div>
	                    <div>
	                    <br />
	                    <div>
		                    <cp:ResourceLabel runat="server" ResourceName="DeletePost_ReasonText" />
		                    <div class="CommonFormFieldName">
			                    <cp:ResourceLabel runat="server" ResourceName="DeletePost_ReasonTemplate" />
		                    </div>
		                    <div class="CommonFormField">
			                    <cp:templatedropdownlist id="ReasonTemplate" runat="server" type="PostDeleteReason" autopostback="true" />
		                    </div>
		                    <div class="CommonFormFieldName">
			                    <cp:ResourceLabel runat="server" ResourceName="DeletePost_Reason" ID="Resourcelabel1" NAME="Resourcelabel1"/>
		                    </div>
		                    <div>
			                    <asp:textbox id="DeleteReason" runat="server" columns="100" TextMode="MultiLine" rows="12" />
		                    </div>
		                    <div>
			                    <asp:Button id="DeletePost" runat="server" />&nbsp;<asp:Button id="CancelDelete" runat="server" />
			                    <asp:requiredfieldvalidator id="ValidateReason" runat="server" Cssclass="CommonValidationWarning" ControlToValidate="DeleteReason" EnableClientScript="False" />
		                    </div>
	                    </div>
                    </div>
                </div>
		    </SkinTemplate>
		</cp:DeletePost>
	</div>
</asp:Content>