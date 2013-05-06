<%@ Page language="c#" Codebehind="EmoticonFilter.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Tools.EmoticonFilter" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="CP_ContentFilter_Title"></cp:resourcecontrol>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ToolsContentFiltersEmoticon" />
    <div class="CommonDescription">
        <CP:ResourceControl ID="ResourceControl2" runat="server" ResourceName="CP_ContentFilter_Description" />
    </div>

            <div class="CommonFormDescription">
	            <cp:resourcecontrol runat="server" resourcename="CP_ContentFilter_EmoticonsDescription" />
            </div>
            
            <asp:datalist id="SmiliesList" runat="server" height="100%" width="100%">
			    <headertemplate>
				    <table id="tblManageSmilies" cellspacing="0" cellpadding="0" width="100%"
					    border="0">
					    <tr>
						    <th class="CommonListHeaderLeftMost">
							    <cp:resourcelabel runat="server" resourcename="Smiley_Code" />
							</th>
						    <th class="CommonListHeader">
							    <cp:resourcelabel runat="server" resourcename="Smiley_Image" />
							</th>
						    <th class="CommonListHeader">
							    <cp:resourcelabel runat="server" resourcename="Smiley_Description" />
							</th>
						    <th class="CommonListHeader">
							    &nbsp;
							</th>
					    </tr>
			    </headertemplate>
			    <itemtemplate>
				    <tr>
					    <td class="CommonListCellLeftMost">
						    <asp:label runat="server" id="SmileyCode" />
						</td>
					    <td class="CommonListCell">
						    <asp:image runat="server" id="SmileyImage" height="19" width="19" />
						</td>
					    <td class="CommonListCell">
						    <asp:label runat="server" id="SmileyText" />
						</td>
					    <td class="CommonListCell" nowrap="nowrap">
						    <asp:Button id="Edit" commandname="Edit" runat="server" />
						    <asp:Button id="Delete" commandname="Delete" runat="server" OnClientClick="javascript:return confirm('Are you sure you want to delete this emoticon?');" />
					    </td>
				    </tr>
			    </itemtemplate>
			    <AlternatingItemTemplate>
                    <tr class="AltListRow">
					    <td class="CommonListCellLeftMost">
						    <asp:label runat="server" id="SmileyCode" />
						</td>
					    <td class="CommonListCell">
						    <asp:image runat="server" id="SmileyImage" height="19" width="19" />
						</td>
					    <td class="CommonListCell">
						    <asp:label runat="server" id="SmileyText" />
						</td>
					    <td class="CommonListCell" nowrap="nowrap">
						    <asp:Button id="Edit" commandname="Edit" runat="server" />
						    <asp:Button id="Delete" commandname="Delete" runat="server" OnClientClick="javascript:return confirm('Are you sure you want to delete this emoticon?');" />
					    </td>
				    </tr>			    
			    </AlternatingItemTemplate>
			    <edititemtemplate>
				    <tr>
					    <td class="CommonListCellLeftMost">
						    <asp:textbox id="SmileyCodeEdit" runat="server" />
						</td>
					    <td class="CommonListCell">
					        <asp:textbox id="SmileyUrlEdit" runat="server" />
					    </td>
					    <td class="CommonListCell">
						    <asp:textbox id="SmileyTextEdit" runat="server" />
						</td>
					    <td class="CommonListCell" nowrap="nowrap">
						    <asp:Button id="Update" runat="server" commandname="Update" />
						    <asp:Button id="Cancel" runat="server" commandname="Cancel" />
					    </td>
				    </tr>
			    </edititemtemplate>
			    <footertemplate>
			    </table>
				<table>
				    <tr>
				        <td class="ContentFilterColumn" width="100px">
						    <cp:resourcelabel runat="server" resourcename="Smiley_Code" />
						</td>
						<td class="ContentFilterColumn" width="100px">
						    <cp:resourcelabel runat="server" resourcename="Smiley_Url" />
						</td>
					    <td class="ContentFilterColumn" width="100px">
						    <cp:resourcelabel runat="server" resourcename="Smiley_Description" />
						</td>
						<td width="100%">
						
						</td>
				    </tr>
				    <tr>
					    <td>
						    <asp:textbox runat="server" id="NewSmileyCode" />
						</td>
						<td>
						    <asp:textbox runat="server" id="NewSmileyUrl" />
						</td>
					    <td>
						    <asp:textbox runat="server" id="NewSmileyText" />
                        </td>
					    <td nowrap="nowrap">
						    <asp:Button runat="server" id="Create" commandname="Create" />
                        </td>
				    </tr>
            </table>
		    </footertemplate>
		    </asp:datalist>

</asp:Content>
