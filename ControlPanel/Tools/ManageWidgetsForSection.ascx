<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageWidgetsForSection.ascx.cs" Inherits="Telligent.Evolution.Web.ControlPanel.Tools.ManageWidgetsForSection" %>

<TEControl:JQuery runat="server" />

<div style="float: left; width:250px;">
	<CP:ResourceControl runat="server" ResourceName="CP_Tools_ManageWidgets_NotAllowedWidgets" Tag="Div" CssClass="CommonSubTitle" />
	<input id="allWidgetSearch" runat="server" type="text" style="width: 246px;" size="25" value="Search..." />
	<br /><select ID="lstAllWidgets" runat="server" multiple="true" size="25" style="width: 250px;" enableviewstate="false" />
</div>

<div style="float:left; padding:15px; padding-top: 200px;">
    <table border="0" height="135px">
        <tr>
            <td><input id="moveRight" type="button" value=">" runat="server" style="padding: 2px 4px;" /></td>
        </tr>
        <tr>
            <td><input id="moveLeft" type="button" value="<" runat="server" style="padding: 2px 4px;" /></td>
        </tr>
        <tr>
            <td><input id="moveAllRight" type="button" value=">>" runat="server" style="padding: 2px 4px;" /></td>
        </tr>
        <tr>
            <td><input id="moveAllLeft" type="button" value="<<" runat="server" style="padding: 2px 4px;" /></td>
        </tr>
    </table>
</div>

<div style="float: left; width:250px;">
	<CP:ResourceControl runat="Server" ResourceName="CP_Tools_ManageWidgets_AllowedWidgets" Tag="Div" CssClass="CommonSubTitle" />
	<input id="availableWidgetSearch" runat="server" type="text" style="width: 246px;" size="25" value="Search..." />
	<br /><select ID="lstAvailableWidgets" runat="server" multiple="true" size="25" style="width: 250px;" />
</div>

<input runat="server" type="hidden" id="availableWidgets" value="" />
<input runat="server" type="hidden" id="modifiedFlag" value="" />

