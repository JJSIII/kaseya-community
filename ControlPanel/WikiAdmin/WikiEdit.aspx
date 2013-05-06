<%@ Page language="c#" Codebehind="WikiEdit.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.WikiAdmin.WikiEdit" MasterPageFile="~/ControlPanel/Masters/WikiAdmin.master" %>
<%@ Register TagPrefix="CP" TagName="AppRoles" Src="~/ControlPanel/GroupAdmin/AppRoles.ascx" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<asp:literal id="RegionTitle" runat="server"></asp:literal>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <cp:controlpanelselectednavigation runat="server" SelectedNavItem="WikiList" />
    
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
                        && !window.confirm('<%= Telligent.Evolution.Components.JavaScript.Encode(Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Wiki_WikiEdit_ValidateInRootGroup")) %>')
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
    
	<div class="CommonDescription">
		<asp:literal id="RegionDescription" runat="server"></asp:literal>
	</div>
	
    <cp:statusmessage id="Status" runat="server"></cp:statusmessage>
    <TWC:TabbedPanes id="TabStrip" runat="server"
	    PanesCssClass="CommonPane"
	    TabSetCssClass="CommonPaneTabSet"
	    TabCssClasses="CommonPaneTab"
	    TabSelectedCssClasses="CommonPaneTabSelected"
	    TabHoverCssClasses="CommonPaneTabHover"
	    >
	    <TWC:TabbedPane runat="server">
		    <Tab><CP:ResourceControl runat="server" ResourceName="CP_Wiki_WikiEdit_Tab_Basic" /></Tab>
		    <Content>
		    <table cellspacing="0" cellpadding="2" border="0">
            <asp:Label runat="server" ID="WikiLicensingRestriction" Visible="false">
                <tr valign="top">
                    <td colspan="2">
                        <cp:resourcecontrol runat="Server" CssClass="CommonLicenseRestrictionMessage" resourcename="Admin_SiteSettings_ApplicationDisabled_DueToLicensing" />
                    </td>
                </tr>
            </asp:Label>
            <asp:Label runat="server" ID="WikiDisabled" Visible="false">
                <tr valign="top">
                    <td colspan="2">
                        <cp:resourcecontrol runat="Server" CssClass="CommonLicenseRestrictionMessage" resourcename="Admin_SiteSettings_ApplicationDisabled" />
                    </td>
                </tr>
            </asp:Label>
	        <tr vAlign="top">
		        <td class="CommonFormFieldName">
			        <strong><CP:FORMLABEL id="Formlabel4" runat="Server" resourcename="CP_Wiki_WikiEdit_Name" controltolabel="WikiName" /></strong>
			        <br />
			        <CP:ResourceControl runat="Server" resourcename="CP_Wiki_WikiEdit_Name_Detail" />
		        </td>
		        <td class="CommonFormField">
			        <asp:textbox id="WikiName" columns="50" runat="server" maxlength="256" />
			        <asp:requiredfieldvalidator id="SectionNameValidator" runat="server" controltovalidate="WikiName"><CP:ResourceControl runat="server" ResourceName="CP_Wiki_WikiEdit_Name_Required" /></asp:requiredfieldvalidator>
			        <asp:RegularExpressionValidator ValidationExpression="^.*[^\s]+.*$" 
                             ControlToValidate="WikiName" Display="dynamic"
                             ErrorMessage="<br/>Name does not contain an alphanumeric character." runat="server" />
		        </td>
	        </tr>
	        <tr>
		        <td class="CommonFormFieldName" style="width:350px">
			        <strong><CP:FORMLABEL id="Formlabel17" runat="Server" resourcename="CP_Wiki_WikiEdit_AppKey" controltolabel="AppKey" /></strong>
			        <br />
			        <CP:ResourceControl runat="Server" resourcename="CP_Wiki_WikiEdit_AppKey_Detail" />
		        </td>
		        <td class="CommonFormField">
			        <asp:textbox id="AppKey" runat="server"  columns="50" maxlength="256" />
			        <asp:CustomValidator id="AppKeyValidator" runat="server"><CP:ResourceControl runat="server" ResourceName="CP_Wiki_WikiEdit_InvalidUrl" /></asp:CustomValidator>
		        </td>
	        </tr>
		    <tr>
			    <td class="CommonFormFieldName" valign="top">
				    <strong><cp:resourcelabel runat="server" resourcename="CP_Wiki_WikiEdit_Description" /></strong><br />
				    <cp:resourcecontrol runat="Server" resourcename="CP_Wiki_WikiEdit_Description_Detail" /></td>
			    <td class="CommonFormField">
				    <asp:textbox id="Description" runat="server" columns="40" maxlength="256"></asp:textbox>
					<asp:customvalidator id="DescriptionValidator" runat="server" controltovalidate="Description" font-bold="True">
				        <CP:ResourceControl runat="server" ResourceName="CP_DescriptionLengthValidation" /></asp:customvalidator>
                </td>
		    </tr>
		    <tr>
			    <td class="CommonFormFieldName">
				    <strong><cp:resourcelabel runat="server" resourcename="CP_Wiki_WikiEdit_Group" /></strong><br />
				    <cp:resourcecontrol runat="Server" resourcename="CP_Wiki_WikiEdit_Group_Detail" /></td>
			    <td class="CommonFormField">
					 <asp:literal id="GroupValue" runat="server"></asp:literal>
				    <TEControl:GroupLookUpTextBox ID="GroupLookUp" runat="server" RequiredGroupPermission="Group_CreateWiki" MaximumSelections="1" />
				    <asp:CustomValidator id="ParentGroupValidator" runat="server" controltovalidate="GroupLookUp">*</asp:CustomValidator>
			    </td>
		    </tr>
		    <tr>
			    <td class="CommonFormFieldName" nowrap="nowrap">
				    <strong><cp:resourcelabel runat="server" resourcename="CP_Wiki_WikiEdit_Enabled" /></strong><br />
				    <cp:resourcecontrol runat="Server" resourcename="CP_Wiki_WikiEdit_Enabled_Detail" /></td>
			    <td class="CommonFormField">
				    <cp:yesnoradiobuttonlist id="Enabled" runat="server"  repeatcolumns="2"></cp:yesnoradiobuttonlist></td>
		    </tr>
		    </table>
		    </Content>
	    </TWC:TabbedPane>
	    
	    <TWC:TabbedPane ID="PermissionsTab" runat="server">
			<Tab><CP:ResourceControl runat="server" ResourceName="CP_BlogAdmin_SectionEdit_Tab_Permissions" /></Tab>
			<Content>
				<CP:AppRoles id="AppRoles" runat="server" />
			</Content>
		</TWC:TabbedPane>
    </TWC:TabbedPanes>

	<p class="PanelSaveButton DetailsFixedWidth">
		<cp:resourcebutton id="SaveButton" runat="server" resourcename="Save" />
	</p>
</asp:Content>