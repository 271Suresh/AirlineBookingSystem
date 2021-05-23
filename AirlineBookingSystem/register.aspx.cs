using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace AirlineBookingSystem
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void button_Click(object sender, EventArgs e)
        {
           
            string fname = Request.Form.Get("fname");
            string lname = Request.Form.Get("lname");
            string gen = Request.Form.Get("gender");
            string dob = Request.Form.Get("dob");
            string city = Request.Form.Get("city");
            string state = Request.Form.Get("state");
            string email = Request.Form.Get("email");
            string ph = Request.Form.Get("phoneno");
            string pass = Request.Form.Get("pass");
            string cpass = Request.Form.Get("cpass");

            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            string query = "Select email from cust";
            MySqlCommand cmdd = new MySqlCommand(query, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            int email_flag = 0;
            while (mydr.Read())
            {
                if (email.Equals(mydr["email"].ToString()))
                {
                    email_flag = 1;
                }
            }

            if(email_flag == 1)
            {
                Response.Write("<script>alert('Email Already Exist, Please provide different Email')</script>");
            }
            else
            {  
                MySqlConnection con = new MySqlConnection("datasource=localhost;port=3306;username=root;password=;");
                con.Open();
                MySqlCommand cmd = new MySqlCommand("insert into flyair.cust(fname,lname,gender,dob,city,state,email,phone,pass,cpass) values('" + fname + "','" + lname + "','" + gen + "','" + dob + "','" + city + "','" + state + "','" + email + "'," + ph + ",'" + pass + "','" + cpass + "')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script language='javascript'>window.alert('Registration Successful');window.location='login.aspx';</script>");
            }

        }

        protected void button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}