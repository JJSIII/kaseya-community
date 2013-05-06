<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageThemes.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Settings.ManageThemes" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
    <CP:ResourceControl ResourceName="CP_ManageThemes_Title" runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ManageThemes" />
	<TEControl:JQuery runat="server" />
	<TEControl:JQueryGlow runat="server" />
	<TEControl:JQueryEvolution runat="server" />
	<TEControl:Script runat="server" Src="~/ControlPanel/Settings/tooltip.js" EnableFileDateVersioning="true" />

    <script type="text/javascript">
    // <![CDATA[
    function refresh(shouldRefresh)
    {
        if (shouldRefresh)
            window.location = window.location;
    }
    function imported() {
        alert('<CP:ResourceControl runat="Server" ResourceName="CP_ManageThemes_ImportSuccessful" />');
        refresh(true);
    }
    // ]]>
    </script>
    
    <asp:Label runat="server" ID="LicenseMessage" Enabled="false" ForeColor="Red"><CP:ResourceControl runat="Server" ResourceName="CP_ManageThemes_LicenseNotSupported" /></asp:Label>

	<div class="CommonDescription">
	    <CP:ResourceControl runat="server" ResourceName="CP_ManageThemes_Description" />
	</div>
	<CP:StatusMessage id="StatusMessage" runat="server" />
	<div class="CommonFormArea">
		<div style="margin-bottom: 1em;">
			<div class="FixedWidthContainer">
				<table cellpadding="0" cellspacing="0" border="0" width="60%">
					<tr>
						<td class="CommonFormFieldName">
							<strong>
								<CP:ResourceControl runat="Server" ResourceName="CP_ManageThemes_ThemeType" />
							</strong>
							<br />
							<CP:ResourceControl runat="Server" ResourceName="CP_ManageThemes_ThemeType_Help" />
						</td>
						<td class="CommonFormField">
							<asp:DropDownList runat="server" ID="ThemeTypes" />
						</td>
					</tr>
                    <tr>
						<td class="CommonFormFieldName">
							<strong>
								<CP:ResourceControl runat="Server" ResourceName="CP_ManageThemes_ThemeName" />
							</strong>
							<br />
							<CP:ResourceControl runat="Server" ResourceName="CP_ManageThemes_ThemeName_Help" />
						</td>
						<td class="CommonFormField">
							<TWC:DropDownList runat="server" ID="Themes" ShowHtmlWhenSelected="false" SelectListWidth="440" SelectListHeight="375" />
						</td>
					</tr>
				</table>
			</div>
		</div>
		
        <p class="PanelSaveButton" style="float: left;">
            <CP:ModalLink runat="server" ID="SaveButton" Width="550" Height="400" Callback="refresh" CssClass="CommonTextButton" ResourceName="CP_ManageThemes_Save" ResourceFile="ControlPanelResources.xml" /> 
            <CP:ModalLink runat="server" ID="SaveAsButton" Width="550" Height="400" Callback="refresh" CssClass="CommonTextButton" ResourceName="CP_ManageThemes_SaveAs" ResourceFile="ControlPanelResources.xml" /> 
            <asp:LinkButton runat="server" id="DeleteButton" CssClass="CommonTextButton"><CP:ResourceControl runat="server" ResourceName="CP_ManageThemes_Delete" /></asp:LinkButton>
        </p>
		<p class="PanelSaveButton" style="float: right">
            <a href="http://telligent.com/r.ashx?7M" target="_blank" class="CommonTextButton"><CP:ResourceControl runat="server" ResourceName="CP_ManageThemes_ThemeMarketplace" /></a>
            <a href="http://telligent.com/r.ashx?7O" target="_blank" class="CommonTextButton"><CP:ResourceControl runat="server" ResourceName="CP_ManageThemes_ThemeDocumentation" /></a>
            &nbsp;&nbsp;&nbsp;
			<cp:ModalLink runat="server" id="ImportButton" Width="940" Height="700" Callback="refresh" CssClass="CommonTextButton" />
			<asp:LinkButton runat="server" id="ExportButton" CssClass="CommonTextButton"><CP:ResourceControl runat="server" ResourceName="CP_ManageThemes_Export" /></asp:LinkButton>
		</p>
        <div style="clear: both;"></div>
	</div>

	<script type="text/javascript">
    // <![CDATA[
		jQuery(function ($) {
			$('#<%= SaveButton.ClientID %>').cpToolTip({
				tooltip: '<div class="tooltip-outer"><div class="tooltip"><CP:ResourceControl runat="Server" ResourceName="CP_ManageThemes_Save_ToolTip" /></div></div>'
			});
			$('#<%= SaveAsButton.ClientID %>').cpToolTip({
				tooltip: '<div class="tooltip-outer"><div class="tooltip"><CP:ResourceControl runat="Server" ResourceName="CP_ManageThemes_SaveAs_ToolTip" /></div></div>'
			});
			$('#<%= DeleteButton.ClientID %>').cpToolTip({
				tooltip: '<div class="tooltip-outer"><div class="tooltip"><CP:ResourceControl runat="Server" ResourceName="CP_ManageThemes_Delete_ToolTip" /></div></div>'
			});
			$('#<%= ImportButton.ClientID %>').cpToolTip({
				tooltip: '<div class="tooltip-outer"><div class="tooltip"><CP:ResourceControl runat="Server" ResourceName="CP_ManageThemes_Import_ToolTip" /></div></div>'
			});
			$('#<%= ExportButton.ClientID %>').cpToolTip({
				tooltip: '<div class="tooltip-outer"><div class="tooltip"><CP:ResourceControl runat="Server" ResourceName="CP_ManageThemes_Export_ToolTip" /></div></div>'
			});
		});
    // ]]>
    </script>

</asp:Content>
