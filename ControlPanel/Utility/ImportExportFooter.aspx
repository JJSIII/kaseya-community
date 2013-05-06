<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportExportFooter.aspx.cs" Inherits="Telligent.EvolutionWeb.ControlPanel.Settings.ImportExportFooter" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>


<asp:Content ContentPlaceHolderId="bcr" runat="Server">

    <input type="hidden" id="State" runat="server" />

	<div class="CommonContentArea">
	    <div class="CommonContent">
	        <TWC:TabbedPanes runat="server"
                PanesCssClass="CommonPane"
                TabSetCssClass="CommonPaneTabSet"
                TabCssClasses="CommonPaneTab"
                TabSelectedCssClasses="CommonPaneTabSelected"
                TabHoverCssClasses="CommonPaneTabHover"
                >
                <TWC:TabbedPane runat="server">
	                <Tab><CP:ResourceControl ResourceName="ImportExportPage_Import" runat="server" /></Tab>
	                <Content>    
                        <TEControl:WrappedLiteral Tag="Div" CssClass="CommonMessageError" ID="ErrorMessage" runat="server" />
                        <div class="CommonFormArea">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tr runat="server" id="FileContainer">
                                    <td class="CommonFormFieldName">
                                        <TEControl:ResourceControl runat="server" ResourceName="ImportExportPage_SelectFile" Tag="Strong" />
                                    </td>
                                    <td class="CommonFormField">
                                        <input type="file" runat="server" id="File" />
                                    </td>
                                </tr>
                                <tr runat="server" id="PropertiesContainer">
                                    <td class="CommonFormFieldName">
                                        <TEControl:ResourceControl runat="server" ResourceName="ImportExportPage_SelectScopedPropertiesToImport" Tag="Strong" />
                                        <TEControl:ResourceControl runat="server" ResourceName="ImportExportPage_SelectScopedPropertiesToImport_Description" Tag="Div" />
                                    </td>
                                    <td class="CommonFormField">
                                        <div style="border: solid 1px #ccc; height: 200px; width: 350px; overflow: auto;">
                                            <TEControl:WrappedLiteral runat="server" ID="ScopedProperties" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                                    
                            <div class="CommonFormField PanelSaveButton">
	                            <TEControl:ResourceButton ID="Import" runat="server" ResourceName="ImportExportPage_Import" />
                            </div>  
                        </div>
	                </Content>
	            </TWC:TabbedPane>
	            <TWC:TabbedPane runat="server">
	                <Tab><CP:ResourceControl ResourceName="ImportExportPage_Export" runat="server" /></Tab>
	                <Content>
                        <div class="CommonFormArea">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tr>
                                    <td class="CommonFormFieldName">
                                        <TEControl:ResourceControl runat="server" ResourceName="ImportExportPage_DownloadFile" Tag="Strong" />
                                    </td>
                                    <td class="CommonFormField">
                                        <TEControl:ResourceButton ID="Export" runat="server" ResourceName="ImportExportPage_Export" />
                                    </td>
                                </tr>
                            </table>
                        </div>
	                </Content>
	            </TWC:TabbedPane>
	        </TWC:TabbedPanes>
        </div>
    </div>
</asp:Content>