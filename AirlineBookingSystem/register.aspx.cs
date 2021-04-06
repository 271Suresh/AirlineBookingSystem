﻿using System;
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
            while (mydr.Read())
            {
                if (email.Equals(mydr["email"].ToString()))
                {
                    Response.Write("<script>alert('Email Already exists')</script>");
                }
                else
                {
                    //string mycon = "Server=localhost;Database=test1;Uid=root;Password= ;";
                    MySqlConnection con = new MySqlConnection("datasource=localhost;port=3306;username=root;password=;");
                    MySqlCommand cmd = new MySqlCommand("insert into flyair.cust(fname,lname,gender,dob,city,state,email,phone,pass,cpass) values(@a1,@a2,@a3,@a4,@a5,@a6,@a7,@a8,@a9,@a10)", con);

                    cmd.Parameters.AddWithValue("@a1", fname);
                    cmd.Parameters.AddWithValue("@a2", lname);
                    cmd.Parameters.AddWithValue("@a3", gen);
                    cmd.Parameters.AddWithValue("@a4", dob);
                    cmd.Parameters.AddWithValue("@a5", city);
                    cmd.Parameters.AddWithValue("@a6", state);
                    cmd.Parameters.AddWithValue("@a7", email);
                    cmd.Parameters.AddWithValue("@a8", ph);
                    cmd.Parameters.AddWithValue("@a9", pass);
                    cmd.Parameters.AddWithValue("@a10", cpass);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Data Saved Successfully')</script>");
                    Response.Redirect("login.aspx");
                }
            }

        }

        protected void button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}