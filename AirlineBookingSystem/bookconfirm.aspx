<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookconfirm.aspx.cs" Inherits="AirlineBookingSystem.WebForm2" %>

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
          body {
            height: 100vh;

            background-image: url("images/plane2.jpg");
          }

          input[type="text"],
          input[type="email"],
          input[type="password"] {
            padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 12px;
          }

          .buttonb {
            background-color:#32CD32;
            color: white;
            padding: 14px 20px;
            margin: 20px 0;
            border: none;
            cursor: pointer;
            text-decoration: none;
            border-radius: 12px;
            text-align: center;
          }

          .buttonc {
            background-color: rgb(233, 55, 55);
            color: white;
            padding: 14px 20px;
            margin: 20px 0;
            border: none;
            cursor: pointer;
            text-decoration: none;
            border-radius: 12px;
            text-align: center;
          }

          button:hover,
          a:hover {
            opacity: 0.8;
          }

          .container {
            display: flex;
            flex-direction: column;
            padding: 3rem;
          }
          .navigator {
            font-size: larger;
            align-self: center;
            display: flex;
            width: 100%;
            justify-content: space-evenly;
            margin-bottom: 2%;
          }
          .middle-block {
            width: 100%;
          }
          .page1,
          .page2 {
            display: flex;
            flex-direction: column;
            width: 100%;
          }
          .cards {
            background: rgba(79, 195, 247, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            display: flex;
            align-items: flex-start;
            justify-content: space-evenly;
            margin-bottom: 4%;
            width: 80%;
          }

          .myButton {
            color: white;
            background-color: transparent;
            display: inline-block;
            cursor: pointer;
            font-size: 17px;
            padding: 16px 31px;
            border: none;
          }
          .outer-block {
            display: flex;
            background: rgba(79, 195, 247, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            width: 90%;
            height: 80vh;
            margin: auto;
            margin-top: 3rem;
            padding: 3rem;
          }

          .leftbox {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            margin-right:3rem;
          }

          /* table */
            table {
          border-spacing: 1;
          border-collapse: collapse;
          background: white;
          border-radius: 6px;
          overflow: hidden;
          max-width: 800px;
          width: 100%;
          margin: 0 auto;
          position: relative;
        }
        table * {
          position: relative;
        }
        table td,
        table th {
          padding-left: 8px;
        }
        table thead tr {
          height: 60px;
          background: #3388BE;
          font-size: 16px;
          color:white;
        }
        table tbody tr {
          height: 48px;
          border-bottom: 1px solid #e3f1d5;
        }
        table tbody tr:last-child {
          border: 0;
        }
        table td,
        table th {
          text-align: left;
        }
        table td.l,
        table th.l {
          text-align: right;
        }
        table td.c,
        table th.c {
          text-align: center;
        }
        table td.r,
        table th.r {
          text-align: center;
        }

       /*tablebutton*/  

   
          .boxbut {
            display: flex;
            justify-content: space-evenly;
          }
          .type {
            text-align: center;
          }

          .rightbox {
            display: flex;
            flex-direction: column;

            flex: 1;
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
                            <a href="profile.aspx"> <i class="fa fa-user-circle" aria-hidden="true"><h3><%=Session["email"]%></h3></i></a>
                        </li>
                        <%  }
                        else
                        { %>
                        <li><a href="login.aspx"> Login</a></li>
                        <li><a href="register.aspx"> REGISTER</a></li>
                        <%  } %>
                    </ul>
            </div>
            <form runat="server" method="post">       
            <div class="outer-block">
                  <div class="leftbox">
                      
                        <div class="ecobox">
                            
                            <div class="boxbut">
                                <table >
                                    <thead>
                                        <tr>
                                            <th>Seat Type</th>
                                            <th>Seat Available</th>
                                            <th>Price</th>
                                            <th>add flight</th>
                                            <th>remove flight</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Economic class</td>
                                            <%=econnomicdata()%>
                                            <td><asp:Button Text="Economic" runat="server" class="buttonb" Id="Button1" OnClick="Economic_Click"/></td>
                                            <td><asp:Button Text="remove" runat="server" class="buttonc" Id="Button2" OnClick="ecoremove_Click"/></td>
                                        </tr>
                                        <tr>
                                            <td>Business class</td>
                                            <%=businessdata()%>
                                            <td><asp:Button Text="business" runat="server" class="buttonb" Id="Button5" OnClick="business_Click"/></td>
                                            <td><asp:Button Text="remove" runat="server" class="buttonc" Id="Button6" OnClick="businessremove_Click"/></td>
                                        </tr>
                                        <tr>
                                            <td>First class</td>
                                            <%=firstdata()%>
                                            <td><asp:Button Text="FirstClass" runat="server" class="buttonb" Id="Button3" OnClick="FirstClass_Click"/></td>
                                            <td><asp:Button Text="remove" runat="server" class="buttonc" Id="Button4" OnClick="fcremove_Click"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                               
                            </div>
                        </div>
                   
                    </div>
                    
                 <div class="rightbox">
                    <div class="topbox">
                        <div class="indexname">
                            <h4>Email</h4>
                            <h4>flight name</h4>
                            <h4>Economy class</h4>
                            <h4>Business class</h4>
                            <h4>First class</h4>
                            <h3>Total Amount</h3>
                        </div>
                        <div class="value">
                            <%=cartdata()%>
                        </div>
                    </div>
                       <asp:Button Text="Book" class="buttonb" runat="server" Id="Button7" OnClick="Book_Click"/>
                       <asp:Button Text="Cancel" class="buttonc" runat="server" Id="Cancel" OnClick="Cancel_Click"/>
                </div>
               </div>
                </form>
            </div>
    </body>  
</html>