using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace PoultrySystem
{
    public partial class Placement : System.Web.UI.Page
    {
        int qtyTotal = 0;
        int grQtyTotal = 0;
        DateTime storid;
        int rowIndex = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                createAccordianUsingRepeater();
           

            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            int i = 0;
            string sql = null;
            // string connetionString = "Data Source=.;Initial Catalog=pubs;User ID=sa;Password=*****";
            sql = "SELECT  distinct tblPlacement.Date, tblGrower.GrowerName, tblHouse.HouseNumber, tblPlacementDetail.Amount FROM  tblGrower INNER JOIN tblHouse ON tblGrower.GrowerID = tblHouse.GrowerID INNER JOIN tblPlacementDetail ON tblHouse.HouseID = tblPlacementDetail.HouseID INNER JOIN tblPlacement ON tblPlacementDetail.PlcementID = tblPlacement.PlacementID Group By tblPlacement.Date, tblGrower.GrowerName, tblHouse.HouseNumber, tblPlacementDetail.Amount ORDER BY tblPlacement.Date DESC";
            SqlConnection connection = new SqlConnection(DBUtil.ConnectionString);
            connection.Open();
            SqlCommand command = new SqlCommand(sql, connection);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            adapter.Dispose();
            command.Dispose();
            connection.Close();
            GridView GridView1 = new GridView();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
                }
        }
        protected void ConsumptionGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
  
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((string.IsNullOrEmpty(e.Row.Cells[3].Text) != true) || (e.Row.Cells[3].Text != " "))
                {
                    int result = Convert.ToInt32(e.Row.Cells[2].Text);
                    if (result == 0)
                    {
                        e.Row.Cells[3].BackColor = System.Drawing.Color.Red;
                        e.Row.Cells[3].Text = "Place";
                    }

                    else if (result > 0)
                    {
                        e.Row.Cells[3].BackColor = System.Drawing.Color.Green;
                        e.Row.Cells[3].Text = "OK";
                        e.Row.Cells[4].Enabled = false;
                        e.Row.Cells[5].Enabled = false;



                    }
                }
            }
       }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "HouseNumber").ToString());
                storid = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "Date").ToString());                
                int tmpTotal = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Amount").ToString());
                qtyTotal += tmpTotal;
                grQtyTotal += tmpTotal;
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lblTotalqty = (Label)e.Row.FindControl("lblTotalqty");
                lblTotalqty.Text = grQtyTotal.ToString();
            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            bool newRow = false;
            if ((DataBinder.Eval(e.Row.DataItem, "Date") != null))
            {
                if (storid != Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "Date").ToString()))
                    newRow = true;
            }
            if ((DataBinder.Eval(e.Row.DataItem, "Date") == null))
            {
                newRow = false;
                rowIndex = 0;
            }
            if (newRow)
            {
                GridView GridView1 = (GridView)sender;
                GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
                NewTotalRow.Font.Bold = true;
                NewTotalRow.BackColor = System.Drawing.Color.Gray;
                NewTotalRow.ForeColor = System.Drawing.Color.White;
                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "Sub Total";
                HeaderCell.HorizontalAlign = HorizontalAlign.Left;
                HeaderCell.ColumnSpan = 3;
                NewTotalRow.Cells.Add(HeaderCell);
                HeaderCell = new TableCell();
                HeaderCell.HorizontalAlign = HorizontalAlign.Right;
                HeaderCell.Text = qtyTotal.ToString();
                NewTotalRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, NewTotalRow);
                rowIndex++;
                qtyTotal = 0;
            }
        }

        //using System.Data;
        public DataTable createDataTable()
        {
            using (SqlConnection c = new SqlConnection(DBUtil.ConnectionString))
            {
                c.Open();
                // 2
                // Create new DataAdapter
                using (SqlDataAdapter a = new SqlDataAdapter("SELECT tblGrower.GrowerName, tblHouse.HouseNumber, tblHouse.HouseSize, tblHouse.StockLevel FROM tblGrower INNER JOIN tblHouse ON tblGrower.GrowerID = tblHouse.GrowerID Group By  tblGrower.GrowerName, tblHouse.HouseNumber, tblHouse.HouseSize, tblHouse.StockLevel", c))
                {
                    // 3
                    // Use DataAdapter to fill DataTable
                    DataTable dt = new DataTable();
                    a.Fill(dt);




                    //DataTable dt = new DataTable();
                    //DataColumn dc = new DataColumn();
                    //dc.ColumnName = "Name";
                    //dc.DataType = typeof(string);
                    //dt.Columns.Add(dc);

                    //dc = new DataColumn();
                    //dc.ColumnName = "Description";
                    //dc.DataType = typeof(string);
                    //dt.Columns.Add(dc);

                    //dc = new DataColumn();
                    //dc.ColumnName = "Email";
                    //dc.DataType = typeof(string);
                    //dt.Columns.Add(dc);

                    //dc = new DataColumn();
                    //dc.ColumnName = "Phone";
                    //dc.DataType = typeof(string);

                    //dt.Columns.Add(dc);

                    //dt.Rows.Add(new object[] { "Adams"});
                    //dt.Rows.Add(new object[] { "Capper", "Hello my name is Albert and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Evans", "Hello my name is Destin and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Gwynne", "Hello my name is Jessie and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Heath", "Hello my name is Joe and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Adams", "Hello my name is Max and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Capper", "Hello my name is Albert and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Evans", "Hello my name is Destin and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Gwynne", "Hello my name is Jessie and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Heath", "Hello my name is Joe and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Adams", "Hello my name is Max and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Capper", "Hello my name is Albert and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Evans", "Hello my name is Destin and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Gwynne", "Hello my name is Jessie and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Heath", "Hello my name is Joe and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Evans", "Hello my name is Destin and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Gwynne", "Hello my name is Jessie and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });
                    //dt.Rows.Add(new object[] { "Heath", "Hello my name is Joe and I am software engineer.", "Demo@Gmail.com", "My Phone is 123456789" });





                    return dt;

                }
            }
        }
        public void createAccordianUsingRepeater()
        {
            //repAccordian.DataSource = createDataTable();
            //repAccordian.DataBind();
        }

        protected void ConsumptionGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       

    }


}