<%@ Page Language="c#" CodeBehind="UserAdd.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.UserAdd" MasterPageFile="~/ControlPanel/Masters/MembershipAdmin.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderID="DescriptionRegion" runat="server">
	<CP:ResourceControl ID="Resourcecontrol1" runat="server" ResourceName="CP_Membership_UserAdd_Title">
	</CP:ResourceControl>
</asp:Content>
<asp:Content ContentPlaceHolderID="TaskRegion" runat="Server">
<script type="text/javascript">
	// <![CDATA[
	function CheckUsernameLength(source, arguments) {
		arguments.IsValid = (arguments.Value.length >= <%= CSContext.Current.SiteSettings.UsernameMinLength %> && arguments.Value.length <= <%= CSContext.Current.SiteSettings.UsernameMaxLength%>);
	}
// ]]>
</script>
	<CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="CreateMember" />
	<div class="FixedWidthContainer">
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		<tr>
			<td align="left">
				<div class="CommonFormFieldName">
					<asp:CustomValidator ID="placeHolderValidator" runat="server" EnableClientScript="false" />
				</div>
			</td>
		</tr>
		<tr>
			<td align="left">
				<div class="CommonFormFieldName">
					<CP:ResourceControl runat="server" ResourceName="CP_Membership_UserAdd_UserName" Tag="Strong" /><br />
					<CP:ResourceControl runat="server" ResourceName="CP_Membership_UserAdd_UserName_Desc" />
				</div>
				<div class="CommonFormField">
					<asp:TextBox ID="username" runat="server" Columns="40"></asp:TextBox>
					<asp:RequiredFieldValidator ID="usernameValidator" runat="server" ControlToValidate="username" Display="Dynamic">
						<CP:ResourceControl runat="server" resourcename="CP_Membership_UserAdd_UserNameWarning" />
					</asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="usernameRegExValidator" runat="server" ControlToValidate="Username" EnableClientScript="false">*</asp:RegularExpressionValidator>
					<asp:CustomValidator ID="usernameLengthValidator" runat="server" ControlToValidate="Username" ClientValidationFunction="CheckUsernameLength" EnableClientScript="true">
						<CP:ResourceControl runat="server" resourcename="CP_Membership_UserAdd_UserNameLengthWarning" /></asp:CustomValidator>
				</div>
			</td>
		</tr>
		<tr>
			<td align="left">
				<div class="CommonFormFieldName">
					<CP:ResourceControl runat="server" ResourceName="CP_Membership_UserAdd_Password" Tag="Strong" /><br />
					<CP:ResourceControl runat="server" ResourceName="CP_Membership_UserAdd_Password_Desc" />
				</div>
				<div class="CommonFormField">
					<asp:TextBox ID="password" runat="server" Columns="40" MaxLength="64" TextMode="Password" AutoComplete="off"></asp:TextBox>
					<asp:RequiredFieldValidator ID="passwordValidator" runat="server" ControlToValidate="Password" Display="Dynamic">
						<CP:resourcecontrol runat="server" resourcename="CP_Membership_UserAdd_PasswordWarning" />
					</asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="passwordRegExValidator" runat="server" Display="Dynamic" ControlToValidate="Password" EnableClientScript="false">*</asp:RegularExpressionValidator>
					<asp:CustomValidator ID="passwordContentValidator" runat="server" ControlToValidate="Password" EnableClientScript="false" Display="Dynamic">
						<CP:resourcecontrol runat="server" resourcename="CP_Membership_UserAdd_PasswordLengthWarning" />
					</asp:CustomValidator>
				</div>
			</td>
		</tr>
		<tr>
			<td align="left">
				<div class="CommonFormFieldName">
					<CP:ResourceControl runat="server" ResourceName="CP_Membership_UserAdd_ReEnterPassword" />
				</div>
				<div class="CommonFormField">
					<asp:TextBox ID="password2" runat="server" Columns="40" MaxLength="64" TextMode="Password" AutoComplete="off"></asp:TextBox>
					<asp:RequiredFieldValidator ID="password2Validator" runat="server" ControlToValidate="Password2" Display="Dynamic">
						<CP:ResourceControl ResourceName="CP_Membership_UserAdd_PasswordConfirmationWarning" runat="server" />
					</asp:RequiredFieldValidator>
					<asp:CompareValidator ID="comparePassword" runat="server" ControlToValidate="Password2" ControlToCompare="Password">
						<TEControl:ResourceControl ResourceName="CreateNewAccount_PasswordNoMatch" runat="server" />
					</asp:CompareValidator>
				</div>
			</td>
		</tr>
		<tr>
			<td align="left">
				<div class="CommonFormFieldName">
					<CP:ResourceControl runat="server" ResourceName="CP_Membership_UserAdd_Email" Tag="Strong" /><br />
					<CP:ResourceControl runat="server" ResourceName="CP_Membership_UserAdd_Email_Desc" />
				</div>
				<div class="CommonFormField">
					<asp:TextBox ID="email" runat="server" Columns="40" MaxLength="128"></asp:TextBox>
					<asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="Email" Display="Dynamic"><CP:ResourceControl ResourceName="CP_Membership_UserAdd_EmailWarning" runat="server" /></asp:RequiredFieldValidator>
					<TEControl:EmailValidator runat="server" ID="emailRegExValidator" ControlToValidate="Email"><CP:ResourceControl ResourceName="CP_Membership_UserAdd_InvalidEmailWarning" runat="server" /></TEControl:EmailValidator>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="CommonFormFieldName">
					<CP:ResourceControl runat="server" ResourceName="CP_Membership_UserAdd_TimeZone" Tag="Strong" /><br />
					<CP:ResourceControl runat="Server" ResourceName="CP_Membership_UserAdd_TimeZone_Desc" />
				</div>
				<div class="CommonFormField">
					<asp:DropDownList id="timezone" runat="server" />
				</div>
			</td>
		</tr>
		</table>
	</div>
	<p id="LicensingWarning" runat="server" style="color: Red; text-align: right" visible="false">
		<CP:ResourceControl runat="server" ResourceName="CP_Membership_UserAdd_LicensingWarning" />
	</p>
	<p class="PanelSaveButton DetailsFixedWidth">
		<CP:ResourceButton ID="createButton" runat="server" ResourceName="CP_Membership_UserAdd_CreateAccountButton" />
	</p>
</asp:Content>
