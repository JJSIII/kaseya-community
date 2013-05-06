<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" CodeBehind="AddUpdateThemeFile.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Utility.AddUpdateThemeFile" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>


<asp:Content ContentPlaceHolderId="bcr" runat="Server">

    <TEControl:Title runat="server" ResourceName="AddUpdateThemeFile_Title" ResourceFile="ControlPanelResources.xml" IncludeSiteName="false" IncludeSectionOrHubName="false" />

	<div class="CommonContentArea">
	    <div class="CommonContent">
            <div class="CommonDescription">
                <CP:ResourceControl ResourceName="AddUpdateThemeFile_Instructions" runat="server" />
            </div>
            <div class="CommonFormArea">
            
                <TEControl:WrappedLiteral runat="server" ID="ErrorMessage" Tag="Div" CssClass="CommonMessageError" />
            
                <div class="CommonFormFieldName">
                    <strong><CP:ResourceControl ResourceName="AddUpdateThemeFile_File" runat="server" /></strong>
                </div>
                <div class="CommonFormField"><input type="file" runat="server" id="File" /></div>
                    
            </div>
	                    
	        <div class="CommonFormArea" style="height: 200px;">
                <div class="CommonFormField PanelSaveButton">
                    <TEControl:ResourceButton runat="server" ID="Save" ResourceName="Save" OnClick="Save_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>