<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="AirlineBookingSystem.logreg" %>
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
        padding-top: 5rem;
      }

      .content {
        margin-bottom: 5rem;
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
        margin-bottom: rem;
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
    </style>
   
  </head>
  <body>
    <div class="fl">
      <div class="nav-bar">
        <h1><a href="home.aspx"> WELCOME TO FlyAIR</a></h1>
        <ul class="menu">
           <li>
            <a href="bookings.aspx"> Bookings</a>
          </li>
          <li>
            <a href="profile.aspx"> <i class="fa fa-user-circle" aria-hidden="true"></i></a>
          </li>
          <li><a href="login.aspx">LOGIN</a></li>
          <li><a href="register.aspx"> REGISTER</a></li>
        </ul>
      </div>

      <div class="backimage">
        <form action="" method="get">
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
        <div class="content2">
          <table class="styled-table">
            <thead>
              <tr>
                <th>CarrierId</th>
                <th>Name</th>
                <th>Origin place</th>
                <th>Destination place</th>
                <th>Price</th>
                <th>BOOK</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>870</td>
                <td>jetBlue</td>
                <td>New York John F. Kennedy</td>
                <td>San Francisco International</td>
                <td>7956</td>
                <td><button class="book-style">BOOK</button></td>
              </tr>
              <tr>
                <td>870</td>
                <td>jetBlue</td>
                <td>New York John F. Kennedy</td>
                <td>San Francisco International</td>
                <td>7956</td>
                <td><button class="book-style">BOOK</button></td>
              </tr>
              <tr>
                <td>870</td>
                <td>jetBlue</td>
                <td>New York John F. Kennedy</td>
                <td>San Francisco International</td>
                <td>7956</td>
                <td><button class="book-style">BOOK</button></td>
              </tr>
              <!-- and so on... -->
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </body>
</html>
