<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logreg.aspx.cs" Inherits="AirlineBookingSystem.logreg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <style type="text/css">
    {
        margin: 0;
        padding: 0;
    }

    .nav-bar{
    background: rgb(0, 0, 0, 0.5);
    height:60px;
    }
    .logo{
    margin: 10px 50px;
    height: 70px;
    }
    .menu{
    float: right;
    list-style: none;
    margin: -85px 50px;
    }
    .menu li{
    display: inline-block;
    margin: 10px 5px;
    }
    .menu li a{
    text-decoration: none;
    color: black;
    padding: 5px 10px;
    font-family:Arial;
    border: 1px solid white;
    border-radius:100px;
    background-color:cornflowerblue;
    }
    .menu li a:hover{
    background: black;
    transition: 1s;
    color: white;
    }
    .nav-bar h1{
        margin: 10px 90px;
        height: 90px;
        font-family: 'Montserrat', sans-serif;
    }
    body{
        align-items: center;
    }
    .content{
        top:30px;
        margin-left:170px;
        position: relative;
        height: 530px;
        width: 1150px;
        overflow: hidden;
        box-shadow: 1px 1px 15px rgba(0,0,0,0.4);
    }
    .content .images{
        height: 100%;
        width: 100%;

    }
    .images img{
        height: 100%;
        width: 100%;
    }
   
</style>
    <script>
        var indexValue = 0;
        function slideShow(){
        setTimeout(slideShow, 2500);
        var x;
        const img = document.querySelectorAll("img");
        for(x = 0; x < img.length; x++){
            img[x].style.display = "none";
            }
        indexValue++;
        if(indexValue > img.length)
        {
            indexValue = 1
        }
        img[indexValue -1].style.display = "block";
        }
        slideShow();
    </script>
</head>
    <body>
         <header>
            <div class="nav-bar">
                   <h1>WELCOME TO FlyAIR</h1>
                    <ul class="menu">
                        <li> <a href="login.aspx">LOGIN</a> </li>
                        <li> <a href="register.aspx"> REGISTER</a> </li>
                    </ul>
                </div>    
            </header>
            <br />
            <br />
            <div class="content">
              <div class="images">
                <img src="b.jpg"/>
                <img src="a.jpg"/>
                <img src="c.jpg"/>
                <img src="3.jpg"/>
              </div>
          </div>
    </body>
</html>