<script type="text/javascript">
//<![CDATA[
	
	var all_fragments_<%= this.ClientID %> = <%= AllSerializedFragments %>;
	var available_fragments_<%= this.ClientID %> = <%= AvailableSerializedFragments %>;

	function manage_widgets_filter_list_<%= this.ClientID %>(list, objs, search) {
		var s = search.toLowerCase();
		if (s == "search...") s = "";
		list.html('');
		$.each(objs, function() {
			if (s == "" || this.FragmentName.toLowerCase().indexOf(s) > -1)
				list.append($('<option></option').val(this.FragmentType).html(this.FragmentName));
		});
	}
	
	function manage_widgets_move_<%= this.ClientID %>(node, srcArray, destArray) {
		var key = $(node).attr("value");
		var item; var itemIndex = -1;
		for(var i = 0; i < srcArray.length; i++) {
			var n = srcArray[i];
			if (n.FragmentType == key) {
				item = n; itemIndex = i;
				break;
			}
		}
		if (itemIndex > -1)
		{
			srcArray.splice(itemIndex, 1);
			destArray.push(item);
		}
	}
	
	function manage_widgets_list_refresh_<%= this.ClientID %>() {
		manage_widgets_filter_list_<%= this.ClientID %>($('#<%= lstAllWidgets.ClientID %>'), all_fragments_<%= this.ClientID %>, $('#<%= allWidgetSearch.ClientID %>').val());
		manage_widgets_filter_list_<%= this.ClientID %>($('#<%= lstAvailableWidgets.ClientID %>'), available_fragments_<%= this.ClientID %>, $('#<%= availableWidgetSearch.ClientID %>').val());
	}
	
	function manage_widgets_available_update_<%= this.ClientID %>() {
		$('#<%= modifiedFlag.ClientID %>').val("modified");
		var s = "";
		for(var i = 0; i < available_fragments_<%= this.ClientID %>.length; i++) {
			s += available_fragments_<%= this.ClientID %>[i].FragmentType + "*";
		}
		$('#<%= availableWidgets.ClientID %>').val(s);
	}

	$(document).ready(function() {
	
		$('#<%= allWidgetSearch.ClientID %>').keyup(function(e) {
			manage_widgets_filter_list_<%= this.ClientID %>($('#<%= lstAllWidgets.ClientID %>'), all_fragments_<%= this.ClientID %>, $('#<%= allWidgetSearch.ClientID %>').val());
		}).blur(function() { if (this.value == '') this.value = 'Search...'; }).focus(function() { if (this.value == 'Search...') this.value = ''; });
		
		$('#<%= availableWidgetSearch.ClientID %>').keyup(function(e) {
			manage_widgets_filter_list_<%= this.ClientID %>($('#<%= lstAvailableWidgets.ClientID %>'), available_fragments_<%= this.ClientID %>, $('#<%= availableWidgetSearch.ClientID %>').val());
		}).blur(function() { if (this.value == '') this.value = 'Search...'; }).focus(function() { if (this.value == 'Search...') this.value = ''; });

		$('#<%= moveRight.ClientID %>').click(function() {
			$('#<%= lstAllWidgets.ClientID %> option:selected').each(function(i, item){
				manage_widgets_move_<%= this.ClientID %>(item, all_fragments_<%= this.ClientID %>, available_fragments_<%= this.ClientID %>);
			});
			$('#<%= lstAllWidgets.ClientID %> option:selected').remove().appendTo('#<%= lstAvailableWidgets.ClientID %>');
			manage_widgets_available_update_<%= this.ClientID %>();
			available_fragments_<%= this.ClientID %>.sort(function (a,b) { if ( a.FragmentName < b.FragmentName ) {return -1; } else if (a.FragmentName > b.FragmentName) { return 1; } else { return 0; }});
			manage_widgets_list_refresh_<%= this.ClientID %>();
		});

		$('#<%= moveLeft.ClientID %>').click(function() {
			$('#<%= lstAvailableWidgets.ClientID %> option:selected').each(function(i, item){
				manage_widgets_move_<%= this.ClientID %>(item, available_fragments_<%= this.ClientID %>, all_fragments_<%= this.ClientID %>);
			});
			$('#<%= lstAvailableWidgets.ClientID %> option:selected').remove().appendTo('#<%= lstAllWidgets.ClientID %>');
			manage_widgets_available_update_<%= this.ClientID %>();
			all_fragments_<%= this.ClientID %>.sort(function (a,b) { if ( a.FragmentName < b.FragmentName ) {return -1; } else if (a.FragmentName > b.FragmentName) { return 1; } else { return 0; }});
			manage_widgets_list_refresh_<%= this.ClientID %>();
		});

		$('#<%= moveAllRight.ClientID %>').click(function() {
			$('#<%= lstAllWidgets.ClientID %> option').each(function(i, item){
				manage_widgets_move_<%= this.ClientID %>(item, all_fragments_<%= this.ClientID %>, available_fragments_<%= this.ClientID %>);
			});
			$('#<%= lstAllWidgets.ClientID %> option').remove().appendTo('#<%= lstAvailableWidgets.ClientID %>');
			manage_widgets_available_update_<%= this.ClientID %>();
			available_fragments_<%= this.ClientID %>.sort(function (a,b) { if ( a.FragmentName < b.FragmentName ) {return -1; } else if (a.FragmentName > b.FragmentName) { return 1; } else { return 0; }});
			manage_widgets_list_refresh_<%= this.ClientID %>();
		});

		$('#<%= moveAllLeft.ClientID %>').click(function() {
			$('#<%= lstAvailableWidgets.ClientID %> option').each(function(i, item){
				manage_widgets_move_<%= this.ClientID %>(item, available_fragments_<%= this.ClientID %>, all_fragments_<%= this.ClientID %>);
			});
			$('#<%= lstAvailableWidgets.ClientID %> option').remove().appendTo('#<%= lstAllWidgets.ClientID %>');
			manage_widgets_available_update_<%= this.ClientID %>();
			all_fragments_<%= this.ClientID %>.sort(function (a,b) { if ( a.FragmentName < b.FragmentName ) {return -1; } else if (a.FragmentName > b.FragmentName) { return 1; } else { return 0; }});
			manage_widgets_list_refresh_<%= this.ClientID %>();
		});
		
		manage_widgets_filter_list_<%= this.ClientID %>($('#<%= lstAllWidgets.ClientID %>'), all_fragments_<%= this.ClientID %>, "");
		manage_widgets_filter_list_<%= this.ClientID %>($('#<%= lstAvailableWidgets.ClientID %>'), available_fragments_<%= this.ClientID %>, "");

	});
//]]>
</script>