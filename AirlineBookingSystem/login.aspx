<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="AirlineBookingSystem.login" %>
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
        padding: 0%;
        margin: 0%;
        font-family: "Poppins", sans-serif;
        box-sizing: border-box;
      }
      body {
        height: 100vh;
        padding: 4rem;
        background-image: url("images/plane2.jpg");
      }

      input[type="text"],
      input[type="password"] {
        padding: 12px 20px;
        margin: 8px 0;
        border: 1px solid #ccc;
        box-sizing: border-box;
        border-radius: 12px;
      }

      button {
        background-color: rgb(233, 55, 55);
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;

        border-radius: 12px;
      }

      button:hover {
        opacity: 0.8;
      }

      .middle-block {
        background: pink;
        display: flex;
        align-items: center;
        height: 80vh;
        background: rgba(78, 176, 247, 0.25);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(4px);
        -webkit-backdrop-filter: blur(4px);
        border-radius: 10px;
      }
      .container {
        display: flex;
        flex-direction: column;

        padding: 7rem;
      }
      .image {
        width: 50%;
      }
      .form-container {
        width: 50%;
      }
    </style>
  </head>
  <body>
    <div class="middle-block">
      <div class="image">
        <img src="images/login.png" height="505px" width="" alt="" />
      </div>
      <div class="form-container">
        <form action="register.aspx" method="post">
          <div class="container">
            <input
              type="text"
              placeholder="Enter Username"
              name="uname"
              required
            />
            <input
              type="password"
              placeholder="Enter Password"
              name="psw"
              required
            />
            <button type="submit">Login</button>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
