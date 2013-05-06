<%@ Page language="c#" Codebehind="Applications.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Groups._applications" MasterPageFile="~/ControlPanel/Masters/Groups.master" %>

<asp:Content ContentPlaceHolderId="TopLeft" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="Applications" runat="server" />
    
    <script type="text/javascript">

        function DeleteApplication(applicationID) {
            if (window.confirm('<CP:ResourceControl ResourceName="CP_Group_SubApplicationDeleteConfirmation" runat="server" Encoding="JavaScript" />'))
                Applications.DeleteApplication(applicationID, DeleteApplicationCallback);
        }

        function DeleteApplicationCallback(result) {
            if (result.error) {
                alert(result.error);
                return;
            }

            if (result.value) {
                eval(result.value);
            }
        }
    
    </script>

	<div class="CommonDescription">
		<CP:ResourceControl runat="server" ResourceName="CP_Group_SubApplications_Desc" />
	</div>

    <div class="CommonFormFieldName">
        <TEControl:WrappedRepeater runat="server" id="theApplications">
            <HeaderTemplate>
                <TEControl:ConditionalContent runat="server">
                    <DisplayConditions>
                        <TEControl:ControlPropertyValueComparison runat="server" ComparisonControlId="theApplications" ComparisonProperty="Items" ComparisonValue="0" Operator="GreaterThan" />
                    </DisplayConditions>
                    <TrueContentTemplate>
                        <table id="AppList" cellSpacing="0" cellPadding="0" border="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="CommonListHeaderLeftMost"><cp:resourcecontrol runat="server" resourcename="CP_Group_AppNameHeader" /></th>
                                    <th class="CommonListHeader" ><cp:resourcecontrol runat="server" resourcename="CP_Group_AppTypeHeader" /></th>
                                    <th class="CommonListHeader" colspan="2"><cp:resourcecontrol runat="server" resourcename="CP_Group_AppEnabledHeader" /></th>
                                </tr>
                            </thead>
                    </TrueContentTemplate>
                    <FalseContentTemplate>
                        MAH HAHAHAHA
                    </FalseContentTemplate>
                </TEControl:ConditionalContent>
            </HeaderTemplate>
            <ItemTemplate>
            <tr>
                <td class="CommonListCellLeftMost"><a href="<%# DataBinder.Eval(Container.DataItem, "Url") %>"><%# DataBinder.Eval(Container.DataItem, "Name") %></a></td>
                <td class="CommonListCell"><%# DataBinder.Eval(Container.DataItem, "Type") %></td>
                <td class="CommonListCell"><%# (bool)DataBinder.Eval(Container.DataItem, "Enabled") ? Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("Yes") : Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("No")%></td>
                <td class="CommonListCell">
                  <input type="button" onclick="window.location='<%# DataBinder.Eval(Container.DataItem, "EditPath") %>'; return false;" 
                        value="<%# Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_PermissionList_Edit") %>" />
                    <input type="button" onclick="DeleteApplication('<%# DataBinder.Eval(Container.DataItem, "UniqueId") %>'); return false;" 
                        value="<%# Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_PermissionList_Delete") %>" />
                </td>
            </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
            <tr class="AltListRow">
                <td class="CommonListCellLeftMost"><a href="<%# DataBinder.Eval(Container.DataItem, "Url") %>"><%# DataBinder.Eval(Container.DataItem, "Name") %></a></td>
                <td class="CommonListCell"><%# DataBinder.Eval(Container.DataItem, "Type") %></td>
                <td class="CommonListCell"><%# (bool)DataBinder.Eval(Container.DataItem, "Enabled") ? Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("Yes") : Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("No")%></td>
                <td class="CommonListCell">
                    <input type="button" onclick="window.location='<%# DataBinder.Eval(Container.DataItem, "EditPath") %>'; return false;" 
                        value="<%# Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_PermissionList_Edit") %>" />
                    <input type="button" onclick="DeleteApplication('<%# DataBinder.Eval(Container.DataItem, "UniqueId") %>'); return false;" 
                        value="<%# Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_PermissionList_Delete") %>"
                        <%# DataBinder.Eval(Container.DataItem, "Disabled") %>
                         />
                </td>
            </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                <TEControl:ConditionalContent runat="server">
                    <DisplayConditions>
                        <TEControl:ControlPropertyValueComparison runat="server" ComparisonControlId="theApplications" ComparisonProperty="Items" ComparisonValue="0" Operator="GreaterThan" />
                    </DisplayConditions>
                    <TrueContentTemplate>
                        </table>
                    </TrueContentTemplate>
                </TEControl:ConditionalContent>
            </FooterTemplate>
        </TEControl:WrappedRepeater>
        <TEControl:Pager runat="server" ID="appPager" PageSize="10" />
        <div style="padding-top: 4px;">
            <asp:PlaceHolder ID="NewApplicationButtonsArea" runat="server" />
        </div>
    </div>
	
</asp:Content>