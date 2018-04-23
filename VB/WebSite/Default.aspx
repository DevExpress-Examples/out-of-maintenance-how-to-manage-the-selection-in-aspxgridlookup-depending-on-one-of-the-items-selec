<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

	<script type="text/javascript">
		var allIsSelected = false;
		function OnSelectionChanged(s, e) {
			arrKeys = s.GetSelectedKeysOnPage();
			for (i in arrKeys) {
				if (arrKeys[i] == 1) {  // "All" item key 
					if (arrKeys.length == 1) allIsSelected = true;
					if (allIsSelected && (arrKeys.length == 2)) {
						s.SetFocusedRowIndex(e.visibleIndex);
						s.UnselectRows(0); // Deselect the "All" item
						allIsSelected = false;
					} else {
						arrKeys.splice(0, 1);
						unselectRows(arrKeys);
						allIsSelected = true;
					}
				}
			}
		}
		function unselectRows(arrKeys) {
			var grid = gridLookup.GetGridView();
			grid.SetFocusedRowIndex(0);
			grid.UnselectRowsByKey(arrKeys);
		}
	</script>

	<title></title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
The "All" item means that it already includes values from all others items. So, if this item is selected, all other items should be unselected. <br/>
		<dx:ASPxGridLookup ID="gridLookup" runat="server" AutoGenerateColumns="False" clientidmode="AutoID"
			KeyFieldName="ID" SelectionMode="Multiple">
			<GridViewClientSideEvents SelectionChanged="OnSelectionChanged" />
			<GridViewProperties>
				<SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="true"></SettingsBehavior>
			</GridViewProperties>
			<Columns>
				<dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
					<ClearFilterButton Visible="True">
					</ClearFilterButton>
				</dx:GridViewCommandColumn>
				<dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
				</dx:GridViewDataTextColumn>
			</Columns>
		</dx:ASPxGridLookup>
	</div>

	</form>
</body>
</html>