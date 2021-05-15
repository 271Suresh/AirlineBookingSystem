<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="AirlineBookingSystem.payment" %>

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
          input[type="password"],
          input[type="Date"],
          select,
          option {
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
            height: 60vh;
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
          h4,
          h3 {
            padding: 10px;
          }

          .topbox {
            display: flex;
            justify-content: space-between;
          }
            
        </style>
        <script>
            function fName() {
                var x = /^[A-Za-z]/;
                var no = document.forms[0].fullname.value
                if (!no.match(x)){
                    alert('invalid First Name');
                    return false;
                }
                return true;
            }
            function mobileno() {
                var x = /^\d{10}$/;
                var no = document.forms[0].mob.value
                if (!no.match(x)) {
                    alert('invalid Contact number');
                    return false;
                }
                return true;
            }
            function zipCode(){
                var x = /^\d{6}$/;
                var no = document.forms[0].zip.value
                if (!no.match(x))
            {
            alert('invalid Zip code');
            return false;
            }
            return true;
            }
            function cName() {
                var x = /^[A-Za-z]/;
                var no = document.forms[0].cardname.value
                if (!no.match(x)) {
                    alert('invalid Card Name');
                    return false;
                }
                return true;
            }
            function cNumber(){
                var x = /^\d{16}$/;
                var no = document.forms[0].cardnumber.value
                if (!no.match(x))
            {
            alert('invalid card number');
            return false;
            }
            return true;
            }
            function cvvCode(){
                var x = /^\d{3}$/;
                var no = document.forms[0].cvv.value
                if (!no.match(x))
            {
            alert('invalid CVV code');
            return false;
            }
            return true;
            }
        </script>
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
                    <form runat="server" method="post" onsubmit="return !!(fName() & mobileno() & zipCode() & cName() & cNumber() & cvvCode());">
                        <div class="h-block" >
                            <div class="middle-block">
                                <h3>Passengers Details</h3>
                                <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                                <input type="text" name="fullname" placeholder="Name" required/>
                                <label for="dob">DOB</label>
                                <input type="Date" name="dob" placeholder="DOB" required/>
                                <label for="mb">Contact No.</label>
                                <input type="text" name="mob" placeholder="Contact No" required/>
                                <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                <input type="email" name="email" placeholder="john@example.com" required/>
            
                                <div class="h-block">
                                    <div class="middle-block">
                                        <label for="state">State</label>
                                        <select name="state" required>
                                            <option value="">Select States</option>
                                            <option value="Andhra Pradesh">Andhra Pradesh</option>
                                            <option value="Chhattisgarh">Chhattisgarh</option>
                                            <option value="Bihar">Bihar</option>
                                            <option value="Goa">Goa</option>
                                            <option value="Gujarat">Gujarat</option>
                                            <option value="Haryana">Haryana</option>
                                            <option value="Jharkhand">Jharkhand</option>
                                            <option value="Karnataka">Karnataka</option>
                                            <option value="Kerala">Kerala</option>
                                            <option value="Madhya Pradesh">Madhya Pradesh</option>
                                            <option value="Maharashtra">Maharashtra</option>
                                            <option value="Odisha">Odisha</option>
                                            <option value="Punjab">Punjab</option>
                                            <option value="Rajasthan">Rajasthan</option>
                                            <option value="Telangana">Telangana</option>
                                            <option value="Uttar Pradesh">Uttar Pradesh</option>
                                            <option value="Uttarakhand">Uttarakhand</option>
                                            <option value="West Bengal">West Bengal</option>
                                        </select>
                                    </div>
                                    <div class="middle-block">  
                                        <label for="zip">Zip</label>
                                        <input type="text" name="zip" placeholder="100001" required/>
                                    </div>
                                </div>
                            </div>  
                                    
                            <div class="middle-block">
                                <h3>Payment</h3>
                                <label for="cname">Card Holder Name</label>
                                <input type="text" name="cardname" placeholder="Card Holder" required/>
                                <label for="ccnum">Credit card number</label>
                                <input type="text" name="cardnumber" placeholder="1111-2222-3333-4444" required/>
                                <label for="expmonth">Exp Month</label>
                                <select name="expmonth" required>
                                    <option value="">Select Exp Month</option>
                                    <option value="Jan">Jan</option>
                                    <option value="Feb">Feb</option>
                                    <option value="Mar">Mar</option>
                                    <option value="Apr">Apr</option>
                                    <option value="May">May</option>
                                    <option value="Jun">Jun</option>
                                    <option value="Jul">Jul</option>
                                    <option value="Aug">Aug</option>
                                    <option value="Sep">Sep</option>
                                    <option value="Oct">Oct</option>
                                    <option value="Nov">Nov</option>
                                    <option value="Dec">Dec</option>
                                </select>
                                <div class="h-block">
                                    <div class="middle-block">
                                        <label for="expyear">Exp Year</label>
                                        <select name="expyear" required>
                                            <option value="">Select Exp Year</option>
                                            <option value="2021">2021</option>
                                            <option value="2022">2022</option>
                                            <option value="2023">2023</option>
                                            <option value="2024">2024</option>
                                            <option value="2025">2025</option>
                                            <option value="2026">2026</option>
                                            <option value="2027">2027</option>
                                            <option value="2028">2028</option>
                                            <option value="2029">2029</option>
                                            <option value="2030">2030</option>
                                        </select>
                                    </div>
                                    <div class="middle-block"> 
                                        <label for="cvv">CVV</label>
                                        <input type="text" name="cvv" placeholder="352" required/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:Button class="button" Text="Make Payment" runat="server" style="background-color: #0277bd" id="button" OnClick="button_Click"/>
                        <%-- <a href="home.aspx" class="button">Cancel</a>--%>
                    </form>
                    <!-- <a href="" class="button" style="background-color: #0277bd">Make Payment</a> -->
                    <a href="home.aspx" class="button">Cancel</a>
                </div>
                <div class="cart-block">
                    <h1 style="color: white;text-align:center">Seat & Fare</h1>
                    <div class="topbox">
                        <div class="indexname">
                            <h4>Economic Class</h4>
                            <h4>Economic Fare</h4>
                            <h4>Business class</h4>
                            <h4>Business Fare</h4>
                            <h4>First class</h4>
                            <h4>First Fare</h4>
                            <hr />
                            <h3>Total Fare</h3>
                        </div>
                        <div class="value">
                            <%=seatData()%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

