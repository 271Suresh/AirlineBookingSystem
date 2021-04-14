using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
    }
}