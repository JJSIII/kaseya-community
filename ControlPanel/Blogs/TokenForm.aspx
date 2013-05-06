<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Page language="c#" Codebehind="TokenForm.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.TokenForm" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">

    <script type="text/javascript">
      // <![CDATA[
      function isSafeUrl(sender, args) {
        args.IsValid = /^((http(s)?|mailto|mms):|\/|#)/i.test(args.Value);
      }
      // ]]>
    </script>

    <DIV class="CommonContentArea">
    <DIV class="CommonContent">
	    <DIV class="CommonFormFieldName">
		    <strong><CP:ResourceControl runat="Server" resourcename="CP_Blog_TextParts_TextPartName" /></strong><br />
		    <cp:ResourceControl runat="Server" resourcename="CP_Blog_TextParts_TextPartName_Help" />
		    <asp:RequiredFieldValidator id="TextPartValidator" Runat="server" ControlToValidate="TextPartBox" Display="Dynamic" />
		    <asp:RegularExpressionValidator id="TextPartRegexValidator" runat="server" ControlToValidate="TextPartBox" Display="Dynamic" ValidationExpression="^[0-9a-zA-Z]{2,50}$" />
	    </DIV>
	    <DIV class="CommonFormField">
		    <asp:TextBox id="TextPartBox" Runat="server" CssClass="ControlPanelTextInput" MaxLength="50" />
	    </DIV>
	    <br />
	    <DIV class="CommonFormFieldName">
		    <strong><CP:ResourceControl runat="Server" resourcename="CP_Blog_TextParts_Link" /></strong><br />
		    <cp:ResourceControl runat="Server" resourcename="CP_Blog_TextParts_Link_Help" />
	    </DIV>
	    <DIV class="CommonFormField">
		    <asp:TextBox id="LinkBox" Runat="server" CssClass="ControlPanelTextInput" MaxLength="255" />
		    <asp:CustomValidator runat="server" ID="LinkValidator" ControlToValidate="LinkBox" ClientValidationFunction="isSafeUrl"><br /><TEControl:ResourceControl runat="server" ResourceName="EditProfile_InvalidUrl" /></asp:CustomValidator>
	    </DIV>
	    <br />
	    <DIV class="CommonFormFieldName">
		    <strong><CP:ResourceControl runat="Server" resourcename="CP_Blog_TextParts_Text" /></strong><br />
		    <cp:ResourceControl runat="Server" resourcename="CP_Blog_TextParts_Text_Help" />
		    <asp:RequiredFieldValidator id="TextValidator" Runat="server" ControlToValidate="TextDescBox" Display="Dynamic" />
	    </DIV>
	    <DIV class="CommonFormField">
		    <asp:TextBox id="TextDescBox" Runat="server" CssClass="ControlPanelTextInput" MaxLength="500" Rows="3" TextMode="MultiLine" />
	    </DIV>
	    <br />
	    <DIV class="CommonFormField PanelSaveButton">
		    <cp:resourcelinkbutton runat="server" id="SaveButton" cssclass="CommonTextButton" resourcename="Save"></cp:resourcelinkbutton>
	    </DIV>
    </DIV>
    </DIV>
</asp:Content>