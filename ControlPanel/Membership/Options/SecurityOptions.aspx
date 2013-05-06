<%@ Page language="c#" Codebehind="SecurityOptions.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.SecurityOptions" MasterPageFile="~/ControlPanel/Masters/MembershipAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="Resourcecontrol1" runat="server" resourcename="CP_Membership_Settings_Security_Title"></cp:resourcecontrol>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="SecuritySettings" />
	<DIV class="CommonDescription">
		<cp:resourcecontrol id="ResourceControl115" runat="server" resourcename="CP_Membership_Settings_Cookie_SubTitle"></cp:resourcecontrol>
	</DIV>
	<CP:statusmessage id="formStatus" runat="server"></CP:statusmessage>

    <div class="FixedWidthContainer">
		<TABLE cellSpacing="0" cellPadding="3" border="0">
			<TR>
				<TD class="CommonFormFieldName">
					<strong><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Cookie_Enabled" /></strong>
					<br />
                    <cp:resourcecontrol runat="Server" resourcename="CP_Membership_Settings_Cookie_Enabled_Descr" />
                </TD>
				<TD class="CommonFormField" noWrap>
					<cp:yesnoradiobuttonlist id="EnableRolesCookie" runat="server" repeatcolumns="2" ></cp:yesnoradiobuttonlist></TD>
			</TR>
			<TR>
				<TD class="CommonFormFieldName">
					<strong><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Cookie_Track" /></strong>
					<br />
					<cp:resourcecontrol runat="Server" resourcename="CP_Membership_Settings_Cookie_Track_Descr" />
				</TD>
				<TD class="CommonFormField">
					<cp:yesnoradiobuttonlist id="EnableAnonymousTracking" runat="server" repeatcolumns="2" ></cp:yesnoradiobuttonlist></TD>
			</TR>
			<TR>
				<TD class="CommonFormFieldName">
					<strong><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Cookie_Name" /></strong>
					<br />
					<cp:resourcecontrol runat="Server" resourcename="CP_Membership_Settings_Cookie_Name_Descr" />
				</TD>
				<TD class="CommonFormField">
					<asp:textbox id="RolesCookieName" runat="server"  maxlength="64"></asp:textbox>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator1" runat="server" controltovalidate="RolesCookieName"
						font-bold="True" errormessage="*"></asp:requiredfieldvalidator></TD>
			</TR>
			<TR>
				<TD class="CommonFormFieldName">
					<strong><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Cookie_Path" /></strong>
					<br />
					<cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Cookie_Path_Descr" />
				</TD>
				<TD class="CommonFormField">
					<asp:textbox id="CookiePath" runat="server"  maxlength="64"></asp:textbox>
					<asp:requiredfieldvalidator runat="server" controltovalidate="CookiePath"
						font-bold="True" errormessage="*"></asp:requiredfieldvalidator></TD>
			</TR>
			<TR>
				<TD class="CommonFormFieldName">
					<strong><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Cookie_Expire" /></strong>
					<br />
					<cp:resourcecontrol runat="Server" resourcename="CP_Membership_Settings_Cookie_Expire_Descr" />
				</TD>
				<TD class="CommonFormField">
					<asp:textbox id="RolesCookieExpiration" runat="server"  maxlength="6"></asp:textbox>
					<asp:requiredfieldvalidator id="RolesCookieExpirationValidator" runat="server" controltovalidate="RolesCookieExpiration"
						font-bold="True" errormessage="*"></asp:requiredfieldvalidator>
				    <asp:RegularExpressionValidator runat="server" ControlToValidate="RolesCookieExpiration" ErrorMessage="*" 
                            Display="Dynamic" ValidationExpression="^[0-9]*$" />
				</TD>
			</TR>
			<TR>
				<TD class="CommonFormFieldName">
					<strong><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Cookie_Anon_Name" /></strong>
					<br />
					<cp:resourcecontrol runat="Server" resourcename="CP_Membership_Settings_Cookie_Anon_Name_Descr" />
				</TD>
				<TD class="CommonFormField">
					<asp:textbox id="AnonymousCookieName" runat="server"  maxlength="64"></asp:textbox>
					<asp:requiredfieldvalidator id="Requiredfieldvalidator2" runat="server" controltovalidate="AnonymousCookieName"
						font-bold="True" errormessage="*"></asp:requiredfieldvalidator></TD>
			</TR>
			<TR>
				<TD class="CommonFormFieldName">
					<strong><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Cookie_Anon_Expire" /></strong>
                    <br />
					<cp:resourcecontrol runat="Server" resourcename="CP_Membership_Settings_Cookie_Anon_Expire_Descr" />
				</TD>
				<TD class="CommonFormField">
					<asp:textbox id="AnonymousCookieExpiration" runat="server"  maxlength="6"></asp:textbox>
					<asp:requiredfieldvalidator id="AnonymousCookieExpirationValidator" runat="server" controltovalidate="AnonymousCookieExpiration"
						font-bold="True" errormessage="*"></asp:requiredfieldvalidator>
				    <asp:RegularExpressionValidator runat="server" ControlToValidate="AnonymousCookieExpiration" ErrorMessage="*" 
                            Display="Dynamic" ValidationExpression="^[0-9]*$" />
				</TD>
			</TR>
			<TR>
				<TD class="CommonFormFieldName">
					<strong><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Cookie_Domain" /></strong>
					<br />
					<cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Cookie_Domain_Descr" />
				</TD>
				<TD class="CommonFormField">
					<asp:textbox id="CookieDomain" runat="server"  maxlength="100"></asp:textbox>
					<asp:RegularExpressionValidator runat="server" ControlToValidate="CookieDomain" ErrorMessage="*" Display="Dynamic" ValidationExpression="^(?:\.?[\w\-]+)+$" />
				</TD>
			</TR>
			<TR>
				<TD class="CommonFormFieldName">
					<strong><cp:resourcecontrol runat="server" resourcename="CP_Membership_Settings_Anon_Window" /></strong>
					<br />
					<cp:resourcecontrol runat="Server" resourcename="CP_Membership_Settings_Anon_Window_Descr" />
				</TD>
				<TD class="CommonFormField">
					<asp:textbox id="AnonymousUserOnlineTimeWindow" runat="server"  maxlength="64"></asp:textbox>
					<asp:requiredfieldvalidator id="AnonymousUserOnlineTimeWindowValidator" runat="server" controltovalidate="AnonymousUserOnlineTimeWindow"
						font-bold="True" errormessage="*"></asp:requiredfieldvalidator>
				    <asp:RegularExpressionValidator runat="server" ControlToValidate="AnonymousUserOnlineTimeWindow" ErrorMessage="*" 
                            Display="Dynamic" ValidationExpression="^[0-9]*$" />
				</TD>
			</TR>
		</TABLE>
	</div>
	<p class="PanelSaveButton DetailsFixedWidth">
			<cp:ResourceButton id="btnSave" runat="server" resourcename="Save" />
	</p>
</asp:Content>