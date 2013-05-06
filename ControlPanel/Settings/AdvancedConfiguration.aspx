<%@ Page language="c#" Codebehind="AdvancedConfiguration.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.Settings.AdvancedConfiguration" MasterPageFile="~/ControlPanel/Masters/SetupAdmin.master" %>
<%@ Register TagPrefix="CP" Namespace="Telligent.Evolution.ControlPanel.Controls" Assembly="Telligent.Evolution.Web" %>
<%@ Register TagPrefix="TWC" Namespace="Telligent.Glow" Assembly="Telligent.Glow" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol id="RegionTitle" runat="Server" resourcename="CP_Settings_AdvancedConfiguration"></cp:resourcecontrol>
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <cp:controlpanelselectednavigation selectednavitem="AdvancedConfiguration" runat="server" />
	<CP:statusmessage id="Status" runat="server"></CP:statusmessage>
        <TWC:TabbedPanes id="EmailTabs" runat="server"
            PanesCssClass="CommonPane"
            TabSetCssClass="CommonPaneTabSet"
            TabCssClasses="CommonPaneTab"
            TabSelectedCssClasses="CommonPaneTabSelected"
            TabHoverCssClasses="CommonPaneTabHover"
            >
            <TWC:TabbedPane ID="TabbedPane1" runat="server">
	            <Tab><cp:resourcecontrol runat="Server" resourcename="CP_Settings_RSS_Title" /></Tab>
	            <Content>
	                <TABLE cellSpacing="0" cellPadding="4" border="0">
                        <asp:PlaceHolder id="RssNotAllowedLicensingHolder" runat="Server">
							<tr>
								<td class="CommonFormFieldName">&nbsp;</td>
								<td class="CommonFormField"><cp:resourcecontrol id="RssNotAllowedLicensing" visible="false" runat="server" Tag="div" CssClass="CommonLicenseRestrictionMessage" resourcename="CP_Settings_RssNotAllowedLicensing" /></td>
							</tr>
						</asp:PlaceHolder>
			            <TR>
				            <TD class="CommonFormFieldName">
					            <strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_RSS_Secure" /></strong><br />
					            <cp:resourcecontrol runat="Server" resourcename="CP_Settings_RSS_Secure_Descr" />
					        </TD>
				            <TD class="CommonFormField" noWrap>
					            <cp:yesnoradiobuttonlist id="SecureRss" runat="server" repeatcolumns="2" cssclass="ControlPanelTextInput"></cp:yesnoradiobuttonlist></TD>
			            </TR>
			            <TR>
				            <TD class="CommonFormFieldName">
					            <strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_RSS_Search" /></strong><br />
					            <cp:resourcecontrol runat="Server" resourcename="CP_Settings_RSS_Search_Descr" />
					        </TD>
				            <TD class="CommonFormField" noWrap>
					            <cp:yesnoradiobuttonlist id="RssSearch" runat="server" repeatcolumns="2" cssclass="ControlPanelTextInput"></cp:yesnoradiobuttonlist></TD>
			            </TR>
		            </TABLE>
	            </Content>
            </TWC:TabbedPane>
            
            <TWC:TabbedPane runat="server">
                <Tab><CP:ResourceControl runat="server" ResourceName="CP_Settings_PostSettings" /></Tab>
                <Content>
                    <TABLE cellSpacing="0" cellPadding="2" border="0">
	                    <TR>
		                    <TD class="CommonFormFieldName">
			                    <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Posting_EnableCensorship" /></strong><br />
			                    <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_Posting_EnableCensorship_Descr" />
		                    </TD>
		                    <TD class="CommonFormField" nowrap="nowrap">
			                    <cp:yesnoradiobuttonlist id="EnableCensorship" runat="server" repeatcolumns="2" cssclass="ControlPanelTextInput" />
		                    </TD>
	                    </TR>
	                    <TR>
		                    <TD class="CommonFormFieldName">
			                    <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_Posting_Emoticons" /></strong><br />
			                    <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_Posting_Emoticons_Descr" />
		                    </TD>
		                    <TD class="CommonFormField" nowrap="nowrap">
			                    <cp:yesnoradiobuttonlist id="EnableEmoticons" runat="server" repeatcolumns="2" cssclass="ControlPanelTextInput" />
		                    </TD>
	                    </TR>
	                    <TR>
		                    <TD class="CommonFormFieldName">
			                    <strong><cp:resourcecontrol runat="server" resourcename="CP_Settings_Posts_FeaturedContent_Title" /></strong><br />
			                    <cp:resourcecontrol runat="Server" resourcename="CP_Settings_Posts_FeaturedContent_Description" />
		                    </TD>
		                    <TD class="CommonFormField" nowrap="nowrap">
			                    <cp:yesnoradiobuttonlist id="EnableFeaturedContent" runat="server" repeatcolumns="2" cssclass="ControlPanelTextInput" />
		                    </TD>
	                    </TR>
	                    <TR>
		                    <TD class="CommonFormFieldName">
			                    <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_List_TopPosters" /></strong><br />
			                    <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_List_TopPosters_Descr" />
		                    </TD>
		                    <TD class="CommonFormField">
			                    <asp:textbox id="TopPostersToDisplay" runat="server"  maxlength="3" />
			                    <asp:requiredfieldvalidator id="TopPostersToDisplayValidator" runat="server" controltovalidate="TopPostersToDisplay" font-bold="True" errormessage="*" />
								<asp:RangeValidator ID="TopPostersToDisplayRangeValidator" runat="server" ControlToValidate="TopPostersToDisplay" Display="Dynamic" Type="Integer" MinimumValue="1" MaximumValue="100"></asp:RangeValidator>
							</TD>

		                    </TD>
	                    </TR>
	                </TABLE>
                </Content>
            </TWC:TabbedPane>
            
            <TWC:TabbedPane runat="server">
                <Tab><CP:ResourceControl runat="server" ResourceName="CP_Settings_IPAddressTrackingSettings" /></Tab>
                <Content>
                    <TABLE cellSpacing="0" cellPadding="2" border="0">
			            <TR>
				            <TD class="CommonFormFieldName">
					            <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_IP_Enable" /></strong><br />
					            <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_IP_Enable_Descr" />
					        </TD>
				            <TD class="CommonFormField" nowrap="nowrap">
					            <cp:yesnoradiobuttonlist id="EnableTrackPostsByIP" runat="server" repeatcolumns="2" cssclass="ControlPanelTextInput"></cp:yesnoradiobuttonlist></TD>
			            </TR>
			            <TR>
				            <TD class="CommonFormFieldName">
					            <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_IP_Display" /></strong><br />
					            <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_IP_Display_Descr" />
					        </TD>
				            <TD class="CommonFormField" nowrap="nowrap">
					            <cp:yesnoradiobuttonlist id="DisplayPostIP" runat="server" repeatcolumns="2" cssclass="ControlPanelTextInput"></cp:yesnoradiobuttonlist></TD>
			            </TR>
			            <TR>
				            <TD class="CommonFormFieldName">
					            <strong><cp:resourcecontrol runat="server" resourcename="Admin_SiteSettings_IP_AdminOnly" /></strong><br />
					            <cp:resourcecontrol runat="Server" resourcename="Admin_SiteSettings_IP_AdminOnly_Descr" />
					        </TD>
				            <TD class="CommonFormField" nowrap="nowrap">
					            <cp:yesnoradiobuttonlist id="DisplayPostIPAdminsModeratorsOnly" runat="server" repeatcolumns="2" cssclass="ControlPanelTextInput"></cp:yesnoradiobuttonlist></TD>
			            </TR>
		            </TABLE>
                </Content>
            </TWC:TabbedPane>
                       
            <TWC:TabbedPane runat="server">
                <Tab><CP:ResourceControl runat="server" ResourceName="CP_TinyMCE_Tab" /></Tab>
                <Content>
                    <TABLE cellSpacing="0" cellPadding="2" border="0">
			            <TR>
				            <TD class="CommonFormFieldName">
					            <strong><cp:resourcecontrol runat="server" resourcename="CP_TinyMCE_SpellCheck" /></strong><br />
					            <cp:resourcecontrol runat="Server" resourcename="CP_TinyMCE_SpellCheck_Help" />
					        </TD>
				            <TD class="CommonFormField" nowrap="nowrap">
				                <CP:TinyMCESpellOptionDropDownList ID="DropDownSpellCheckModule" runat="server"></CP:TinyMCESpellOptionDropDownList></TD>
			            </TR>
		            </TABLE>
                </Content>
            </TWC:TabbedPane>
            
       </TWC:TabbedPanes>
	<p class="PanelSaveButton DetailsFixedWidth">
		<cp:resourcelinkbutton id="SaveButton" runat="server" resourcename="Save" cssclass="CommonTextButton" />
    </p>
</asp:Content>