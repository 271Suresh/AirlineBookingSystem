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
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight where fid="+fid, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                string eprice = mydr.GetString(13);
                htmstr = "<td>" + eprice + "</td>";
            }
            return htmstr;
        }
        public string businessdata()
        {
            string htmstr = "";
            int fid = int.Parse(Application["flightid"].ToString());
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight where fid=" + fid, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                string bprice = mydr.GetString(11);
                htmstr = "<td>" + bprice + " </ td > ";
            }
            return htmstr;
        }
        public string firstdata()
        {
            string htmstr = "";
            int fid = int.Parse(Application["flightid"].ToString());
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Select * from flight where fid=" + fid, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                string fprice = mydr.GetString(9);
                htmstr = "<td>" + fprice + " </ td > ";
            }
            return htmstr;
        }

        private static int ecount;
        protected void Economic_Click(object sender, EventArgs e)
        {
            ecount++;
            //Response.Write("Economic seat:"+ecount);
        }
        
        private static int bcount;
        protected void business_Click(object sender, EventArgs e)
        {
            bcount++;
            //Response.Write(bcount);
        }

        private static int fcount;
        protected void FirstClass_Click(object sender, EventArgs e)
        {
            fcount++;
            //Response.Write(fcount);
        }

        protected void ecoremove_Click(object sender, EventArgs e)
        {
            ecount--;
            //Response.Write(ecount);
        }
        protected void businessremove_Click(object sender, EventArgs e)
        {
            bcount--;
            //Response.Write(bcount);
        }
        protected void fcremove_Click(object sender, EventArgs e)
        {
            fcount--;
            //Response.Write(fcount);
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
            string custid = ((string)Session["custid"]);
            int fid = int.Parse(Application["flightid"].ToString());
            DateTime today = DateTime.Today;
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("select * from flight where fid=" + fid, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                int eprice = int.Parse(mydr.GetString(13).ToString());
                int bprice = int.Parse(mydr.GetString(11).ToString());
                int fprice = int.Parse(mydr.GetString(9).ToString());
                int tamount = eprice * ecount + bprice * bcount + fprice * fcount;
                MySqlConnection con = new MySqlConnection("datasource=localhost;port=3306;username=root;password=;");
                con.Open();
                MySqlCommand cmd = new MySqlCommand("insert into flyair.booking(custid,fid,eseat,eprice,bseat,bprice,fseat,fprice,tamount,bdate)values(@a1,@a2,@a3,@a4,@a5,@a6,@a7,@a8,@a9,@a10)", con);
                cmd.Parameters.AddWithValue("@a1", custid);
                cmd.Parameters.AddWithValue("@a2", fid);
                cmd.Parameters.AddWithValue("@a3", ecount);
                cmd.Parameters.AddWithValue("@a4", eprice);
                cmd.Parameters.AddWithValue("@a5", bcount);
                cmd.Parameters.AddWithValue("@a6", bprice);
                cmd.Parameters.AddWithValue("@a7", fcount);
                cmd.Parameters.AddWithValue("@a8", fprice);
                cmd.Parameters.AddWithValue("@a9", tamount);
                cmd.Parameters.AddWithValue("@a10", today);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            conn.Close();

        }
    }
}