<%@ Page language="c#" Codebehind="BlogFeedsForm.aspx.cs" AutoEventWireup="false" Inherits="Telligent.EvolutionWeb.ControlPanel.Blogs.BlogFeedsForm" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
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

<CP:StatusMessage runat="server" id="Status" Visible="false"/>

<TWC:TabbedPanes id="BlogFeedTabs" runat="server"
	PanesCssClass="CommonPane"
	TabSetCssClass="CommonPaneTabSet"
	TabCssClasses="CommonPaneTab"
	TabSelectedCssClasses="CommonPaneTabSelected"
	TabHoverCssClasses="CommonPaneTabHover"
	>
	<TWC:TabbedPane ID="TabbedPane1" runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_Blogs_Feeds_Tab_Basic" /></Tab>
		<Content>

			<div class="CommonFormFieldName">
				<strong><cp:ResourceControl runat="Server" resourcename="CP_Blogs_Feeds_FeedTitle" /></strong><br />
				<cp:ResourceControl runat="server" resourcename="CP_Blogs_Feeds_FeedTitle_Help" />
			</div>
			<div class="CommonFormField">
				<asp:textbox id=FeedTitleTxt runat="Server" style="width: 300px;" cssclass="ControlPanelTextInput" />
				<asp:RequiredFieldValidator id="FeedTitleTxtValidator" Runat="server" ControlToValidate="FeedTitleTxt" Display="Dynamic" Text="*" />
			</div>

			<div class="CommonFormFieldName">
				<strong><cp:ResourceControl runat="Server" resourcename="CP_Blogs_Feeds_FeedUrl" /></strong><br />
				<cp:ResourceControl runat="server" resourcename="CP_Blogs_Feeds_FeedUrl_Help" />
			</div>
			<div class="CommonFormField">
				<asp:textbox id="FeedUrlTxt" runat="Server" style="width: 300px;" cssclass="ControlPanelTextInput" />
				<asp:RequiredFieldValidator id="FeedUrlTxtValidator" Runat="server" ControlToValidate="FeedUrlTxt" Display="Dynamic" Text="*" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="FeedUrlTxt" Display="Dynamic" Text="*" ValidationExpression="^(http|https)\://.*" />
			</div>

			<div class="CommonFormFieldName">
				<strong><cp:ResourceControl  runat="Server" resourcename="CP_Blogs_Feeds_Author" /></strong><br />
				<cp:ResourceControl runat="server" resourcename="CP_Blogs_Feeds_Author_Help" /><br />
				<cp:ResourceControl runat="server" resourcename="CP_Blogs_Feeds_Author_Note" />
			</div>
			<div class="CommonFormField">
				<asp:DropDownList ID="Author" runat="server" />
				
			</div>

		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane ID="SectionPermissions" runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_Blogs_Feeds_Tab_PullPost" /></Tab>
		<Content>
		
			<div class="CommonFormFieldName">
				<strong><cp:ResourceControl runat="Server" resourcename="CP_Blogs_Feeds_FeedInterval" /></strong><br />
				<cp:ResourceControl runat="server" resourcename="CP_Blogs_Feeds_FeedInterval_Help" />
			</div>
			<div class="CommonFormField">
				<asp:textbox id="FeedIntervalTxt" runat="Server" style="width: 50px;" Text="60" cssclass="ControlPanelTextInput" />
				<asp:RegularExpressionValidator ID=rev1 runat="server"
					ControlToValidate="FeedIntervalTxt"
					ValidationExpression="0*[1-9][0-9]*"
					display="dynamic" />
				<asp:RequiredFieldValidator id="FeedIntervalTxtValidator" Runat="server" ControlToValidate="FeedIntervalTxt" Display="Dynamic" Text="*" />
			</div>
			
			<div class="CommonFormFieldName">
				<strong><cp:ResourceControl runat="Server" resourcename="CP_Blogs_Feeds_FeedExcerptSize" /></strong><br />
				<cp:ResourceControl runat="server" resourcename="CP_Blogs_Feeds_FeedExcerptSize_Help" />
			</div>
			<div class="CommonFormField">
				<asp:textbox id="FeedExerptSize" runat="Server" style="width: 50px;" Text="250" cssclass="ControlPanelTextInput" />
				<asp:RegularExpressionValidator ID=rev2 runat="server"
					ControlToValidate="FeedExerptSize"
					ValidationExpression="0*[1-9][0-9]*"
					display="dynamic" />
				<asp:RequiredFieldValidator id="FeedExerptSizeValidator" Runat="server" ControlToValidate="FeedExerptSize" Display="Dynamic" Text="*" />
			</div>
			
			<div class="CommonFormFieldName">
				<strong><cp:ResourceControl runat="Server" resourcename="CP_Blogs_Feeds_FeedShowFullPost" /></strong><br />
				<cp:ResourceControl runat="server" resourcename="CP_Blogs_Feeds_FeedShowFullPost_Help" />
			</div>
			<div class="CommonFormField">
				<asp:checkbox id="checkShowFullPost" runat="Server" cssclass="ControlPanelTextInput" />
			</div>
		</Content>
	</TWC:TabbedPane>
</TWC:TabbedPanes>


<div class="CommonFormField" align="right">
	<cp:ResourceLinkButton id="AddFeedButton" runat="Server" cssclass="CommonTextButton" resourcename="CP_Add" />
</div>

</asp:Content>