
<%@ Page language="c#" Codebehind="ManageLicenses.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Tools.ManageLicenses" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>
<%@ Import Namespace="Telligent.Registration" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="CP_Tools_ManageLicenses_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
<script type="text/javascript">
    // <![CDATA[

	function UnregisterServer(serverName) {
		if (serverName == null || serverName == '')
			return;

		if (window.confirm('<CP:ResourceControl ResourceName="CP_Tools_ManageLicenses_ServerList_RegisteredServers_Confirmation" runat="server" Encoding="JavaScript" />'.replace('{0}', serverName))) {
		//<CP:ResourceControl ResourceName="CP_Tools_ManageLicenses_ServerList_RegisteredServers_Confirmation" runat="server" Encoding="JavaScript" />')) {
			ManageLicenses.UnregisterServer(serverName);
			refresh();
		}
	}
    
    // ]]>
    </script>
    
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ToolsLicenses" />
	<div class="CommonDescription">
		<cp:resourcecontrol id="Resourcecontrol1" runat="Server" resourcename="CP_Tools_ManageLicenses_Description" />
	</div>
	<cp:StatusMessage runat="server" id="Status" Visible="false" />
	
	<table cellspacing="0" border="0" cellpadding="0" width="100%">
		<tr>
			<td>
				<table cellspacing="0" border="0" cellpadding="0">
					<tr>
						<td class="CommonFormFieldName"><cp:ResourceControl runat="server" resourceName="CP_Tools_ManageLicenses_UploadLicenseFile" /></td>
						<td class="CommonFormField">
							<input type="file" runat="server" id="LicenseFile" />
						</td>
						<td class="CommonFormField">
							<asp:Button runat="server" id="UploadLicense" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<cp:RepeaterPlusNone id="Products" runat="server">
		<headertemplate>
			<table cellspacing="0" cellpadding="0" border="0" width="100%">
			<thead>
			<tr>
				<td class="CommonListHeaderLeftMost" width="300">
					<cp:resourcecontrol runat="Server" resourcename="CP_Tools_ManageLicenses_ProductList_Product" />
				</td>
				<td class="CommonListHeader">
					<cp:resourcecontrol runat="Server" resourcename="CP_Tools_ManageLicenses_ProductList_LicenseInstalled" ID="Resourcecontrol3"/>
				</td>
			</tr>
			</thead>
			<tbody>
		</headertemplate>
		<itemtemplate>
			<tr>
				<td class="CommonListCellLeftMost" valign="top" width="50%" id="Col1" runat="server">
					<b><cp:ResourceControl runat="server" resourceName="CP_Tools_ManageLicenses_Name" />:</b> <asp:Literal id="Name" runat="server" /><br />
					<b><cp:ResourceControl runat="server" resourceName="CP_Tools_ManageLicenses_Email" />:</b> <asp:Literal id="Email" runat="server" /><br/>
					<b><cp:ResourceControl runat="server" resourceName="CP_Tools_ManageLicenses_Company" />:</b> <asp:Literal id="Company" runat="server" /><br />
					<b><cp:ResourceControl runat="server" resourceName="CP_Tools_ManageLicenses_LicenseKey" />:</b> <asp:Literal id="LicenseID" runat="server" /><br />
					<b><cp:ResourceControl runat="server" resourceName="CP_Tools_ManageLicenses_Installed" />:</b> <asp:Literal id="InstalledDate" runat="server" /><br />
					<asp:Placeholder id="EnvironmentArea" runat="server">
						<b><cp:ResourceControl runat="server" resourceName="CP_Tools_ManageLicenses_Environment" />:</b> <asp:Literal id="Environment" runat="server" /><br />
					</asp:Placeholder>
					<asp:Placeholder id="LeasedArea" runat="server">
						<b><i><cp:ResourceControl runat="server" resourceName="CP_Tools_ManageLicenses_Leased" /></i></b><br />
					</asp:Placeholder>
                    <asp:Placeholder ID="Expired" runat="server" Visible="false"><div class="CommonLicenseMessageError"><asp:Literal ID="ExpiredMessages" runat="server" /></div></asp:Placeholder>
       				<asp:LinkButton id="Delete" runat="server" CssClass="CommonTextButton" />                    
				</td>
				<td class="CommonListCell" valign="top" width="50%" id="Col2" runat="server">
					<CP:RepeaterPlusNone ID="Licenses" runat="server">
						<ItemTemplate>
							<b><asp:Literal id="ProductName" runat="server" /></b><br />
							<cp:ResourceControl runat="server" resourceName="CP_Tools_ManageLicenses_Version" />: <asp:Literal id="ProductVersion" runat="server" /><br />
							<span style="color: Red" id="Expires" runat="server"><cp:ResourceControl runat="server" resourceName="CP_Tools_ManageLicenses_Expires" />: <asp:Literal id="ExpirationDate" runat="server" /></span>
							<span style="color: Red" id="Inactive" runat="server"><cp:ResourceControl runat="server" resourceName="CP_Tools_ManageLicenses_Inactive" /></span>
							<asp:Label ID="Errors" runat="server" ForeColor="Red" />
							<ul>
								<asp:Literal id="ProductAttributes" runat="server" />
							</ul>
						</ItemTemplate>
					</CP:RepeaterPlusNone>
				</td>
			</tr>
		</ItemTemplate>
		<footertemplate>
			</tbody>
			</table>
		</footertemplate>
		<nonetemplate>
			<tr>
				<td class="CommonListCellLeftMost" colspan="3" align="center">
					<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_ProductList_NoProducts" />
				</td>
			</tr>
		</nonetemplate>
	</cp:repeaterplusnone>
	
	<br />
	
	<p id="OverUsage" runat="server" visible="False">
		<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_OverUsage" />
	</p>

	<table cellspacing="0" cellpadding="0" border="0" width="100%">
		<thead>
			<tr>
				<td class="CommonListHeaderLeftMost" colspan="2">
					<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Totals" />
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="CommonListCellLeftMost" valign="top" width="50%">
					<p>
						<b><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Telligent.Evolution" /></b>
						<ul>
							<li>
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Branding" />
								<ul>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="CS_BrandingRestrictions" runat="server" /></li>
								</ul>
							</li>
							<li>
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Domains" />
								<ul>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="CS_NumberOfDomains" runat="server" /></li>
								</ul>
							</li>
							<li id="BlogsUsage" runat="server">
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Blogs" />
								<ul>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="CS_NumberOfBlogs_Licensed" runat="server" /></li>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_InUse" />: <asp:Literal id="CS_NumberOfBlogs_Usage" runat="server" /></li>
								</ul>
							</li>
							<li id="ForumsUsage" runat="server">
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Forums" />
								<ul>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="CS_NumberOfForums_Licensed" runat="server" /></li>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_InUse" />: <asp:Literal id="CS_NumberOfForums_Usage" runat="server" /></li>
								</ul>
							</li>
							<li id="GalleriesUsage" runat="server">
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Galleries" />
								<ul>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="CS_NumberOfGalleries_Licensed" runat="server" /></li>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_InUse" />: <asp:Literal id="CS_NumberOfGalleries_Usage" runat="server" /></li>
								</ul>
							</li>
							<li id="FilesUsage" runat="server">
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Groups" />
								<ul>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="CS_NumberOfGroups_Licensed" runat="server" /></li>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_InUse" />: <asp:Literal id="CS_NumberOfGroups_Usage" runat="server" /></li>
								</ul>
							</li>
							<li id="MirrorsUsage" runat="server">
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Mirrors" />
								<ul>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="CS_NumberOfContentMirrors_Licensed" runat="server" /></li>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_InUse" />: <asp:Literal id="CS_NumberOfContentMirrors_Usage" runat="server" /></li>
								</ul>
							</li>
							<li id="WikisUsage" runat="server">
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Wikis" />
								<ul>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="CS_NumberOfWikis_Licensed" runat="server" /></li>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_InUse" />: <asp:Literal id="CS_NumberOfWikis_Used" runat="server" /></li>
								</ul>
							</li>
							<li id="UsersUsage" runat="server">
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Seats" />
								<ul>
									<li><cp:resourcecontrol ID="Resourcecontrol4" runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="CS_NumberOfUsers_Licensed" runat="server" /></li>
									<li><cp:resourcecontrol ID="Resourcecontrol5" runat="server" ResourceName="CP_Tools_ManageLicenses_InUse" />: <asp:Literal id="CS_NumberOfUsers_Used" runat="server" /></li>
								</ul>
							</li>
							<li id="ServersUsage" runat="server">
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Servers" />
								<ul>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="CS_NumberOfServers_Licensed" runat="server" /></li>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_InUse" />: <asp:Literal id="CS_NumberOfServers_Used" runat="server" /></li>
								</ul>
							</li>
							<li>
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Components" />
								<ul>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="CS_EnabledComponents" runat="server" /></li>
								</ul>
							</li>
                            <li id="CSARestrictions" runat="server">Restrictions
								<ul>
								<li runat="server" id="AllowRoleEditing"><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_AllowRoleEditing" />: <asp:Literal id="CS_AllowRoleEditing_Licensed" runat="server" /></li>
								<li runat="server" id="AllowWidgetStudio"><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_AllowWidgetStudio" />: <asp:Literal id="CS_AllowWidgetStudio_Licensed" runat="server" /></li>
								<li runat="server" id="AllowConversations"><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_AllowConversations" />: <asp:Literal id="CS_AllowConversations_Licensed" runat="server" /></li>
								<li runat="server" id="AllowDocumentSearchIndexing"><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_AllowDocumentSearchIndexing" />: <asp:Literal id="CS_AllowDocumentSearchIndexing_Licensed" runat="server" /></li>
								<li runat="server" id="AllowNewThemes"><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_AllowNewThemes" />: <asp:Literal id="CS_AllowNewThemes_Licensed" runat="server" /></li>
								<li runat="server" id="AllowJoinfulGroups"><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_AllowJoinfulGroups" />: <asp:Literal id="CS_AllowJoinfulGroups_Licensed" runat="server" /></li>
								<li runat="server" id="AllowQAForums"><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_AllowQAForums" />: <asp:Literal id="CS_AllowQAForums_Licensed" runat="server" /></li>
								<li runat="server" id="AllowRSS"><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_AllowRSS" />: <asp:Literal id="CS_AllowRSS_Licensed" runat="server" /></li>
								<li runat="server" id="AllowSpamCustomization"><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_AllowSpamCustomization" />: <asp:Literal id="CS_AllowSpamCustomization_Licensed" runat="server" /></li>
                                </ul>
							</li>

						</ul>
					</p>
				</td>
				<td class="CommonListCell" valign="top" width="50%">
					<p>
						<b><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_MailGateway" /></b>
						<ul>
							<li id="AddressesUsage" runat="server">
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Addresses" />
								<ul>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="MG_NumberOfAddresses_Licensed" runat="server" /></li>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_InUse" />: <asp:Literal id="MG_NumberOfAddresses_Usage" runat="server" /></li>
								</ul>
							</li>
						</ul>
					</p>
					<p>
						<b><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_SecurityModules" /></b>
						<ul>
							<li>
								<cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_ModuleTypes" />
								<ul>
									<li><cp:resourcecontrol runat="server" ResourceName="CP_Tools_ManageLicenses_Licensed" />: <asp:Literal id="SM_ModuleTypes" runat="server" /></li>
								</ul>
							</li>
						</ul>
					</p>
				</td>
			</tr>
		</tbody>
	</table>
	<cp:RepeaterPlusNone id="RegisteredServers" runat="server">
		<HeaderTemplate>
			<table>
				<thead>
					<tr>
						<td class="CommonListHeader" colspan="2">
							<cp:resourcecontrol runat="Server" resourcename="CP_Tools_ManageLicenses_ServerList_RegisteredServers" />
						</td>
					</tr>
				</thead>
				<tr>
					<td colspan="2">
						<cp:resourcecontrol runat="Server" resourcename="CP_Tools_ManageLicenses_ServerList_RegisteredServers_Description" />
					</td>
				</tr>
				<tr>
					<td>
						<table>
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td>
					<asp:Literal runat="server" ID="ServerName" />
				</td>
				<td>
					<CP:ResourceButton runat="server" ID="Unregister" ResourceName="CP_Tools_ManageLicenses_ServerList_RegisteredServers_Unregister" />
				</td>
			</tr>
		</ItemTemplate>
		<FooterTemplate>
						</table>
					</td>
				</tr>	
			</table>
		</FooterTemplate>
	</cp:RepeaterPlusNone>
</asp:Content>