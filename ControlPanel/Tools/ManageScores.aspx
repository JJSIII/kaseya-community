<%@ Page language="c#" Codebehind="ManageScores.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Settings.ManageScores" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl id="SectionDescription" runat="server" ResourceName="ManageScores_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">	
    <cp:controlpanelselectednavigation selectednavitem="ManageScores" runat="server" />
	<div class="CommonDescription">
        <cp:resourcecontrol runat="server" resourcename="ManageScores_SubTitle" />
    </div>

    <TEControl:JQuery runat="server" />
    <TEControl:JQueryEvolution runat="server" />
    <TEControl:Script runat="server" Src="~/ControlPanel/Tools/jquery-ui-1.8.17.slider.min.js" EnableFileDateVersioning="true" />

    <cp:statusmessage runat="server" id="Status" />

    <div style="position: relative;" runat="server" id="ScoreManagement" class="score-management">
        <div style="float: left; width: 280px; overflow: hidden; text-overflow: ellipsis;">
            <asp:Repeater ID="Scores" runat="server">
                <ItemTemplate>
                    <%# ((Guid)Eval("Id")) == CurrentScoreId ? "<div style=\"background-color: #D8E5FF;\">" : "<div>"%>
                        <asp:HyperLink ID="ScoreLink" runat="server" style="text-decoration: none; color: inherit; display: block; padding: 8px 8px 16px 8px; border-top: solid 1px #ccc;">
                            <strong><asp:Literal ID="ScoreName" runat="server" /></strong>
                            <span style="display: block;"><asp:Literal ID="ScoreDescription" runat="server" /></span>
                        </asp:HyperLink>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div style="padding: 8px; border-top: solid 1px #ccc; border-bottom: solid 1px #ccc;">
                <CP:ResourceControl runat="server" ResourceName="ManageScores_Scores_GetMoreScores" />
            </div>
        </div>
        <div style="padding-left: 300px;" runat="server" id="ScoreContainer">
            <div class="CommonFormSubTitle" style="position: relative;">
                <div style="position: absolute; right: 10px; top: 4px;">
                    <CP:YesNoRadioButtonList runat="server" ID="EnableDecay" RepeatDirection="Horizontal" YesResourceName="OnOffList_On" NoResourceName="OnOffList_Off" />    
                </div>
                <CP:ResourceControl runat="server" ResourceName="ManageScores_Decay" />
            </div>

            <table cellpadding="0" cellspacing="0" border="0" width="100%" id="DecayConfiguration">
                <tr>
                    <td class="CommonFormFieldName" colspan="2">
                        <CP:ResourceControl runat="server" ResourceName="ManageScores_Decay_Description" />
                    </td>
                </tr>
                <tr>
                    <td class="CommonFormFieldName">
                        <CP:ResourceControl runat="server" ResourceName="ManageScores_Decay_HalfLife" Tag="Strong" />
                        <CP:ResourceControl runat="server" ResourceName="ManageScores_Decay_HalfLife_Description" Tag="Div" />
                    </td>
                    <td class="CommonFormField" style="text-align: right;">
                        <asp:TextBox runat="server" ID="HalfLife" Columns="4" />
                        <asp:RangeValidator runat="server" MinimumValue="1" MaximumValue="20000" ErrorMessage="*" Font-Bold="true" ControlToValidate="HalfLife" Type="Integer" />
                    </td>
                </tr>
                <TEControl:WrappedLiteral runat="server" ID="DecayOverrides">
                    <LeaderTemplate>
                        <tr>
                            <td class="CommonFormFieldName" colspan="2">
                    </LeaderTemplate>
                    <TrailerTemplate>
                            </td>
                        </tr>
                    </TrailerTemplate>
                </TEControl:WrappedLiteral>
                <tr>
                    <td class="CommonFormFieldName">
                        <CP:ResourceControl runat="server" ResourceName="ManageScores_Decay_EnableOverrides" />        
                    </td>
                    <td class="CommonFormField" style="text-align: right;">
                        <CP:YesNoRadioButtonList runat="server" ID="EnableGroupDecayConfiguration" RepeatDirection="Horizontal" />         
                    </td>
                </tr>
            </table>            
    
            <div class="CommonFormSubTitle">
                <CP:ResourceControl runat="server" ResourceName="ManageScores_Weight" />
            </div>
            <table cellspacing="0" border="0" cellpadding="0" width="100%">
                <tr>
                    <td class="CommonFormFieldName" colspan="2">
                        <CP:ResourceControl ID="ResourceControl4" runat="server" ResourceName="ManageScores_Weight_Description" />
                    </td>
                </tr>
                <asp:Repeater ID="Weights" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td class="CommonFormFieldName">
                                <asp:Literal ID="MetricId" runat="server" Visible="false" />
                                <strong><asp:Literal ID="MetricName" runat="server" /></strong>
                                <div><asp:Literal ID="MetricDescription" runat="server" /></div>
                            </td>
                            <td class="CommonFormField">
                                <div style="float: right;">
                                    <table cellspacing="0" border="0" cellpadding="0">
                                        <td valign="bottom" style="padding: 0 12px 14px 0;"><CP:ResourceControl runat="server" ResourceName="ManageScores_Weight_Label_Off" /></td>
                                        <td>
                                            <table cellpadding="0" cellspacing="0" border="0" style="width: 250px; margin:0 0 4px 0;">
                                                <tr>
                                                    <td align="center" width="33%"><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="ManageScores_Weight_Label_Less" /></td>
                                                    <td align="center" width="33%"><CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="ManageScores_Weight_Label_Normal" /></td>
                                                    <td align="center" width="33%"><CP:ResourceControl ID="ResourceControl3" runat="server" ResourceName="ManageScores_Weight_Label_More" /></td>
                                                </tr>
                                            </table>
                                            <div class="slider">
                                                <div class="ui" style="width:250px;"></div>
                                                <asp:TextBox ID="Weight" runat="server" />
                                            </div>
                                            <asp:RangeValidator runat="server" Type="Double" MinimumValue="0" MaximumValue="1" ErrorMessage="*" Font-Bold="true" ControlToValidate="Weight" />
                                        </td>
                                    </table>
                                </div>
                                <div style="clear: right;"></div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td class="CommonFormFieldName">
                        <CP:ResourceControl runat="server" ResourceName="ManageScores_WeightCannotBeOverridden" />                            
                    </td>
                    <td class="CommonFormField" style="text-align: right;">
                        <CP:ResourceLinkButton ID="AddRemoveMetrics" runat="server" ResourceName="ManageScores_AddRemoveMetrics" CssClass="CommonTextButton" />                    
                    </td>
                </tr>
            </table>
        </div>
		<div style="clear: both;"></div>
    </div>

	<div class="PanelSaveButton">
	    <cp:resourcebutton id="SaveButton" runat="server" resourcename="Save" />
	</div>

    <script type="text/javascript">

        jQuery(function () {
            jQuery('.score-management input').change(function () {
                jQuery.telligent.evolution.navigationConfirmation.enable();
            });

            jQuery('#<%= SaveButton.ClientID %>').click(function () {
                jQuery.telligent.evolution.navigationConfirmation.ignoreClick();
                return true;
            });

            jQuery('#<%= EnableDecay.ClientID %> input').change(function () {
                if (jQuery(this).val() == 'True') {
                    jQuery('#DecayConfiguration *').removeAttr('disabled');
                } else {
                    jQuery('#DecayConfiguration *').attr('disabled', 'disabled');
                }
            });

            if (jQuery('#<%= EnableDecay.ClientID %> input:checked').val() == 'True') {
                jQuery('#DecayConfiguration *').removeAttr('disabled');
            } else {
                jQuery('#DecayConfiguration *').attr('disabled', 'disabled');
            }

            jQuery('.slider').each(function () {
                var t = jQuery(this);
                var i = jQuery('input', t);
                var s = jQuery('.ui', t).slider({
                    range: false,
                    min: 0,
                    max: 1,
                    step: .166,
                    value: i.val(),
                    change: function (event, ui) {
                        jQuery.telligent.evolution.navigationConfirmation.enable();
                        i.val(s.slider('value'));
                    }
                });
                i.hide();
            });
        });

    </script>

</asp:Content>