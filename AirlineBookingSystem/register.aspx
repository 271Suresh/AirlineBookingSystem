<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="AirlineBookingSystem.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap"
      rel="stylesheet"
    />
    <title></title>
    <style>
      * {
        padding: 0;
        margin: 0;
        font-family: "Poppins", sans-serif;
      }
      .border {
     
        width: 98.5%;
        padding: 9px;
        margin-top: 2rem;
        background-repeat: no-repeat;
      }
      body {
        background: url("images/plane2.jpg");
        height: 100vh;
        display: flex;
      }
      input,
      select,
      option {
        padding: 12px 20px;
        margin: 8px 0;
        border: 1px solid #ccc;
        box-sizing: border-box;
        border-radius: 12px;
      }

      button {
        background-color: #ff7043;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        border-radius: 12px;
      }

      button:hover {
        opacity: 0.8;
      }
      .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
        border-radius: 20px;
      }

      img.avatar {
        width: 15%;
        height: 10%;
        border-radius: 1%;
      }

      span.psw {
        float: right;
        padding-top: 16px;
      }
      .outer-container {
        padding: 2rem;
        margin: auto;
        background: rgba(79, 195, 247, 0.25);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(4px);
        -webkit-backdrop-filter: blur(4px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
        display: flex;
        flex-direction: column;
        align-items: center;
        align-self: center;
      }
    </style>
  </head>
  <body>
    <div align="center" class="outer-container">
      <h1 style="color: white">WELCOME TO FlyAIR</h1>

      <div class="border">
        <form
          id="registration"
          runat="server"
          method="post"
          action="login.aspx"
        >
          <div class="container">
            <input type="text" name="fname" placeholder="First Name" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="lname" placeholder="Last Name" /> <br />
            <select name="Gender" id="gender">
              <option value="">Select Gender</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="others">Others</option>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input
              type="Date"
              name="date"
              placeholder="DOB"
              style="width: 165px"
            />
            <br />
            <input type="text" name="city" placeholder="City" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="state" placeholder="State" /> <br />
            <input type="text" name="email" placeholder="Email" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="phoneno" placeholder="Mobile No" /> <br />
            <input type="text" name="pass" placeholder="Password" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="cpass" placeholder="Confirm Password" />
            <br />
            <button type="submit">Register</button><br />
            <br />
          </div>
          <br />
        </form>
      </div>
    </div>
  </body>
</html>
