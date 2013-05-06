<%@ Page language="c#" Codebehind="SectionEdit.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Forums.SectionEdit" MasterPageFile="~/ControlPanel/Masters/ForumAdmin.master" %>
<%@ Register TagPrefix="CP" TagName="SectionEditControl" Src="~/ControlPanel/Forums/SectionEditControl.ascx" %>

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
                        && !window.confirm('<%= Telligent.Evolution.Components.JavaScript.Encode(Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Forums_SectionEdit_ValidateInRootGroup")) %>')
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
    
    <DIV>
		<CP:statusmessage id="administratorGroupWarning" runat="server"></CP:statusmessage>
	</DIV>

	<div class="CommonDescription">
		<asp:literal id="RegionDescription" runat="server"></asp:literal>
	</div>
	
	<cp:SectionEditControl id="SectionEdit1" runat="server" />
	<p class="PanelSaveButton DetailsFixedWidth">
		<cp:resourcebutton id="SaveButton" runat="server" resourcename="Save" />
	</p>
</asp:Content>