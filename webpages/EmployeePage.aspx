<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeePage.aspx.cs" Inherits="WebApplication3.webpages.EmployeePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Page</title>

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

    <link href="offcanvas.css" rel="stylesheet" />

</head>
<body class="home">
    <form id="form1" runat="server">
        <main role="main" class="container">
            <div class="container">
                <nav class="navbar navbar-expand-md fixed-top navbar-dark bg-dark">
                    <a href="#">
                        <asp:Image runat="server" src="../img/giu-logo.jpg" Height="89px" Width="174px" /></a>
                    <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div>
                        <asp:Label runat="server" Text="Welcome" CssClass="text-white"></asp:Label>
                    </div>

                    <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Dashboard</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">View</a>
                                <div class="dropdown-menu" aria-labelledby="dropdown01">
                                    <asp:Button runat="server" ID="ShowGradeThesis" OnClick="" class="dropdown-item" Text="Grade Thesis"></asp:Button>
                                    <asp:Button runat="server" ID="ShowGradeDefense" OnClick="" class="dropdown-item" Text="Grade Defense"></asp:Button>
                                    <asp:Button runat="server" ID="ShowCreatePR" OnClick="" class="dropdown-item" Text="Create PR"></asp:Button>
                                </div>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton runat="server" OnClick="LogOut" class="nav-link">Logout</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </main>
    </form>
</body>
</html>
