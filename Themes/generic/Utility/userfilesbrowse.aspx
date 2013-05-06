<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/modal.Master" %>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <TEControl:Title runat="server" IncludeSiteName="false" EnableRendering="false" Tag="H1" CssClass="title">
        <ContentTemplate><TEControl:ResourceControl ResourceName="UserFilesBrowseableList_Name" runat="server"><Parameter1Template><TEControl:UserData runat="server" UseAccessingUser="true" Property="DisplayName" /></Parameter1Template></TEControl:ResourceControl></TEControl:ContentData></ContentTemplate>
    </TEControl:Title>
    
    <script type="text/javascript">
    // <![CDATA[
        function closeModal()
        {
            var opener = window.parent.Telligent_Modal.GetWindowOpener(window);
            opener.location = opener.location;
            setTimeout(function () {
                opener.Telligent_Modal.Close();
            }, 250);
        }

        var url = null;
        function ProcessUrl(cUrl)
        {
            url = cUrl;
            if (url != null && content != null && preview != null) {
                setTimeout(function () {
                    window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(new Array(content, url, preview));
                }, 250);
            }
        }

        var content = null;
        function ProcessContent(cContent)
        {
            content = cContent;
            content = content.replace(/<\/?a[^>]*>/ig, '');
            if (url != null && content != null && preview != null) {
                setTimeout(function () {
                    window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(new Array(content, url, preview));
                }, 250);
            }
        }

        var preview = null;
        function ProcessPreview(cContent)
        {
            preview = cContent;
            preview = preview.replace(/<\/?a[^>]*>/ig, '');
            if (url != null && content != null && preview != null) {
                setTimeout(function () {
                    window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(new Array(content, url, preview));
                }, 250);
            }
        }
    // ]]>
    </script>
    
    <TEControl:SelectContentForm runat="server" 
        ContentUrlSelectedClientFunction="ProcessUrl" 
        ContentSelectedClientFunction="ProcessContent" 
        ContentPreviewSelectedClientFunction="ProcessPreview"
        BrowseableListType="Telligent.Evolution.Components.Providers.UserFilesBrowseableList, Telligent.Evolution.Components"
        ItemsAreaHtmlGenericControlId="ItemsArea" 
        NavigationTreeId="Tree" 
        OptionsAreaHtmlGenericControlId="OptionsArea" 
        SelectButtonId="SelectButton"
        ErrorMessageTextId="ErrorMessage"
	    SuccessMessageTextId="SuccessMessage"
	    
        ItemCssClass="content-selector-item" 
	    SelectedItemCssClass="content-selector-item selected content-selector-item__selected" 
	    ItemNameCssClass="content-selector-item-name"
	    SelectedItemNameCssClass="content-selector-item-name selected  content-selector-item-name__selected"
	    ItemAreaCssClass="content-selector-item-wrapper"
	    >
        <FormTemplate>
            <TEControl:WrappedLiteral Tag="Div" CssClass="message success" ID="SuccessMessage" runat="server" />
            <TEControl:WrappedLiteral Tag="Div" CssClass="message error" ID="ErrorMessage" runat="server" />
        
            <table cellpadding="0" cellspacing="0">
                <tr valign="top">
		            <td>
		                <div id="treeArea"><TWC:Tree id="Tree" Width="150" Height="360" runat="server" /></div>
		            </td>
		            <td style=" width: 400px;">
		                <div runat="server" ID="ItemsArea" style="height: 180px; padding: 6px; overflow: auto; border: solid 1px #888; border-left-width: 0;"></div>
		                <div runat="server" ID="OptionsArea" style="height: 160px; overflow: hidden; padding: 4px 0 3px 0; border: solid 1px #888; border-top-width: 0; border-left-width: 0;"></div>
		            </td>
		        </tr>
		    </table>
            
            <div class="field-list-header"></div>
            <fieldset class="field-list">
                <ul class="field-list">
                    <li class="field-item">
                        <span class="field-item-input">
	                        <asp:LinkButton ID="SelectButton" CssClass="internal-link upload-file" Runat="server"><span></span><TEControl:ResourceControl runat="server" ResourceName="OK" /></asp:LinkButton>
	                        <asp:LinkButton CssClass="internal-link cancel" Runat="server" OnClientClick="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(); return false;"><span></span><TEControl:ResourceControl runat="server" ResourceName="Cancel" /></asp:LinkButton>
                        </span>
                    </li>
                </ul>
            </fieldset>
            <div class="field-list-footer"></div>
        </FormTemplate>
    </TEControl:SelectContentForm>
</asp:Content>
