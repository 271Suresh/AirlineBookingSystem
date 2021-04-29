<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="AirlineBookingSystem.payment" %>

<!DOCTYPE html>


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
            width: 50%;
            padding: 0 16px;
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
            width: 100%;
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
            width:100%;
          }

          .button:hover,
          a:hover {
            opacity: 0.8;
          }
          .outer-block {
            display: flex;
            flex-direction: column;
            background: rgba(55, 224, 21, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            width: 70%;
            height: 100vh;
            margin: auto;
            margin-top: 3rem;
            padding: 3rem;
          }
          .cart-block {
            display: flex;
            flex-direction: column;
            background: rgba(55, 224, 21, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            width: 25%;
            height: 30vh;
            margin: auto;
            margin-top: 3rem;
            padding: 3rem;
          }

          .h-block{
              display:flex;
          }

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
            form{
                padding-top: 30px;
                padding-bottom: 30px;
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
            <div class="h-block">
                <div class="outer-block">
                    <h1 style="color: white;text-align:center">Traveller Info & Payment</h1>
                    <form action="register.aspx" method="post">
                        <div class="h-block" >
                            <div class="middle-block">
                                <h3>Passengers Details</h3>
                                <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                                <input type="text" id="fname" name="firstname" placeholder="Name" required/>
                                <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                <input type="text" id="email" name="email" placeholder="john@example.com" required/>
                                <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                                <input type="text" id="adr" name="address" placeholder="Area-Street" required/>
                                <label for="city"><i class="fa fa-institution"></i> City</label>
                                <input type="text" id="city" name="city" placeholder="Pune" required/>
                                <div class="h-block">
                                    <div class="middle-block">
                                        <label for="state">State</label>
                                        <input type="text" id="state" name="state" placeholder="Maharastra" required/>
                                    </div>
                                    <div class="middle-block">  
                                        <label for="zip">Zip</label>
                                        <input type="text" id="zip" name="zip" placeholder="10001" required/>
                                    </div>
                                </div>
                            </div>
                                
                                    
                            <div class="middle-block">
                                <h3>Payment</h3>
                                    
                                <label for="cname">Card Holder Name</label>
                                <input type="text" id="cname" name="cardname" placeholder="Card Holder" required/>
                                <label for="ccnum">Credit card number</label>
                                <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444" required/>
                                <label for="expmonth">Exp Month</label>
                                <input type="text" id="expmonth" name="expmonth" placeholder="September" required/>
                                <div class="h-block">
                                    <div class="middle-block">
                                        <label for="expyear">Exp Year</label>
                                        <input type="text" id="expyear" name="expyear" placeholder="2021" required/>
                                    </div>
                                    <div class="middle-block"> 
                                        <label for="cvv">CVV</label>
                                        <input type="text" id="cvv" name="cvv" placeholder="352" required/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <a href="" class="button" style="background-color: #0277bd">Make Payment</a>
                    <a href="home.aspx" class="button">Cancel</a>
                </div>
                <div class="cart-block">
                    <h1 style="color: white;text-align:center">Fare</h1>
                </div>
            </div>
        </div>
    </body>
</html>

