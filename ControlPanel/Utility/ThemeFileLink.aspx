<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemeFileLink.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Utility.ThemeFileLink" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>


<asp:Content ContentPlaceHolderId="bcr" runat="Server">

    <TEControl:Title runat="server" ResourceName="ThemeFileLink_Title" ResourceFile="ControlPanelResources.xml" IncludeSiteName="false" IncludeSectionOrHubName="false" />

	<div class="CommonContentArea">
	    <div class="CommonContent">
            <div class="CommonDescription">
                <CP:ResourceControl ResourceName="ThemeFileLink_Instructions" runat="server" />
            </div>
            <div class="CommonFormArea">
            
                <div class="CommonFormFieldName">
                    <strong><CP:ResourceControl ResourceName="ThemeFileLink_URL" runat="server" /></strong>
                </div>
                <div class="CommonFormField"><asp:TextBox runat="server" ID="Url" onclick="this.select();" oncontextmenu="this.select();" Style="width: 450px;" ReadOnly="true" /></div>
                    
            </div>
	                    
	        <div class="CommonFormArea" style="height: 200px;">
                <div class="CommonFormField PanelSaveButton">
                    <TEControl:ResourceButton runat="server" ID="Close" ResourceName="Close" OnClientClick="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(); return false;" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>