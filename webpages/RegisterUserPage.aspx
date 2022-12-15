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
            <div class="container py-5 h-100">
                <nav class="navbar navbar-dark bg-dark">
                    <span class="navbar-brand mb-0 h1">
                        <img src="../img/giu-logo.png" style="height: 105px; width: 215px" />
                    </span>
                </nav>
                <div class="row d-flex justify-content-center align-items-center h-100">
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
                                                    <label class="form-label" for="form3Example1m1">Username</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" type="text" ID="Password" class="form-control form-control-lg" />
                                                    <label class="form-label" for="form3Example1n1">Password</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" type="text" ID="FirstName" class="form-control form-control-lg" />
                                                    <asp:Label runat="server" class="form-label" for="form3Example1m">First name</asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" type="text" ID="LastName" class="form-control form-control-lg" />
                                                    <asp:Label runat="server" class="form-label" for="form3Example1n">Last name</asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" type="text" ID="Email" class="form-control form-control-lg" />
                                                    <label class="form-label" for="form3Example1m1">Email Address</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" type="text" ID="PhoneNumber" class="form-control form-control-lg" />
                                                    <label class="form-label" for="form3Example1n1">Phone Number</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <asp:TextBox runat="server" type="text" ID="Address" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example8">Address</label>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">

                                                <div class="form-outline mb-4">
                                                    <asp:TextBox runat="server" type="text" ID="Semester" class="form-control form-control-lg" />
                                                    <label class="form-label" for="form3Example8">Semester</label>
                                                </div>


                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <asp:DropDownList runat="server" ID="Usertype" OnSelectedIndexChanged="Usertype_SelectedIndexChanged">
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
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" type="text" ID="GPA" class="form-control form-control-lg" />
                                                    <label class="form-label" for="form3Example1m1">GPA</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <asp:TextBox runat="server" type="text" ID="TextBox2" class="form-control form-control-lg" />
                                                    <label class="form-label" for="form3Example1n1">Phone Number</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <asp:TextBox runat="server" type="date" ID="BirthDate" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example9">Birth Date</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example90" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example90">Pincode</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example99" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example99">Course</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example97" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example97">Email ID</label>
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
    </form>
</body>

</html>
