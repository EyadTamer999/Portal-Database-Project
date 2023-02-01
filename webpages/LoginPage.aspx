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

        html, body {
            height: 100%;
        }

        .wrap {
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .button {
            min-width: 300px;
            min-height: 60px;
            font-family: 'Nunito', sans-serif;
            font-size: 22px;
            text-transform: uppercase;
            letter-spacing: 1.3px;
            font-weight: 700;
            color: #313133;
            background: #4FD1C5;
            background: linear-gradient(90deg, rgba(129,230,217,1) 0%, rgba(79,209,197,1) 100%);
            border: none;
            border-radius: 1000px;
            box-shadow: 12px 12px 24px rgba(79,209,197,.64);
            transition: all 0.3s ease-in-out 0s;
            cursor: pointer;
            outline: none;
            position: relative;
            padding: 10px;
        }

        button::before {
            content: '';
            border-radius: 1000px;
            min-width: calc(300px + 12px);
            min-height: calc(60px + 12px);
            border: 6px solid #00FFCB;
            box-shadow: 0 0 60px rgba(0,255,203,.64);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 0;
            transition: all .3s ease-in-out 0s;
        }

        .button:hover, .button:focus {
            color: #313133;
            transform: translateY(-6px);
        }

        button:hover::before, button:focus::before {
            opacity: 1;
        }

        button::after {
            content: '';
            width: 30px;
            height: 30px;
            border-radius: 100%;
            border: 6px solid #00FFCB;
            position: absolute;
            z-index: -1;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            animation: ring 1.5s infinite;
        }

        button:hover::after, button:focus::after {
            animation: none;
            display: none;
        }

        @keyframes ring {
            0% {
                width: 30px;
                height: 30px;
                opacity: 1;
            }

            100% {
                width: 300px;
                height: 300px;
                opacity: 0;
            }
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
                <asp:Image Style="margin: 1rem;" ID="LoginImg" runat="server" ImageUrl="../img/user-icon.png" Height="60px" Width="60px" />
                <br />
                <asp:Label ID="Text1" runat="server" Text="Login"></asp:Label>
                <br />
                <asp:Label ID="InvalidLogin" runat="server" Font-Size="Large" Visible="false" Style="color: red">Invalid Email or Password</asp:Label>

                <div style="height: 29px; margin: 3rem;">
                    <asp:TextBox ID="Email" runat="server" placeholder="Enter Email"></asp:TextBox>
                    <asp:TextBox ID="Password" runat="server" type="password" placeholder="Enter Password"></asp:TextBox>
                </div>
                <div style="margin: 3rem;">
                    <asp:Button runat="server" ID="LoginButton" OnClick="Login" class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);" Text="Login" Width="342px" Height="50px" />
                    <br />
                </div>
                <div style="margin: 3rem;">
                    <asp:Button runat="server" ID="RegisterButton" OnClick="Register" class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(181 45 73) 0%, rgb(177 151 57) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);" Text="No Account? Register!" Height="50px" Width="342px" />
                </div>
            </div>
            <br />
        </div>
    </form>
</body>
</html>
