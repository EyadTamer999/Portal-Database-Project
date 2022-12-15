<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebApplication3.webpages.LoginPage" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>GIU Portal</title>

    <!--Bootstrap CSS-->
    <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!--Datatables-->
    <link href="../Datatables/css/jquery.dataTables.min.css" rel="stylesheet" />

    <!--Fontawesome-->
    <link href="../fontawesome/css/all.css" rel="stylesheet" />

    <!--Jquery-->
    <script src="../Bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    <script src="../Datatables/js/jquery.dataTables.min.js"></script>

    <!--Bootstrap-->
    <script src="../Bootstrap/js/bootstrap.min.js"></script>

    <!--popper js-->
    <script src="../Bootstrap/js/popper.min.js"></script>


    <style type="text/css">
        .navbar-toggler {
            width: 32px;
            height: 21px;
        }
    </style>

</head>

<body>
    <form id="form1" runat="server">

        <div class="sticky-top">
            <nav class="navbar navbar-dark bg-dark">
                <span class="navbar-brand mb-0 h1">
                    <img src="../img/giu-logo.png" style="height: 105px; width: 215px" />
                </span>
            </nav>
        </div>
        <div style="text-align: center">
            <div class="p-3 mb-2 bg-light text-dark" style="height: 205px">
                <asp:Image ID="LoginImg" runat="server" ImageUrl="../img/user-icon.png" Height="60px" Width="60px" />
                <br />
                <asp:Label ID="Text1" runat="server" Text="Login"></asp:Label>
                <p style="height: 29px">
                    <asp:TextBox ID="Email" runat="server" placeholder="Enter Email"></asp:TextBox>
                    <asp:TextBox ID="Password" runat="server" placeholder="Enter Password"></asp:TextBox>
                </p>
                <asp:Button ID="LoginButton" class="btn btn-info" runat="server" Text="Login" OnClick="Login" Width="342px" Height="50px" />
                <br />
                <asp:Label ID="InvalidLogin" runat="server" Visible="false" Style="color: red">Invalid Email or Password</asp:Label>
                <br />
                <asp:Button ID="RegisterButton" class="btn btn-danger" runat="server" Text="No Account? Register..." OnClick="Register" Height="50px" Width="342px" />
            </div>
        </div>
        <div class="fixed-bottom">
            <footer class="bg-light text-center text-lg-start">
                <!-- Copyright -->
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                    &copy All Rights Reserved.
                </div>
                <!-- Copyright -->
            </footer>
        </div>

    </form>
</body>
</html>
