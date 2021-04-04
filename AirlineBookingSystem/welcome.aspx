<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="AirlineBookingSystem.welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap"
      rel="stylesheet"
    />
    <style>
          * {
       
        font-family: "Poppins", sans-serif;
       
      }
        body{
          background: #3da7e0;
        }
            
        .container{

          text-align: center;
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate(-50%,-50%);
          width: 100%;
        }
        .container span{
          text-transform: uppercase;
          display: block;
        }
        .text1{
          color: white;
          font-size: 60px;
          font-weight: 700;
          letter-spacing: 5px;
          margin-bottom: 20px;
          background: #3da7e0;
          position: relative;
          animation: text 3s 1;
        }
        .text2{
          font-size: 30px;
          color: darkpurple;
        }

        @keyframes text {
          0%{
            color: #e66363;
            margin-bottom: -40px;
          }
          30%{
        color: #e66363;
            letter-spacing: 25px;
            margin-bottom: -40px;
          }
          85%{
        color: black;
            letter-spacing: 8px;
            margin-bottom: -40px;
          }
        }

    </style>
    <script>
          setTimeout('window.location="home.aspx";', 5000);
    </script>
</head>

<body>
    <div class="container">
        <span class="text1">FlyAIR</span>
        <span class="text2">Airline Booking System </span>
    </div>
</body>
</html>
