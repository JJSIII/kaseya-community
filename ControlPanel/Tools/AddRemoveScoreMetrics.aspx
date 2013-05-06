<%@ Page language="c#" Codebehind="AddRemoveScoreMetrics.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Settings.AddRemoveScoreMetrics" MasterPageFile="~/ControlPanel/Masters/Modal.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>

<asp:Content ContentPlaceHolderId="bcr" runat="Server">
    <script type="text/javascript">
        function Move(fromList, toList) {
            var itemIndex = fromList.GetSelectedIndex();
            var item = fromList.GetItemAtIndex(itemIndex);
            fromList.RemoveItem(item);
            toList.AddItem(item);
            fromList.Refresh();
            toList.Refresh();
        }
    </script>
	<div class="CommonContentArea">
		<div class="CommonContent">
			<cp:StatusMessage runat="server" id="statusMessage" />
			<table width="100%">
				<tr>
					<td>
						<CP:ResourceControl runat="server" ResourceName="AddRemoveScoreMetrics_AvailableMetrics" Tag="Div" CssClass="CommonFormFieldName" />
						<TWC:OrderedList runat="server" ID="availableMetrics" Width="200px" Height="250px" EnableMoveUpButton="false" EnableMoveDownButton="false" DraggableOrderedListIds="currentMetrics" />
					</td>
                    <td align="center">
                        <div style="padding-right: 8px;">
                            <p>
                                <input id="moveRight" type="button" value=" > " onclick="if (document.images) Move(window.<%= this.availableMetrics.ClientID %>,window.<%= this.currentMetrics.ClientID %>)"></p>
                            <p>
                                <input id="moveLeft" type="button" value=" < " onclick="if (document.images) Move(window.<%= this.currentMetrics.ClientID %>,window.<%= this.availableMetrics.ClientID %>)"></p>
                        </div>
                    </td>
					<td>
						<CP:ResourceControl runat="server" ResourceName="AddRemoveScoreMetrics_ActiveMetrics" Tag="Div" CssClass="CommonFormFieldName" />
						<TWC:OrderedList runat="server" ID="currentMetrics" Width="200px" Height="250px" DraggableOrderedListIds="availableMetrics" EnableMoveUpButton="false" EnableMoveDownButton="false" />
					</td>
				</tr>
			</table>

			<div class="CommonFormField PanelSaveButton">
				<CP:ResourceButton id="saveButton" runat="server" ResourceName="Save" />
			</div>
		</div>
	</div>
</asp:Content>