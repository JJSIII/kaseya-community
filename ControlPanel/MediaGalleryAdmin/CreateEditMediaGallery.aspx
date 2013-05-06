<%@ Page language="c#" Codebehind="CreateEditMediaGallery.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleryAdmin.CreateEditMediaGallery" MasterPageFile="~/ControlPanel/Masters/MediaGalleryAdmin.master" %>
<%@ Register TagPrefix="CP" TagName = "MediaGalleryDetails" Src = "~/ControlPanel/MediaGalleryAdmin/MediaGalleryEditControl.ascx" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<asp:literal id="RegionTitle" runat="server"></asp:literal>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">

    <TEControl:JQuery runat="server" />

    <script type="text/javascript">
    // <![CDATA[

        $(document).ready(function()
        {
            $('#<%= SaveButton.ClientID %>').click(function(e)
            {
                var groupLookUpTextBox = window.<%= ((GroupLookUpTextBox) CSControlUtility.Instance().FindControl(this, "GroupLookUp")).LookUpTextBoxClientID %>;
                if (groupLookUpTextBox)
                {
                    if (groupLookUpTextBox.GetSelectedLookUpCount() > 0 
                        && groupLookUpTextBox.GetSelectedLookUpByIndex(0).Value == '<%= GroupLookUpTextBox.GetGroupValue(Telligent.Evolution.Components.Groups.GroupService.GetRootGroup()) %>'
                        && !window.confirm('<%= Telligent.Evolution.Components.JavaScript.Encode(Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_MediaGalleryAdmin_MediaGalleryEditControl_ValidateInRootGroup")) %>')
                        )
                    {
                        if (e.stopPropagation)
                            e.stopPropagation();
                        else
                            e.cancelBubble = true;

                        if (e.preventDefault)
                            e.preventDefault();
                        else
                            e.returnValue = false;
                            
                        return false;
                    }
                }
            });
        });
    
    // ]]>
    </script>

    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="MediaGalleryCreateMediaGallery" />
	<div class="CommonDescription">
		<asp:literal id="RegionDescription" runat="Server" ></asp:literal> 
	</div>
	<CP:StatusMessage runat="server" id="Status" Visible="false"/>
	
	<CP:MediaGalleryDetails runat="server" id="MediaGalleryDetails" />
	<p class="PanelSaveButton DetailsFixedWidth">
		<cp:ResourceButton id="SaveButton" runat="Server" ResourceName="Save" />
	</p>
</asp:Content>