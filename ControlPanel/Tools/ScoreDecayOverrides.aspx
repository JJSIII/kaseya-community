<%@ Page language="c#" Codebehind="ScoreDecayOverrides.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Settings.ScoreDecayOverrides" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">
    <TEControl:JQuery runat="server" />

	<div class="CommonContentArea">
		<div class="CommonContent">

            <div class="CommonFormSubTitle">
                <CP:ResourceControl runat="server" ResourceName="ScoreDecayOverrides_Decay" />
            </div>
            <table cellspacing="0" border="0" cellpadding="0" width="100%">
                <TEControl:WrappedRepeater ID="Overrides" runat="server">
                    <ItemTemplate>
                        <tr data-applicationid="<%# Eval("ApplicationId") %>" class="decay">
                            <td class="CommonFormFieldName">
                                <strong><asp:Literal ID="ApplicationName" runat="server" /></strong> <asp:Literal ID="ContainerName" runat="server" />
                                <div style="font-size: 80%;"><asp:Literal ID="ContentTypes" runat="server" /></div>
                            </td>
                            <td class="CommonFormField" style="white-space: nowrap;">
                                <asp:TextBox ID="HalfLife" runat="server"  Width="40px" />
                            </td>
                            <td class="CommonFormField" style="white-space: nowrap;">
                                <asp:HyperLink ID="Reset" runat="server" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <NoneTemplate>
                        <tr>
                            <td colspan="2">
                                <CP:ResourceControl runat="server" ResourceName="ScoreDecayOverrides_NoOverrides" Tag="Div" CssClass="CommonMessageWarning" />                            
                            </td>
                        </tr>
                    </NoneTemplate>
                </TEControl:WrappedRepeater>
            </table>

            <div style="text-align: center;">
			    <TEControl:Pager runat="server" ID="Pager" />
            </div>

		</div>
	</div>

    <script type="text/javascript">

        function callback(arg, success, error)
        {
            <%= ClientScript.GetCallbackEventReference(this, "arg", "success", null, "error", true) %>
        }

        jQuery(function() {
            var errorMessage = '<CP:ResourceControl ResourceName="ScoreDecayOverrides_AjaxError" runat="server" Encoding="JavaScript" />'

            jQuery('.decay').each(function() {
                var t = jQuery(this);
                var i = jQuery('input', t).change(function() {
                    var i = jQuery(this);
                    if (isNaN(parseInt(i.val())) || parseInt(i.val()) <= 0 || parseInt(i.val()) != $.trim(i.val())) {
                        alert('<CP:ResourceControl ResourceName="ScoreDecayOverrides_InvalidValueError" runat="server" Encoding="JavaScript" />');
                        i.val(i.attr('original-value'));
                        return;
                    }
					if (i.attr('original-value') == i.val())
						return;
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
                })
				.keypress(function(e) {
					if (e.which == 13) {
						e.preventDefault();
						$(this).trigger('change');
					}
				});
                i.attr('original-value', i.val());
                jQuery('a', t).click(function() {
                    i.attr('disabled', 'disabled');
                    callback ('event=reset&applicationId=' + t.attr('data-applicationId'), function(result) 
                    {
                        if (result == "1")
                        {
                            t.fadeOut('fast', function() {
                                t.remove();
                                if (jQuery('.decay').length == 0)
                                    window.location.reload(true);
                            });
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