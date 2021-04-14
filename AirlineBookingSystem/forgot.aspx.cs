using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Net.Mail;
using System.Net;
using MySql.Data.MySqlClient;
using System.Text;

namespace AirlineBookingSystem
{
	public partial class forgot : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Button1_Click(object sender, EventArgs e)
		{
            string email = Request.Form.Get("email");

            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            string query = "Select * from cust";
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
            string pass = mydr["pass"].ToString();
            if (email_flag == 1)
            {
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("sutharsuresh271@gmail.com", "Suresh12345271");
                smtp.EnableSsl = true;
                MailMessage msg = new MailMessage();
                msg.Subject = "Hello " + email;
                msg.Body = "Your current password is "+pass;
                string toaddress = email;
                msg.To.Add(toaddress);
                string fromaddress = "Suresh Suthar<sutharsuresh271@gmail.com>";
                msg.From = new MailAddress(fromaddress);
                smtp.Send(msg);
                Response.Write("<script>alert('email sent')</script>");

            }
            else
            {
                Response.Write("<script>alert('Invalid Username or Password')</script>");
            }
        }
	}
}