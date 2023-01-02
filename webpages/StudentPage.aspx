<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentPage.aspx.cs" Inherits="WebApplication3.webpages.StudentPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<style>
    .Grid1 {
        margin-left: auto;
        margin-right: auto;
    }

    div.nav {
        position: fixed;
        top: 0px;
        left: 0px;
    }

    div.box {
        background-color: beige;
        height: 250px;
        width: 220px;
        border: 2px dashed #000;
        float: left;
        margin: 20px;
    }

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
    }

    nav {
        height: 80px;
        background: #5D6D7E;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0rem calc((100vc-1600px) / 2);
    }

    .logo {
        color: #FFFFFF;
        font-size: 1.5rem;
        font-weight: bold;
        font-style: italic;
        padding: 0 2rem;
    }

    nav a {
        text-decoration: none;
        color: azure;
        padding: 0 1.5rem;
    }

    .hero {
        background: #818181;
    }

    .hero-container {
        display: grid;
        grid-template-columns: 1fr 1fr;
        height: 95vh;
        padding: 0rem calc((100vw - 1300) /2);
    }

    .column-left {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
        color: azure;
    }

        .column-left h1 {
            margin-bottom: 1rem;
            font-size: 3rem;
        }

        .column-left p {
            margin-bottom: 2rem;
            font-size: 1.5rem;
            line-height: 1.5;
        }

    button {
        padding: 1rem 3rem;
        font-size: 1rem;
        border: none;
        color: #818181;
        background: azure;
        cursor: pointer;
        border-radius: 50px;
    }

        button:hover {
            background: #fff;
            color: #000;
        }

    .column-right {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 0rem 2rem;
    }

    .hero-image {
        width: 100%;
        height: 100%;
    }

    @media screen and (max-width:768px) {
        .hero-container {
            grid-template-columns: 1fr;
        }
    }
</style>
<head runat="server">
    <title>Student page</title>
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
</head>

