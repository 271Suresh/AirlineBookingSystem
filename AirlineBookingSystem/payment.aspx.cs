using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

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
            int custid = int.Parse(Application["custid"].ToString());
            int fid = int.Parse(Application["fid"].ToString());
            int ecount = int.Parse(Application["ecount"].ToString());
            int eprice = int.Parse(Application["eprice"].ToString());
            int bcount = int.Parse(Application["bcount"].ToString());
            int bprice = int.Parse(Application["bprice"].ToString());
            int fcount = int.Parse(Application["fcount"].ToString());
            int fprice = int.Parse(Application["fprice"].ToString());
            int tamount = int.Parse(Application["tamount"].ToString());
            Response.Write("custid--" + custid);
            Response.Write("<br>fid--" + fid);
            Response.Write("<br>eseat--" + ecount);
            Response.Write("<br>eprice--" + eprice);
            Response.Write("<br>bseat--" + bcount);
            Response.Write("<br>bprice--" + bprice);
            Response.Write("<br>fseat--" + fcount);
            Response.Write("<br>fprice--" + fprice);
            Response.Write("<br>total fare--" + tamount);
            Response.Write("<br>booking date--"+Application["today"]);
        }

        protected void button_Click(object sender, EventArgs e)
        {
            int custid = int.Parse(Application["custid"].ToString());
            int fid = int.Parse(Application["fid"].ToString());
            int ecount = int.Parse(Application["ecount"].ToString());
            int eprice = int.Parse(Application["eprice"].ToString());
            int bcount = int.Parse(Application["bcount"].ToString());
            int bprice = int.Parse(Application["bprice"].ToString());
            int fcount = int.Parse(Application["fcount"].ToString());
            int fprice = int.Parse(Application["fprice"].ToString());
            int tamount = int.Parse(Application["tamount"].ToString());
            string fname = Request.Form.Get("fname");
            string dob = Request.Form.Get("dob");
            string mob = Request.Form.Get("mob");
            string email = Request.Form.Get("email");
            string state = Request.Form.Get("state");
            string zip = Request.Form.Get("zip");

            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=;");
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("insert into flyair.booking(custid,fid,eseat,eprice,bseat,bprice,fseat,fprice,tamount,bdate)values(@a1,@a2,@a3,@a4,@a5,@a6,@a7,@a8,@a9,@a10)", conn);
            cmdd.Parameters.AddWithValue("@a1", custid);
            cmdd.Parameters.AddWithValue("@a2", fid);
            cmdd.Parameters.AddWithValue("@a3", ecount);
            cmdd.Parameters.AddWithValue("@a4", eprice);
            cmdd.Parameters.AddWithValue("@a5", bcount);
            cmdd.Parameters.AddWithValue("@a6", bprice);
            cmdd.Parameters.AddWithValue("@a7", fcount);
            cmdd.Parameters.AddWithValue("@a8", fprice);
            cmdd.Parameters.AddWithValue("@a9", tamount);
            cmdd.Parameters.AddWithValue("@a10", Application["today"]);
            //cmdd.ExecuteNonQuery();
            int modified = (int)cmdd.ExecuteScalar();
            Response.Write(modified);
            conn.Close();

            MySqlConnection connn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            connn.Open();
            MySqlCommand cmddd = new MySqlCommand("select * from booking where custid=" + custid + " and fid=" + fid, connn);

            MySqlDataReader mydr = cmddd.ExecuteReader();
            while (mydr.Read())
            {
                int bid = int.Parse(mydr.GetString(0).ToString());
                Response.Write(bid);
                //MySqlConnection con = new MySqlConnection("datasource=localhost;port=3306;username=root;password=;");
                //con.Open();
                //MySqlCommand cmd = new MySqlCommand("insert into flyair.payment(pname,dob,mobile,email,state,zip,payment_type,bid) values(@a1,@a2,@a3,@a4,@a5,@a6,@a7,@a8,@a9,@a10)", con);
                //cmd.Parameters.AddWithValue("@a1", fname);
                //cmd.Parameters.AddWithValue("@a2", dob);
                //cmd.Parameters.AddWithValue("@a3", mob);
                //cmd.Parameters.AddWithValue("@a4", email);
                //cmd.Parameters.AddWithValue("@a5", state);
                //cmd.Parameters.AddWithValue("@a6", zip);
                //cmd.Parameters.AddWithValue("@a7", tamount);
                //cmd.Parameters.AddWithValue("@a8", fprice);
                //cmd.Parameters.AddWithValue("@a9", tamount);
                //cmd.Parameters.AddWithValue("@a10", Application["today"]);
                //cmd.ExecuteNonQuery();
                //Response.Redirect("payment.aspx");
                //con.Close();
            }
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
                htmstr = "<h4>" + ecount + " </h4><h4>" + eprice + " </h4><h4>" + bcount + " </h4><h4>" + bprice + " </h4><h4>" + fcount + " </h4><h4>" + fprice + " </h4><h4>" + tamount + " </h4>";
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