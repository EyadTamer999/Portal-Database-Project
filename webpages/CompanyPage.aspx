﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyPage.aspx.cs" Inherits="WebApplication3.webpages.CompanyPage" %>

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
<body class="home bg-info">
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
                        <asp:Label runat="server" Text="Welcome" ID="CompanyID"></asp:Label>
                    </div>

                    <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Create Project</a>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton runat="server" OnClick="LogOut" class="nav-link">Logout</asp:LinkButton>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">View</a>
                                <div class="dropdown-menu" aria-labelledby="dropdown01">
                                    <asp:Button runat="server" ID="ViewMyProfile" class="dropdown-item" OnClick="ShowMyProfile" Text="My Profile"></asp:Button>
                                    <asp:Button runat="server" ID="EmployeesDropDown" class="dropdown-item" OnClick="ShowEmployees" Text="Employees"></asp:Button>
                                    <asp:Button runat="server" ID="StudentsDropDown" class="dropdown-item" OnClick="ShowStudents" Text="Students"></asp:Button>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>

            <br />
            <!--Show my profile-->
            <div class="my-3 p-3 bg-white justify-content-center align-content-lg-center rounded box-shadow border-gray" style="margin-top: 5rem!important;">

                <small class="d-block text-right mt-3">
                    <br />
                    <asp:Label runat="server" class="form-label justify-content-end align-content-end" Text="My Profile"></asp:Label>
                </small>
                <div class="col" runat="server" visible="false" id="ShowMyProfileDiv">
                    <br />
                    <asp:Label runat="server" ID="MyCompanyID" Visible="true" class="form-label" Text="My Company ID: " for="form3Example1m1"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="MyUserName" Visible="true" class="form-label" Text="My User Name: " for="form3Example1m1"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="MyPassword" Visible="true" class="form-label" Text="My Password: " for="form3Example1m1"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="MyName" Visible="true" class="form-label" Text="My Name: " for="form3Example1m1"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="MyEmail" Visible="true" class="form-label" Text="My Email: " for="form3Example1m1"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="MyPhone" Visible="true" class="form-label" Text="My Phone Number: " for="form3Example1m1"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="MyLocation" Visible="true" class="form-label" Text="My Location: " for="form3Example1m1"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="MyRepEmail" Visible="true" class="form-label" Text="My Representative Email: " for="form3Example1m1"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="MyRepName" Visible="true" class="form-label" Text="My Representative Name: " for="form3Example1m1"></asp:Label>
                    <br />
                </div>


                <!----------------
                                b) Create projects on the system.
                                c) Assign Employees to supervise local industrial projects that belongs to them.
                                d) Grade thesis of a specific student.
                                e) Grade defense of a specific student.
                                f) Grade progress report for a specific student.
                                                                                                                    ---------------->
                <!--Show my Employees-->
                <div class="my-3 p-3 bg-white justify-content-center align-content-center rounded box-shadow"style="margin-top: 15rem!important; height: 56rem;">
                    <h6 class="border-bottom border-gray pb-2 mb-0">Employees</h6>

                    <div class="media text-muted pt-3 " style="margin-top: -5rem; padding-top: 7rem!important;">
                        <div class="row justify-content-center align-baseline">
                            <div runat="server" visible="false" id="EmployeesLabelHeading">
                                <small class="d-block text-right mt-3 justify-content-center align-content-center">
                                    <asp:Button runat="server" ID="AddEmployeeButton" OnClick="AddNewEmployee" Text="Add Employee" class="alert-info" />                                    
                                </small>
                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <asp:TextBox runat="server" Visible="false" type="text" ID="Username" class="form-control form-control-lg" />
                                            <asp:Label runat="server" ID="UsernameLabel" Visible="false" class="form-label" for="form3Example1m1">Username</asp:Label>
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
                                            <asp:TextBox runat="server" Visible="false" type="text" ID="Field" class="form-control form-control-lg" />
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
                                <asp:GridView ID="EmployeeTable" Visible="False" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateColumns="False" DataSourceID="EmployeeSQL" style="overflow-y:scroll">
                                    <Columns>
                                        <asp:BoundField DataField="Staff_id" HeaderText="Staff_id" InsertVisible="False" ReadOnly="True" SortExpression="Staff_id" />
                                        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="Field" HeaderText="Field" SortExpression="Field" />
                                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="EmployeeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:PortalConnectionString %>" SelectCommand="SELECT [Staff_id], [Username], [Password], [Email], [Field], [Phone] FROM [Employee] WHERE ([Company_id] = @Company_id) ORDER BY [Staff_id]">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Company_id" QueryStringField="UserID" Direction="Input" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Show my Students-->
                <div runat="server" visible="false" class="my-3 p-3 bg-white rounded box-shadow" id="StudentsLabelHeading">
                    <h6 class="border-bottom border-gray pb-2 mb-0">Employees</h6>
                    <small class="d-block text-right mt-3">
                        <asp:Button runat="server" ID="Button1" OnClick="AddNewEmployee" Text="Add Employee" class="alert-info" />
                    </small>
                    <div class="media text-muted pt-3">
                        <div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <div class="form-outline">
                                        <asp:TextBox runat="server" Visible="false" type="text" ID="TextBox1" class="form-control form-control-lg" />
                                        <asp:Label runat="server" ID="Label1" Visible="false" class="form-label" for="form3Example1m1">Username</asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <div class="form-outline">
                                        <asp:TextBox runat="server" type="text" Visible="false" ID="TextBox2" class="form-control form-control-lg" />
                                        <asp:Label runat="server" ID="Label2" Visible="false" class="form-label" for="form3Example1n1">Password</asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <div class="form-outline">
                                        <asp:TextBox runat="server" type="text" Visible="false" ID="TextBox3" class="form-control form-control-lg" />
                                        <asp:Label runat="server" ID="Label3" Visible="false" class="form-label" for="form3Example1m1">Email</asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <div class="form-outline">
                                        <asp:TextBox runat="server" Visible="false" type="password" ID="TextBox4" class="form-control form-control-lg" />
                                        <asp:Label runat="server" ID="Label4" Visible="false" class="form-label" for="form3Example1n1">Field</asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <div class="form-outline">
                                        <asp:TextBox runat="server" type="text" Visible="false" ID="TextBox5" class="form-control form-control-lg" />
                                        <asp:Label runat="server" ID="Label5" Visible="false" class="form-label" for="form3Example1m1">Phone</asp:Label>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="media text-muted pt-3">
                            <asp:GridView ID="GridView2" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="Staff_id" HeaderText="Staff_id" InsertVisible="False" ReadOnly="True" SortExpression="Staff_id" />
                                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Field" HeaderText="Field" SortExpression="Field" />
                                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <defs>
        </defs>
    </form>
</body>
</html>