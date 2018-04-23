using System;
using System.Data;
public partial class _Default : System.Web.UI.Page {
    protected void Page_Init(object sender, EventArgs e) {
        DataTable table;
        if (!IsPostBack && !IsCallback) {
            table = new DataTable();
            table.Columns.Add("ID", typeof(int));
            table.Columns.Add("Name", typeof(string));
            table.PrimaryKey = new DataColumn[] { table.Columns["ID"] };
            table.Rows.Add(new object[] { 1, "All" });
            table.Rows.Add(new object[] { 2, "Moscow" });
            table.Rows.Add(new object[] { 3, "London" });
            table.Rows.Add(new object[] { 4, "Paris" });
            table.Rows.Add(new object[] { 5, "NewYork" });
            Session["table"] = table;
        } else {
            table = (DataTable)Session["table"];
        }
        gridLookup.DataSource = table;
        gridLookup.DataBind();
    }
}
