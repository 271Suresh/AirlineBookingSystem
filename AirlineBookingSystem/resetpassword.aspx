<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetpassword.aspx.cs" Inherits="AirlineBookingSystem.resetpassword" %>

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

          .button {
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
            height: 50vh;
            align-items: center;
            align-self: center;
            margin: auto;
            margin-top: 3rem;
            padding: 3rem;
          }

          .container {
            display: flex;
            flex-direction: column;
            padding: 3rem;
          }
        </style>
    </head>
<body>
    <div class="fl">
        <div class="nav-bar">
            <h1><a href="home.aspx"> WELCOME TO FlyAIR</a></h1>
            <ul class="menu">
                <li><a href="bookings.aspx"> Bookings</a></li>
                <li><a href="profile.aspx"> <i class="fa fa-user-circle" aria-hidden="true"></i></a></li>
                <li><a href="login.aspx">LOGIN</a></li>
                <li><a href="register.aspx"> REGISTER</a></li>
            </ul>
        </div>
        <div class="outer-block">
            <h1 style="color: white">Reset Password</h1>
            <div class="middle-block">
                <form action="register.aspx" runat="server" method="post">
                    <div class="container">
                        <input type="text" placeholder="Email Id" name="email" required />
                        <input type="text" placeholder="Current Password" name="curpass" required />
                        <input type="text" placeholder="New Password" name="pass" required />
                        <input type="text" placeholder="Confirm Password" name="cpass" required />
                        <asp:Button class="button" Text="Reset" runat="server" Id="Button1" OnClick="Button1_Click"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
