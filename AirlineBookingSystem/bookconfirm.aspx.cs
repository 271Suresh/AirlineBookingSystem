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
            MySqlCommand cmdd = new MySqlCommand("update flight set eseat=eseat-1", conn);  
            cmdd.ExecuteNonQuery();
            conn.Close();
      }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        public string economicdata()
        {
            string htmstr = "";
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight", conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                string eseat = mydr.GetString(12);
                string eprice = mydr.GetString(13);
                htmstr = "<td>" + eseat + "</td> <td>" + eprice + " </ td > ";
            }
            return htmstr;
        }

        public string firstclassdata()
        {
            
            string htmstr = "";
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight", conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                string eseat = mydr.GetString(8);
                string eprice = mydr.GetString(9);
                htmstr = "<td>" + eseat + "</td> <td>" + eprice + " </ td > ";
            }
            return htmstr;
        }

        public string businessdata()
        {
            string htmstr = "";
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight", conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                string eseat = mydr.GetString(10);
                string eprice = mydr.GetString(11);
                htmstr = "<td>" + eseat + "</td> <td>" + eprice + " </ td > ";
            }
            return htmstr;
        }

        protected void FirstClass_Click(object sender, EventArgs e)
        {
            string session_data = ((string)Session["email"]);
            //int flight_id= int.Parse(Application["flightid"]);
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("update flight set fseat=fseat-1", conn);
            cmdd.ExecuteNonQuery();
            conn.Close();
        }

        protected void business_Click(object sender, EventArgs e)
        {
            string session_data = ((string)Session["email"]);
            //int flight_id= int.Parse(Application["flightid"]);
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("update flight set bseat=bseat-1", conn);
            cmdd.ExecuteNonQuery();
            conn.Close();
        }

        protected void ecoremove_Click(object sender, EventArgs e)
        {
            string session_data = ((string)Session["email"]);
            //int flight_id= int.Parse(Application["flightid"]);
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("update flight set eseat=eseat+1", conn);
            cmdd.ExecuteNonQuery();
            conn.Close();
        }

        protected void fcremove_Click(object sender, EventArgs e)
        {
            string session_data = ((string)Session["email"]);
            //int flight_id= int.Parse(Application["flightid"]);
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("update flight set fseat=fseat+1", conn);
            cmdd.ExecuteNonQuery();
            conn.Close();
        }

        protected void businessremove_Click(object sender, EventArgs e)
        {
            string session_data = ((string)Session["email"]);
         
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("update flight set bseat=bseat+1", conn);
            cmdd.ExecuteNonQuery();
            conn.Close();
        }
    }
}