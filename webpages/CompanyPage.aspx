﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyPage.aspx.cs" Inherits="WebApplication3.webpages.CompanyPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company Page</title>

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
    <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <!--Datatables-->
    <link href="../Datatables/css/jquery.dataTables.min.css" rel="stylesheet"/>

    <!--Fontawesome-->
    <link href="../fontawesome/css/all.css" rel="stylesheet"/>

    <!--Jquery-->
    <script src="../Bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    <script src="../Datatables/js/jquery.dataTables.min.js"></script>

    <!--Bootstrap-->
    <script src="../Bootstrap/js/bootstrap.min.js"></script>

    <!--popper js-->
    <script src="../Bootstrap/js/popper.min.js"></script>

    <link href="offcanvas.css" rel="stylesheet"/>
</head>
<body class="home">
<form id="form1" runat="server">
<main role="main" class="container">
<div class="container">
    <nav class="navbar navbar-expand-md fixed-top navbar-dark bg-dark">
        <a href="#">
            <asp:Image runat="server" src="../img/giu-logo.jpg" Height="89px" Width="174px"/>
        </a>
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
                <li class="nav-item">
                    <asp:LinkButton runat="server" class="nav-link" OnClick="ShowCreateProject" Text="Create Project"></asp:LinkButton>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">View</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <asp:Button runat="server" ID="ViewMyProfile" class="dropdown-item" OnClick="ShowMyProfile" Text="My Profile"></asp:Button>
                        <asp:Button runat="server" ID="EmployeesDropDown" class="dropdown-item" OnClick="ShowEmployees" Text="Employees"></asp:Button>
                        <asp:Button runat="server" ID="StudentsDropDown" class="dropdown-item" OnClick="ShowStudents" Text="Students"></asp:Button>
                        <asp:Button runat="server" ID="GradeStudentsDropDown" class="dropdown-item" OnClick="ShowGradeStudents" Text="Grade Students"></asp:Button>
                    </div>
                </li>
                <li class="nav-item">
                    <asp:LinkButton runat="server" OnClick="LogOut" class="nav-link">Logout</asp:LinkButton>
                </li>
            </ul>
        </div>
    </nav>
</div>
<br/>
<!---Create Project--->
<div class="my-3 p-3 bg-white justify-content-center rounded box-shadow border-gray" style="margin-top: 5rem!important; width: fit-content; height: fit-content;" runat="server" visible="false" id="ShowCreateProjectDiv">
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="form-outline">
                <asp:Label runat="server" ID="ProjTitleLabel" class="form-label">Project Title:</asp:Label>

                <asp:TextBox runat="server" type="text" ID="ProjTitleTextBox" class="form-control form-control-lg"/>
                <asp:Label runat="server" ID="MajorCodeLabel" class="form-label">Major Code:</asp:Label>

                <asp:TextBox runat="server" type="text" ID="MajorCodeTextBox" class="form-control form-control-lg"/>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="form-outline">
                <asp:Label runat="server" ID="DescriptionLabel" class="form-label">Description Project:</asp:Label>
                <asp:TextBox runat="server" type="text" ID="DescriptionTextBox" Style="width: 45rem; height: 25rem; font-size: small; vertical-align: top !important;" class="form-control form-control-lg"/>
            </div>
        </div>
    </div>
    <asp:Button runat="server" Style="min-width: 8rem; min-height: 2rem; background: linear-gradient(90deg, rgb(181 45 73) 0%, rgb(177 151 57) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);" Text="Create Project" OnClick="CreateProjectClicked" ID="CreateProjectButton"/>
</div>

<!--Show my profile-->
<div class="my-3 p-3 bg-white justify-content-center align-content-lg-center rounded box-shadow border-gray" style="margin-top: 5rem!important; width: fit-content; height: fit-content;" runat="server" visible="false" id="ShowMyProfileDiv">

    <div class="col" style="background: darkslategrey;">

        <div class="card" style="width: fit-content; height: fit-content; background-color: burlywood;">
            <div class="card-header form-label justify-content-end align-content-end" style="background: darkgray; color: darkslategray; font-family: fantasy; text-align: center;">
                My Profile
            </div>
            <div class="card-body">

                <div class="card-text">
                    <br/>
                    <asp:Label runat="server" ID="MyCompanyID" Visible="true" class="form-label" Text="My Company ID: "></asp:Label>
                </div>
                <div class="card-text">
                    <br/>
                    <asp:Label runat="server" ID="MyUserName" Visible="true" class="form-label" Text="My User Name: "></asp:Label>
                </div>
                <div class="card-text">
                    <br/>
                    <asp:Label runat="server" ID="MyPassword" Visible="true" class="form-label" Text="My Password: "></asp:Label>
                </div>
                <div class="card-text">
                    <br/>
                    <asp:Label runat="server" ID="MyName" Visible="true" class="form-label" Text="My Name: "></asp:Label>
                </div>
                <div class="card-text">
                    <br/>
                    <asp:Label runat="server" ID="MyEmail" Visible="true" class="form-label" Text="My Email: "></asp:Label>
                </div>
                <div class="card-text">
                    <br/>
                    <asp:Label runat="server" ID="MyPhone" Visible="true" class="form-label" Text="My Phone Number: "></asp:Label>
                </div>
                <div class="card-text">
                    <br/>
                    <asp:Label runat="server" ID="MyLocation" Visible="true" class="form-label" Text="My Location: "></asp:Label>
                </div>
                <div class="card-text">
                    <br/>
                    <asp:Label runat="server" ID="MyRepEmail" Visible="true" class="form-label" Text="My Representative Email: "></asp:Label>
                </div>
                <div class="card-text">
                    <br/>
                    <asp:Label runat="server" ID="MyRepName" Visible="true" class="form-label" Text="My Representative Name: "></asp:Label>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Show my Employees-->
