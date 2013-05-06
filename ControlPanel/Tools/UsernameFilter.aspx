<%@ Page language="c#" Codebehind="UsernameFilter.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Tools.UsernameFilter" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="CP_ContentFilter_Title"></cp:resourcecontrol>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ToolsContentFiltersUsername" />
    <div class="CommonDescription">
        <CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_ContentFilter_Description" />
    </div>
		<CP:StatusMessage runat="server" id="Status" />        

	    <div class="CommonFormDescription">
	        <cp:resourcecontrol runat="server" resourcename="CP_ContentFilter_UsernameDescription" /></strong>
        </div>
        <div class="CommonFormFieldName">
	        <strong><CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="CP_ContentFilter_Username_Directions" /></strong>
	    </div>
	    <div class="CommonFormField">
	        <asp:Textbox id="Usernames" TextMode="Multiline" Width="400px" Height="200px" runat="server" />
        </div>
        <div class="CommonFormField">
            <asp:Button id="SaveUsernameFilter" runat="server" />
	    </div>
	    
</asp:Content>
