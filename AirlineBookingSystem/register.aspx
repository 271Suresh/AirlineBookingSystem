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

      .button {
        background-color: #ff7043;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        border-radius: 12px;
      }

      .button:hover {
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
    <script>
        function fName() {
            var x = /^[A-Za-z]/;
            var no = document.forms[0].fname.value
            if (!no.match(x)) {
                alert('invalid First Name');
                return false;
            }
            return true;
        }
        function lName() {
            var x = /^[A-Za-z]/;
            var no = document.forms[0].lname.value
            if (!no.match(x)) {
                alert('invalid Last Name');
                return false;
            }
            return true;
        }
	    function phno(){
            var x = /^\d{10}$/;
            var no = document.forms[0].phoneno.value
            if (!no.match(x))
		    {
			    alert('invalid phone Number');
			    return false;
		    }
		    return true;
        }
        function passCpass() {
            var pwd = document.forms[0].pass.value
            var cpwd = document.forms[0].cpass.value
            if (pwd == cpwd) {
                return true;
            }
            else {
                alert("Password does not match");
                return false;
            }
        }
    </script>
  </head>
  <body>
    <div align="center" class="outer-container">
      <h1 style="color: white">WELCOME TO FlyAIR</h1>

      <div class="border">
        <form
            id="registration"
            runat="server"
            method="post"
            onsubmit="return !!(fName() & lName() & phno() & passCpass());"
        >
          <div class="container">
            <input type="text" name="fname" placeholder="First Name" required/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="lname" placeholder="Last Name" required/> <br />
            <select name="gender" id="gender" required>
              <option value="">Select Gender</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="others">Others</option>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input
              type="Date"
              name="dob"
              placeholder="DOB"
              style="width: 165px"
               required
            />
            <br />
            <input type="text" name="city" placeholder="City" required/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="state" placeholder="State" required/> <br />
            <input type="email" name="email" placeholder="Email" required/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="phoneno" placeholder="Mobile No" required/> <br />
            <input type="password" name="pass" placeholder="Password" required/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="password" name="cpass" placeholder="Confirm Password" required/>
            <br />
             <asp:Button class="button" Text="Register" runat="server" id="button" OnClick="button_Click"/>
            <br />
          </div>
          <br />
        </form>
      </div>
    </div>
  </body>
</html>
