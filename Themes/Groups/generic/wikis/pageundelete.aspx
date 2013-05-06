<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/modal.Master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Wikis.Components" %>

<asp:Content ContentPlaceHolderID="content" runat="server">
	<TEControl:JQuery runat="server" />
	<script type="text/javascript">
		// <![CDATA[
		$(document).ready(function() {
			var submitButton = $('#<%= CSControlUtility.Instance().FindControl(this, "UndeletePage").ClientID %>');

			submitButton.click(function(e) { $('.processing', submitButton.parent()).css("visibility", "visible"); submitButton.addClass('disabled'); });

		});

		function CloseModal() {
			var opener = window.parent.Telligent_Modal.GetWindowOpener(window);
			opener.location = '<%= WikiUrls.Instance().View(WikiControlUtility.Instance().GetCurrentWiki(this)) %>';
			opener.Telligent_Modal.Close();
		}
		// ]]>
	</script>

	<TEControl:Title runat="server" IncludeSiteName="false" EnableRendering="false">
		<ContentTemplate><TEControl:ResourceControl runat="server" ResourceName="Wikis_Page_Undelete" /></ContentTemplate>
	</TEControl:Title>
	
    <TEWiki:UndeletePageForm runat="server" UndeletePageButtonId="UndeletePage">
        <SuccessActions>
            <TEControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
        </SuccessActions>
        <FormTemplate>	
            <div class="field-list-header"></div>
                <fieldset class="field-list">
                    <legend class="field-list-description"><span><TEControl:ResourceControl runat="server" ResourceName="Wikis_Page_Undelete_Header" /></span></legend>
                    <ul class="field-list">
                        <li class="field-item">
                            <span class="field-item-input">
                                <asp:LinkButton ID="UndeletePage" runat="server" CssClass="internal-link delete-post"><span></span><TEControl:ResourceControl runat="server" ResourceName="Wikis_Page_Undelete_SinglePage" /></asp:LinkButton>
                                <span class="processing" style="visibility: hidden;"></span>
                                <asp:LinkButton runat="server" CssClass="internal-link cancel" OnClientClick="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(); return false;"><span></span><TEControl:ResourceControl runat="server" ResourceName="Cancel" /></asp:LinkButton>
                            </span>
                        </li>
                    </ul>
                </fieldset>
            <div class="field-list-footer"></div>	
        </FormTemplate>
    </TEWiki:UndeletePageForm>
</asp:Content>
