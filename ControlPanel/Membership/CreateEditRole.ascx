<%@ Control CodeBehind="CreateEditRole.ascx.cs" Language="c#" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Membership.CreateEditRole" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>

<div class="CommonContentArea"><div class="CommonContent">

<div class="CommonFormArea">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr runat="server" id="RoleIDContainer">
    <td class="CommonFormFieldName">
		    <strong><cp:resourcelabel runat="server" resourcename="ID" id="IDResourceLabel"/></strong>
    </td>
    <td class="CommonFormField">
		    <asp:literal id="RoleID" runat="server" />
    </td>
</tr>
<tr>
    <td class="CommonFormFieldName">
		    <strong><cp:resourcelabel runat="server" resourcename="Name" id="Resourcelabel3"/></strong>
    </td>
    <td class="CommonFormField">
            <asp:textbox id="Name" runat="server" maxlength="256" width="300" />
            <asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="Name" id="Requiredfieldvalidator1"/>
    </td>
</tr>
<tr>
    <td class="CommonFormFieldName">
		    <strong><cp:resourcelabel runat="server" resourcename="Description" id="DescResourceLabel"/></strong>
    </td>
    <td class="CommonFormField">
		    <asp:textbox id="Description" columns="40" runat="server" maxlength="512" rows="5" textmode="MultiLine"/>
    </td>
</tr>
</table>
		
<div class="CommonFormFieldName">
    <cp:roleicons id="RoleIcon" runat="server" EnableLink="false"></cp:roleicons>
</div>

<div class="CommonFormField">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr valign="bottom">
        <td>
	        <strong><cp:resourcecontrol runat="server" resourcename="CP_Membership_RoleEdit_UploadRoleIcon" id="Resourcecontrol32"/></strong><br />
        	<input type="file" runat="server" id="RoleImageUpload" name="RoleImageUpload"/>
        </td>
        <td align="right">
	    	<cp:resourcelinkbutton id="DeleteImageButton" runat="server" cssclass="CommonTextButton" resourcename="CP_Membership_RoleEdit_DeleteRoleIcon"></cp:resourcelinkbutton>
        </td>
    </tr>
    </table>	
</div>

<div class="CommonFormField PanelSaveButton">
	<cp:resourcelinkbutton id="SaveButton" runat="server" cssclass="CommonTextButton" resourcename="Save"></cp:resourcelinkbutton>
	<cp:resourcelinkbutton id="DeleteButton" runat="server" cssclass="CommonTextButton" resourcename="Delete"></cp:resourcelinkbutton>
</div>

</div>

</div></div>
