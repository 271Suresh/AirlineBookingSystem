using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace AirlineBookingSystem
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Application["flightid"]);
        }

        protected void logout_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            Session.Clear();
        }

        protected void Economic_Click(object sender, EventArgs e)
        {
            string session_data = ((string)Session["email"]);
            //int flight_id= int.Parse(Application["flightid"]);

            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight", conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                string eseat = mydr.GetString(11);
                string eprice = mydr.GetString(12);
                Response.Write("seat:" +eseat);
                Response.Write("price:"+ eprice);

                
                //conn.Close();
                //if (pass == cpass)
                //{
                //    conn.Open();
                //    cmdd = new MySqlCommand("update cust set pass='" + pass + "',cpass='" + cpass + "' where email ='" + session_data + "'", conn);
                //    cmdd.ExecuteNonQuery();
                //    conn.Close();
                //    Response.Write("<script language='javascript'>window.alert('Your Password has been changed');window.location='login.aspx';</script>");
                //}

                //else
                //{
                //    Response.Write("<script>alert('Password Do Not Match!!')</script>");
                //}
            }
            //else
            //{
            //    Response.Write("<script>alert('Invalid Current Password!!')</script>");
            //}
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        public string economicdata()
        {
            string session_data = ((string)Session["email"]);
            string htmstr = "";
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight", conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                string eseat = mydr.GetString(11);
                string eprice = mydr.GetString(12);
                Response.Write("seat:" + eseat);
                Response.Write("price:" + eprice);
                htmstr = " <td>" + eseat + "</td> < td >" + eprice + " </ td > ";
            }
            return htmstr;
        }
    }
}