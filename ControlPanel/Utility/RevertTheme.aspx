<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RevertTheme.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Utility.RevertTheme" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">

    <TEControl:JQuery runat="server" />
    <script type="text/javascript">
    // <!--

        function enableDisablePageInputs(cb)
        {
            var revertLayoutsContainer = document.getElementById('<%= RevertLayoutContent.ClientID %>');
            if (cb.checked)
                $('input, select', revertLayoutsContainer).removeAttr('disabled');
            else
                $('input, select', revertLayoutsContainer).attr('disabled', 'disabled');
        }

        function enableDisableHeaderFooterInputs(cb)
        {
            var revertLayoutsContainer = document.getElementById('<%= RevertHeaderFooterContent.ClientID %>');
            if (cb.checked)
                $('input, select', revertLayoutsContainer).removeAttr('disabled');
            else
                $('input, select', revertLayoutsContainer).attr('disabled', 'disabled');
        }

        function enableDisableFileRevertInputs(cb)
        {
            var revertLayoutsContainer = document.getElementById('<%= RevertFileContent.ClientID %>');
            if (cb.checked)
                $('input, select', revertLayoutsContainer).removeAttr('disabled');
            else
                $('input, select', revertLayoutsContainer).attr('disabled', 'disabled');
        }

        function enableDisableWidgetScopedPropertyInputs(cb) {
        	var revertLayoutsContainer = document.getElementById('<%= RevertWidgetScopedPropertiesContent.ClientID %>');
           	if (cb.checked)
           		$('input, select', revertLayoutsContainer).removeAttr('disabled');
           	else
           		$('input, select', revertLayoutsContainer).attr('disabled', 'disabled');
        }

        function validateForm()
        {
            return window.confirm('<%= Telligent.Evolution.Components.JavaScript.Encode(Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_RevertThemes_Revert_Confirmation")) %>');                
        }

        jQuery(function ($) {
            $('input[type="checkbox"].all').on('change', function () {
                var select = $(this);
                var revertibleFileInputs = select.closest('table').find('.RevertFileCheckbox input');
                if (select.is(':checked')) {
                    revertibleFileInputs.attr('checked', 'checked');
                } else {
                    revertibleFileInputs.removeAttr('checked');
                }
            });
        });
    
    // -->    
    </script>

    <TEControl:Title runat="server" ResourceName="CP_RevertThemes_Title" ResourceFile="ControlPanelResources.xml" IncludeSiteName="false" IncludeSectionOrHubName="false" />

	<div class="CommonContentArea">
	    <div class="CommonContent">
            <div class="CommonDescription">
                <CP:ResourceControl ResourceName="CP_RevertThemes_Instructions" runat="server" />
            </div>
            <div class="CommonFormArea">
            
                <TEControl:WrappedLiteral runat="server" ID="Message" Tag="Div" CssClass="CommonMessageError" />
            
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="CommonFormField">
                            <asp:CheckBox runat="server" ID="RevertLayouts" onclick="enableDisablePageInputs(this);" Checked="true" />
                        </td>
                        <td class="CommonFormFieldName" runat="server" ID="RevertLayoutContent">
                            <asp:Panel runat="server" ID="BlogRevertLayoutsMessage" Visible="false">
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_BlogRevert_1" />
                                <asp:DropDownList runat="server" ID="BlogRevertCustom" />
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_BlogRevert_2" />
                            </asp:Panel>
                            <asp:Panel runat="server" ID="GroupRevertLayoutsMessage">
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_GroupRevert_1" />
                                <asp:DropDownList runat="server" ID="GroupRevertCustom" />
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_GroupRevert_2" />
                            </asp:Panel>
                            <asp:Panel runat="server" ID="SiteRevertLayoutsMessage">
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_SiteRevert_1" />
                                <asp:DropDownList runat="server" ID="SiteRevertCustom" />
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_SiteRevert_2" />
                                <asp:DropDownList runat="server" ID="RevertTo" />
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_SiteRevert_3" />
                            </asp:Panel>
                            <table cellpadding="2" cellspacing="0" border="0" style="margin: 10px 0 0 10px;" runat="server" id="RevertThemeTypesContainer">
                                <tr id="RevertUserContainer" runat="server">
                                    <td><asp:Checkbox runat="server" ID="RevertUserPages" Checked="true" /></td>
                                    <td><CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_RevertUserPages_Name" /></td>
                                </tr>
                                <tr id="RevertSiteContainer" runat="server">
                                    <td><asp:Checkbox runat="server" ID="RevertSitePages" Checked="true" /></td>
                                    <td><CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_RevertSitePages_Name" /></td>
                                </tr>
                                <tr>
                                    <td><asp:Checkbox runat="server" ID="RevertGroupPages" Checked="true" /></td>
                                    <td><CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_RevertGroupPages_Name" /></td>
                                </tr>
                                <tr>
                                    <td><asp:Checkbox runat="server" ID="RevertBlogPages" Checked="true" /></td>
                                    <td><CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_RevertBlogPages_Name" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="CommonFormField">
                            <asp:CheckBox runat="server" ID="RevertHeaderFooter" Checked="true" onclick="enableDisableHeaderFooterInputs(this);" />
                        </td>
                        <td class="CommonFormFieldName" runat="server" id="RevertHeaderFooterContent">
                            <asp:Panel runat="server" ID="BlogRevertHeaderFooterMessage" Visible="false">
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertHeaderFooter_BlogRevert_1" />
                                <asp:DropDownList runat="server" ID="BlogRevertHeaderFooterSelection" />
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertHeaderFooter_BlogRevert_2" />
                            </asp:Panel>
                            <asp:Panel runat="server" ID="GroupRevertHeaderFooterMessage">
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertHeaderFooter_GroupRevert_1" />
                                <asp:DropDownList runat="server" ID="GroupRevertHeaderFooterSelection" />
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertHeaderFooter_GroupRevert_2" />
                            </asp:Panel>
                            <asp:Panel runat="server" ID="SiteRevertHeaderFooterMessage">
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertHeaderFooter_SiteRevert_1" />
                                <asp:DropDownList runat="server" ID="SiteRevertHeaderFooterSelection" />
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertHeaderFooter_SiteRevert_2" />
                                <asp:DropDownList runat="server" ID="RevertHeaderFooterTo" />
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertHeaderFooter_SiteRevert_3" />
                            </asp:Panel>
                            <table cellpadding="2" cellspacing="0" border="0" style="margin: 10px 0 0 10px;" runat="server" id="RevertHeaderFooterThemeTypesContainer">
                                <tr id="RevertSiteHeaderContainer" runat="server">
                                    <td><asp:Checkbox runat="server" ID="RevertSiteHeaderFooter" Checked="true" /></td>
                                    <td><CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_RevertSitePages_Name" /></td>
                                </tr>
                                <tr>
                                    <td><asp:Checkbox runat="server" ID="RevertGroupHeaderFooter" Checked="true" /></td>
                                    <td><CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_RevertGroupPages_Name" /></td>
                                </tr>
                                <tr>
                                    <td><asp:Checkbox runat="server" ID="RevertBlogHeaderFooter" Checked="true" /></td>
                                    <td><CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_RevertBlogPages_Name" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server" id="RevertConfigurationArea">
                        <td class="CommonFormField">
                            <asp:CheckBox runat="server" ID="RevertConfiguration" Checked="true" />
                        </td>
                        <td class="CommonFormFieldName">
                            <CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_RevertConfiguration_Name" />
                        </td>
                    </tr>

                    <tr runat="server" id="RevertFileArea">
                        <td class="CommonFormField">
                            <asp:CheckBox runat="server" ID="RevertFiles" Checked="true" onclick="enableDisableFileRevertInputs(this);" />
                        </td>
                        <td class="CommonFormFieldName" runat="server" id="RevertFileContent">
                            <CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_RevertFiles_Name" />
                            <asp:PlaceHolder  runat="server" id="RevertibleFiles">
                                <table cellpadding="2" cellspacing="0" border="0" style="margin: 10px 0 0 10px;">
                                    <tr>
                                        <td colspan="2"><CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_FilesNoDefault" /></td>
                                    </tr>
                                    <tr runat="server" id="RevertAllFilesRow">
                                        <td><input type="checkbox" id="RevertAllFiles" class="all" checked="checked" runat="server" /></td>
                                        <td><CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_All" /></td>
                                    </tr>
                                    <asp:Repeater runat="server" ID="RevertFilesRepeater">
                                        <ItemTemplate>
                                            <tr>
                                                <td><asp:CheckBox CssClass="RevertFileCheckbox" runat="server" ID="RevertFileCheckbox" /></td>
                                                <td><asp:Literal runat="server" ID="RevertFileLiteral"></asp:Literal></td>
                                            </tr>
                                        </ItemTemplate>                                    
                                    </asp:Repeater>
                                </table>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" id="RevertibleDefaultFiles">
                                <table cellpadding="2" cellspacing="0" border="0" style="margin: 10px 0 0 10px;">
                                    <tr>
                                        <td colspan="2"><CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_FilesDefault" /></td>
                                    </tr>
                                    <tr runat="server" id="RevertAllDefaultFilesRow">
                                        <td><input type="checkbox" id="RevertAllDefaultFiles" class="all" checked="checked" runat="server" /></td>
                                        <td><CP:ResourceControl runat="server" ResourceName="CP_RevertThemes_All" /></td>
                                    </tr>
                                    <asp:Repeater runat="server" ID="RevertDefaultFilesRepeater">
                                        <ItemTemplate>
                                            <tr>
                                                <td><asp:CheckBox CssClass="RevertFileCheckbox" runat="server" ID="RevertFileCheckbox" /></td>
                                                <td><asp:Literal runat="server" ID="RevertFileLiteral"></asp:Literal></td>
                                            </tr>
                                        </ItemTemplate>                                    
                                    </asp:Repeater>
                                </table>
                            </asp:PlaceHolder>
                        </td>
                    </tr>

					<tr runat="server" id="RevertScopedWidgetPropertiesArea">
						 <td class="CommonFormField">
                            <asp:CheckBox runat="server" ID="RevertScopedWidgetProperties" Checked="true" onclick="enableDisableWidgetScopedPropertyInputs(this);" />
                        </td>
                        <td class="CommonFormFieldName" runat="server" ID="RevertWidgetScopedPropertiesContent">
							<asp:Panel runat="server" ID="BlogRevertScopedWidgetPropertiesMessage" Visible="false">
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertScopedWidgetProperties_BlogRevert" />
                            </asp:Panel>
                            <asp:Panel runat="server" ID="GroupRevertScopedWidgetPropertiesMessage">
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertScopedWidgetProperties_GroupRevert" />
                            </asp:Panel>
                            <asp:Panel runat="server" ID="SiteRevertScopedWidgetPropertiesMessage">
                                <CP:ResourceControl runat="server" ResourceName="CP_RevertScopedWidgetProperties_SiteRevert" />
                            </asp:Panel>
                            <table cellpadding="2" cellspacing="0" border="0" style="margin: 10px 0 0 10px;" runat="server" id="RevertScopedWidgetPropertiesThemeTypesContainer">
                                <tr runat="server" id="RevertScopedWidgetPropertiesSiteArea">
                                    <td><asp:Checkbox runat="server" ID="RevertScopedWidgetPropertiesSite" Checked="true" /></td>
                                    <td><CP:ResourceControl ID="ResourceControl8" runat="server" ResourceName="CP_RevertThemes_RevertSitePages_Name" /></td>
                                </tr>
                                <tr>
                                    <td><asp:Checkbox runat="server" ID="RevertScopedWidgetPropertiesGroup" Checked="true" /></td>
                                    <td><CP:ResourceControl ID="ResourceControl9" runat="server" ResourceName="CP_RevertThemes_RevertGroupPages_Name" /></td>
                                </tr>
                                <tr>
                                    <td><asp:Checkbox runat="server" ID="RevertScopedWidgetPropertiesBlog" Checked="true" /></td>
                                    <td><CP:ResourceControl ID="ResourceControl10" runat="server" ResourceName="CP_RevertThemes_RevertBlogPages_Name" /></td>
                                </tr>
                            </table>
                        </td>
					</tr>

                </table>

            </div>
	                    
	        <div class="CommonFormArea">
                <div class="CommonFormField PanelSaveButton">
                    <TEControl:ResourceButton runat="server" ID="Revert" ResourceName="CP_RevertThemes_Revert" ResourceFile="ControlPanelResources.xml" OnClick="Save_Click" OnClientClick="return validateForm();" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>