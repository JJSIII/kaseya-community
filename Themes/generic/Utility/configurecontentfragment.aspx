<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/themes/generic/common/modal.Master" %>
<%@ Import Namespace="Telligent.Evolution.Components"%>
<%@ Import Namespace="Telligent.Evolution.Extensibility.UI.Version1" %>
<%@ Import Namespace="Telligent.Evolution.Controls"%>

<script runat="server" type="text/C#" language="C#">
protected void Page_Load(object sender, EventArgs e)
{
	IContentFragment fragment = this.ContentFragmentForm.DataSource as IContentFragment;
	if (fragment != null)
	{
		string titleResource = ResourceManager.GetString("CF_ConfigureContentFragment_Title");
		Head.AddTitle(string.Format(titleResource, fragment.FragmentName), Context);

        IInstanceBasedContentFragment instanceFragment = fragment as IInstanceBasedContentFragment;
        if (instanceFragment != null)
            ContentFragmentForm.CssClass = instanceFragment.InstanceCssClass;
        else
            ContentFragmentForm.CssClass = Css.MakeHyphenatedClassName(FullTypeNameCollection.Values[fragment.GetType()].Name);
	}
}
</script>
<asp:Content ContentPlaceHolderID="content" runat="server">
	<TEControl:JQuery runat="server" />
	<script type="text/javascript">
		// <![CDATA[
	    $(document).ready(function()
	    {
	        var saveButton = $('#<%= CSControlUtility.Instance().FindControl(this, "Save").ClientID %>');
	        saveButton.click(function()
	        {
	            if (typeof (Page_ClientValidate) == "function" && Page_ClientValidate('') == false)
	                return false;

	            $('.processing', saveButton.parent()).css("visibility", "visible");
	            saveButton.addClass('disabled');
	        });
	    });
		// ]]>
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
								<legend class="field-list-description"><span><TEDynConfig:PropertyGroupData Property="Description" runat="server" /></span></legend>
								<ul class="field-list">
						</PropertyFormGroupHeaderTemplate>
						<PropertyFormSubGroupHeaderTemplate>
									<li class="field-item heading"><TEDynConfig:PropertySubGroupData Property="Name" runat="server" /></li>
						</PropertyFormSubGroupHeaderTemplate>
						<PropertyFormPropertyTemplate>
									<li class="field-item <%# Eval("ID") %>">
										<label class="field-item-header"><TEDynConfig:PropertyData Property="Name" runat="server" /></label>
										<span class="field-item-description"><TEDynConfig:PropertyData Property="Description" runat="server" /></span>
										<span class="field-item-input"><TEDynConfig:PropertyControl runat="server" /></span>
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
									<asp:LinkButton ID="Save" runat="server" CssClass="internal-link save-form"><span></span><TEControl:ResourceControl runat="server" ResourceName="Save" /></asp:LinkButton>
									<span class="processing" style="visibility: hidden;"></span>
								</span>
							</li>
						</ul>
					</fieldset>
					<div class="field-list-footer"></div>

		</FormTemplate>
	</TEControl:ConfigureContentFragmentForm>

</asp:Content>