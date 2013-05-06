<%@ Page language="c#" Codebehind="Settings.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.SettingsPage" MasterPageFile="~/ControlPanel/Masters/ControlPanel.master" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"> <span class="pipe">&raquo;</span> Control Panel Dashboard Settings</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
	<DIV class="CommonDescription"><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_Config_ConfigureCPOptions" /></DIV>
	<TABLE cellPadding="4">
		<TR>
			<TD class="CommonFormFieldName">
				<strong><CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_Config_ConfigureCPAutoScale" /></strong><br />
				<CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_Config_ConfigureCPAutoScaleDesc" />
		    </TD>
			<TD class="CommonFormField">
				<CP:YESNORADIOBUTTONLIST id="ynScalePageSize" runat="server"  RepeatColumns="2"></CP:YESNORADIOBUTTONLIST></TD>
		</TR>
		<TR>
			<TD class="CommonFormFieldName">
				<strong><CP:ResourceControl ID="ResourceControl5" runat="server" ResourceName="CP_Config_ConfigureCPEnableGrouping" /></strong><br />
				<CP:ResourceControl ID="ResourceControl4" runat="server" ResourceName="CP_Config_ConfigureCPEnableGroupingDesc" />
			</TD>
			<TD class="CommonFormField">
				<CP:YESNORADIOBUTTONLIST id="ynEnableGrouping" runat="server"  RepeatColumns="2"></CP:YESNORADIOBUTTONLIST></TD>
		</TR>
		<TR>
			<TD class="CommonFormFieldName">
				<strong><CP:ResourceControl ID="ResourceControl6" runat="server" ResourceName="CP_Config_ConfigureCPExpandGrouping" /></strong><br />
				<CP:ResourceControl ID="ResourceControl7" runat="server" ResourceName="CP_Config_ConfigureCPExpandGroupingDesc" />
			</TD>
			<TD class="CommonFormField">
				<CP:YESNORADIOBUTTONLIST id="ynExpandGrouping" runat="server"  RepeatColumns="2"></CP:YESNORADIOBUTTONLIST></TD>
		</TR>
		<TR>
			<TD class="CommonFormFieldName">
				<strong><CP:ResourceControl ID="ResourceControl8" runat="server" ResourceName="CP_Config_ConfigureCPEnableGridSearch" /></strong><br />
				<CP:ResourceControl ID="ResourceControl9" runat="server" ResourceName="CP_Config_ConfigureCPEnableGridSearchDesc" />
			</TD>
			<TD class="CommonFormField">
				<CP:YESNORADIOBUTTONLIST id="ynEnableSearchBox" runat="server"  RepeatColumns="2"></CP:YESNORADIOBUTTONLIST></TD>
		</TR>
		<TR>
			<TD class="CommonFormFieldName">
				<strong><CP:ResourceControl ID="ResourceControl10" runat="server" ResourceName="CP_Config_ConfigureCPGridRunningMode" /></strong><br />
				<CP:ResourceControl ID="ResourceControl11" runat="server" ResourceName="CP_Config_ConfigureCPGridRunningModeDesc" />
			</TD>
			<TD class="CommonFormField">
				<asp:DropDownList id="GridMode" Runat="Server">
				</asp:DropDownList></TD>
		</TR>
		<TR>
			<TD class="CommonFormFieldName">
				<strong><CP:ResourceControl ID="ResourceControl12" runat="server" ResourceName="CP_Config_ConfigureCPShowAdvanced" /></strong><br />
				<CP:ResourceControl ID="ResourceControl13" runat="server" ResourceName="CP_Config_ConfigureCPShowAdvancedDesc" />
				</TD>
			<TD class="CommonFormField">
				<CP:YESNORADIOBUTTONLIST id="ynShowAdvanced" runat="server"  RepeatColumns="2"></CP:YESNORADIOBUTTONLIST></TD>
		</TR>
	</TABLE>
	<DIV class="CommonFormField PanelSaveButton">
		<cp:ResourceLinkButton id="Save" runat="Server" CssClass="CommonTextButton" ResourceName="Save"></cp:ResourceLinkButton></DIV>
</asp:Content>