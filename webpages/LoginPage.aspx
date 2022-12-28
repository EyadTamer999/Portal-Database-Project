<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebApplication3.webpages.LoginPage" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>GIU Portal</title>

    <style>
        body {
            background: linear-gradient(45deg, transparent 0%, transparent 57%, #ffd800 100%), linear-gradient(-45deg, #8b1818 0%, #807b09 0.3%, #940f0f 112%,transparent 11%), linear-gradient(90deg, #141212 100%, #940f0f 65%,transparent 20%)
        }
    </style>

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
</head>

<body>
    <form id="form1" runat="server">

        <nav class="navbar navbar-light bg-dark">
            <a href="LoginPage.aspx">
                <asp:Image src="../img/giu-logo.jpg" runat="server" Height="89px" Width="174px" />
            </a>
        </nav>

        <div style="text-align: center">
            <div class="p-3 mb-2 text-white">
                <asp:Image ID="LoginImg" runat="server" ImageUrl="../img/user-icon.png" Height="60px" Width="60px" />
                <br />
                <asp:Label ID="Text1" runat="server" Text="Login"></asp:Label>
                <p style="height: 29px">
                    <asp:TextBox ID="Email" runat="server" placeholder="Enter Email"></asp:TextBox>
                    <asp:TextBox ID="Password" runat="server" type="password" placeholder="Enter Password"></asp:TextBox>
                </p>
                <asp:Button ID="LoginButton" class="btn btn-info" runat="server" Text="Login" OnClick="Login" Width="342px" Height="50px" />
                <br />
                <asp:Label ID="InvalidLogin" runat="server" Visible="false" Style="color: red">Invalid Email or Password</asp:Label>
                <br />
                <asp:Button ID="RegisterButton" class="btn btn-danger" runat="server" Text="No Account? Register..." OnClick="Register" Height="50px" Width="342px" />
            </div>
        </div>

    </form>
    <div class="text-lg-start bottom">
        <!-- Copyright -->
        <footer class="text-center" style="height: 15rem;">
            &copy All Rights Reserved.
        </footer>
        <!-- Copyright -->
    </div>
</body>
</html>
