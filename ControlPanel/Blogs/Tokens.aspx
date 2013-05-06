<%@ Page language="c#" Codebehind="Tokens.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Blogs.TokensPage" MasterPageFile="~/ControlPanel/Masters/Blogs.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Blogs.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcelabel id="title" runat="server" resourcename="CP_Blog_TextParts_Title"></cp:resourcelabel>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <cp:controlpanelselectednavigation selectednavitem="TextParts" runat="server" id="SelectedNavigation1" />

    <script>
    function refreshPage(res)
    {
        refresh();
    }
    </script>

    <DIV class="CommonDescription">
	    <CP:ResourceControl runat="server" ResourceName="CP_Blog_TextParts_SubTitle" />
    </DIV>

    <div class="CommonFormArea" style="text-align: right;">
		<cp:ModalButton runat="server" Height="430" Width="480" Callback="refreshCallback" ResourceName="CP_Blog_TextParts_NewTextPart" id="NewTextPart" />
    </div>			
    			
    <div class="CommonListArea">
    <asp:Repeater runat = "Server" id = "theTokens">
    <HeaderTemplate>
	    <table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
        <thead>
            <tr>
            <th class="CommonListHeaderLeftMost" ><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Name" ID="Resourcecontrol3" NAME="Resourcecontrol3"/></th>
            <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Link" ID="Resourcecontrol4" NAME="Resourcecontrol4"/></th>
            <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Text" ID="Resourcecontrol5" NAME="Resourcecontrol4"/></th>
            <th class="CommonListHeader"><cp:resourcecontrol runat="server" resourcename="CP_Blog_GridCol_Actions" ID="Resourcecontrol7" NAME="Resourcecontrol4"/></th>
            </tr>
        </thead>
    </HeaderTemplate>
    <ItemTemplate>
	    <tr>
	    <td class="CommonListCellLeftMost"><%# DataBinder.Eval(Container.DataItem,"Token")%></td>
	    <td class="CommonListCell"><a href="<%# DataBinder.Eval(Container.DataItem,"Link")%>"><%# DataBinder.Eval(Container.DataItem,"Link")%></a></td>
	    <td class="CommonListCell"><%# DataBinder.Eval(Container.DataItem,"Text") %></td>
	    <td  class="CommonListCell" nowrap="nowrap">
	    
	    <cp:ModalButton runat="Server" Height="430" Width="480" callback="refreshCallback" resourcename="CP_Blog_GridCol_Edit" Url='<%# BlogUrls.Instance().ControlPanel_TokenForm(CurrentWeblog.SectionID, (int)DataBinder.Eval(Container.DataItem,"TokenID")) %>' />
	    <CP:ResourceButton CommandArgument='<%# DataBinder.Eval(Container.DataItem, "TokenID")%>' CommandName="Delete" Runat="server" ID = "DeleteButton" ResourceName="CP_Blog_GridCol_Delete"  /></td>
	    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
	    <tr class="AltListRow">
	    <td class="CommonListCellLeftMost"><%# DataBinder.Eval(Container.DataItem,"Token")%></td>
	    <td class="CommonListCell"><a href="<%# DataBinder.Eval(Container.DataItem,"Link")%>"><%# DataBinder.Eval(Container.DataItem,"Link")%></a></td>
	    <td class="CommonListCell"><%# DataBinder.Eval(Container.DataItem,"Text") %></td>
	    <td  class="CommonListCell" nowrap="nowrap">
	    <cp:ModalButton runat="Server" Height="430" Width="480" callback="refreshCallback" resourcename="CP_Blog_GridCol_Edit" Url = '<%# BlogUrls.Instance().ControlPanel_TokenForm(CurrentWeblog.SectionID, (int)DataBinder.Eval(Container.DataItem,"TokenID")) %>' />
	    <CP:ResourceButton CommandArgument='<%# DataBinder.Eval(Container.DataItem, "TokenID")%>' CommandName="Delete" Runat="server" ID = "DeleteButton" ResourceName="CP_Blog_GridCol_Delete"  /></td>
	    </tr>
    </AlternatingItemTemplate>

    <FooterTemplate>
	    </table>
    </FooterTemplate>
    </asp:Repeater>

    </div>
</asp:Content>