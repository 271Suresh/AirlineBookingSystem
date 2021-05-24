using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Net.Mail;
using System.Net;
using System.Text;

namespace AirlineBookingSystem
{
    public partial class payment : System.Web.UI.Page
    {
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button_Click(object sender, EventArgs e)
        {
            int custid = int.Parse(Application["custid"].ToString());
            int fid = int.Parse(Application["fid"].ToString());
            int ecount = int.Parse(Application["ecount"].ToString());
            int eprice = int.Parse(Application["ecoprice"].ToString());
            int bcount = int.Parse(Application["bcount"].ToString());
            int bprice = int.Parse(Application["busiprice"].ToString());
            int fcount = int.Parse(Application["fcount"].ToString());
            int fprice = int.Parse(Application["firstprice"].ToString());
            int tamount = int.Parse(Application["tamount"].ToString());
            string bdate = Application["today"].ToString();
            string fname = Request.Form.Get("fullname");
            string dob = Request.Form.Get("dob");
            string mob = Request.Form.Get("mob");
            string email = Request.Form.Get("email");
            string state = Request.Form.Get("state");
            string zip = Request.Form.Get("zip");

            //inserting into booking table
            MySqlConnection con = new MySqlConnection("datasource=localhost;port=3306;username=root;password=;");
            con.Open();
            MySqlCommand cmd = new MySqlCommand("insert into flyair.booking(custid,fid,eseat,eprice,bseat,bprice,fseat,fprice,tamount,bdate)values('" + custid + "','" + fid + "','" + ecount + "','" + eprice + "','" + bcount + "','" + bprice + "','" + fcount + "'," + fprice + ",'" + tamount + "','" + bdate + "')", con);
            //cmd.Parameters.AddWithValue("@a1", custid);
            //cmd.Parameters.AddWithValue("@a2", fid);
            //cmd.Parameters.AddWithValue("@a3", ecount);
            //cmd.Parameters.AddWithValue("@a4", eprice);
            //cmd.Parameters.AddWithValue("@a5", bcount);
            //cmd.Parameters.AddWithValue("@a6", bprice);
            //cmd.Parameters.AddWithValue("@a7", fcount);
            //cmd.Parameters.AddWithValue("@a8", fprice);
            //cmd.Parameters.AddWithValue("@a9", tamount);
            //cmd.Parameters.AddWithValue("@a10", bdate);
            cmd.ExecuteNonQuery();
            con.Close();

            //subtracting seat in flight table when user does booking
            MySqlConnection con3 = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            con3.Open();
            MySqlCommand cmd3 = new MySqlCommand("update flight set eseat=eseat-'" + ecount + "',bseat=bseat-'" + bcount + "',fseat=fseat-'" + fcount + "' where fid='" + fid + "'", con3);
            cmd3.ExecuteNonQuery();
            con3.Close();

            //inserting into payment table
            MySqlConnection con1 = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            con1.Open();
            MySqlCommand cmd1 = new MySqlCommand("select * from booking where custid=" + custid + " and fid=" + fid + " and bdate ='" + bdate + "'", con1);

            MySqlDataReader mydr = cmd1.ExecuteReader();
            while (mydr.Read())
            {
                int bid = int.Parse(mydr.GetString(0).ToString());
                MySqlConnection con2 = new MySqlConnection("datasource=localhost;port=3306;username=root;password=;");
                con2.Open();
                MySqlCommand cmd2 = new MySqlCommand("insert into flyair.payment(pname,dob,mobile,email,state,zip,bid) values('" + fname + "','" + dob + "','" + mob + "','" + email + "','" + state + "','" + zip + "','" + bid + "')", con2);
                
                cmd2.ExecuteNonQuery();
                //Response.Redirect("payment.aspx");
                con.Close();
            }

            //send booking details to email
            string useremail = ((string)Session["email"]);
            int bookid = int.Parse(mydr.GetString(0));
            string bookingdate = mydr.GetString(10);
            int economic = int.Parse(mydr.GetString(3));
            int business = int.Parse(mydr.GetString(5));
            int first = int.Parse(mydr.GetString(7));
            int tfare = int.Parse(mydr.GetString(9));


            MySqlConnection con5 = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            con5.Open();
            MySqlCommand cmd5 = new MySqlCommand("select f.airlinename,f.source,f.destination,f.departuretime,f.arrivaltime,p.pname,c.custid,f.date from flight f,payment p, cust c where f.fid='"+fid+"'and p.bid='"+bookid+"'",con5);
            MySqlDataReader mydr2 = cmd5.ExecuteReader();
            mydr2.Read();
            string flightname = mydr2.GetString(0);
            string from = mydr2.GetString(1);
            string to = mydr2.GetString(2);
            string departuredate = mydr2.GetString(7);
            string departuretime = mydr2.GetString(3);
            string arrivaltime = mydr2.GetString(4);
            string pass_name = mydr2.GetString(5);

            //email
            string textBody = "Booking No. " + bookid + "<br>Booking Date: " + bookingdate + "<br>Passenger Name: " + pass_name +
                        "<br><table border=" + 1 + " cellpadding=" + 2 + " cellspacing=" + 2 + " width = " + 800 + ">" +
                        "<th bgcolor='#4da6ff'>flight</th><th bgcolor='#4da6ff'>Economic</th><th bgcolor='#4da6ff'>Business</th><th bgcolor='#4da6ff'>First</th><th bgcolor='#4da6ff'>Total fare</th><th bgcolor='#4da6ff'>Date of Departure</th><th bgcolor='#4da6ff'>Departs</th><th bgcolor='#4da6ff'>Arrives</th>" +
                        "<tr><td>" + flightname + "</td><td>" + economic + "</td><td>" + business + "</td><td>" + first + "</td><td>₹" + tfare + "</td><td>" + departuredate + "</td><td>" + from + "<br>" + departuretime + "</td><td>" + to + "<br>" + arrivaltime + "</td></tr>";

            textBody += "</table>";
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("flyairofficial00@gmail.com", "For@whileloop");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Booking Confirm";
            msg.Body = textBody;
            msg.IsBodyHtml = true;
            string toaddress = useremail;
            msg.To.Add(toaddress);
            string fromaddress = "FlyAir<flyairofficial00@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            smtp.Send(msg);
            //Response.Write("<script language='javascript'>window.alert(Booking Confirmed');window.location='login.aspx';</script>");
            Response.Redirect("BookingDone.aspx");

        }

        public string seatData()
        {
            string htmstr = "";
            int fid = int.Parse(Application["fid"].ToString());
            int ecount = int.Parse(Application["ecount"].ToString());
            int eprice = int.Parse(Application["ecoprice"].ToString());
            int bcount = int.Parse(Application["bcount"].ToString());
            int bprice = int.Parse(Application["busiprice"].ToString());
            int fcount = int.Parse(Application["fcount"].ToString());
            int fprice = int.Parse(Application["firstprice"].ToString());
            int tamount = int.Parse(Application["tamount"].ToString());
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight where fid=" + fid, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                htmstr = "<h4>" + ecount + " </h4><h4>" + eprice + " </h4><h4>" + bcount + " </h4><h4>" + bprice + " </h4><h4>" + fcount + " </h4><h4>" + fprice + " </h4><h4> ₹" + tamount + " </h4>";
            }
            return htmstr;
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
        }
    }
}