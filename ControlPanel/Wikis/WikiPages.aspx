<%@ Page language="c#" Codebehind="WikiPages.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.ManageWikis.WikiPages" MasterPageFile="~/ControlPanel/Masters/Wikis.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@Import Namespace="Telligent.Evolution.Wikis.Components" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="SectionDescription" runat="server" resourcename="CP_Wiki_WikiPageList_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <cp:controlpanelselectednavigation runat="server" SelectedNavItem="WikiPages" />
	<div class="CommonDescription">
		<cp:resourcecontrol id="Section_Sub_Description" runat="server" resourcename="CP_Wiki_WikiPageList_SubTitle" />
	</div>

    <div>
        <CP:ResourceControl resourcename="Feedback_Filter" runat="Server" id="FeedbackFilterLabel" />
        <asp:dropdownlist id="filterStatus" runat="server"></asp:dropdownlist>&nbsp;
        <CP:ResourceButton runat="server" resourcename="CP_ApplyFilter" id="filterButton" />
    </div>

	<asp:Repeater runat="server" id="WikiPageList">
        <HeaderTemplate>
            <TEControl:ConditionalContent runat="server">
	            <DisplayConditions>
	                <TEControl:ControlPropertyValueComparison runat="server" ComparisonControlId="WikiPageList" ComparisonProperty="Items" ComparisonValue="0" Operator="GreaterThan" />
	            </DisplayConditions>
	            <TrueContentTemplate>
                    <div class="CommonListArea">
	                    <table id="Listing" cellSpacing="0" cellPadding="0" border="0" width="100%">
		                    <thead>
			                    <tr>
				                    <th class="CommonListHeaderLeftMost">
					                    <cp:resourcecontrol runat="server" resourcename="CP_Wiki_GridCol_Title" />
				                    </th>
				                    <th class="CommonListHeader">
					                    <cp:resourcecontrol runat="server" resourcename="CP_Wiki_GridCol_Status" />
				                    </th>
				                    <th class="CommonListHeader">
					                    <cp:resourcecontrol runat="server" resourcename="CP_Wiki_GridCol_Comments" />
				                    </th>
				                    <th class="CommonListHeader">
					                    <cp:resourcecontrol runat="server" resourcename="CP_Wiki_GridCol_RevisionCount" />
				                    </th>
				                    <th class="CommonListHeader">
				                        &nbsp;	
			                        </th>
			                    </tr>
		                    </thead>
        	    </TrueContentTemplate>
		    </TEControl:ConditionalContent>
        </HeaderTemplate>
        <ItemTemplate>
                <tr>
                    <td class="CommonListCellLeftMost">
                        <CP:Hyperlink ID="TitleLink" runat="server" />
                    </td>
		            <td class="CommonListCell PostImageStatusCell">
                        <asp:Literal ID="PageStatus" runat="server" />
                    </td>
                    <td class="CommonListCell">
                        <asp:Literal ID="CommentCount" runat="server" />&nbsp;
                    </td>
                    <td class="CommonListCell">
                        <%# Eval("RevisionCount")%>&nbsp;
                    </td>
                    <td class="CommonListCell" nowrap="nowrap">
                        <input type="button" value="Edit" onclick="window.location = '<%# WikiUrls.Instance().Edit((Telligent.Evolution.Wikis.Components.Page)Container.DataItem) %>'" />
                       &nbsp;
                       <CP:ResourceButton runat="server" ID="DeleteButton" CommandArgument='<%# Eval("ID") %>' CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this wiki page?');" ResourceName="CP_PermissionList_Delete" />
                       <CP:ResourceButton runat="server" ID="UndeleteButton" CommandArgument='<%# Eval("ID") %>' CommandName="Undelete" ResourceName="CP_Wiki_Undelete" />
                    </td>
                </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
                <tr class="AltListRow">
                    <td class="CommonListCellLeftMost">
                        <CP:Hyperlink ID="TitleLink" runat="server" />
                    </td>
		            <td class="CommonListCell PostImageStatusCell">
                        <asp:Literal ID="PageStatus" runat="server" />
                    </td>
                    <td class="CommonListCell">
                        <asp:Literal ID="CommentCount" runat="server" />&nbsp;
                    </td>
                    <td class="CommonListCell">
                        <%# Eval("RevisionCount")%>&nbsp;
                    </td>
                    <td class="CommonListCell" nowrap="nowrap">
                        <input type="button" value="Edit" onclick="window.location = '<%# WikiUrls.Instance().Edit((Telligent.Evolution.Wikis.Components.Page)Container.DataItem) %>'" />
                       &nbsp;
                       <CP:ResourceButton runat="server" ID="DeleteButton" CommandArgument='<%# Eval("ID") %>' CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this wiki page?');" ResourceName="CP_PermissionList_Delete" />
                       <CP:ResourceButton runat="server" ID="UndeleteButton" CommandArgument='<%# Eval("ID") %>' CommandName="Undelete" ResourceName="CP_Wiki_Undelete" />
                    </td>
                </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
        <TEControl:ConditionalContent runat="server">
	            <DisplayConditions>
	                <TEControl:ControlPropertyValueComparison runat="server" ComparisonControlId="WikiPageList" ComparisonProperty="Items" ComparisonValue="0" Operator="GreaterThan" />
	            </DisplayConditions>
	            <TrueContentTemplate>
                        </table>
                    </div>
        	    </TrueContentTemplate>
		    </TEControl:ConditionalContent>
        </FooterTemplate>
	</asp:Repeater>
	
	<TEControl:ConditionalContent runat="server">
	    <DisplayConditions>
	        <TEControl:ControlPropertyValueComparison runat="server" ComparisonControlId="WikiPageList" ComparisonProperty="Items" ComparisonValue="0" Operator="EqualTo" />
	    </DisplayConditions>
	    <TrueContentTemplate>
	        <div class="CommonMessageWarning">
                <table>
                    <tr>
                        <td style="width:35px">
        		            <img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/spam.gif" />
                        </td>
                        
                        <td>
                            <CP:ResourceControl runat="server" ResourceName="CP_Wiki_WikiPageList_NoPages" />
                        </td>
                    </tr>
                </table>
            </div>
	    </TrueContentTemplate>
	</TEControl:ConditionalContent>
	
			
    <TEControl:Pager runat = "Server" id = "thePager" />
	
</asp:Content>