<div runat="server" class="my-3 p-3 bg-white justify-content-center align-content-center rounded box-shadow" style="margin-top: 15rem!important; height: 56rem;" visible="false" id="EmployeesLabelHeading">
    <h6 class="border-bottom border-gray pb-2 mb-0">Employees</h6>
    <div runat="server" id="AssignProjectDiv" visible="false" class="row">
        <div class="col-md-6 mb-4">
            <div class="form-outline">
                <asp:Label runat="server" ID="StaffIDLabelProject" class="form-label">Staff ID:</asp:Label>
                <asp:TextBox runat="server" type="text" ID="StaffIDTextProject" class="form-control form-control-lg"/>
                <br/>
                <asp:Label runat="server" ID="Label1" class="form-label">Project Code:</asp:Label>
                <asp:TextBox runat="server" placeholder="Bachelor Code" type="text" ID="BachelorCodeAssign" class="form-control form-control-lg"/>
            </div>
            <asp:Button runat="server" ID="AssignProjectToEmployeeButton" OnClick="AssignProjectToEmployee" Text="Confirm" Style="min-width: 8rem; min-height: 2rem; background: linear-gradient(90deg, rgb(181 45 73) 0%, rgb(177 151 57) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"/>
        </div>
    </div>
    <br/>

    <div class="media text-muted pt-3 " style="margin-top: -5rem; padding-top: 7rem!important;">
        <div class="row justify-content-center align-baseline" style="width: 960px; height: 100px;">
            <div>
                <small class="d-block text-right mt-3 justify-content-center align-content-center">
                    <asp:Button runat="server" ID="AddEmployeeButton" OnClick="AddNewEmployee" Text="Add Employee" Style="min-width: 8rem; min-height: 2rem; background: linear-gradient(90deg, rgb(181 45 73) 0%, rgb(177 151 57) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"/>
                    <asp:Button runat="server" ID="AssignEmployeeDropDown" OnClick="ShowAssignEmployee" Text="Assign Employee" Style="min-width: 8rem; min-height: 2rem; background: linear-gradient(90deg, rgb(181 45 73) 0%, rgb(177 151 57) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"></asp:Button>
                </small>
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="form-outline">
                            <asp:TextBox runat="server" Visible="false" type="text" ID="Username" class="form-control form-control-lg"/>
                            <asp:Label runat="server" ID="UsernameLabel" Visible="false" class="form-label">Username</asp:Label>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="form-outline">
                            <asp:TextBox runat="server" type="text" Visible="false" ID="Email" class="form-control form-control-lg"/>
                            <asp:Label runat="server" ID="EmailLabel" Visible="false" class="form-label">Email</asp:Label>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="form-outline">
                            <asp:TextBox runat="server" Visible="false" type="text" ID="Field" class="form-control form-control-lg"/>
                            <asp:Label runat="server" ID="FieldLabel" Visible="false" class="form-label">Field</asp:Label>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="form-outline">
                            <asp:TextBox runat="server" type="text" Visible="false" ID="Phone" class="form-control form-control-lg"/>
                            <asp:Label runat="server" ID="PhoneLabel" Visible="false" class="form-label">Phone</asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="form-outline">
                                <asp:TextBox runat="server" placeholder="Assign Project" type="text" Visible="false" ID="PIDTextBox" class="form-control form-control-lg"/>
                                <asp:Label runat="server" ID="PIDLabel" Visible="false" class="form-label">Project Code:</asp:Label>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="media text-muted pt-3">
                    <asp:GridView ID="EmployeeTable" Visible="False" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateColumns="False" Style="overflow-y: scroll">
                        <Columns>
                            <asp:BoundField DataField="Staff_id" HeaderText="Staff_id" InsertVisible="False" ReadOnly="True" SortExpression="Staff_id"/>
                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username"/>
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"/>
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"/>
                            <asp:BoundField DataField="Field" HeaderText="Field" SortExpression="Field"/>
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"/>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="EmployeeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:PortalConnectionString %>" SelectCommand="SELECT [Staff_id], [Username], [Password], [Email], [Field], [Phone] FROM [Employee] WHERE ([Company_id] = @Company_id) ORDER BY [Staff_id]">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Company_id" QueryStringField="UserID" Direction="Input" Type="Int32"/>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Show my Students-->
<div runat="server" visible="false" class="my-3 p-3 bg-white justify-content-center align-content-center rounded box-shadow" id="StudentsLabelHeading" style="margin-top: 5rem!important; height: 34rem!important;">
    <h6 class="border-bottom border-gray pb-2 mb-0">Students</h6>
    <div class="media text-muted pt-3">
        <asp:GridView ID="StudentTable" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateColumns="False" Style="overflow-y: scroll">
            <Columns>
                <asp:BoundField DataField="sid" HeaderText="Student ID" InsertVisible="False" ReadOnly="True" SortExpression="sid"/>
                <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name"/>
                <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name"/>
                <asp:BoundField DataField="Major_code" HeaderText="Major_code" SortExpression="Major_code"/>
                <asp:BoundField DataField="Assigned_Project_code" HeaderText="Assigned_Project_code" SortExpression="Assigned_Project_code"/>
                <asp:BoundField DataField="Date_Of_Birth" HeaderText="Date_Of_Birth" SortExpression="Date_Of_Birth"/>
                <asp:BoundField DataField="Adress" HeaderText="Adress" SortExpression="Adress"/>
                <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age"/>
                <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester"/>
                <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA"/>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="StudentSQL" runat="server" ConnectionString="<%$ ConnectionStrings:PortalConnectionString %>" SelectCommand="SELECT * FROM [Student]">
            <SelectParameters>
                <asp:QueryStringParameter Name="Company_id" QueryStringField="UserID" Direction="Input" Type="Int32"/>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</div>

