<%@ Page language="c#" EnableViewState="true" Codebehind="SectionEdit.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.BlogAdmin.SectionEdit" MasterPageFile="~/ControlPanel/Masters/BlogAdmin.master" %>
<%@ Register TagPrefix="CP" TagName = "SectionDetails" Src = "~/ControlPanel/BlogAdmin/SectionEditControl.ascx" %>

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
                        && !window.confirm('<%= Telligent.Evolution.Components.JavaScript.Encode(Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_BlogAdmin_SectionEdit_ValidateInRootGroup")) %>')
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
    
	<CP:StatusMessage id="Status" runat="server"></CP:StatusMessage>
	
	<asp:Panel runat="server" ID="DescriptionPanel">
	<DIV class="CommonDescription">
		<asp:literal id="RegionDescription" runat="Server"></asp:literal> 
	</DIV>
	</asp:Panel>

	<CP:SectionDetails id="SectionDetails1" runat="Server"></CP:SectionDetails>
	<p class="PanelSaveButton">
		<cp:resourcebutton id="SaveButton" runat="server" resourcename="Save" />
	</p>
</asp:Content>