<%@ Page language="c#" Codebehind="FilesBrowseModal.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.FilesBrowseModal" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="server">
    <script type="text/javascript">
    // <![CDATA[
    function closeModal()
    {
        window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close();
    }

    var url = null;
    function ProcessUrl(cUrl)
    {
        url = cUrl;
	    if (url != null && content != null)
	        window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(new Array(content, url));
    }

    var content = null;
    function ProcessContent(cContent)
    {
        content = cContent;
        content = content.replace(/<\/?a[^>]*>/ig, '');
        if (url != null && content != null)
            window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(new Array(content, url));
    }

    // ]]>
    </script>
    <div class="CommonContentArea">
    <div class="CommonContent">
    <TEControl:SelectContentForm runat="server" 
        ContentUrlSelectedClientFunction="ProcessUrl" 
        ContentSelectedClientFunction="ProcessContent" 
        BrowseableListType="Telligent.Evolution.Blogs.Providers.WeblogFilesBrowseableList, Telligent.Evolution.Blogs"
        ItemsAreaHtmlGenericControlId="ItemsArea" 
        NavigationTreeId="Tree" 
        OptionsAreaHtmlGenericControlId="OptionsArea" 
        SelectButtonId="SelectButton"
        ItemCssClass="CommonContentSelectorItem" 
	    SelectedItemCssClass="CommonContentSelectorItemSelected" 
	    ItemNameCssClass="CommonContentSelectorItemName"
	    SelectedItemNameCssClass="CommonContentSelectorItemNameSelected"
	    ItemAreaCssClass="CommonContentSelectorItemArea"
	    ErrorMessageTextId="ErrorMessage"
	    SuccessMessageTextId="SuccessMessage"
	    >
        <FormTemplate>
            <TEControl:WrappedLiteral Tag="Div" CssClass="CommonMessageSuccess" ID="SuccessMessage" runat="server" />
            <TEControl:WrappedLiteral Tag="Div" CssClass="CommonMessageError" ID="ErrorMessage" runat="server" />
        
		    <div>
		        <table cellpadding="0" cellspacing="0" border="0" width="100%">
		            <tr valign="top"><td width="33%"><div class="CommonContentSelectorTreeArea" id="treeArea">
			        <TWC:Tree id="Tree" Width="100%" Height="100%" runat="server"  />
		        </div></td>
		            <td width="60%">
		                <div class="CommonContentSelectorItemsArea" id="itemsArea"><div runat="server" ID="ItemsArea"></div></div>
		                <div class="CommonContentSelectorOptionsArea" id="optionsArea"><div runat="server" id="OptionsArea"></div></div>
		            </td></tr></table>        
            </div>
            <div class="CommonContentSelectorButtonArea">
	            <TEControl:ResourceLinkButton ID="SelectButton" Runat="server" ResourceName="OK" CssClass="CommonTextButton" />
	            <TEControl:ResourceLinkButton Runat="server" ResourceName="Cancel" OnClientClick="window.parent.Telligent_Modal.GetWindowOpener(window).Telligent_Modal.Close(); return false;" CssClass="CommonTextButton" />
            </div>
        </FormTemplate>
    </TEControl:SelectContentForm>
    </div>
    </div>

    <script type="text/javascript">
// <![CDATA[

function resizeContent()
{
    try
    {
        var optionsArea = document.getElementById('optionsArea');
        var itemsArea = document.getElementById('itemsArea');
        var treeArea = document.getElementById('treeArea');

        if (optionsArea.childNodes[0].innerHTML == '')
        {
            optionsArea.style.display = 'none';
            itemsArea.style.height = '322px';
        }
        else
        {
            optionsArea.style.display = 'block';
            itemsArea.style.height = (316 - optionsArea.offsetHeight) + 'px';
        }
        
        <%= CSControlUtility.Instance().FindControl(this, "Tree").ClientID %>.Resize(treeArea.offsetWidth - 4, treeArea.offsetHeight - 4);
    }
    catch (e) {}
}

setInterval(resizeContent, 249);

// ]]>
</script>
</asp:Content>