<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MediaGalleryEditControlDetails.ascx.cs" Inherits="Telligent.Evolution.ControlPanel.MediaGalleryAdmin.MediaGalleryEditControlDetails" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<CP:StatusMessage id="Status" runat="server"></CP:StatusMessage>
<table width="100%">
	<tr vAlign="top">
		<td class="CommonFormFieldName">
			<strong><CP:FORMLABEL id="Formlabel4" runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_Name" controltolabel="SectionName" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_Name_Detail" />
		</td>
		<td class="CommonFormField">
			<asp:textbox id="SectionName" columns="50" runat="server" maxlength="256" />
			<asp:requiredfieldvalidator id="SectionNameValidator" runat="server" controltovalidate="SectionName">*</asp:requiredfieldvalidator>
			<asp:RegularExpressionValidator ValidationExpression="^.*[^\s]+.*$" id="rev1"
                     ControlToValidate="SectionName" Display="dynamic"
                     runat="server" />
		</td>
	</tr>
	<tr>
		<td class="CommonFormFieldName" style="width:350px">
			<strong><CP:FORMLABEL id="Formlabel17" runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_AppKey" controltolabel="AppKey" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_AppKey_Detail" />
		</td>
		<td class="CommonFormField">
			<asp:textbox id="AppKey" runat="server" columns="50" maxlength="256" /><ASP:Literal Runat="server" ID="AppKeyUrlSuffix" />
			<asp:CustomValidator id="AppKeyValidator" runat="server"><CP:ResourceControl runat="server" ResourceName="CP_Media_MediaGalleryInvalidUrl" /></asp:CustomValidator>
		</td>
	</tr>
	<tr>
		<td class="CommonFormFieldName">
			<strong><CP:FORMLABEL runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_Owners" controltolabel="Owners" /> </strong><br />
			<CP:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_Owners_Detail" />
			<CP:ResourceControl Tag="Em" runat="server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_Optional" />
		</td>
		<td class="CommonFormField">
			<TEControl:UserLookUpTextBox runat="server" ID="Owners" LoadSystemAccounts="false" Width="275px" />
		</td>
	</tr>
	<tr runat="server">
		<td class="CommonFormFieldName" vAlign="top">
			<strong><CP:FORMLABEL id="Formlabel2" runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_Group" controltolabel="AdminGroupList" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_Group_Detail" />
		</td>
		<td class="CommonFormField">
			<asp:literal id="GroupValue" runat="server"></asp:literal>
			<TEControl:GroupLookUpTextBox ID="GroupLookUp" runat="server" RequiredGroupPermission="Group_CreateMediaGallery" MaximumSelections="1" />
			<asp:CustomValidator id="ParentGroupValidator" runat="server">*</asp:CustomValidator>
		</td>
	</tr>

	<tr runat="server" id="IsActive">
		<td class="CommonFormFieldName">
			<strong><CP:FORMLABEL id="Formlabel6" runat="Server" ResourceName="CP_MediaGalleryAdmin_MediaGalleryEditControl_Enable" controltolabel="ynIsActive" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_Enable_Detail" />
		</td>
		<td class="CommonFormField">
			<CP:yesnoradiobuttonlist id="ynIsActive" runat="server"  repeatcolumns="2" />
		</td>
	</tr>
	<tr runat="server" id="IsSearchable">
		<td class="CommonFormFieldName">
			<strong><CP:FORMLABEL id="Formlabel16" runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_Index" controltolabel="ynIsSearchable" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_Index_Detail" />
		</td>
		<td class="CommonFormField">
			<cp:yesnoradiobuttonlist id="ynIsSearchable" runat="server"  repeatcolumns="2" />
		</td>
	</tr>
	<tr runat="server" id="ViewModePanel">
        <td class="CommonFormFieldName">
            <strong><CP:ResourceControl runat="Server" ResourceName="CP_MediaGalleries_PresentationOptions_ViewMode" /></strong><br />
            <CP:ResourceControl runat="server" ResourceName="CP_MediaGalleries_PresentationOptions_ViewMode_Help" />
        </td>
        <td class="CommonFormField">
            <asp:DropDownList runat="server" ID="ViewModeDropDown" />
        </td>
    </tr>
	<tr runat="server" id="SectionLocalizationArea">
		<td class="CommonFormFieldName">
			<strong><CP:formlabel id="Formlabel5" runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_DefaultLanguage" controltolabel="DefaultLanguage" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_MediaGalleryAdmin_MediaGalleryEditControl_DefaultLanguage_Detail" />
		</td>
		<td class="CommonFormField">
			<asp:DropDownList ID="DefaultLanguage" runat="server" />
		</td>
	</tr>
</table>
