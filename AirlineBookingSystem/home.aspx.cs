using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace AirlineBookingSystem
{
    public partial class logreg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string from = source1.SelectedValue;
            string to = destination1.SelectedValue;
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            string query = "Select * from flight where source='" + from + "' and destination='" + to + "'";
            MySqlCommand cmdd = new MySqlCommand(query, conn);
            MySqlDataAdapter sda = new MySqlDataAdapter(cmdd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow row= GridView1.SelectedRow;
            Application["flightid"] = row.Cells[1].Text;
            Application["flightname"] = row.Cells[8].Text;
            Application["eseat"] = row.Cells[13].Text;
            Application["bseat"] = row.Cells[11].Text;
            Application["fseat"] = row.Cells[9].Text;
            Response.Redirect("bookconfirm.aspx");
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
             /* Verifies that the control is rendered */
        }

 
        public string GetWhileLoopData()
        {
            string from = source1.SelectedValue;
            string to = destination1.SelectedValue;
            string htmlStr = " ";
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            string query = "Select * from flight where source='"+ from +"' and destination='"+ to +"'";
            MySqlCommand cmdd = new MySqlCommand(query, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            int from_to = 0;
            while (mydr.Read())
            {
                from_to = 1;
                string flino1 = mydr.GetString(1);
                string sairline1 = mydr.GetString(8);
                string source1 = mydr.GetString(2);
                string destination1 = mydr.GetString(3);
                string date1 = mydr.GetString(6);
                string dtime1 = mydr.GetString(4);
                string atime1 = mydr.GetString(5);
                string price1 = mydr.GetString(7);
                htmlStr += "<tr><td>" + flino1 + "</td><td>" + sairline1 + "</td><td>" + source1 + "</td><td>" + destination1 + "</td>" +
                    "<td>" + date1 + "</td><td>" + dtime1 + "</td><td>" + atime1 + "</td><td>" + price1 + "</td>";
            }
            if(from_to == 0)
            {
                htmlStr = "<tr><td>No Flights Available !! Select Different Route</td></tr>";
            }
            conn.Close();
            return htmlStr;
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();

            
            
        }

        protected void dbdata_Click(object sender, EventArgs e)
        {

        }
    }
}