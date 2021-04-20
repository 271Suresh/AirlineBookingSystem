using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace AirlineBookingSystem
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void button_Click(object sender, EventArgs e)
        {

            string email = Request.Form.Get("uname");
            string pass = Request.Form.Get("pwd");

            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            string query = "Select email,pass from cust";
            MySqlCommand cmdd = new MySqlCommand(query, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            int email_flag = 0;
            while (mydr.Read())
            {
                if (email.Equals(mydr["email"].ToString()) && pass.Equals(mydr["pass"]))
                {
                    email_flag = 1;
                }
            }

            if (email_flag == 1)
            {
                mydr.Read();
                Session["email"] = email;
              
                Response.Redirect("home.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Username or Password')</script>");
            }
        }
    }
}