<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyPage.aspx.cs" Inherits="WebApplication3.webpages.CompanyPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company Page</title>

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
<body class="home bg-light">
    <form id="form1" runat="server">

        <nav class="navbar navbar-expand-md fixed-top navbar-dark bg-dark">
            <a href="#">
                <asp:Image runat="server" src="../img/giu-logo.jpg" Height="89px" Width="174px" /></a>
            <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Dashboard <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Notifications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LoginPage.aspx">Logout</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">View</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown01">
                            <asp:Button runat="server" ID="EmployeesDropDown" class="dropdown-item" OnClick="ShowEmployees" Text="Employees"></asp:Button>
                            <asp:Button runat="server" ID="StudentsDropDown" class="dropdown-item" OnClick="ShowEmployees" Text="Students"></asp:Button>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="container">

            <div runat="server" visible="false" class="my-3 p-3 bg-white rounded box-shadow" id="EmployeesLabelHeading">
                <h6 class="border-bottom border-gray pb-2 mb-0">Employees</h6>
                <small class="d-block text-right mt-3">
                    <asp:Button runat="server" ID="AddEmployeeButton" OnClick="AddNewEmployee" Text="Add Employee" class="alert-info" />
                </small>
                <div class="media text-muted pt-3">
                    <div>
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <div class="form-outline">
                                    <asp:TextBox runat="server" Visible="false" type="text" ID="Username" class="form-control form-control-lg" />
                                    <asp:Label runat="server" ID="UsernameLabel" Visible="false" class="form-label" for="form3Example1m1">Username</asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <div class="form-outline">
                                    <asp:TextBox runat="server" type="text" Visible="false" ID="Password" class="form-control form-control-lg" />
                                    <asp:Label runat="server" ID="PasswordLabel" Visible="false" class="form-label" for="form3Example1n1">Password</asp:Label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <div class="form-outline">
                                    <asp:TextBox runat="server" type="text" Visible="false" ID="Email" class="form-control form-control-lg" />
                                    <asp:Label runat="server" ID="EmailLabel" Visible="false" class="form-label" for="form3Example1m1">Email</asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <div class="form-outline">
                                    <asp:TextBox runat="server" Visible="false" type="password" ID="Field" class="form-control form-control-lg" />
                                    <asp:Label runat="server" ID="FieldLabel" Visible="false" class="form-label" for="form3Example1n1">Field</asp:Label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <div class="form-outline">
                                    <asp:TextBox runat="server" type="text" Visible="false" ID="Phone" class="form-control form-control-lg" />
                                    <asp:Label runat="server" ID="PhoneLabel" Visible="false" class="form-label" for="form3Example1m1">Phone</asp:Label>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="media text-muted pt-3">
                        <asp:GridView ID="GridView1" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" />
                                <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                <asp:BoundField DataField="Password" HeaderText="Password" />
                                <asp:BoundField DataField="Field" HeaderText="Field" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="Phone" HeaderText="Phone" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <div class="my-3 p-3 bg-white rounded box-shadow">
                <h6 class="border-bottom border-gray pb-2 mb-0">Students</h6>
                <div class="media text-muted pt-3">
                    <img data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1" alt="32x32" class="mr-2 rounded" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1851c9e320b%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1851c9e320b%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2211.836840629577637%22%20y%3D%2216.960000014305116%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 32px; height: 32px;">
                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <strong class="text-gray-dark">Full Name</strong>
                            <a href="#">Follow</a>
                        </div>
                        <span class="d-block">@username</span>
                    </div>
                </div>
                <div class="media text-muted pt-3">
                    <img data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1" alt="32x32" class="mr-2 rounded" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1851c9e320b%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1851c9e320b%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2211.836840629577637%22%20y%3D%2216.960000014305116%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 32px; height: 32px;">
                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <strong class="text-gray-dark">Full Name</strong>
                            <a href="#">Follow</a>
                        </div>
                        <span class="d-block">@username</span>
                    </div>
                </div>
                <div class="media text-muted pt-3">
                    <img data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1" alt="32x32" class="mr-2 rounded" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1851c9e320c%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1851c9e320c%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2211.836840629577637%22%20y%3D%2216.960000014305116%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 32px; height: 32px;">
                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <strong class="text-gray-dark">Full Name</strong>
                            <a href="#">Follow</a>
                        </div>
                        <span class="d-block">@username</span>
                    </div>
                </div>
                <small class="d-block text-right mt-3">
                    <a href="#">All suggestions</a>
                </small>
            </div>
        </main>

        <defs>
        </defs>
        <text x="0" y="2" style="font-weight: bold; font-size: 2pt; font-family: Arial, Helvetica, Open Sans, sans-serif">32x32</text>

    </form>
</body>
</html>
