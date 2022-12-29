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
                                    <asp:Button runat="server" ID="ShowGradeThesis" OnClick="ShowThesisRelated" class="dropdown-item" Text="Grade Thesis"></asp:Button>
                                    <asp:Button runat="server" ID="ShowGradeDefense" OnClick="ShowDefenseRelated" class="dropdown-item" Text="Grade Defense"></asp:Button>
                                    <asp:Button runat="server" ID="ShowCreatePR" OnClick="ShowPRRelated" class="dropdown-item" Text="Create PR"></asp:Button>
                                </div>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton runat="server" OnClick="LogOut" class="nav-link">Logout</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <!--Show my Students-->
            <div runat="server" visible="true" class="my-3 p-3 bg-white justify-content-center align-content-center rounded box-shadow" id="StudentsLabelHeading" style="margin-top: 8rem!important; height: 34rem!important;">
                <h6 class="border-bottom border-gray pb-2 mb-0">Students</h6>
                <div class="media text-muted pt-3">
                    <asp:GridView ID="StudentTable" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateColumns="False" Style="overflow-y: scroll">
                        <Columns>
                            <asp:BoundField DataField="sid" HeaderText="Student ID" InsertVisible="False" ReadOnly="True" SortExpression="sid" />
                            <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                            <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                            <asp:BoundField DataField="Major_code" HeaderText="Major_code" SortExpression="Major_code" />
                            <asp:BoundField DataField="Assigned_Project_code" HeaderText="Assigned_Project_code" SortExpression="Assigned_Project_code" />
                            <asp:BoundField DataField="Date_Of_Birth" HeaderText="Date_Of_Birth" SortExpression="Date_Of_Birth" />
                            <asp:BoundField DataField="Adress" HeaderText="Adress" SortExpression="Adress" />
                            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                            <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                            <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="StudentSQL" runat="server" ConnectionString="<%$ ConnectionStrings:PortalConnectionString %>" SelectCommand="SELECT * FROM [Student]">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Company_id" QueryStringField="UserID" Direction="Input" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div runat="server" visible="true" class="my-3 p-3 bg-white justify-content-center align-content-center rounded box-shadow" id="GradeStudentDiv" style="margin-top: 5rem!important; height: 34rem!important;">
                <h6 class="border-bottom border-gray pb-2 mb-0">Grade Student</h6>
                <div class="col-md-6 mb-4 align-content-center">
                    <div class="row">
                        <div class="col">

                            <asp:TextBox runat="server" ID="GradeSid" Placeholder="Student ID" CssClass="form-control form-control-lg" Visible="false"></asp:TextBox>
                            <asp:TextBox runat="server" ID="ThesisTitle" Placeholder="Thesis Title" CssClass="form-control form-control-lg" Visible="false"></asp:TextBox>
                            <asp:TextBox runat="server" ID="DefenseLocation" Placeholder="Defense Location" CssClass="form-control form-control-lg" Visible="false"></asp:TextBox>
                            <asp:TextBox runat="server" ID="PRDate" type="date" CssClass="form-control form-control-lg" Visible="false"></asp:TextBox>
                            <asp:TextBox runat="server" ID="PRContent" Placeholder="Content" CssClass="form-control form-control-lg" Visible="false"></asp:TextBox>
                            <asp:TextBox runat="server" ID="EmployeeGrade" Placeholder="Grade" CssClass="form-control form-control-lg" Visible="false"></asp:TextBox>


                            <asp:Button runat="server" ID="SubmitGradeThesis" Text="Submit" OnClick="GradeThesis" class="btn-danger" Visible="false" />
                            <asp:Button runat="server" ID="SubmitGradeDefense" Text="Submit" OnClick="GradeDefense" class="btn-info" Visible="false" />
                            <asp:Button runat="server" ID="SubmitGradePR" Text="Submit" OnClick="CreatePR" class="btn-outline-dark" Visible="false" />
                        </div>
                    </div>
                    <h2 runat="server" ID="SubmittedLabel" Visible="false" class="mb-5 text-uppercase" Style="color: red">Student Graded!</h2>
                </div>
            </div>
        </main>
    </form>
</body>
</html>
