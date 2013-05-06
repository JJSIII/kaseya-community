<%@ Page language="c#" Codebehind="ManageScoreDecay.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Groups.ManageScoreDecay" MasterPageFile="~/ControlPanel/Masters/Groups.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl id="SectionDescription" runat="server" ResourceName="ManageScoreDecay_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">	
    <TEControl:JQuery ID="JQuery1" runat="server" />

    <CP:ControlPanelSelectedNavigation SelectedNavItem="ManageScoreDecay" runat="server" />
	<div class="CommonDescription">
        <cp:resourcecontrol runat="server" resourcename="ManageScoreDecay_Description" />
    </div>

    <CP:StatusMessage runat="server" ID="Status" />

    <div style="position: relative;" runat="server" id="ScoreManagement">
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
                <CP:ResourceControl runat="server" ResourceName="ManageScoreDecay_Decay" />
            </div>

            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td colspan="2"><div class="CommonFormFieldName">
                        <CP:ResourceControl runat="server" ResourceName="ManageScoreDecay_Decay_Description" />
                    </div></td>
                </tr>
                <tr>
                    <td class="CommonFormFieldName" colspan="2">
                        <CP:ResourceControl runat="server" ResourceName="ManageScoreDecay_Decay_HalfLife" Tag="Strong" />
                        <CP:ResourceControl runat="server" ResourceName="ManageScoreDecay_Decay_HalfLife_Description" Tag="Div" />
                    </td>
                </tr>
                <asp:Repeater ID="Applications" runat="server">
                    <ItemTemplate>
                        <tr data-applicationid="<%# Eval("ApplicationId") %>" class="decay <asp:Literal ID="NotSupportedStyle" runat="server" Text="not-supported" />">
                            <td class="CommonFormFieldName">
                                <strong><asp:Literal runat="server" ID="ApplicationName" /></strong>
                                <div style="font-size: 80%;"><asp:Literal runat="server" ID="ContentTypes" /></div>
                            </td>
                            <td class="CommonFormField">
                                <CP:ResourceControl ResourceName="ManageScoreDecay_UsingDefault" ID="UsingDefault" runat="server" Tag="Strong" CssClass="using-default" />
                                <asp:HyperLink ID="Override" runat="server" NavigateUrl="#" CssClass="add-override">
                                    <CP:ResourceControl ResourceName="ManageScoreDecay_Override" runat="server" />
                                </asp:HyperLink>
                                <asp:TextBox runat="server" ID="HalfLife" CssClass="override-value" Width="40px" />
                                <asp:HyperLink ID="Reset" runat="server" NavigateUrl="#" CssClass="reset-override">
                                    <CP:ResourceControl ResourceName="ManageScoreDecay_Reset" runat="server" />
                                </asp:HyperLink>
                                <CP:ResourceControl ResourceName="ManageScoreDecay_NotSupported" ID="NotSupported" runat="server"  />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <TEControl:Pager ID="ApplicationPager" runat="server">
                    <LeaderTemplate>
                        <tr><td colspan="2" style="text-align:center; padding: 8px 0;">
                    </LeaderTemplate>
                    <TrailerTemplate>
                        </td></tr>
                    </TrailerTemplate>
                </TEControl:Pager>
                <CP:ResourceControl ResourceName="ManageScoreDecay_OverrideMessage" runat="server" ID="OverridesEnabled">
                    <LeaderTemplate>
                        <tr>
                            <td colspan="2"><div class="CommonFormFieldName">
                    </LeaderTemplate>
                    <TrailerTemplate>
                            </div></td>
                        </tr>
                    </TrailerTemplate>
                </CP:ResourceControl>
            </table>            
         </div>
		 <div style="clear: both;"></div>
    </div>

    <script type="text/javascript">

        function callback(arg, success, error)
        {
            <%= ClientScript.GetCallbackEventReference(this, "arg", "success", null, "error", true) %>
        }

        jQuery(function() {
            var errorMessage = '<CP:ResourceControl ResourceName="ScoreDecayOverrides_AjaxError" runat="server" Encoding="JavaScript" />';
            var defaultDecayValue = '<ASP:Literal runat="server" ID="DefaultDecayValue" />';

            jQuery('.decay').each(function() {
                var t = jQuery(this);
                var i = jQuery('input', t).change(function() {
                    var i = jQuery(this);
                    if (isNaN(parseInt(i.val())) || parseInt(i.val()) <= 0 || parseInt(i.val()) != $.trim(i.val())) {
                        alert('<CP:ResourceControl ResourceName="ScoreDecayOverrides_InvalidValueError" runat="server" Encoding="JavaScript" />');
                        i.val(i.attr('original-value'));
                        return;
                    }
                    i.attr('disabled', 'disabled');
                    callback('event=update&applicationId=' + t.attr('data-applicationId') + '&value=' + parseFloat(i.val()), function(result) {
                        if (result != "1")
                            alert(errorMessage);
                        window.setTimeout(function() { i.removeAttr('disabled'); }, 999);
                        i.attr('original-value', i.val());
                    },
                    function() {
                        alert(errorMessage);
                        i.removeAttr('disabled');
                    });
                });
                i.attr('original-value', i.val());
                jQuery('a.add-override', t).click(function() {
                    i.removeAttr('disabled').val(defaultDecayValue);
                    jQuery('.override-value, .reset-override', t).show();
                    jQuery('.using-default, .add-override', t).hide();
                    return false;
                });
                jQuery('a.reset-override', t).click(function() {
                    i.attr('disabled', 'disabled');
                    callback ('event=reset&applicationId=' + t.attr('data-applicationId'), function(result) 
                    {
                        if (result == "1")
                        {
                            jQuery('.override-value, .reset-override', t).hide();
                            jQuery('.using-default, .add-override', t).show();
                        }
                        else
                        {
                            alert(errorMessage);
                            i.removeAttr('disabled');
                        }
                    }, 
                    function() 
                    {
                        alert(errorMessage); 
                        i.removeAttr('disabled');
                    });
                    return false;
                });
            });
        });
    
    </script>

</asp:Content>