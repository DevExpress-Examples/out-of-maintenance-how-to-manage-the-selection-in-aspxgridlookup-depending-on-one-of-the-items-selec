Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim table As DataTable
		If (Not IsPostBack) AndAlso (Not IsCallback) Then
			table = New DataTable()
			table.Columns.Add("ID", GetType(Integer))
			table.Columns.Add("Name", GetType(String))
			table.PrimaryKey = New DataColumn() { table.Columns("ID") }
			table.Rows.Add(New Object() { 1, "All" })
			table.Rows.Add(New Object() { 2, "Moscow" })
			table.Rows.Add(New Object() { 3, "London" })
			table.Rows.Add(New Object() { 4, "Paris" })
			table.Rows.Add(New Object() { 5, "NewYork" })
			Session("table") = table
		Else
			table = CType(Session("table"), DataTable)
		End If
		gridLookup.DataSource = table
		gridLookup.DataBind()
	End Sub
End Class
