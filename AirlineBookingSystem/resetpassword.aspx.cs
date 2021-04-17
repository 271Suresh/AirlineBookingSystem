using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Drawing;
using MySql.Data.MySqlClient;

namespace AirlineBookingSystem
{
    public partial class resetpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			
		}

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = Request.Form.Get("email");
            string curpass = Request.Form.Get("curpass");
            string pass = Request.Form.Get("pwd");
            string cpass = Request.Form.Get("cpwd");
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select email,pass from cust where email='" + email + "' and pass='"+ curpass +"'", conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            if (mydr.HasRows == true)
            {
                mydr.Read();
                conn.Close();
                if (pass==cpass)
                {
                    conn.Open();  
                    cmdd = new MySqlCommand("update cust set pass='" + pass + "',cpass='" + cpass + "' where email ='" + email + "'" , conn);
                    cmdd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("<script language='javascript'>window.alert('Your Password has been changed');window.location='login.aspx';</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Username or Password')</script>");
            }

        }
    }
}