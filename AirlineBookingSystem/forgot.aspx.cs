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
            MySqlCommand cmdd = new MySqlCommand("Select email,pass from cust where email='"+email+"'", conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            if (mydr.HasRows == true)
            {
                mydr.Read();
				//string eml = mydr["email"].ToString();
				string pass = mydr["pass"].ToString();
				//Response.Write(eml);
				//Response.Write(pass);
				SmtpClient smtp = new SmtpClient();
				smtp.Host = "smtp.gmail.com";
				smtp.Port = 587;
				smtp.Credentials = new System.Net.NetworkCredential("flyairofficial00@gmail.com", "For@whileloop");
				smtp.EnableSsl = true;
				MailMessage msg = new MailMessage();
				msg.Subject = "Hello " + email;
				msg.Body = "Your current password is " + pass;
				string toaddress = email;
				msg.To.Add(toaddress);
				string fromaddress = "FlyAir<flyairofficial00@gmail.com>";
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