<body>
    <form id="form1" runat="server">
        <nav>
            <div class="logo">
                <img src="../img/giu-logo.jpg" alt="HHHHHHHHHHHHHHHHHH">
                STUDENT PAGE
               
            </div>
            <div class=" nav-items">
                <a href="/">Home</a>
                <a href="/">View</a>
                <a href="/">Submit</a>
            </div>
        </nav>
        <section class="hero">
            <div class="hero-container">
                <div class="column-left" style="justify-content: center; align-content: center">
                    <h1>Welcome to your home page</h1>
                    <p>There are currently no announcements from your faculty</p>
                    <asp:Button ID="ViewThesis" runat="server" Text="Thesis" OnClick="ViewThesis_Click" Style="padding: 1rem 3rem; font-size: 1rem; border: none; color: #818181; background: azure; cursor: pointer; border-radius: 50px;" />
                    <div>
                        <asp:GridView ID="GridView1" runat="server" CssClass="Grid1" Visible=" true"></asp:GridView>
                    </div>
                    <asp:Button ID="ViewDefense" runat="server" Text="Defense" OnClick="ViewDefense_Click" Style="padding: 1rem 3rem; font-size: 1rem; border: none; color: #818181; background: azure; cursor: pointer; border-radius: 50px;" />
                    <div>
                        <asp:GridView ID="GridView2" runat="server" CssClass="Grid1" Visible=" true"></asp:GridView>
                    </div>
                    <asp:Button ID="ViewPR" runat="server" Text="Progress report" OnClick="ViewPR_Click" Style="padding: 1rem 3rem; font-size: 1rem; border: none; color: #818181; background: azure; cursor: pointer; border-radius: 50px;" />

                    <div class="my-3 p-3 bg-white justify-content-center rounded box-shadow border-gray" style="margin-top: 5rem!important; width: fit-content; height: fit-content;" runat="server" visible="true" id="date">
                        Day&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="day" runat="server" Width="50px"></asp:TextBox><br />
                        Month&nbsp;<asp:TextBox ID="month" runat="server" Width="50px">&nbsp;&nbsp;&nbsp;</asp:TextBox><br />
                        Year&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="year" runat="server" Width="50px">&nbsp;&nbsp;&nbsp;</asp:TextBox><br />
                    </div>
                </div>

                <asp:GridView ID="GridView3" runat="server" CssClass="Grid1" Visible=" true"></asp:GridView>
            </div>
            <asp:Button ID="ViewProjectGrade" runat="server" Text="Bachelor Project Grade" OnClick="ViewProjectGrade_Click" Style="padding: 1rem 3rem; font-size: 1rem; border: none; color: #818181; background: azure; cursor: pointer; border-radius: 50px;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="projgrade" runat="server" Text=""></asp:Label>
            <asp:Button ID="ViewBookedMeeting" runat="server" Text="Booked Meetings" OnClick="ViewBookedMeeting_Click" Style="padding: 1rem 3rem; font-size: 1rem; border: none; color: #818181; background: azure; cursor: pointer; border-radius: 50px;" />
            <div>
                <asp:GridView ID="GridView4" runat="server" CssClass="Grid1" Visible=" true"></asp:GridView>
            </div>
            <asp:Button ID="ViewMeetings" runat="server" Text="Meetings Available" OnClick="ViewMeetings_Click" Style="padding: 1rem 3rem; font-size: 1rem; border: none; color: #818181; background: azure; cursor: pointer; border-radius: 50px;" />
            <div>
                <asp:GridView ID="GridView5" runat="server" CssClass="Grid1" Visible=" true"></asp:GridView>
            </div>
            <asp:Button ID="MakePreference" runat="server" Text="MakePreference" OnClick="MakePreference_Click" Style="padding: 1rem 3rem; font-size: 1rem; border: none; color: #818181; background: azure; cursor: pointer; border-radius: 50px;" />
            <asp:Label ID="Label4" runat="server" Text="Bachelor code"></asp:Label>
            &nbsp;<asp:TextBox ID="Bachid" runat="server"></asp:TextBox>
            &nbsp;<asp:Label ID="Label5" runat="server" Text="Preference Number"></asp:Label>
            &nbsp;<asp:TextBox ID="Pref" runat="server"></asp:TextBox>

            <asp:Button ID="SubmitThesis" runat="server" Text="Submit Thesis" OnClick="SubmitThesis_Click" Style="padding: 1rem 3rem; font-size: 1rem; border: none; color: #818181; background: azure; cursor: pointer; border-radius: 50px;" />
            <asp:Label runat="server" ID="Thesistitle" class="form-label" for="form3Example1m1">Project Title:</asp:Label>
            <asp:TextBox runat="server" type="text" ID="ProjTitle" />
            <div class="col-md-6 mb-4">
                <div class="form-outline">
                    <asp:Label runat="server" ID="PDF" class="form-label" for="form3Example1m1">PDF Document:</asp:Label>
                    <asp:TextBox runat="server" type="text" ID="DescriptionTextBox" Style="width: 45rem; height: 25rem; font-size: small; vertical-align: top !important;" class="form-control form-control-lg" />
                </div>
            </div>
            <asp:Button ID="UpdateDefense" runat="server" Text="Update Defense" OnClick="UpdateDefense_Click" Style="padding: 1rem 3rem; font-size: 1rem; border: none; color: #818181; background: azure; cursor: pointer; border-radius: 50px;" />
            <div class="col-md-6 mb-4">
                <div class="form-outline">
                    <asp:Label runat="server" ID="defense" class="form-label" for="form3Example1m1">Defense Content:</asp:Label>
                    <asp:TextBox runat="server" type="text" ID="DefenseContent" Style="width: 45rem; height: 25rem; font-size: small; vertical-align: top !important;" class="form-control form-control-lg" />
                </div>
            </div>
            <asp:Button ID="BookMeeting" runat="server" Text="Book Meeting" OnClick="BookMeeting_Click" Style="padding: 1rem 3rem; font-size: 1rem; border: none; color: #818181; background: azure; cursor: pointer; border-radius: 50px;" />
            <asp:Label ID="Book" runat="server" Text="Meeting ID"></asp:Label>
            &nbsp;<asp:TextBox ID="BookID" runat="server"></asp:TextBox>
            <asp:Button ID="ToDoList" runat="server" Text="Meeting to do list" OnClick="ToDoList_Click" Style="padding: 1rem 3rem; font-size: 1rem; border: none; color: #818181; background: azure; cursor: pointer; border-radius: 50px;" />
            <asp:Label runat="server" ID="Meetingid" class="form-label" for="form3Example1m1">Meeting Id:</asp:Label>
            <asp:TextBox runat="server" type="text" ID="Meetingid1" />
            <div class="col-md-6 mb-4">
                <div class="form-outline">
                    <asp:Label runat="server" ID="Label2" class="form-label" for="form3Example1m1">To Do List:</asp:Label>
                    <asp:TextBox runat="server" type="text" ID="DoList" Style="width: 45rem; height: 25rem; font-size: small; vertical-align: top !important;" class="form-control form-control-lg" />
                </div>
            </div>
        </section>
    </form>
</body>
</html>
