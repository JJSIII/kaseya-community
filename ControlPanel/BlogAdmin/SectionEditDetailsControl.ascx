<%@ Control language="c#" Codebehind="SectionEditDetailsControl.ascx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.BlogAdmin.SectionEditDetailsControl" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<CP:StatusMessage id="Status" runat="server"></CP:StatusMessage>
<table width="100%">
	<tr vAlign="top">
		<td class="CommonFormFieldName">
			<strong><CP:FORMLABEL runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_Name" controltolabel="SectionName" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_Name_Detail" />
		</td>
		<td class="CommonFormField">
			<asp:textbox id="SectionName" columns="50" runat="server" maxlength="256" />
			<asp:requiredfieldvalidator id="SectionNameValidator" runat="server" controltovalidate="SectionName">*</asp:requiredfieldvalidator>
			<asp:RegularExpressionValidator ValidationExpression="^.*[^\s]+.*$" id="rev1" ControlToValidate="SectionName" Display="dynamic" runat="server" />
		</td>
	</tr>
	<tr>
		<td class="CommonFormFieldName" style="width:350px">
			<strong><CP:FORMLABEL runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_AppKey" controltolabel="AppKey" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_AppKey_Detail" />
		</td>
		<td class="CommonFormField">
			<asp:textbox id="AppKey" runat="server" columns="50" maxlength="256" />
			<asp:CustomValidator id="AppKeyValidator" runat="server"><CP:ResourceControl runat="server" ResourceName="CP_Blogs_BlogInvalidUrl" /></asp:CustomValidator>
		</td>
	</tr>
	<tr runat="server" id="BlogAuthor">
		<td class="CommonFormFieldName">
			<strong><CP:FORMLABEL runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_Owner" controltolabel="Owners" /> </strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_Owner_Detail" />
		</td>
		<td class="CommonFormField">
		    <TEControl:UserLookUpTextBox runat="server" ID="Owners" Width="275px" />
		</td>
	</tr>
	<tr runat="server" id="groupSelectRow">
		<td class="CommonFormFieldName" vAlign="top">
			<strong><CP:FORMLABEL runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_Group" controltolabel="AdminGroupList" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_Group_Detail" />
		</td>
		<td class="CommonFormField">
			<asp:literal id="GroupValue" runat="server"></asp:literal>
			<div style="width: 360px; float:left;"><TEControl:GroupLookUpTextBox ID="GroupLookUp" runat="server" RequiredGroupPermission="Group_CreateBlog" MaximumSelections="1" Width="350" /></div>
			<asp:RequiredFieldValidator id="ParentGroupValidator" runat="server" controltovalidate="GroupLookUp">*</asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr runat="server" id="IsActive">
		<td class="CommonFormFieldName">
			<strong><CP:FORMLABEL runat="Server" ResourceName="CP_BlogAdmin_SectionEdit_Settings_IsActive" controltolabel="ynIsActive" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_IsActive_Detail" />
		</td>
		<td class="CommonFormField">
			<CP:yesnoradiobuttonlist id="ynIsActive" runat="server"  repeatcolumns="2" />
		</td>
	</tr>
	<tr runat="server" id="EnableAggBugs">
		<td class="CommonFormFieldName">
			<strong><CP:FORMLABEL runat="Server" resourcename="BlogSettings_EnableAggBugs" controltolabel="ynEnableAggBugs" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="BlogSettings_EnableAggBugs_Detail" />
		</td>
		<td class="CommonFormField">
			<cp:yesnoradiobuttonlist id="ynEnableAggBugs" runat="server"  repeatcolumns="2" />
		</td>
	</tr>
	<tr runat="server" id="IsSearchable">
		<td class="CommonFormFieldName">
			<strong><CP:FORMLABEL runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_IsSearchable" controltolabel="ynIsSearchable" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_IsSearchable_Detail" />
		</td>
		<td class="CommonFormField">
			<cp:yesnoradiobuttonlist id="ynIsSearchable" runat="server"  repeatcolumns="2" />
		</td>
	</tr>
	<tr runat="server" id="IsCommunityAggregated">
		<td class="CommonFormFieldName">
			<strong><CP:formlabel runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_IsCommunityAggregated" controltolabel="ynIsCommunityAggregated" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_IsCommunityAggregated_Detail" />
		</td>
		<td class="CommonFormField">
			<CP:yesnoradiobuttonlist id="ynIsCommunityAggregated" runat="server"  repeatcolumns="2" />
		</td>
	</tr>
	<tr runat="server" id="SectionLocalizationArea">
		<td class="CommonFormFieldName">
			<strong><CP:formlabel runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_DefaultLanguage" controltolabel="DefaultLanguage" /></strong>
			<br />
			<CP:ResourceControl runat="Server" resourcename="CP_BlogAdmin_SectionEdit_Settings_DefaultLanguage_Detail" />
		</td>
		<td class="CommonFormField">
			<asp:DropDownList ID="DefaultLanguage" runat="server" />
		</td>
	</tr>
</table>