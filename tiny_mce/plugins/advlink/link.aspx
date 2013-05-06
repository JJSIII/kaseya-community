<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="link.aspx.cs" Inherits="Telligent.Evolution.Web.tiny_mce.themes.advanced.link" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>{#advlink_dlg.title}</title>
	<script type="text/javascript" src="../../tiny_mce_popup.js"></script>
	<script type="text/javascript" src="../../utils/mctabs.js"></script>
	<script type="text/javascript" src="../../utils/form_utils.js"></script>
	<script type="text/javascript" src="../../utils/validate.js"></script>
	<script type="text/javascript" src="js/advlink.js"></script>
	<link href="css/advlink.css" rel="stylesheet" type="text/css" />
</head>
<body id="advlink" style="display: none">
    <TEControl:JQuery runat="server" />
    <form id="PageForm" runat="server" onsubmit="insertAction();return false;" action="#">
		<div class="tabs">
			<ul>
				<li id="general_tab" class="current"><span><a href="javascript:mcTabs.displayTab('general_tab','general_panel');" onmousedown="return false;">{#advlink_dlg.general_tab}</a></span></li>
			</ul>
		</div>

		<div class="panel_wrapper">
			<div id="general_panel" class="panel current">
				<fieldset>
					<legend>{#advlink_dlg.general_props}</legend>

					<table border="0" cellpadding="4" cellspacing="0">
						<tr>
						  <td class="nowrap">
						    <label id="hreflabel" for="href">
					          {#advlink_dlg.url}
					          <asp:Label ID="wikiHrefLabel" runat="server"></asp:Label>
					        </label>
					      </td>
						  <td><table border="0" cellspacing="0" cellpadding="0">
								<tr>
								  <td><input id="href" name="href" type="text" class="mceFocus" value="" onchange="selectByValue(this.form,'linklisthref',this.value);" /></td>
								  <td id="hrefbrowsercontainer">&nbsp;</td>
								</tr>
							  </table></td>
						</tr>
						<tr id="linklisthrefrow">
							<td class="column1"><label for="linklisthref">{#advlink_dlg.list}</label></td>
							<td colspan="2" id="linklisthrefcontainer"><select id="linklisthref"><option value=""></option></select></td>
						</tr>
						<tr>
							<td class="column1"><label for="anchorlist">{#advlink_dlg.anchor_names}</label></td>
							<td colspan="2" id="anchorlistcontainer"><select id="anchorlist"><option value=""></option></select></td>
						</tr>
						<tr>
							<td><label id="targetlistlabel" for="targetlist">{#advlink_dlg.target}</label></td>
							<td id="targetlistcontainer"><select id="targetlist"><option value=""></option></select></td>
						</tr>
						<tr>
							<td class="nowrap"><label id="titlelabel" for="title">{#advlink_dlg.titlefield}</label></td>
							<td><input id="title" name="title" type="text" value="" /></td>
						</tr>
					</table>
				</fieldset>
			</div>

			<div id="popup_panel" class="panel">
				<fieldset>
					<legend>{#advlink_dlg.popup_props}</legend>

					<input type="checkbox" id="ispopup" name="ispopup" class="radio" onclick="setPopupControlsDisabled(!this.checked);buildOnClick();" />
					<label id="ispopuplabel" for="ispopup">{#advlink_dlg.popup}</label>

					<table border="0" cellpadding="0" cellspacing="4">
						<tr>
							<td class="nowrap"><label for="popupurl">{#advlink_dlg.popup_url}</label>&nbsp;</td>
							<td>
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td><input type="text" name="popupurl" id="popupurl" value="" onchange="buildOnClick();" /></td>
										<td id="popupurlbrowsercontainer">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="nowrap"><label for="popupname">{#advlink_dlg.popup_name}</label>&nbsp;</td>
							<td><input type="text" name="popupname" id="popupname" value="" onchange="buildOnClick();" /></td>
						</tr>
						<tr>
							<td class="nowrap"><label>{#advlink_dlg.popup_size}</label>&nbsp;</td>
							<td class="nowrap">
								<input type="text" id="popupwidth" name="popupwidth" value="" onchange="buildOnClick();" /> x
								<input type="text" id="popupheight" name="popupheight" value="" onchange="buildOnClick();" /> px
							</td>
						</tr>
						<tr>
							<td class="nowrap" id="labelleft"><label>{#advlink_dlg.popup_position}</label>&nbsp;</td>
							<td class="nowrap">
								<input type="text" id="popupleft" name="popupleft" value="" onchange="buildOnClick();" /> /                                
								<input type="text" id="popuptop" name="popuptop" value="" onchange="buildOnClick();" /> (c /c = center)
							</td>
						</tr>
					</table>
					
					<fieldset>
						<legend>{#advlink_dlg.popup_opts}</legend>

						<table border="0" cellpadding="0" cellspacing="4">
							<tr>
								<td><input type="checkbox" id="popuplocation" name="popuplocation" class="checkbox" onchange="buildOnClick();" /></td>
								<td class="nowrap"><label id="popuplocationlabel" for="popuplocation">{#advlink_dlg.popup_location}</label></td>
								<td><input type="checkbox" id="popupscrollbars" name="popupscrollbars" class="checkbox" onchange="buildOnClick();" /></td>
								<td class="nowrap"><label id="popupscrollbarslabel" for="popupscrollbars">{#advlink_dlg.popup_scrollbars}</label></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="popupmenubar" name="popupmenubar" class="checkbox" onchange="buildOnClick();" /></td>
								<td class="nowrap"><label id="popupmenubarlabel" for="popupmenubar">{#advlink_dlg.popup_menubar}</label></td>
								<td><input type="checkbox" id="popupresizable" name="popupresizable" class="checkbox" onchange="buildOnClick();" /></td>
								<td class="nowrap"><label id="popupresizablelabel" for="popupresizable">{#advlink_dlg.popup_resizable}</label></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="popuptoolbar" name="popuptoolbar" class="checkbox" onchange="buildOnClick();" /></td>
								<td class="nowrap"><label id="popuptoolbarlabel" for="popuptoolbar">{#advlink_dlg.popup_toolbar}</label></td>
								<td><input type="checkbox" id="popupdependent" name="popupdependent" class="checkbox" onchange="buildOnClick();" /></td>
								<td class="nowrap"><label id="popupdependentlabel" for="popupdependent">{#advlink_dlg.popup_dependent}</label></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="popupstatus" name="popupstatus" class="checkbox" onchange="buildOnClick();" /></td>
								<td class="nowrap"><label id="popupstatuslabel" for="popupstatus">{#advlink_dlg.popup_statusbar}</label></td>
								<td><input type="checkbox" id="popupreturn" name="popupreturn" class="checkbox" onchange="buildOnClick();" checked="checked" /></td>
								<td class="nowrap"><label id="popupreturnlabel" for="popupreturn">{#advlink_dlg.popup_return}</label></td>
							</tr>
						</table>
					</fieldset>
				</fieldset>
			</div>
		</div>

		<div class="mceActionPanel">
			<div style="float: left">
				<input type="submit" id="insert" name="insert" value="{#insert}" />
			</div>

			<div style="float: right">
				<input type="button" id="cancel" name="cancel" value="{#cancel}" onclick="tinyMCEPopup.close();" />
			</div>
		</div>
    </form>
</body>
</html>
