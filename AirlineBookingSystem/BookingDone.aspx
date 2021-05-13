<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingDone.aspx.cs" Inherits="AirlineBookingSystem.BookingDone" %>

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
            body {
            animation: aurora 10s infinite;
            background-image: url("images/plane2.jpg");
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

            .backimage {
            background-repeat: no-repeat;

            display: flex;
            flex-direction: column;
            padding-top: 0rem;
            }

            .content {
            margin-bottom: 5rem;
            margin-top:5rem;
            padding: 2rem;
            margin-right: 20rem;
            margin-left: 20rem;
            background: rgba(79, 195, 247, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            }

            input[type="text"],
            input {
            padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 12px;
            }
            .input {
            display: flex;
            }
            .buttons {
            display: flex;
            }
            .btn-grad {
            background-color: #ff7043;
            }
            .btn-grad {
            margin: 10px;
            padding: 15px 45px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;
            box-shadow: 0 0 20px rgb(139, 134, 130);
            border-radius: 10px;
            display: block;
            }

            .btn-grad:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
            }

            button {
            border-style: none;
            }

            .textbox {
                padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 12px;

            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            /*border-radius: 5px;
            border: 1px solid #848484;*/
            outline: 0;
            height: 3rem;
            width: 15rem;
            }
            .labeltext {
            display: flex;
            flex-direction: column;
            margin: 2rem;
            }

            .styled-table {
            border-collapse: collapse;
            font-size: 0.9em;
            font-family: sans-serif;
            min-width: 400px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            backdrop-filter: blur(7.5px);
            -webkit-backdrop-filter: blur(7.5px);
            }

            .styled-table thead tr {
            background: linear-gradient(
                45deg,
                #5eb9ff 0%,
                #5a8eff 49%,
                #6682ff 82%
            );
            backdrop-filter: blur(7.5px);
            -webkit-backdrop-filter: blur(7.5px);
            color: #ffffff;
            text-align: left;
            }
            .styled-table th,
            .styled-table td {
            padding: 12px 15px;
            }
            .styled-table tbody tr {
            border-bottom: thin solid #dddddd;
            backdrop-filter: blur(7.5px);
            -webkit-backdrop-filter: blur(7.5px);
            }

            .styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
            backdrop-filter: blur(7.5px);
            -webkit-backdrop-filter: blur(7.5px);
            }

            .styled-table tbody tr:last-of-type {
            border-bottom: thin solid #009879;
            }

            .styled-table tbody tr.active-row {
            font-weight: bold;
            color: #009879;
            }
            .content2 {
      
            /* background: rgba(90, 142, 255, 0.55);
                    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
                    backdrop-filter: blur(7.5px);
                    -webkit-backdrop-filter: blur(7.5px);
                    border-radius: 10px;
                    border: 1px solid rgba(255, 255, 255, 0.18); */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100%;
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
            .book-style {
            margin: 10px;
            padding: 12px 45px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;
            box-shadow: 0 0 20px rgb(55, 140, 173);
            border-radius: 10px;
            display: block;
            background-image: linear-gradient(
                to right,
                #eb0c7c 0%,
                #e320a8 51%,
                #eb0c56 100%
            );
            }
            /* payment */
              .green-box {
                display: flex;
                flex-direction: column;
                align-self: center;
                margin-top: 10rem;
              }
            .msg {
                color: white;
                font-size:40px;
              }
        </style>
    

        <script type="text/javascript">
            setTimeout('window.location="home.aspx";', 4000);
        </script>
    </head>
<body>
        <div class="fl">
            <div class="backimage">
                <div class="green-box">
                <img src="https://www.freeiconspng.com/thumbs/success-icon/success-icon-10.png" alt=""/>
                <div class="msg">Booking Succesfull</div>
                </div>
            </div>
        </div>
    </body>
</html>
