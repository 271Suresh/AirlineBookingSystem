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
            
            
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (Session["email"] == null)
                Response.Redirect("login.aspx");
            else
            {
                GridViewRow row = GridView1.SelectedRow;
                Application["flightid"] = row.Cells[1].Text;
                Application["flightname"] = row.Cells[8].Text;
                Application["eseat"] = row.Cells[13].Text;
                Application["eprice"] = row.Cells[14].Text;
                Application["bseat"] = row.Cells[11].Text;
                Application["bprice"] = row.Cells[11].Text;
                Application["fseat"] = row.Cells[9].Text;
                Application["fprice"] = row.Cells[9].Text;
                Response.Redirect("bookconfirm.aspx");
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
             /* Verifies that the control is rendered */
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            
        }

        protected void dbdata_Click(object sender, EventArgs e)
        {
            string from = source1.SelectedValue;
            string to = destination1.SelectedValue;
            string departuredate = ddate.Text;
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            string query = "Select * from flight where source='" + from + "' and destination='" + to + "' and date='" + departuredate + "'";
            MySqlCommand cmdd = new MySqlCommand(query, conn);
            MySqlDataAdapter sda = new MySqlDataAdapter(cmdd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Write("<script>alert('No Flight Available on this Day')</script>");
            }
            else
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
    }
}