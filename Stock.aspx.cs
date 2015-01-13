using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;



namespace PoultrySystem
{
    public partial class Stock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable StockRecord = GetStockData();
            GridView1.DataSource = StockRecord;
            GridView1.DataBind();
            ////DropDownList1.Visible = false;



        }
        private static DataTable GetStockData()
        {

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            DataTable StockRecord = new DataTable();
            string command = "select HouseNumber,GrowerName,HouseSize,StockLevel from tblGrower right join tblHouse on tblGrower.GrowerID = tblHouse.GrowerID  Order By GrowerName ";
            SqlCommand cmd = new SqlCommand(command, con);
            con.Open();
            StockRecord.Load(cmd.ExecuteReader());
            return StockRecord;


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private static DataTable GetStockDataByGrower()
        {
            DropDownList DropDownList1 = new DropDownList();
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            DataTable StockRecord = new DataTable();
            string command = "select HouseNumber,GrowerName,HouseSize,StockLevel from tblGrower right join tblHouse on tblGrower.GrowerID = tblHouse.GrowerID WHERE tblGrower.GrowerID = " + DropDownList1.SelectedItem.Value + ""; 
            SqlCommand cmd = new SqlCommand(command, con);
            con.Open();
            StockRecord.Load(cmd.ExecuteReader());
            return StockRecord;


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DropDownList1.Visible = false;
            //DataTable StockRecord = GetStockDataByGrower();
            //GridView2.DataSource = StockRecord;
            //GridView2.DataBind();

            //GridView2.Visible = true;
            GridView1.Visible = true;
            GridView2.Visible = false;
            
          
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex != null && DropDownList1.SelectedItem.Text != "Select")
            {
                GridView1.Visible = false;
                //   DropDownList DropDownList1 = new DropDownList();
                SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
                DataTable StockRecord = new DataTable();
                string command = "select HouseNumber,GrowerName,HouseSize,StockLevel from tblGrower right join tblHouse on tblGrower.GrowerID = tblHouse.GrowerID WHERE tblGrower.GrowerID = " + DropDownList1.SelectedItem.Value + "";
                SqlCommand cmd = new SqlCommand(command, con);
                con.Open();

                StockRecord.Load(cmd.ExecuteReader());

                GridView2.DataSource = StockRecord;
                GridView2.DataBind();
                GridView2.Visible = true;
                DropDownList1.Visible = true;
            }
            else
            {
                GridView2.Visible = false;

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DropDownList1.Visible = true;
            //DataTable StockRecord = GetStockDataByGrower();
            //GridView2.DataSource = StockRecord;
            //GridView2.DataBind();

            //GridView2.Visible = true;
            GridView1.Visible = false;
            Button1.Text = "Full View";

        }

       
    }
}