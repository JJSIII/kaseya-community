<%@ Page language="c#" Codebehind="RemoteMetaBlogSettingsForm.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.RemoteMetaBlogSettingsForm" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">
	<div class="CommonFormArea">
		<h3 class="CommonSubTitle"><cp:resourcecontrol runat="Server" resourcename="CP_Blogs_RemoteOptions_RemoteMetaWeblogTitle" /></h3>
	
		<div class="OptionsFieldName">
			<cp:formlabel runat="Server" controltolabel="Url" resourcename="CP_Blogs_RemoteOptions_Url_Help" />&nbsp;
		</div>
		<div class="CommonFormField">
			<asp:textbox id="Url" cssclass="ControlPanelTextInput" runat="server" />			
		</div>

		<div class="OptionsFieldName">
			<cp:formlabel runat="Server" controltolabel="AppKey" resourcename="CP_Blogs_RemoteOptions_AppKey_Help" />&nbsp;
		</div>
		<div class="CommonFormField">
			<asp:textbox id="AppKey" cssclass="ControlPanelTextInput" runat="server" />			
		</div>

		<div class="OptionsFieldName">
			<cp:formlabel runat="Server" controltolabel="Username" resourcename="CP_Blogs_RemoteOptions_Username_Help" />&nbsp;
		</div>
	    <div class="CommonFormField">
	        <asp:textbox id="Username" cssclass="ControlPanelTextInput" runat="server" />
	    </div>

		<div class="OptionsFieldName">
			<cp:formlabel runat="Server" controltolabel="Password" resourcename="CP_Blogs_RemoteOptions_Password_Help" />&nbsp;
		</div>
		<div class="CommonFormField">
			<asp:textbox id="Password" cssclass="ControlPanelTextInput" runat="server" />			    
		</div>

		<div class="OptionsFieldName">
			<cp:formlabel runat="Server" controltolabel="Message" resourcename="CP_Blogs_RemoteOptions_Message" />&nbsp;
		</div>
		<div class="CommonFormField">
			<asp:textbox id="AppendMessage" cssclass="ControlPanelTextInput" runat="server" />			    
		</div>

		<p class="CommonFormField PanelSaveButton">
			<cp:resourcelinkbutton id="SaveButton" runat="server" cssclass="CommonTextButton" resourcename="Save" />
		</p>
	
	</div>
</asp:Content>