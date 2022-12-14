<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication3.webpages.LoginPage" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>GIU Portal</title>
    <!--Bootstrap CSS-->
    <link href="Bootstrap\css\bootstrap.min.css" rel="stylesheet" />
    <!--Datatables-->
    <link href="Datatables\css\jquery.dataTables.min.css" rel="stylesheet" />
    <!--Fontawesome-->
    <link href="fontawesome\css\all.css" rel="stylesheet" />

    <!--Jquery-->
    <link href="Bootstrap\js\jquery-3.3.1.slim.min.js" />

    <!--Bootstrap-->
    <link href="Bootstrap\js\jquery-3.3.1.slim.min.js" /> 

    <!--popper js-->
    <link href="Bootstrap\js\jquery-3.3.1.slim.min.js" />

</head>

<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg navbar-light">
                <a class="navbar-brand" href="#">
                    <img src="img\giu-logo.png" style="height: 74px; width: 74px" />
                    Portal
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" expanded="false" aria-label="Toggle navigation">
                </button>
                </a>
            </nav>
        </div>


        <div>
            <div style="text-align: center">
                <div style="height: 205px">
                    <asp:Label ID="Text1" runat="server" Text="Login"></asp:Label>
                    <p style="height: 29px">
                        <asp:TextBox ID="Email" runat="server" Text="Enter Email"></asp:TextBox>
                        <asp:TextBox ID="Password" runat="server" Text="Enter Password"></asp:TextBox>
                    </p>
                    <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="Login" Width="342px" Style="height: 29px" />
                </div>
                <div style="text-align: end; height: 255px;">
                    <asp:Label ID="Text2" runat="server" Text="No Account? Register..."></asp:Label>
                    <div>
                        <p style="height: 29px">
                            <asp:TextBox ID="RegisterUsername" runat="server" Text="Username"></asp:TextBox>
                            <asp:TextBox ID="RegisterPassword" runat="server" Text="Password"></asp:TextBox>
                            <div>
                                <asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="Register" Height="29px" Width="342px" />
                            </div>
                        </p>
                    </div>
                </div>
            </div>
            <footer>
                <p style="text-align: center">
                    &copy All Rights Reserved. <a class="footerlinks" href="#" targert="_blank">Simple Snippet</a>
                </p>
            </footer>
    </form>
</body>
</html>
