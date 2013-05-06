<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveThemeAs.aspx.cs" Inherits="Telligent.Evolution.ControlPanel.Settings.SaveThemeAs" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">

	<div class="CommonContentArea">
	<div class="CommonContent">
	    <div class="CommonFormArea">
        <CP:StatusMessage runat="server" id="StatusMessage" />
        <table width="100%" cellpadding="0" cellspacing="0" border="0" runat="server" id="FormWrapper">
	        <tr>
		        <td class="CommonFormDescription" colspan="2">
                    <asp:Literal runat="server" ID="FormInstructions" />
		        </td>
	        </tr>
            <tr runat="server" id="SelectParentThemeWrapper">
                <td class="CommonFormFieldName">
                    <CP:ResourceControl runat="server" ResourceName="CP_SaveThemeAs_SelectParentTheme" Tag="Strong" />
                    <CP:ResourceControl runat="server" ResourceName="CP_SaveThemeAs_SelectParentTheme_Help" Tag="Div" />
                </td>
                <td class="CommonFormField">
                    <asp:DropDownList runat="server" ID="ParentThemeDropDownList" ></asp:DropDownList>
                </td>
            </tr>
            <tr runat="server" id="SelectGroupWrapper">
                <td class="CommonFormFieldName">
                    <CP:ResourceControl runat="server" ResourceName="CP_SaveThemeAs_SelectGroup" Tag="Strong" />
                    <CP:ResourceControl runat="server" ResourceName="CP_SaveThemeAs_SelectGroup_Help" Tag="Div" />
                </td>
                <td class="CommonFormField">
                    <TEControl:GroupLookUpTextBox runat="server" ID="SelectGroup" IncludeCurrentGroup="false" MaximumSelections="1" Width="250px" />
                    <asp:CustomValidator runat="server" ID="ValidateSelectGroup" ErrorMessage="*" />
                </td>
            </tr>
            <tr runat="server" id="SelectBlogWrapper">
                <td class="CommonFormFieldName">
                    <CP:ResourceControl runat="server" ResourceName="CP_SaveThemeAs_SelectBlog" Tag="Strong" />
                    <CP:ResourceControl runat="server" ResourceName="CP_SaveThemeAs_SelectBlog_Help" Tag="Div" />
                </td>
                <td class="CommonFormField">
                    <TEBlog:WeblogOrGroupLookUpTextBox runat="server" ID="SelectBlog" IncludeCurrentApplication="false" IncludeCurrentGroup="false" IncludeGroupsInSuggestions="false" MaximumSelections="1" Width="250px" />
                    <asp:CustomValidator runat="server" ID="ValidateSelectBlog" ErrorMessage="*" />
                </td>
            </tr>
            <tr>
                <td class="CommonFormFieldName">
	                <CP:ResourceControl runat="server" ResourceName="CP_SaveThemeAs_ThemeName" Tag="Strong" />
                    <CP:ResourceControl runat="server" ResourceName="CP_SaveThemeAs_ThemeName_Help" Tag="Div" />
                </td>
                <td class="CommonFormField">
                    <asp:TextBox runat="server" ID="ThemeName" MaxLength="64" Columns="40" style="width: 250px;" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ThemeName" ErrorMessage="*" />
                </td>
            </tr>
            <tr>
                <td class="CommonFormFieldName">
                    <CP:ResourceControl runat="server" ResourceName="CP_SaveThemeAs_ThemeDescription" Tag="Strong" />
                    <CP:ResourceControl runat="server" ResourceName="CP_SaveThemeAs_ThemeDescription_Help" Tag="Div" />
                </td>
                <td class="CommonFormField">
                    <asp:TextBox runat="server" ID="ThemeDescription" MaxLength="512" style="width: 250px;" />
                </td>
            </tr>
            <tr>
                <td class="CommonFormFieldName">
                    <CP:ResourceControl runat="server" ResourceName="CP_SaveThemeAs_ThemePreviewImage" Tag="Strong" />
                    <CP:ResourceControl runat="server" ResourceName="CP_SaveThemeAs_ThemePreviewImage_Help" Tag="Div" />
                </td>
                <td class="CommonFormField">
                    <TWC:FileUpload ID="ThemePreviewImage" AllowedFileTypes="png,gif,jpg,jpeg" runat="server" Width="250px" />
                </td>
            </tr>
	        <tr>
		        <td colspan="2" class="CommonFormActionButtons">
			        <cp:resourcelinkbutton id="SaveButton" runat="server" cssclass="CommonTextButton" resourcename="Save" />
		        </td>
	        </tr>
        </table>
        </div>
    </div>
    </div>

</asp:Content>

