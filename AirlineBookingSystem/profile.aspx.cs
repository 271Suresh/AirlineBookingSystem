﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirlineBookingSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["email"]);
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();


        }
    }
}