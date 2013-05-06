<%@ Page language="c#" Codebehind="FileCategories.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.MediaGalleries.FileCategories" MasterPageFile="~/ControlPanel/Masters/MediaGalleries.master" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.MediaGalleries.Components" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<CP:ResourceControl runat="server" resourcename="CP_MediaGalleries_FileCategories_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation SelectedNavItem="FileCategories" runat="server" id="SelectedNavigation1" />
	<div class="CommonDescription">
		<CP:ResourceControl runat="server" resourcename="CP_MediaGalleries_FileCategories_Description" />
	</div>
	
    <script language = "javascript" type="text/javascript">
     
      function reloadCategories()
      {
	    window.location = window.location;
      }
     
      function VerifyDelete()
      {
        return window.confirm('<%= Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_MediaGalleries_FileCategoryList_Delete") %>');
      }

    </script>

    <table cellpadding="0" cellspacing="0" border="0"  width="100%">
		<tr>
			<td align="right">
        	    <cp:ModalButton ModalType="Link" Height="300" Width="400" runat="Server" Callback="reloadCategories" id="NewCategory" ResourceName="CP_MediaGalleries_FileCategoryList_New" />
            </td>
        </tr>
    </table>

   
    <div class="CommonListArea">
		<TEControl:WrappedRepeater runat="Server" ShowHeaderFooterOnNone="false" id = "theCategories">
		<HeaderTemplate>
		<table id="CommentListing" cellSpacing="0" cellPadding="0" border="0" width="100%">
		<thead>
			<tr>
			    <th class="CommonListHeaderLeftMost"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleries_FileCategoryGrid_Name" /></th>
				<th class="CommonListHeader PostHeader"><cp:resourcecontrol runat="server" resourcename="CP_MediaGalleries_FileCategoryGrid_Posts" /></th>
                <th class="CommonListHeader">&nbsp;</th>
			</tr>
		</thead>
		</HeaderTemplate>
			<ItemTemplate>
			<tr>
			    <td class="CommonListCellLeftMost">
			        <a href='<%# Telligent.Evolution.MediaGalleries.Components.MediaGalleryUrls.Instance().TagsBrowser(CurrentMediaGallery, new string[] { Eval("Name").ToString() }) %>'><%# Eval("Name") %></a>
			    </td>
			    <td class="CommonListCell PostViewsCell">
		            <a href="<%#  MediaGalleryUrls.Instance().ControlPanel_FileList(CurrentMediaGallery.SectionID, Server.UrlEncode(DataBinder.Eval(Container.DataItem, "Name").ToString())) %>"><%# Eval("RelatedContentCount")%></a>
			    </td>
			    <td  class="CommonListCell">
				    <input type="button" onclick="javascript:Telligent_Modal.Open('<%# MediaGalleryUrls.Instance().ControlPanel_CategoryForm(CurrentMediaGallery.SectionID, Server.UrlEncode(DataBinder.Eval(Container.DataItem,"Name").ToString())) %>', 400, 300, reloadCategories);" value="<%# ResourceManager.GetString("CP_MediaGalleries_FileList_Edit", "ControlPanelResources.xml") %>" />
			        <cp:ResourceButton OnClientClick="return VerifyDelete();" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Name")%>' CommandName="Delete" Runat="server" ID = "DeleteButton" ResourceName="CP_MediaGalleries_FileList_Delete" Enabled="<%# HasDeletePermission %>" />
			    </td>
			  </tr>
			</ItemTemplate>
            <AlternatingItemTemplate>
            <tr class="AltListRow">
                <td class="CommonListCellLeftMost">
			        <a href='<%# Telligent.Evolution.MediaGalleries.Components.MediaGalleryUrls.Instance().TagsBrowser(CurrentMediaGallery, new string[] { Eval("Name").ToString() }) %>'><%# Eval("Name") %></a>
			    </td>
			    <td class="CommonListCell PostViewsCell">
		            <a href="<%#  MediaGalleryUrls.Instance().ControlPanel_FileList(CurrentMediaGallery.SectionID, Server.UrlEncode(DataBinder.Eval(Container.DataItem, "Name").ToString())) %>"><%# Eval("RelatedContentCount")%></a>
			    </td>
			    <td  class="CommonListCell">
				    <input type="button" onclick="javascript:Telligent_Modal.Open('<%# MediaGalleryUrls.Instance().ControlPanel_CategoryForm(CurrentMediaGallery.SectionID, Server.UrlEncode(DataBinder.Eval(Container.DataItem,"Name").ToString())) %>', 400, 300, reloadCategories);" value="<%# ResourceManager.GetString("CP_MediaGalleries_FileList_Edit", "ControlPanelResources.xml") %>" />
			        <cp:ResourceButton OnClientClick="return VerifyDelete();" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Name")%>' CommandName="Delete" Runat="server" ID = "DeleteButton" ResourceName="CP_MediaGalleries_FileList_Delete" Enabled="<%# HasDeletePermission %>" />
			    </td>
			  </tr>
			</AlternatingItemTemplate>			
			
			<FooterTemplate>
			    </table>
			</FooterTemplate>

            <NoneTemplate>
                <div class="CommonMessageWarning">
                    <table>
                        <tr>
                            <td style="width:35px">
            		            <img src="<%=SiteUrls.Instance().Locations["ControlPanel"]%>images/comment/spam.gif" />
                            </td>
                            
                            <td>
                                <CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_MediaGalleries_FileCategoryGrid_NoCategories" />
                            </td>
                        </tr>
                    </table>
                </div>
            </NoneTemplate>		
        </TEControl:WrappedRepeater>
			
        <TEControl:Pager runat = "Server" id = "thePager" />
        
	</div>	
	
</asp:Content>