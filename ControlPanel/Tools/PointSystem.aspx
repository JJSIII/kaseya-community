<%@ Page language="c#" Codebehind="PointSystem.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Settings.PointSystem" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="Admin_SiteSettings_Points"></cp:resourcecontrol>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
	<CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ToolsPoints" />
	<cp:statusmessage id="LicenseMessage" runat="server" />
	<cp:statusmessage id="Status" runat="server" />
	<div class="CommonMessageWarning">
		<cp:resourcecontrol resourcename="CP_Tools_Points_InformationMessage" ResourceFile="ControlPanelResources.xml" runat="server" />
	</div>
	<TWC:TabbedPanes id="EditorTabs" runat="server"
	PanesCssClass="CommonPane"
	TabSetCssClass="CommonPaneTabSet"
	TabCssClasses="CommonPaneTab"
	TabSelectedCssClasses="CommonPaneTabSelected"
	TabHoverCssClasses="CommonPaneTabHover"
	>
	<TWC:TabbedPane runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="Admin_SiteSettings_Points_Tab_General" /></Tab>
		<Content>
				<table border="0" cellspacing="0" cellpadding="2">
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Points_EnablePointSystem" /></strong><br />
							<cp:resourcecontrol resourcename="Admin_SiteSettings_Points_EnablePointSystem_Descr" runat="server" />
						</td>
						<td class="CommonFormField" nowrap="nowrap">
							<cp:yesnoradiobuttonlist id="EnablePointSystem" runat="server" repeatcolumns="2"></cp:yesnoradiobuttonlist>
						</td>
					</tr>
				</table>
		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="Admin_SiteSettings_Points_Tab_FactorValues" /></Tab>
		<Content>
				<cp:resourcecontrol runat="Server" Tag="Div" CssClass="CommonFormSubTitle" resourcename="Admin_SiteSettings_Points_QualityFactors" />
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Points_VerifiedAnswerFactor" /></strong><br />
							<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_Points_VerifiedAnswerFactor_Descr" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="PointsVerifiedAnswerFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PointsVerifiedAnswerFactor"
								id="PointsVerifiedAnswerFactorValidator" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Points_RatingFactor" /></strong><br />
							<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_Points_RatingFactor_Descr" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="PointsRatingFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PointsRatingFactor"
								id="PointsRatingFactorValidator" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Points_FavoritePostFactor" /></strong><br />
							<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_Points_FavoritePostFactor_Descr" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="PointsFavoritePostFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PointsFavoritePostFactor"
								id="PointsFavoritePostFactorValidator" />
						</td>
					</tr>
				</table>

				<cp:resourcecontrol runat="Server" Tag="Div" CssClass="CommonFormSubTitle" resourcename="Admin_SiteSettings_Points_Participation" />
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Points_RaterFactor" /></strong><br />
							<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_Points_RaterFactor_Descr" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="PointsRaterFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PointsRaterFactor"
								id="PointsRaterFactorValidator" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Points_PostFactor" /></strong><br />
							<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_Points_PostFactor_Descr" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="PointsPostFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PointsPostFactor"
								id="PointsPostFactorValidator" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Points_ReplyFactor" /></strong><br />
							<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_Points_ReplyFactor_Descr" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="PointsReplyFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PointsReplyFactor"
								id="PointsReplyFactorValidator" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Points_ReplierFactor" /></strong><br />
							<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_Points_ReplierFactor_Descr" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="PointsReplierFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PointsReplierFactor"
								id="PointsReplierFactorValidator" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Points_DownloadFactor" /></strong><br />
							<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_Points_DownloadFactor_Descr" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="PointsDownloadFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PointsDownloadFactor"
								id="PointsDownloadFactorValidator" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Points_DownloaderFactor" /></strong><br />
							<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_Points_DownloaderFactor_Descr" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="PointsDownloaderFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PointsDownloaderFactor"
								id="PointsDownloaderFactorValidator" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Points_FavoriteUserFactor" /></strong><br />
							<cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_Points_FavoriteUserFactor_Descr" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="PointsFavoriteUserFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="PointsFavoriteUserFactor"
								id="PointsFavoriteUserFactorValidator" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><CP:ResourceControl runat="server" ResourceName="CP_Tools_Points_WikiComments" /></strong><br />
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_Points_WikiComments_Desc" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="WikiCommentsFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="WikiCommentsFactor" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><CP:ResourceControl runat="server" ResourceName="CP_Tools_Points_WikiEdits" /></strong><br />
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_Points_WikiEdits_Desc" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="WikiEditsFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="WikiEditsFactor" />
						</td>
					</tr>
					<tr>
						<td class="CommonFormFieldName">
							<strong><CP:ResourceControl runat="server" ResourceName="CP_Tools_Points_WikiNewPage" /></strong><br />
							<CP:ResourceControl runat="server" ResourceName="CP_Tools_Points_WikiNewPage_Desc" />
						</td>
						<td class="CommonFormField">
							<asp:textbox id="WikiNewPageFactor" runat="server" CssClass="ControlPanelTextInput" maxlength="64"></asp:textbox>
							<asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="WikiNewPageFactor" />
						</td>
					</tr>
				</table>
		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="Admin_SiteSettings_Points_Tab_Calculate" /></Tab>
		<Content>
				<div class="CommonFormFieldName">
					<cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Points_Calculate" />
				</div>
				<div class="CommonFormField">
					<asp:button id="CalculateButton" runat="server" width="80px"></asp:button>
				</div>
		</Content>
	</TWC:TabbedPane>
    <TWC:TabbedPane ID="TabbedPane1" runat="server">
	    <Tab><cp:resourcecontrol ID="Resourcecontrol1" runat="Server" resourcename="CP_ManageRanks_Tab" /></Tab>
	    <Content>
            <div class="PanelSaveButton">
                <input type="button" value='<%= Telligent.Evolution.Components.ResourceManager.GetString("CP_ManageRanks_Add", "ControlPanelResources.xml") %>' onclick="Telligent_Modal.Open('<%= ResolveUrl("~/controlpanel/settings/createupdaterank.aspx") %>', 500, 400, refresh);" />
            </div>

            <asp:Repeater runat="server" ID="RankList">
                <HeaderTemplate>
                    <div class="CommonListArea">
                    <table id="Listing" cellSpacing="0" cellPadding="0" border="0" width="100%">
                        <thead>
	                        <tr>
		                        <th class="CommonListHeaderLeftMost">
		                            &nbsp;
		                        </th>
		                        <th class="CommonListHeader">
			                        <cp:resourcecontrol ID="Resourcecontrol2" runat="server" resourcename="Rank_Name" />
		                        </th>
		                        <th class="CommonListHeader">
			                        <cp:resourcecontrol ID="Resourcecontrol3" runat="server" resourcename="Rank_MinValue" />
		                        </th>
		                        <th class="CommonListHeader">
			                        <cp:resourcecontrol ID="Resourcecontrol4" runat="server" resourcename="Rank_MaxValue" />
		                        </th>
		                        <th class="CommonListHeader">
		                            &nbsp;	
	                            </th>
	                        </tr>
                        </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="CommonListCellLeftMost">
                            <%# string.IsNullOrEmpty(Eval("RankIconUrl").ToString()) ? "&nbsp;" : "<img src=\"" + ResolveUrl(Eval("RankIconUrl").ToString()) + "\" style=\"max-height: 80px; max-width: 60px;\" />" %>
                        </td>
                        <td class="CommonListCell">
                            <a href="javascript: Telligent_Modal.Open('<%= ResolveUrl("~/controlpanel/settings/createupdaterank.aspx") %>?RankID=<%# Eval("RankID") %>', 500, 400, refresh);"><%# Globals.HtmlEncode(Eval("RankName").ToString()) %></a>
                        </td>
                        <td class="CommonListCell">
                            <%# Eval("MinimumValue")%>
                        </td>
                        <td class="CommonListCell">
                            <%# Eval("MaximumValue")%>
                        </td>
                        <td class="CommonListCell">
                            <input type="button" value="Edit" onclick="Telligent_Modal.Open('<%= ResolveUrl("~/controlpanel/settings/createupdaterank.aspx") %>?RankID=<%# Eval("RankID") %>', 500, 400, refresh);" />
                            <input type="button" value="Delete" onclick="Telligent_Modal.Open('<%= ResolveUrl("~/controlpanel/settings/createupdaterank.aspx") %>?delete=1&RankID=<%# Eval("RankID") %>', 500, 400, refresh);" />
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="AltListRow">
                        <td class="CommonListCellLeftMost">
                            <%# string.IsNullOrEmpty(Eval("RankIconUrl").ToString()) ? "&nbsp;" : "<img src=\"" + ResolveUrl(Eval("RankIconUrl").ToString()) + "\" style=\"max-height: 80px; max-width: 60px;\" />" %>
                        </td>
                        <td class="CommonListCell">
                            <a href="javascript: Telligent_Modal.Open('<%= ResolveUrl("~/controlpanel/settings/createupdaterank.aspx") %>?RankID=<%# Eval("RankID") %>', 500, 400, refresh);"><%# Globals.HtmlEncode(Eval("RankName").ToString())%></a>
                        </td>
                        <td class="CommonListCell">
                            <%# Eval("MinimumValue")%>
                        </td>
                        <td class="CommonListCell">
                            <%# Eval("MaximumValue")%>
                        </td>
                        <td class="CommonListCell">
                            <input type="button" value="Edit" onclick="Telligent_Modal.Open('<%= ResolveUrl("~/controlpanel/settings/createupdaterank.aspx") %>?RankID=<%# Eval("RankID") %>', 500, 400, refresh);" />
                            <input type="button" value="Delete" onclick="Telligent_Modal.Open('<%= ResolveUrl("~/controlpanel/settings/createupdaterank.aspx") %>?delete=1&RankID=<%# Eval("RankID") %>', 500, 400, refresh);" />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </table>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </Content>
	</TWC:TabbedPane>
	</TWC:TabbedPanes>
	<div class="PanelSaveButton DetailsFixedWidth">
		<cp:resourcelinkbutton id="SaveButton" runat="server" resourcename="Save" cssclass="CommonTextButton"></cp:resourcelinkbutton>
	</div>
</asp:Content>

