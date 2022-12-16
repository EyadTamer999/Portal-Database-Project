<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterUserPage.aspx.cs" Inherits="WebApplication3.webpages.RegisterUserPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <meta charset="utf-8" />


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

        .card-registration .select-input.form-control[readonly]:not([disabled]) {
            font-size: 1rem;
            line-height: 2.15;
            padding-left: .75em;
            padding-right: .75em;
        }

        .card-registration .select-arrow {
            top: 13px;
        }
    </style>

</head>

<body>
    <form runat="server">
        <section class="h-100 bg-dark">

            <div class="row d-flex justify-content-center align-items-center h-100">

                <div class="container py-5 h-100">
                    <nav class="navbar navbar-light bg-dark">
                        <a href="LoginPage.aspx">
                            <asp:Image src="../img/giu-logo.jpg" runat="server" Height="89px" Width="174px" />
                        </a>
                    </nav>
                    <div class="col">
                        <div class="card card-registration my-4">
                            <div class="row g-0">
                                <div class="col-xl-6">
                                    <div class="card-body p-md-5 text-black">
                                        <h3 class="mb-5 text-uppercase">User registration form</h3>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" type="text" ID="Username" class="form-control form-control-lg" />
                                                    <asp:Label runat="server" ID="UsernameLabel" class="form-label" for="form3Example1m1">Username</asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" type="password" ID="Password" class="form-control form-control-lg" />
                                                    <asp:Label runat="server" ID="PasswordLabel" class="form-label" for="form3Example1n1">Password</asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <asp:DropDownList runat="server" ID="Usertype" OnSelectedIndexChanged="Usertype_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Value="Student">Student</asp:ListItem>
                                                    <asp:ListItem Value="Company">Company</asp:ListItem>
                                                    <asp:ListItem Value="EE">External Examiner</asp:ListItem>
                                                    <asp:ListItem Value="TA">Teaching Assistant</asp:ListItem>
                                                    <asp:ListItem Value="Lecturer">Lecturer</asp:ListItem>
                                                    <asp:ListItem Value="Employee">Employee</asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                                User Type
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline mb-4">
                                                    <asp:TextBox runat="server" type="text" Visible="false" ID="Semester" class="form-control form-control-lg" />
                                                    <asp:Label runat="server" ID="SemesterLabel" Visible="false" class="form-label" for="form3Example8">Semester</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" Visible="false" type="text" ID="FirstName" class="form-control form-control-lg" />
                                                    <asp:Label runat="server" Visible="false" class="form-label" ID="FirstNameLabel" for="form3Example1m">First name</asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" Visible="false" type="text" ID="LastName" class="form-control form-control-lg" />
                                                    <asp:Label runat="server" Visible="false" class="form-label" ID="LastNameLabel" for="form3Example1n">Last name</asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" type="text" ID="Email" class="form-control form-control-lg" />
                                                    <asp:Label runat="server" ID="EmailLabel" class="form-label" for="form3Example1m1">Email Address</asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" type="text" ID="PhoneNumber" class="form-control form-control-lg" />
                                                    <asp:Label runat="server" ID="PhoneLabel" class="form-label" for="form3Example1n1">Phone Number</asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <asp:TextBox runat="server" type="text" ID="Address" Visible="false" class="form-control form-control-lg" />
                                            <asp:Label runat="server" ID="AddressLabel" Visible="false" class="form-label" for="form3Example8">Address</asp:Label>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" type="text" Visible="false" ID="GPA" class="form-control form-control-lg" />
                                                    <asp:Label runat="server" ID="GPALabel" Visible="false" class="form-label" for="form3Example1m1">GPA</asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" Visible="false" type="text" ID="Field" class="form-control form-control-lg" />
                                                    <asp:Label runat="server" ID="FieldLabel" Visible="false" class="form-label" for="form3Example1n1">Field</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <asp:TextBox runat="server" type="date" ID="BirthDate" Visible="false" class="form-control form-control-lg" />
                                            <asp:Label runat="server" ID="BirthDateLabel" Visible="false" class="form-label" for="form3Example9">Birth Date</asp:Label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="MajorCode" Visible="false" class="form-control form-control-lg" />
                                            <asp:Label runat="server" ID="MajorCodeLabel" Visible="false" class="form-label" for="form3Example90">Major Code</asp:Label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="Facultyid" Visible="false" class="form-control form-control-lg" />
                                            <asp:Label runat="server" ID="FacultyidLabel" Visible="false" class="form-label" for="form3Example99">Faculty ID</asp:Label>
                                        </div>


                                        <div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="RepName" Visible="false" class="form-control form-control-lg" />
                                            <asp:Label runat="server" ID="RepNameLabel" Visible="false" class="form-label" for="form3Example99">Company Representative Name</asp:Label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="RepEmail" Visible="false" class="form-control form-control-lg" />
                                            <asp:Label runat="server" ID="RepEmailLabel" Visible="false" class="form-label" for="form3Example99">Company Representative Email</asp:Label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <asp:TextBox runat="server" ID="Companyid" Visible="false" class="form-control form-control-lg" />
                                            <asp:Label runat="server" ID="CompanyidLabel" Visible="false" class="form-label" for="form3Example99">Company ID</asp:Label>
                                        </div>
                                        <div class="d-flex justify-content-end pt-3">
                                            <asp:Button ID="Register" runat="server" class="btn btn-info" OnClick="RegisterUser" Text="Submit"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="bottom">
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
