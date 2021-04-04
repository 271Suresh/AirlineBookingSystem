<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="AirlineBookingSystem.logreg" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title></title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
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
        background: linear-gradient(
          45deg,
          #5eb9ff 0%,
          #5a8eff 49%,
          #6682ff 82%
        );

        animation: aurora 10s infinite;
      }

      .nav-bar {
        background: rgba(255, 255, 255, 0.2);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(6.5px);
        -webkit-backdrop-filter: blur(6.5px);
        border: 1px solid rgba(255, 255, 255, 0.18);
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

      .backimage {
        height: 91vh;
        background-image: url("b.jpg");
        background-repeat: no-repeat;
        background-position: center;
        display: flex;
        flex-direction: column;
        padding: 6rem;
      }

      .content {
        margin-top: 3rem;
        padding: 3rem;
        background: rgba(90, 142, 255, 0.55);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(7.5px);
        -webkit-backdrop-filter: blur(7.5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }
      .input {
        display: flex;
      }
      .buttons {
        display: flex;
      }
      .btn-grad {
        background-image: linear-gradient(
          to right,
          #0cebeb 0%,
          #20e3b2 51%,
          #0cebeb 100%
        );
      }
      .btn-grad {
        margin: 10px;
        padding: 15px 45px;
        text-align: center;
        text-transform: uppercase;
        transition: 0.5s;
        background-size: 200% auto;
        color: white;
        box-shadow: 0 0 20px rgb(55, 140, 173);
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
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        border: 1px solid #848484;
        outline: 0;
        height: 3rem;
        width: 15rem;
      }
      .labeltext {
        display: flex;
        flex-direction: column;
        margin: 2rem;
      }
    </style>
    <script>
        var indexValue = 0;
        function slideShow() {
            setTimeout(slideShow, 2500);
            var x;
            const img = document.querySelectorAll("img");
            for (x = 0; x < img.length; x++) {
                img[x].style.display = "none";
            }
            indexValue++;
            if (indexValue > img.length) {
                indexValue = 1;
            }
            img[indexValue - 1].style.display = "block";
        }
        slideShow();
    </script>
  </head>
  <body>
    <div class="fl">
      <div class="nav-bar">
        <h1>WELCOME TO FlyAIR</h1>
        <ul class="menu">
          <li><a href="login.aspx">LOGIN</a></li>
          <li><a href="register.aspx"> REGISTER</a></li>
        </ul>
      </div>

      <div class="backimage">
        <form action="#" method="get">
          <div class="content">
            <div class="input">
              <div class="labeltext">
                <label for="source">FROM</label>
                <input class="textbox" type="text" name="source" id="" />
              </div>

              <div class="labeltext">
                <label for="destination">TO</label>
                <input class="textbox" type="text" name="destination" id="" />
              </div>

              <div class="labeltext">
                <label for="date">departure date</label>
                <input class="textbox" type="date" name="date" id="" />
              </div>
            </div>

            <div class="buttons">
              <div class="labeltext">
                <button class="btn-grad">
                  Search Flights
                  <i class="fa fa-arrow-right" aria-hidden="true"></i>
                </button>
              </div>

              <div class="labeltext">
                <button class="btn-grad">
                  Get Cheapest Flight
                  <i class="fa fa-arrow-right" aria-hidden="true"></i>
                </button>
              </div>
            </div>
          </div>
        </form>
        <div class="content"></div>
      </div>
    </div>
  </body>
</html>
