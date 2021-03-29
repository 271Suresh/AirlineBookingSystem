<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="AirlineBookingSystem.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        .border{
            background-image: url("back.jpg");
            width: 98.5%;
            padding: 9px;
            background-repeat:no-repeat;
        }
        input[type=text], input[type=password] {
            width: 20%;
            padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius:12px;
        }

        button {
            background-color: cornflowerblue;
            color: black;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 20%;
            border-radius:12px;
        }

        button:hover {
            opacity: 0.8;
        }
        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
            border-radius:20px;
        
        }

        img.avatar {
            width: 15%;
            height:10%;
            border-radius: 1%;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }
    </style>
</head>
<body align="center">
    <h2>Login To FlyAIR</h2>
    <hr />
    <div class="border">
       
        <form action="register.aspx" method="post">
            <div class="imgcontainer">
                <img src="user.jpg" class="avatar">
            </div>

            <div class="container">
                <input type="text" placeholder="Enter Username" name="uname" required><br />
                <input type="password" placeholder="Enter Password" name="psw" required><br />
                <button type="submit">Login</button><br />
            </div>
            <br />
        </form>
    </div>
</body>
</html>
