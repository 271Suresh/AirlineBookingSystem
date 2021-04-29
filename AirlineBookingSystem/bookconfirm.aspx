<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookconfirm.aspx.cs" Inherits="AirlineBookingSystem.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Home page</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
      crossorigin="anonymous"
    />
    <style type="text/css">
      * {
        padding: 0%;
        margin: 0%;
        font-family: "Poppins", sans-serif;
        box-sizing: border-box;
      
      }

      .nav-bar {
        background: rgba(2, 119, 189, 0.55);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(6.5px);
        -webkit-backdrop-filter: blur(6.5px);
        height: 70px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 1.5rem;
      }
      .menu {
        display: flex;
      }
      .nav-bar h1 {
        color: white;
      }
      .menu li {
        margin-left: 4.5rem;
        list-style: none;
      }
      a {
        text-decoration: none;
        color: white;
      }

      .fl {
        display: flex;
        flex-direction: column;
      }
      body {
        height: 100vh;

        background-image: url("images/plane2.jpg");
      }

      input[type="text"],
      input[type="email"],
      input[type="password"] {
        padding: 12px 20px;
        margin: 8px 0;
        border: 1px solid #ccc;
        box-sizing: border-box;
        border-radius: 12px;
      }

      button {
        background-color: rgb(233, 55, 55);
        color: white;
        padding: 14px 20px;
        margin: 20px 0;
        border: none;
        cursor: pointer;
        text-decoration: none;
        border-radius: 12px;
        text-align: center;
      }

      button:hover,
      a:hover {
        opacity: 0.8;
      }

      .container {
        display: flex;
        flex-direction: column;
        padding: 3rem;
      }
      .navigator {
        font-size: larger;
        align-self: center;
        display: flex;
        width: 100%;
        justify-content: space-evenly;
        margin-bottom: 2%;
      }
      .middle-block {
        width: 100%;
      }
      .page1,
      .page2 {
        display: flex;
        flex-direction: column;
        width: 100%;
      }
      .cards {
        background: rgba(79, 195, 247, 0.25);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(4px);
        -webkit-backdrop-filter: blur(4px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
        display: flex;
        align-items: flex-start;
        justify-content: space-evenly;
        margin-bottom: 4%;
        width: 80%;
      }

      .myButton {
        color: white;
        background-color: transparent;
        display: inline-block;
        cursor: pointer;
        font-size: 17px;
        padding: 16px 31px;
        border: none;
      }
      .outer-block {
        display: flex;
        background: rgba(79, 195, 247, 0.25);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(4px);
        -webkit-backdrop-filter: blur(4px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
        width: 90%;
        height: 80vh;
        margin: auto;
        margin-top: 3rem;
        padding: 3rem;
      }

      .leftbox {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
      }

      /* table */
       table.purpleHorizon {
        background-color: none;
        width: 350px;
        text-align: left;
        border-collapse: collapse;
      }
      table.purpleHorizon td,
      table.purpleHorizon th {
        border: 1px solid #555555;
        padding: 10px 0px;
      }
      table.purpleHorizon tbody td {
        font-weight: bold;
        color: #ffffff;
      }
      table.purpleHorizon tr:nth-child(even) {
        background: #cc3bfc;
      }

      table.purpleHorizon thead th {
        font-size: 19px;
        font-weight: bold;
      color: black;
        text-align: left;
      }
      table.purpleHorizon thead th:first-child {
        border-left: none;
      }

      table.purpleHorizon tfoot {
        font-size: 13px;
        font-weight: bold;
        color: #ffffff;
        border-top: 5px solid #792396;
      }
      table.purpleHorizon tfoot td {
        font-size: 13px;
      }
      .boxbut {
        display: flex;
        justify-content: space-evenly;
      }
      .type {
        text-align: center;
      }

      .rightbox {
        display: flex;
        flex-direction: column;

        flex: 1;
      }

      h4,
      h3 {
        padding: 10px;
      }

      .topbox {
        display: flex;
        justify-content: space-between;
      }
    </style>
  </head>
  <body>
    <div class="fl">
        <div class="nav-bar">
                        <h1><a href="home.aspx"> WELCOME TO FlyAIR</a></h1>
                        <ul class="menu">
                            <%
                            if (Session["email"]!=null)
                            {   %>
                            <li>
                                <a href="bookings.aspx"> Bookings</a>
                            </li>
                            <li>
                                <a href="profile.aspx"> <i class="fa fa-user-circle" aria-hidden="true"></i></a>
                            </li>
                    
                            <li><form   runat="server" method="post">
                                <asp:Button Text="Logout" class="myButton" runat="server" Id="logout" OnClick="logout_Click"/></form></li>
                            <%  }
                            else
                            { %>
                            <li><a href="login.aspx"> Login</a></li>
                            <li><a href="register.aspx"> REGISTER</a></li>
                            <%  } %>
        
                        </ul>
                    </div>

                      
      <div class="outer-block">
        <div class="leftbox">
          <div class="ecobox">
            <div class="type">Economic</div>
            <div class="boxbut">
              <table class="purpleHorizon">
                <thead>
                  <tr>
                    <th>Seat</th>
                    <th>Price</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>33</td>
                    <td>1111</td>
                  </tr>
                </tbody>
              </table>
                <form   runat="server" method="post">
                    <asp:Button Text="Economic" runat="server" Id="Economic" OnClick="Economic_Click"/>
                   </form>
              <button>add</button>
            </div>
          </div>

          <div class="firstclass">
            <div class="type">First Class</div>
            <div class="boxbut">
              <table class="purpleHorizon">
                <thead>
                  <tr>
                    <th>Seat</th>
                    <th>Price</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>33</td>
                    <td>1111</td>
                  </tr>
                </tbody>
              </table>
               <asp:Button Text="FirstClass" runat="server" Id="FirstClass"/>
              <button>add</button>
            </div>
          </div>

          <div class="business">
            <div class="type">Business</div>
            <div class="boxbut">
              <table class="purpleHorizon">
                <thead>
                  <tr>
                    <th>Seat</th>
                    <th>Price</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>33</td>
                    <td>1111</td>
                  </tr>
                </tbody>
              </table>
              <button>add</button>
            </div>
          </div>
        </div>
        <div class="rightbox">
          <div class="topbox">
            <div class="indexname">
              <h4>Username</h4>
              <h4>flight name</h4>
              <h4>Economy</h4>
              <h4>business</h4>
              <h4>first class</h4>
              <h3>Total Amount</h3>
            </div>
            <div class="value">
              <h4>Pranath naik</h4>
              <h4>Air asia</h4>
              <h4>0</h4>
              <h4>1</h4>
              <h4>2</h4>
              <h3>212</h3>
            </div>
          </div>
          <a href="payment.aspx">Book</a>
        </div>
      </div>
    </div>
  </body>
</html>