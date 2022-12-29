<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterUserPage.aspx.cs" Inherits="WebApplication3.webpages.RegisterUserPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <meta charset="utf-8" />


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
        <section class="h-100">

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
                                        <br />
                                        <h2 runat="server" class="mb-5 text-uppercase" style="color: red" visible="false" id="Success">User Registered!</h2>
                                        <asp:Label ID="Error" runat="server" Text="Oops Somthing went wrong!" Visible="false" ForeColor="Red"></asp:Label>
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
                                                    <asp:ListItem Value=" ">-->Select User type<--</asp:ListItem>
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
                                            <asp:TextBox runat="server" ID="FacultyCode" Visible="false" class="form-control form-control-lg" />
                                            <asp:Label runat="server" ID="FacultyCodeLabel" Visible="false" class="form-label" for="form3Example99">Faculty Code</asp:Label>
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
                                        <div class="d-flex justify-content-end pt-3 wrap">
                                            <asp:Button ID="Register" runat="server" style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"  class="button" OnClick="RegisterUser" Text="Submit"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="text-lg-start bottom">
            <!-- Copyright -->
            <footer class="text-center" style="height: 15rem;">
                &copy All Rights Reserved.
            </footer>
            <!-- Copyright -->
        </div>
    </form>
</body>

</html>
