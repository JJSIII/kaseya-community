<%@ Page Language="c#" CodeBehind="MemberSearch.aspx.cs" AutoEventWireup="false"
    Inherits="Telligent.Evolution.ControlPanel.Membership.MemberSearch" MasterPageFile="~/ControlPanel/Masters/MembershipAdmin.master" %>

<%@ Import Namespace="Telligent.Evolution.Components" %>
<asp:Content ContentPlaceHolderID="DescriptionRegion" runat="server">
    <CP:ResourceControl runat="server" ResourceName="CP_Membership_Default_Title" />
</asp:Content>
<asp:Content ContentPlaceHolderID="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="BrowseMembers" runat="server" />
    <script type="text/javascript">
    <!--

        var actionsName = '<cp:resourcecontrol runat="server" resourcename="CP_MemberSearch_GridCol_Actions" />';
        var sUrl = unescape(window.location.pathname);
    -->
    </script>
    <div class="CommonFormArea">
        <CP:UserSearch ID="UserSearchControl" runat="Server" DestinationURL="MemberSearch.aspx">
            <SkinTemplate>
                <script type="text/javascript">
                    // <![CDATA[
                    joinedDateValue = new Date();
                    lastPostDateValue = new Date();

                    function LastPostDateComparerChange()
                    {
                        var dateComparerIndex = document.getElementById('<%=Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "lastPostDateComparer").ClientID%>').selectedIndex;
                        if (dateComparerIndex == 0)
                            document.getElementById('lastPostDateContainer').style.display = 'none';
                        else
                            document.getElementById('lastPostDateContainer').style.display = 'inline';
                    }

                    function JoinedDateComparerChange()
                    {
                        var dateComparerIndex = document.getElementById('<%=Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "joinedDateComparer").ClientID%>').selectedIndex;
                        if (dateComparerIndex == 0)
                            document.getElementById('joinedDateContainer').style.display = 'none';
                        else
                            document.getElementById('joinedDateContainer').style.display = 'inline';
                    }

                    function disableJoinedDate(DropDownList) 
                    {
	                    joinedDateValue = <%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "joinedDate").ClientID %>.DateTime;
                    }
                    
                    function disableLastPostDate(DropDownList) 
                    {
		                lastPostDateValue = <%= Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "lastPostDate").ClientID %>.DateTime;
                    }
                    
                    function toggleAdvancedOptions(toggleCheckbox)
                    {
                        var optionsContainer = document.getElementById("AdvancedSearchContainer");
                        if (optionsContainer == null)
                            return;
              
                        if (!toggleCheckbox.checked)
                            optionsContainer.style.display = 'none';
                        else
                            optionsContainer.style.display = 'block';
                    }
                    
                    function KeyDownHandler(event)
                    {
                        if (event.keyCode == 13)
                        {
                            <%= Page.GetPostBackClientEvent(Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "searchButton"), "") %>;
                        }
                    }

                    // ]]>
                </script>
                <asp:Panel runat="server" DefaultButton="searchButton">
                    <div class="CommonFormFieldName">
                        <CP:ResourceControl runat="server" ResourceName="CP_Membership_Default_Description" />
                    </div>
                    <div>
                        <asp:TextBox ID="searchText" runat="server" Columns="75" class="shorttxt" MaxLength="255"
                            onkeydown="KeyDownHandler(event);" />
                        <asp:Button ID="searchButton" runat="server" />
                    </div>
                    <p />
                    <input type="checkbox" onclick="toggleAdvancedOptions(this)"><CP:ResourceControl
                        ID="ResourceControl1" runat="server" ResourceName="CP_Membership_MoreOptions" />
                    </input>
                    <p />
                    <div id="AdvancedSearchContainer" style="display: none;">
                        <p />
                        <CP:ResourceControl runat="server" ResourceName="CP_Membership_Default_SearchOptions" />
                        <p />
                        <div class="CommonFormFieldName">
                            <CP:ResourceControl runat="server" ResourceName="CP_Membership_Default_UserSearchControl_SortBy" />
                        </div>
                        <div class="CommonFormField">
                            <CP:MemberSortDropDownList ID="memberSortDropDown" runat="server" />
                            <CP:SortOrderDropDownList ID="sortOrderDropDown" runat="server" />
                        </div>
                        <div class="CommonFormFieldName">
                            <CP:ResourceControl runat="server" ResourceName="CP_Membership_UserSearchControl_FilterByDate" />
                        </div>
                        <div class="CommonFormField">
                            <asp:DropDownList ID="joinedDateComparer" runat="server" />
                            <span id="joinedDateContainer">
                                <TWC:DateTimeSelector runat="server" ID="joinedDate" DateTimeFormat="MMMM d yyyy"
                                    ShowCalendarPopup="true" />
                            </span>
                            <asp:DropDownList ID="lastPostDateComparer" runat="server" />
                            <span id="lastPostDateContainer">
                                <TWC:DateTimeSelector runat="server" ID="lastPostDate" DateTimeFormat="MMMM d yyyy"
                                    ShowCalendarPopup="true" />
                            </span>
                        </div>
                        <div class="CommonFormFieldName">
                            <CP:ResourceControl runat="server" ResourceName="CP_Membership_UserSearchControl_Role" />
                        </div>
                        <div class="CommonFormField">
                            <asp:DropDownList ID="searchRole" runat="server" />
                        </div>
                        <div class="CommonFormFieldName">
                            <CP:ResourceControl runat="server" ResourceName="CP_Membership_UserSearchControl_Status" />
                        </div>
                        <div class="CommonFormField">
                            <CP:AccountStatusDropDownList EnableShowAll="true" ID="currentAccountStatus" runat="server" />
                        </div>
                        <div class="CommonFormFieldName" id="AdminRow1" runat="server">
                            <CP:ResourceControl runat="server" ResourceName="CP_Membership_UserSearchControl_SearchFor" />
                        </div>
                        <div class="CommonFormField">
                            <asp:DropDownList ID="searchType" runat="server" align="absmiddle" />
                        </div>
                    </div>
                    <div class="CommonFormFieldName">
                        <CP:ResourceLabel ID="DescResourceLabel" runat="server" ResourceName="CP_Membership_UserSearchControl_PageSize" />
                    </div>
                    <div class="CommonFormField">
                        <asp:DropDownList ID="pageList" runat="server">
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="20">20</asp:ListItem>
                            <asp:ListItem Value="30">30</asp:ListItem>
                            <asp:ListItem Value="40">40</asp:ListItem>
                            <asp:ListItem Value="50">50</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </asp:Panel>
            </SkinTemplate>
        </CP:UserSearch>
    </div>
    <CP:StatusMessage runat="server" ID="Status" Visible="false" />
    <asp:Panel runat="server" ID="UserResultsPanel">
        <CP:RepeaterPlusNone runat="server" ID="UserSearchResults">
            <HeaderTemplate>
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tr>
                        <th class="CommonListHeaderLeftMost">
                            <CP:ResourceControl runat="server" ResourceName="CP_MemberSearch_GridCol_Username" />
                        </th>
                        <th class="CommonListHeader" style="text-align: center;">
                            <CP:ResourceControl runat="server" ResourceName="CP_MemberSearch_GridCol_Email" />
                        </th>
                        <th class="CommonListHeader" style="text-align: center;">
                            <CP:ResourceControl runat="server" ResourceName="CP_MemberSearch_GridCol_Posts" />
                        </th>
                        <th class="CommonListHeader" style="text-align: center;">
                            <CP:ResourceControl runat="server" ResourceName="CP_MemberSearch_GridCol_Joined" />
                        </th>
                        <th class="CommonListHeader" style="text-align: center;">
                            &nbsp;
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td class="CommonListCellLeftMost">
                        <TEControl:ConditionalContent runat="server">
                            <ContentConditions><TEControl:CustomCondition CustomResult='<%# Eval("IsSystemAccount")%>' runat="server" /></ContentConditions>
                            <TrueContentTemplate>
                                <TEControl:UserData runat="server" Property="Username" />
                            </TrueContentTemplate>
                            <FalseContentTemplate>
                                <TEControl:UserData runat="server" Property="Username" LinkTo="Profile" />
                            </FalseContentTemplate>
                        </TEControl:ConditionalContent>
                    </td>
                    <td class="CommonListCell" style="text-align: center;">
                        <a href='mailto:<%# Eval("Email") %>'>
                            <%# Eval("Email") %></a>
                    </td>
                    <td class="CommonListCell" style="text-align: center;">
                        <a href='<%# Eval("SearchPostsUrl") %>'><%# AddCommentsToPosts((int)Eval("TotalPosts"),(int)Eval("UserID")) %></a>
                    </td>
                    <td class="CommonListCell" style="text-align: center;">
                        <%# Eval("DateCreated") %>
                    </td>
                    <td class="CommonListCell">
                        <input type="button" onclick="window.location = 'UserEdit.aspx?UserID=<%# Eval("UserID") %>';"
                            value="<%# ResourceManager.GetString("CP_UserEdit_EditUser", "ControlPanelResources.xml") %>" />
                        <% if (!CurrentCSContext.SiteSettings.EnableMultipleEvolutionSites)
                           { %>
                        <input type="button" onclick="javascript:Telligent_Modal.Open('UserName.aspx?UserID=<%# Eval("UserID") %>', 500, 300, refresh);"
                            value="<%# ResourceManager.GetString("CP_UserEdit_ChangeUserName", "ControlPanelResources.xml") %>" />
                        <% } %>
                        <input type="button" onclick="javascript:Telligent_Modal.Open('UserPassword.aspx?UserID=<%# Eval("UserID") %>', 500, 300, refresh);"
                            value="<%# ResourceManager.GetString("CP_UserEdit_ChangePassword", "ControlPanelResources.xml") %>" />
                        <input type="button" onclick="javascript:Telligent_Modal.Open('UserRoles.aspx?UserID=<%# Eval("UserID") %>', 500, 400, refresh);"
                            value="<%# ResourceManager.GetString("CP_UserEdit_ChangeRoles", "ControlPanelResources.xml") %>" />
                        <input type="button" onclick="javascript:Telligent_Modal.Open('UserDelete.aspx?UserID=<%# Eval("UserID") %>', 500, 300, refresh);"
                            value="<%# ResourceManager.GetString("CP_UserEdit_DeleteUser", "ControlPanelResources.xml") %>" />
                    </td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="AltListRow">
                    <td class="CommonListCellLeftMost">
                        <TEControl:ConditionalContent runat="server">
                            <ContentConditions><TEControl:CustomCondition CustomResult='<%# Eval("IsSystemAccount")%>' runat="server" /></ContentConditions>
                            <TrueContentTemplate>
                                <TEControl:UserData runat="server" Property="Username" />
                            </TrueContentTemplate>
                            <FalseContentTemplate>
                                <TEControl:UserData runat="server" Property="Username" LinkTo="Profile" />
                            </FalseContentTemplate>
                        </TEControl:ConditionalContent>
                    </td>
                    <td class="CommonListCell" style="text-align: center;">
                        <a href='mailto:<%# Eval("Email") %>'>
                            <%# Eval("Email") %></a>
                    </td>
                    <td class="CommonListCell" style="text-align: center;">
                        <a href='<%# Eval("SearchPostsUrl") %>'><%# AddCommentsToPosts((int)Eval("TotalPosts"),(int)Eval("UserID")) %></a>
                    </td>
                    <td class="CommonListCell" style="text-align: center;">
                        <%# Eval("DateCreated") %>
                    </td>
                    <td class="CommonListCell">
                        <input type="button" onclick="window.location = 'UserEdit.aspx?UserID=<%# Eval("UserID") %>';"
                            value="<%# ResourceManager.GetString("CP_UserEdit_EditUser", "ControlPanelResources.xml") %>" />
                        <% if (!CurrentCSContext.SiteSettings.EnableMultipleEvolutionSites)
                           { %>
                        <input type="button" onclick="javascript:Telligent_Modal.Open('UserName.aspx?UserID=<%# Eval("UserID") %>', 500, 300, refresh);"
                            value="<%# ResourceManager.GetString("CP_UserEdit_ChangeUserName", "ControlPanelResources.xml") %>" />
                        <% } %>
                        <input type="button" onclick="javascript:Telligent_Modal.Open('UserPassword.aspx?UserID=<%# Eval("UserID") %>', 500, 300, refresh);"
                            value="<%# ResourceManager.GetString("CP_UserEdit_ChangePassword", "ControlPanelResources.xml") %>" />
                        <input type="button" onclick="javascript:Telligent_Modal.Open('UserRoles.aspx?UserID=<%# Eval("UserID") %>', 500, 400, refresh);"
                            value="<%# ResourceManager.GetString("CP_UserEdit_ChangeRoles", "ControlPanelResources.xml") %>" />
                        <input type="button" onclick="javascript:Telligent_Modal.Open('UserDelete.aspx?UserID=<%# Eval("UserID") %>', 500, 300, refresh);"
                            value="<%# ResourceManager.GetString("CP_UserEdit_DeleteUser", "ControlPanelResources.xml") %>" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </CP:RepeaterPlusNone>
        <TEControl:Pager runat="Server" ID="csPager" />
    </asp:Panel>
    <script type="text/javascript">
    // <![CDATA[
        document.getElementById('<%=Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "lastPostDateComparer").ClientID%>').onchange = LastPostDateComparerChange;
        document.getElementById('<%=Telligent.Evolution.Controls.CSControlUtility.Instance().FindControl(this, "joinedDateComparer").ClientID%>').onchange = JoinedDateComparerChange;
        LastPostDateComparerChange();
        JoinedDateComparerChange();
    // ]]>
    </script>
</asp:Content>
