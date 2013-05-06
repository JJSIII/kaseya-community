<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/modal.Master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Wikis.Components" %>

<script runat=server>

    protected override void OnInit(EventArgs e)
    {
        Telligent.Evolution.Wikis.Components.Page page = Telligent.Evolution.Wikis.Controls.WikiControlUtility.Instance().GetCurrentPage(this, false);

        if (page != null)
        {
            pnlChildren.Visible = page.ChildPageCount > 0;
            pnlNoChildren.Visible = !pnlChildren.Visible;
        }
        
        base.OnInit(e);
    }

</script>

<asp:Content ContentPlaceHolderID="content" runat="server">
	<TEControl:JQuery runat="server" />
	<script type="text/javascript">
		// <![CDATA[
		$(document).ready(function() {
			var deleteButton = $('#<%= CSControlUtility.Instance().FindControl(this, "ConfirmDelete").ClientID %>');
			var deleteSingle = $('#<%= CSControlUtility.Instance().FindControl(this, "DeleteSinglePage").ClientID %>');
			var deleteWithChildren = $('#<%= CSControlUtility.Instance().FindControl(this, "DeleteWithChildren").ClientID %>');

			deleteButton.click(function(e) { $('.processing', deleteButton.parent()).css("visibility", "visible"); deleteButton.addClass('disabled'); });

			deleteSingle.click(function(e) { $('.processing', deleteSingle.parent()).css("visibility", "visible"); deleteWithChildren.addClass('disabled'); deleteSingle.addClass('disabled'); });
			deleteWithChildren.click(function(e) { $('.processing', $(deleteWithChildren).parent()).css("visibility", "visible"); deleteWithChildren.addClass('disabled'); deleteSingle.addClass('disabled'); });
		});

		function CloseModal() {
			var opener = window.parent.Telligent_Modal.GetWindowOpener(window);
			opener.location = '<%= WikiUrls.Instance().View(WikiControlUtility.Instance().GetCurrentWiki(this)) %>';
			opener.Telligent_Modal.Close();
		}
		// ]]>
	</script>
	<TEControl:Title runat="server" IncludeSiteName="false" EnableRendering="false">
		<ContentTemplate><TEControl:ResourceControl ID="ResourceControl1" runat="server" ResourceName="Wikis_Page_Delete" /></ContentTemplate>
	</TEControl:Title>
	<asp:Panel ID="pnlNoChildren" runat=server Visible=false>
        <TEWiki:DeleteLeafPageForm runat="server" ConfirmButtonId="ConfirmDelete">
            <SuccessActions>
                <TEControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
            </SuccessActions>
            <FormTemplate>	
                <div class="field-list-header"></div>
                    <fieldset class="field-list delete-wiki-page">
                        <legend class="field-list-description"><span><TEControl:ResourceControl runat="server" ResourceName="Wikis_Page_Delete_NoChildren_Header" /></span></legend>
                        <ul class="field-list">
                            <li class="field-item delete-wiki-page">
                                <span class="field-item-input">
                                    <asp:LinkButton ID="ConfirmDelete" runat="server" CssClass="internal-link delete-post"><span></span><TEControl:ResourceControl runat="server" ResourceName="Yes" /></asp:LinkButton>
                                    <asp:LinkButton runat="server" CssClass="internal-link delete-post" OnClientClick="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(); return false;"><span></span><TEControl:ResourceControl runat="server" ResourceName="No" /></asp:LinkButton>
                                </span>
                            </li>
                        </ul>
                    </fieldset>
                <div class="field-list-footer"></div>
            </FormTemplate>
        </TEWiki:DeleteLeafPageForm>
    </asp:Panel>
	<asp:Panel ID="pnlChildren" runat=server Visible=false>
        <TEWiki:DeletePageForm runat="server" DeleteSinglePageButtonId="DeleteSinglePage" DeleteWithChildrenButtonId="DeleteWithChildren">
            <SuccessActions>
                <TEControl:ExecuteScriptAction runat="server" Script="CloseModal();" />
            </SuccessActions>
            <FormTemplate>	
                <div class="field-list-header"></div>
                    <fieldset class="field-list">
                        <legend class="field-list-description"><span><TEControl:ResourceControl runat="server" ResourceName="Wikis_Page_Delete_WithChildren_Header" /></span></legend>
                        <ul class="field-list">
                            <li class="field-item delete-wiki-page">
                                <span class="field-item-input">
                                    <asp:LinkButton ID="DeleteSinglePage" runat="server" CssClass="internal-link delete-post"><span></span><TEControl:ResourceControl runat="server" ResourceName="Wikis_Page_Delete_SingePage" /></asp:LinkButton>
                                    <asp:LinkButton ID="DeleteWithChildren" runat="server" CssClass="internal-link delete-post"><span></span><TEControl:ResourceControl runat="server" ResourceName="Wikis_Page_Delete_WithChildren" /></asp:LinkButton>
                                    <span class="processing" style="visibility: hidden;"></span>
                                    <asp:LinkButton runat="server" CssClass="internal-link cancel" OnClientClick="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(); return false;"><span></span><TEControl:ResourceControl runat="server" ResourceName="Cancel" /></asp:LinkButton>
                                </span>
                            </li>
                        </ul>
                    </fieldset>
                <div class="field-list-footer"></div>	
            </FormTemplate>
        </TEWiki:DeletePageForm>
	</asp:Panel>
</asp:Content>
