<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportExportBlogPage.aspx.cs" Inherits="Telligent.EvolutionWeb.ControlPanel.Settings.ImportExportBlogPage" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>


<asp:Content ContentPlaceHolderId="bcr" runat="Server">

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
	                    <TEBlog:ImportWeblogThemeContentFragmentPageForm runat="server" FileHtmlInputFileId="File" ImportButtonId="Import" MessageTextId="Message" ScopedPropertyTextId="ScopedProperties">
                            <SuccessActions><TEControl:RefreshPageAction WindowNameScript="window.parent.Telligent_Modal.GetWindowOpener(window)" runat="server" /></SuccessActions>
                            <FormTemplate>
                                <TEControl:WrappedLiteral Tag="Div" CssClass="CommonMessageError" ID="Message" runat="server" />
                                <div class="CommonFormArea">
                                    <TEControl:PlaceHolder runat="server">
                                        <DisplayConditions><TEControl:ControlVisibilityCondition runat="server" ControlId="File" ControlVisibilityEquals="true" /></DisplayConditions>
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                <tr>
                                                    <td class="CommonFormFieldName">
                                                        <TEControl:ResourceControl runat="server" ResourceName="ImportExportPage_SelectFile" Tag="Strong" />
                                                    </td>
                                                    <td class="CommonFormField">
                                                        <input type="file" runat="server" id="File" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </TEControl:PlaceHolder>

                                    <TEControl:PlaceHolder runat="server">
                                        <DisplayConditions><TEControl:ControlVisibilityCondition runat="server" ControlId="ScopedProperties" ControlVisibilityEquals="true" /></DisplayConditions>
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                <tr>
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
                                        </ContentTemplate>
                                    </TEControl:PlaceHolder>
                                    
                                    <div class="CommonFormField PanelSaveButton">
	                                    <TEControl:ResourceButton ID="Import" runat="server" ResourceName="ImportExportPage_Import" />
                                    </div>  
                                </div>
                            </FormTemplate>
                        </TEBlog:ImportWeblogThemeContentFragmentPageForm>
	                </Content>
	            </TWC:TabbedPane>
	            <TWC:TabbedPane runat="server">
	                <Tab><CP:ResourceControl ResourceName="ImportExportPage_Export" runat="server" /></Tab>
	                <Content>
                        <TEBlog:ExportWeblogThemeContentFragmentPageForm runat="server" ExportButtonId="Export">
                            <FormTemplate>
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
                            </FormTemplate>
                        </TEBlog:ExportWeblogThemeContentFragmentPageForm>              
	                </Content>
	            </TWC:TabbedPane>
	        </TWC:TabbedPanes>
        </div>
    </div>
</asp:Content>