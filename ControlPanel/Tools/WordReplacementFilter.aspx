<%@ Page language="c#" Codebehind="WordReplacementFilter.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Tools.WordReplacementFilter" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" EnableViewState="false" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="CP_ContentFilter_Title"></cp:resourcecontrol>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ToolsContentFiltersWordReplacement" />
    <div class="CommonDescription">
        <CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_ContentFilter_Description" />
    </div>
		<CP:StatusMessage runat="server" id="Status" />        

            <div class="CommonFormDescription">
	            <cp:resourcecontrol ID="Resourcecontrol1" runat="server" resourcename="CP_ContentFilter_BadWordsDescription" />
            </div>
            <div class="CommonFormFieldName">
	            <strong><CP:ResourceControl ID="ResourceControl4" runat="server" ResourceName="CP_ContentFilter_BadWords_Directions" /></strong>
	        </div>
	        <div class="CommonFormField">
	            <asp:Textbox id="BadwordFilter" TextMode="Multiline" Width="400px" Height="200px" runat="server" />
	        </div>
	        <div class="CommonFormField">
	            <asp:Button id="SaveBadwordFilter" runat="server"  />
	        </div>
</asp:Content>
