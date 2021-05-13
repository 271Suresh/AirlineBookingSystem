using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace AirlineBookingSystem
{
    public partial class bookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
        }

        public string fdate()
        {
            string htmstr = "";
            string custid = ((string)Session["custid"]);
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("select distinct f.date from flight f, cust c, booking b where b.fid=f.fid and b.custid='" + custid + "'", conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();

            while (mydr.Read())
            {
                string fdate = mydr.GetString(0);
                htmstr+= "<hr style='background-color:#483D8B;height:3px;border: none;'/><h2>" + fdate + " </h2><br><br><br><br><br><br><br><br>";
            }
                

            return htmstr;
        }
        
        public string departArrive()
        {
            string htmstr = "";
            string custid = ((string)Session["custid"]);
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("select distinct f.fid,f.source,f.destination,f.departuretime,f.arrivaltime,f.airlinename from flight f, cust c, booking b where b.fid=f.fid and b.custid='" + custid+"'", conn);
            MySqlDataReader mydr1 = cmdd.ExecuteReader();
            while (mydr1.Read())
            {
                string from = mydr1.GetString(1);
                string to = mydr1.GetString(2);
                string dtime = mydr1.GetString(3);
                string atime = mydr1.GetString(4);
                htmstr+= "<hr style='background-color:#483D8B;height:3px;border: none;'/><h2 style='color:#DC143C;'>" + from + "</h2>"+"<h1>To</h1>"+ "<h2 style='color:#008000;'>" + to+"</h2>" +
                    "<h4>" +dtime+"</h4>" + "<h2>-</h2>" + "<h4>" + atime + "</h4><br>";
            }
            return htmstr;
        }

        public string booked()
        {
            string htmstr = "";
            string custid = ((string)Session["custid"]);
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("select distinct b.eseat,b.bseat,b.fseat,b.eprice,b.bprice,b.fprice,b.tamount,b.bdate from flight f, cust c, booking b where b.fid=f.fid and b.custid='" + custid + "'",conn);
            MySqlDataReader mydr1 = cmdd.ExecuteReader();
            while (mydr1.Read())
            {
                string eseat = mydr1.GetString(0);
                string bseat = mydr1.GetString(1);
                string fseat = mydr1.GetString(2);
                string eprice = mydr1.GetString(3);
                string bprice = mydr1.GetString(4);
                string fprice = mydr1.GetString(5);
                string tfare = mydr1.GetString(6);
                string bdate = mydr1.GetString(7);
                htmstr+= "<hr style='background-color:#483D8B;height:3px;border: none;'/><h3>Economic Cls : " + eseat + "</h3>" + "<h4 style='color:#DC143C;'>Fare : ₹ " + eprice + "</h4>" +
                        "<h3>Business Cls : " + bseat + "</h3>" + "<h4 style='color:#DC143C;'>Fare : ₹ " + bprice + "</h4>" +
                        "<h3>First Cls : " + fseat + "</h3>" + "<h4 style='color:#DC143C;'>Fare : ₹ " + fprice + "</h4>" +
                        "<h3 style='color:#008000;'>Total Fare : ₹ " + tfare + "/-</h3>" +
                        "<h4>Booking Date : " + bdate + "</h4><br>";
            }
            return htmstr;
        }
    }
}