using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace AirlineBookingSystem
{
    public partial class logreg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void apidata_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/US/USD/en-US/SFO-sky/JFK-sky/2021-06-12?inboundpartialdate=2019-12-01");
            var request = new RestRequest(Method.GET);
            request.AddHeader("x-rapidapi-key", "100aee3d20msh6de230251b45d00p1e0503jsnf0e186ce0144");
            request.AddHeader("x-rapidapi-host", "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com");
            IRestResponse response = client.Execute(request);
            Response.Write(response.Content);
        }

        public string GetWhileLoopData()
        {
            string from = Request.Form.Get("source");
            string to = Request.Form.Get("destination");
            string htmlStr = " ";
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;database=flyair;username=root;password=;");
            conn.Open();
            string query = "Select * from flight where source='"+ from +"' and destination='"+ to +"'";
            MySqlCommand cmdd = new MySqlCommand(query, conn);
            MySqlDataReader mydr = cmdd.ExecuteReader();
            while (mydr.Read())
            {
                string flino1 = mydr.GetString(1);
                string sairline1 = mydr.GetString(8);
                string source1 = mydr.GetString(2);
                string destination1 = mydr.GetString(3);
                string date1 = mydr.GetString(6);
                string dtime1 = mydr.GetString(4);
                string atime1 = mydr.GetString(5);
                string price1 = mydr.GetString(7);
                htmlStr += "<tr><td>" + flino1 + "</td><td>" + sairline1 + "</td><td>" + source1 + "</td><td>" + destination1 + "</td>" +
                    "<td>" + date1 + "</td><td>" + dtime1 + "</td><td>" + atime1 + "</td><td>" + price1 + "</td>";
            }
            conn.Close();
            return htmlStr;
        }
    }
}