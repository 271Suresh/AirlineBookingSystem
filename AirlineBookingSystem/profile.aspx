<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="AirlineBookingSystem.WebForm1" %>

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
          .middle-block {
            width: 100%;
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
            padding: 10px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 12px;
            /*width: 500px*/
          }

          .button{
            background-color: rgb(233, 55, 55);
            color: white;
            padding: 10px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            text-decoration: none;
            border-radius: 12px;
            text-align: center;
          }

          .button:hover,
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
            width: 40%;
            height: 105vh;
            margin: auto;
            margin-top: 3rem;
            padding: 3rem;
          }

          /*.h-block{
              display:flex;
          }*/

          .container {
            display: flex;
            flex-direction: column;
            padding: 3rem;
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
            img{
                width:50%;
                border-radius:20px;
                margin-left:110px;
            }
            .topbox {
                display: flex;
                justify-content:space-evenly;
                
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
                    <a href="profile.aspx"> <i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp;<%=Session["fname"]%></a>
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
            <%--<div class="h-block">--%>
                <div class="outer-block">
                    <h1 style="color: white;text-align:center">Profile Page</h1>
                    <div class="middle-block">
                        <div class="container">
                            <img src="user.jpg" /><br />
                            <div class="topbox">
                                <div class="indexname">
                                    <h4>User Name</h4><br />
                                    <h4>City</h4><br />
                                    <h4>State</h4><br />
                                    <h4>Gender</h4><br />
                                    <h4>Mobile No.</h4>
                                </div>
                                <div class="value">
                                    <%=GetWhileLoopData()%>
                                </div>
                            </div>
                            <br />
                            <a href="resetpassword.aspx" class="button" style="background-color: #0277bd">Change Password</a>
                            <a href="home.aspx" class="button">Cancel</a>
                        </div>
                    </div>
                </div>
                <%--<div class="outer-block">
                    <h1 style="color: white;text-align:center">update details</h1>
                    <div class="middle-block">
                        <form action="register.aspx" method="post">
                            <div class="container" style="text-align:center">
                                <button type="submit" class="button">update</button>
                                <button type="submit" class="button" style="background-color: #0277bd">
                                cancel
                                </button>
                                <a href="resetpassword.aspx" class="button" style="background-color: #0277bd">change password</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>--%>
        </div>
    </body>
</html>
