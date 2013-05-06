<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SectionEditControl.ascx.cs" Inherits="Telligent.Evolution.ControlPanel.BlogAdmin.SectionEditControl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="CP" TagName = "SectionDetails" Src = "~/ControlPanel/BlogAdmin/SectionEditDetailsControl.ascx" %>
<%@ Register TagPrefix="CP" TagName="AppRoles" Src="~/ControlPanel/GroupAdmin/AppRoles.ascx" %>

<TWC:TabbedPanes id="SettingTabs" runat="server"
	PanesCssClass="CommonPane"
	TabSetCssClass="CommonPaneTabSet"
	TabCssClasses="CommonPaneTab"
	TabSelectedCssClasses="CommonPaneTabSelected"
	TabHoverCssClasses="CommonPaneTabHover"
	>
	<TWC:TabbedPane runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_SectionEdit_Tab_Settings" /></Tab>
		<Content>
			<CP:SectionDetails id="SectionDetails1" runat="Server"></CP:SectionDetails>
		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane ID="SectionPermissions" runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_SectionEdit_Tab_Permissions" /></Tab>
		<Content>
		    <CP:AppRoles id="AppRoles" runat="server" />
		</Content>
	</TWC:TabbedPane>
	<TWC:TabbedPane id="MailingListTab" runat="server">
		<Tab><CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_SectionEdit_Tab_BlogByEmail" /></Tab>
		<Content>
		    <table cellspacing="0" cellpadding="2" border="0">
		    <tr>
			    <td class="CommonFormFieldName">
				    <strong><cp:resourcelabel id="Resourcelabel9" runat="server" resourcename="CP_BlogAdmin_SectionEdit_LE_EnableMailingList" /></strong><br />
				    <cp:ResourceControl runat="Server" resourcename="CP_BlogAdmin_SectionEdit_LE_EnableMailingList_Detail" /></td>
			    <td class="CommonFormField">
				    <cp:yesnoradiobuttonlist id="LEEnableMailingList" runat="server"  repeatcolumns="2"></cp:yesnoradiobuttonlist>
			    </td>
		    </tr>
		    </table>
		</Content>
	</TWC:TabbedPane>
</TWC:TabbedPanes>
