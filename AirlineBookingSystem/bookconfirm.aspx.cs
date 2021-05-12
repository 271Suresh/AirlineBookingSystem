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
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        //private static int eseat_avail;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void logout_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            Session.Clear();
        }
       
        public string econnomicdata()
        {
            string htmstr = "";
            int fid = int.Parse(Application["flightid"].ToString());
            int eseat_avail = int.Parse(Application["eseat"].ToString());
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight where fid="+fid, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            //int eseat = 0;
            while (mydr.Read())
            {
                string eprice = mydr.GetString(13);
                htmstr = "<td>" + eseat_avail + "</td><td>" + eprice + "</td>";
            }
            //eseat_avail = eseat;
            return htmstr;
        }

        public string businessdata()
        {
            string htmstr = "";
            int fid = int.Parse(Application["flightid"].ToString());
            int bseat_avail = int.Parse(Application["bseat"].ToString());
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight where fid=" + fid, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                string bprice = mydr.GetString(11);
                htmstr = "<td>" + bseat_avail + "</td><td>" + bprice + " </ td > ";
            }
            return htmstr;
        }
        public string firstdata()
        {
            string htmstr = "";
            int fid = int.Parse(Application["flightid"].ToString());
            int fseat_avail = int.Parse(Application["fseat"].ToString());
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight where fid=" + fid, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                string fprice = mydr.GetString(9);
                htmstr = "<td>" + fseat_avail + "</td><td>" + fprice + " </ td > ";
            }
            return htmstr;
        }

        private static int ecount;
        protected void Economic_Click(object sender, EventArgs e)
        {
            int eseat_avail = int.Parse(Application["eseat"].ToString());
            if (eseat_avail <= 0)
            {
                Response.Write("<script>alert('Economic Class Bookings Are Full!!')</script>");
                return;
            }
            else
            {
                ecount++;
                Application["eseat"] = eseat_avail - 1;
            }
        }

        private static int bcount;
        protected void business_Click(object sender, EventArgs e)
        {
            int bseat_avail = int.Parse(Application["bseat"].ToString());
            if (bseat_avail <= 0)
            {
                Response.Write("<script>alert('Business Class Bookings Are Full!!')</script>");
                return;
            }
            else
            {
                bcount++;
                Application["bseat"] = bseat_avail - 1;
            }
        }

        private static int fcount;
        protected void FirstClass_Click(object sender, EventArgs e)
        {
            int fseat_avail = int.Parse(Application["fseat"].ToString());
            if (fseat_avail <= 0)
            {
                Response.Write("<script>alert('Bookings Are Full!!')</script>");
                return;
            }
            else
            {
                fcount++;
                Application["fseat"] = fseat_avail - 1;
            }
        }

        protected void ecoremove_Click(object sender, EventArgs e)
        {
            ecount--;
            if(ecount < 0)
            {
                Response.Write("<script>alert('Select seats')</script>");
                ecount = 0;
            }
            else
            {
                int eseat_avail = int.Parse(Application["eseat"].ToString());
                Application["eseat"] = eseat_avail + 1;
                
            }
        }

        protected void businessremove_Click(object sender, EventArgs e)
        {
            bcount--;
            if (bcount < 0)
            {
                Response.Write("<script>alert('Select seats')</script>");
                bcount = 0;
            }
            else
            {
                int bseat_avail = int.Parse(Application["bseat"].ToString());
                Application["bseat"] = bseat_avail + 1;

            }
        }
        protected void fcremove_Click(object sender, EventArgs e)
        {
            fcount--;
            if (fcount < 0)
            {
                Response.Write("<script>alert('Select seats')</script>");
                fcount = 0;
            }
            else
            {
                int fseat_avail = int.Parse(Application["fseat"].ToString());
                Application["fseat"] = fseat_avail + 1;

            }
        }
        public string cartdata()
        {
            string htmstr = "";
            int fid = int.Parse(Application["flightid"].ToString());
            string email = ((string)Session["email"]);
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight where fid=" + fid, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                int eprice = int.Parse(mydr.GetString(13).ToString());
                int bprice = int.Parse(mydr.GetString(11).ToString());
                int fprice = int.Parse(mydr.GetString(9).ToString());
                int tamount = eprice * ecount + bprice * bcount + fprice * fcount;
                htmstr = "<h4>" +email + " </h4><h4>" + Application["flightname"] + " </h4><h4>" + ecount + " </h4><h4>" + bcount + " </h4><h4>" + fcount + " </h4><h4>" + tamount + " </h4>";
            }         
            return htmstr;
        }
        protected void Book_Click(object sender, EventArgs e)
        {
            if (ecount == 0 
                && bcount == 0
                && fcount == 0)
            {
                Response.Write("<script>alert('You have not booked any seats')</script>");
            }
            else
            {
                string custid = ((string)Session["custid"]);
                int fid = int.Parse(Application["flightid"].ToString());
                DateTime today = DateTime.Now;
                MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
                conn.Open();
                MySqlCommand cmdd = new MySqlCommand("select * from flight where fid=" + fid, conn);
                MySqlDataReader mydr = cmdd.ExecuteReader();
                mydr.Read();
                int eprice = int.Parse(mydr.GetString(13).ToString());
                int bprice = int.Parse(mydr.GetString(11).ToString());
                int fprice = int.Parse(mydr.GetString(9).ToString());
                int ecoprice = eprice * ecount;
                int busiprice = bprice * bcount;
                int firstprice = fprice * fcount;
                //Response.Write(ecoprice);
                //Response.Write(busiprice);
                //Response.Write(firstprice);
                int tamount = ecoprice + busiprice + firstprice ;
                int nop = ecount + bcount + fcount;
                Application["custid"] = custid;
                Application["fid"] = fid;
                Application["ecount"] = ecount;
                Application["eprice"] = eprice;
                Application["bcount"] = bcount;
                Application["bprice"] = bprice;
                Application["fcount"] = fcount;
                Application["fprice"] = fprice;
                Application["tamount"] = tamount;
                Application["nop"] = nop;
                Application["ecoprice"] = ecoprice;
                Application["busiprice"] = busiprice;
                Application["firstprice"] = firstprice;
                Application["today"] = today;
                Response.Redirect("payment.aspx");
                conn.Close();
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
    }
}