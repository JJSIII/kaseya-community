<%@ Page language="c#" Codebehind="CreateUpdateRank.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Settings.CreateUpdateRank" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">
	<div class="CommonContentArea">
	<div class="CommonContent">
	
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
	    <td class="CommonFormFieldName">
				    <strong><cp:resourcelabel runat="server" resourcename="Name" id="Resourcelabel4"/></strong>
        </td>
        <td class="CommonFormField">
				    <asp:textbox id="RankName" runat="server" />
				    <asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="RankName" id="RankNameValidator" />
        </td>
    </tr>
    <tr>
        <td class="CommonFormFieldName">
				    <strong><cp:resourcelabel runat="server" resourcename="CP_CreateUpdateRank_MinValue" id="Resourcelabel5"/></strong>
	    </td>
	    <td class="CommonFormField">
				    <asp:textbox id="RankMinValue" runat="server" columns="10" />
				    <asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="RankMinValue" id="RankMinValueValidator" />
	    </td>
    </tr>
    <tr>
	    <td class="CommonFormFieldName">
				    <strong><cp:resourcelabel runat="server" resourcename="CP_CreateUpdateRank_MaxValue" id="Resourcelabel6"/></strong>
	    </td>
	    <td class="CommonFormField">
				    <asp:textbox id="RankMaxValue" runat="server" columns="10" />
				    <asp:requiredfieldvalidator runat="server" errormessage="*" font-bold="True" controltovalidate="RankMaxValue" id="RankMaxValueValidator" />
        </td>
    </tr>
    </table>
    <div class="CommonFormFieldName">
		<asp:Image runat="server" id="RankImage" style="max-height: 80px; max-width: 60px;" />
    </div>
    <div class="CommonFormField">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr valign="bottom">
        <td>
		    <strong><cp:resourcecontrol runat="server" resourcename="CP_CreateUpdateRank_UploadRankIcon" id="Resourcecontrol32"/></strong><br />
	        <input type="file" runat="server" id="RankImageUpload" name="RankImageUpload"/>
        </td>
        <td align="right">
            <cp:resourcelinkbutton id="DeleteImageButton" runat="server" cssclass="CommonTextButton" resourcename="CP_CreateUpdateRank_DeleteRankIcon"></cp:resourcelinkbutton>
        </td>
        </tr>
        </table>
	</div>
	<div class="CommonFormFieldName PanelSaveButton" align="right">
		<cp:resourcelinkbutton id="SaveButton" runat="server" cssclass="CommonTextButton" resourcename="Save" />
		&nbsp;
		<cp:resourcelinkbutton id="DeleteButton" runat="server" cssclass="CommonTextButton" resourcename="Delete" causesvalidation="false" />
	</div>
	</div>
	</div>
</asp:Content>