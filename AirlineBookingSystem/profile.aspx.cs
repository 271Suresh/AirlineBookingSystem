using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace AirlineBookingSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string GetWhileLoopData()
        {
            string session_data = ((string)Session["email"]);
            string htmlStr = " ";
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            string query = "Select * from cust where email='"+ session_data+"'";
            MySqlCommand cmdd = new MySqlCommand(query, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                string fname = mydr.GetString(1);
                string lname = mydr.GetString(2);
                string gen = mydr.GetString(3);
                string dob = mydr.GetString(4);
                string city = mydr.GetString(5);
                string state = mydr.GetString(6);
                string ph = mydr.GetString(8);
                Response.Write("Username - " + fname +' ' +lname);
                Response.Write("<br><br>City - " + city);
                Response.Write("<br><br>State - " + state);
                Response.Write("<br><br>Gender - " + gen);
                Response.Write("<br><br>Mobile Number - " + ph);
                Response.Write("<br><br>");
            }
            return htmlStr;
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
        }
    }
}