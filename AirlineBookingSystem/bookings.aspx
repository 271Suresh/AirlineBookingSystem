<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookings.aspx.cs" Inherits="AirlineBookingSystem.bookings" %>
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
            align-items:center;
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
            margin: 8px 0;
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
          .outer-block {
            display: flex;
            flex-direction: column;
            background: rgba(79, 195, 247, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            width: 80%;
            height: 80vh;
            margin: auto;
            margin-top: 3rem;
            padding: 3rem;
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
            color:white;
	        background-color:transparent;
	        display:inline-block;
	        cursor:pointer;
	        font-size:17px;
	        padding:16px 31px;
            border:none;
            }
        </style>
        <script>
          function show(shown, hidden) {
            document.getElementById(shown).style.display = "block";
            document.getElementById(hidden).style.display = "none";
            return false;
          }
        </script>
    </head>
    <body>
        <div class="fl">
            <div class="nav-bar">
                <h1>WELCOME TO FlyAIR</h1>
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
                    
                            <li> <form   runat="server" method="post">
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
                <div class="navigator">
                    <div>
                        <a href="#" onclick="return show('page2','page1');">
                            Completed Trips
                        </a>
                    </div>
                    <div>
                        <a href="#" onclick="return show('page1','page2');">Upcoming trips
                        </a>
                    </div>
                </div>

                <div class="middle-block">
                    <div  class="page1" id="page1">
                        <div class="cards">
                            <div class="date">
                                <h3 style='color:#483D8B;'>Travelling Date</h3>
                                <hr style='background-color:#483D8B;height:3px;border: none;'/>

                                <%=fdate()%>
                            </div>
                            <div class="place">
                                <h3 style='color:#483D8B;'>Departs - Arrives</h3>
                                <hr style='background-color:#483D8B;height:3px;border: none;'/>

                                 <%=departArrive()%>
                            </div>
                            <div class="details">
                                <h3 style='color:#483D8B;'>Booking Details</h3>
                                <hr style='background-color:#483D8B;height:3px;border: none;'/>
                                <%=booked()%>
                            </div>
                        </div>
                    </div>

                    <div id="page2" style="display: none">
                        <div id="page1">
                            <div class="cards">
                                <div class="date">
                                    <h1>Travel Date</h1>
                                    <h1>21</h1>
                                    March 2021
                                    <p>sunday</p>
                                    
                                </div>
                                <div class="place">
                                    <h1>Pune-Goa</h1>
                                    <p>Emirates</p>
                                </div>
                                <div class="details">
                                    <h1>Completed</h1>
                                    <p>trip1202</p>   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
