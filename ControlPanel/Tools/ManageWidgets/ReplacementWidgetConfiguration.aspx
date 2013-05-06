<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/generic/Common/modal.Master" AutoEventWireup="true" CodeBehind="ReplacementWidgetConfiguration.aspx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Tools.ReplacementWidgetConfiguration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" runat="server">

    <script type="text/javascript">
        jQuery(function ($) {
            // resize parent iframe to contain full contents of this configuration form
            parent.document.getElementById('ReplacementConfigurationFrame').height = document['body'].offsetHeight;
        });
    </script>
	<TEControl:ConfigureContentFragmentForm runat="server" ID="ContentFragmentForm"
		ContentFragmentConfigurationFormId="ConfigurationForm"
		ContentFragmentDescriptionTextId="Description"
		SaveButtonId="Save">
		<FormTemplate>
			<h2 class="description"><asp:Literal runat="server" id="Description" /></h2>
		
					<TEDynConfig:ConfigurationForm runat="server" id="ConfigurationForm"
						RenderGroupsInTabs="true" 
						PanesCssClass="tab-pane"
						TabSetCssClass="tab-set"
						TabCssClasses="tab"
						TabSelectedCssClasses="tab selected"
						TabHoverCssClasses="tab hover"
						>
						<PropertyFormGroupHeaderTemplate>
							<div class="field-list-header"></div>
							<fieldset class="field-list">
								<legend class="field-list-description"><span><TEDynConfig:PropertyGroupData ID="PropertyGroupData1" Property="Description" runat="server" /></span></legend>
								<ul class="field-list">
						</PropertyFormGroupHeaderTemplate>
						<PropertyFormSubGroupHeaderTemplate>
									<li class="field-item heading"><TEDynConfig:PropertySubGroupData ID="PropertySubGroupData1" Property="Name" runat="server" /></li>
						</PropertyFormSubGroupHeaderTemplate>
						<PropertyFormPropertyTemplate>
									<li class="field-item <%# Eval("ID") %>">
										<label class="field-item-header"><TEDynConfig:PropertyData ID="PropertyData1" Property="Name" runat="server" /></label>
										<span class="field-item-description"><TEDynConfig:PropertyData ID="PropertyData2" Property="Description" runat="server" /></span>
										<span class="field-item-input"><TEDynConfig:PropertyControl ID="PropertyControl1" runat="server" /></span>
									</li>
						</PropertyFormPropertyTemplate>
						<PropertyFormGroupFooterTemplate>
								</ul>
							</fieldset>
							<div class="field-list-footer"></div>
						</PropertyFormGroupFooterTemplate>
					</TEDynConfig:ConfigurationForm>
			
					<div class="field-list-header"></div>
					<fieldset class="field-list">
						<ul class="field-list">
							<li class="field-item save-form">
								<span class="field-item-input">
									<asp:LinkButton ID="Save" runat="server" CssClass="internal-link save-form"><span></span><TEControl:ResourceControl ID="ResourceControl1" runat="server" ResourceName="Save" /></asp:LinkButton>
									<span class="processing" style="visibility: hidden;"></span>
								</span>
							</li>
						</ul>
					</fieldset>
					<div class="field-list-footer"></div>

		</FormTemplate>
	</TEControl:ConfigureContentFragmentForm>

</asp:Content>