<div runat="server" visible="false" class="my-3 p-3 bg-white justify-content-center align-content-center rounded box-shadow" id="GradeStudentDiv" style="margin-top: 5rem!important; height: 34rem!important;">
    <h6 class="border-bottom border-gray pb-2 mb-0">Grade Student</h6>
    <div class="col-md-6 mb-4 align-content-center">
        <div class="row">
            <div class="col">
                <asp:Button runat="server" ID="ShowGradeThesis" Text="Grade Thesis" OnClick="ShowThesisRelated" class="btn-danger" Visible="true"/>
                <asp:Button runat="server" ID="ShowGradeDefense" Text="Grade Defense" OnClick="ShowDefenseRelated" class="btn-info" Visible="true"/>
                <asp:Button runat="server" ID="ShowGradePR" Text="Grade Progress Report" OnClick="ShowPRRelated" class="btn-outline-dark" Visible="true"/>


                <asp:TextBox runat="server" ID="GradeSid" Placeholder="Student ID" CssClass="form-control form-control-lg" Visible="false"></asp:TextBox>
                <asp:TextBox runat="server" ID="ThesisTitle" Placeholder="Thesis Title" CssClass="form-control form-control-lg" Visible="false"></asp:TextBox>
                <asp:TextBox runat="server" ID="DefenseLocation" Placeholder="Defense Location" CssClass="form-control form-control-lg" Visible="false"></asp:TextBox>
                <asp:TextBox runat="server" ID="PRDate" type="date" CssClass="form-control form-control-lg" Visible="false"></asp:TextBox>
                <asp:TextBox runat="server" ID="CompanyGrade" Placeholder="Grade" CssClass="form-control form-control-lg" Visible="false"></asp:TextBox>


                <asp:Button runat="server" ID="SubmitGradeThesis" Text="Submit" OnClick="GradeThesis" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(181 45 73) 0%, rgb(177 151 57) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);" Visible="false"/>
                <asp:Button runat="server" ID="SubmitGradeDefense" Text="Submit" OnClick="GradeDefense" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(181 45 73) 0%, rgb(177 151 57) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);" Visible="false"/>
                <asp:Button runat="server" ID="SubmitGradePR" Text="Submit" OnClick="GradePR" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(181 45 73) 0%, rgb(177 151 57) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);" Visible="false"/>
            </div>
            <h2 runat="server" id="SubmittedLabel" visible="false" class="mb-5 text-uppercase" style="color: red">Student Graded!</h2>
        </div>
    </div>
</div>
</main>
</form>
</body>
</html>