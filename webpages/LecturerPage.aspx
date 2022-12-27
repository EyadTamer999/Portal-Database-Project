<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerPage.aspx.cs" Inherits="WebApplication3.webpages.LecturerPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            direction: ltr;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Lecturer Page"></asp:Label>
            <br />
            <br />
        </div>
        <p class="auto-style1">
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Create local project"></asp:Label>
            <asp:Button ID="Button1" runat="server" OnClick="CreateProjectClicked" Text="Create Project" />
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Lecturer ID"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Width="173px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Project code"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            &nbsp;<asp:Label ID="Label5" runat="server" Text="Major Code"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label6" runat="server" Text="Title"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            &nbsp;<asp:Label ID="Label7" runat="server" Text="Description"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            Specify deadline<asp:Button ID="Button2" runat="server" Text="Submit" OnClick="SpecifyThesisDeadline" />
        </p>
        Deadline<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <p>
            &nbsp;
        </p>
        <asp:Label ID="Label8" runat="server" Text="Create meetings"></asp:Label>
        <asp:Button ID="Button3" runat="server" OnClick="CreateMeeting" Text="Submit" Height="31px" Width="70px" />
        <p>
            <asp:Label ID="Label9" runat="server" Text="Lecturer Id"></asp:Label>
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <asp:Label ID="Label10" runat="server" Text="Start Time"></asp:Label>
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label11" runat="server" Text="End time"></asp:Label>
        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
        <asp:Label ID="Label12" runat="server" Text="Date"></asp:Label>
        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label13" runat="server" Text="Meeting point"></asp:Label>
            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <asp:Label ID="Label14" runat="server" Text="Add to the to-do "></asp:Label>
        <asp:Button ID="Button4" runat="server" Text="Submit" OnClick="LecturerAddToDo" />
        <br />
        <br />
        <asp:Label ID="Label15" runat="server" Text="Meeting ID"></asp:Label>
        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
        &nbsp;<asp:Label ID="Label16" runat="server" Text="To do list"></asp:Label>
        <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <asp:Label ID="Label17" runat="server" Text="View Meeting"></asp:Label>
        &nbsp;<asp:Button ID="Button5" runat="server" Text="view" OnClick="ViewMeetingLecturer" />
        <p>
            <asp:Label ID="Label18" runat="server" Text="Lecturer ID"></asp:Label>
            <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
            &nbsp;<asp:Label ID="Label19" runat="server" Text="Meeting ID"></asp:Label>
            <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label20" runat="server" Text="View external examiners"></asp:Label>
            <asp:Button ID="Button6" runat="server" Text="view" OnClick="viewEE" />
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label44" runat="server" Text="Lecturer recommend external examiner"></asp:Label>
            <asp:Button ID="Button12" runat="server" Text="Recommend" />
        </p>
        <p>
            <asp:Label ID="Label45" runat="server" Text="Lecture ID"></asp:Label>
            <asp:TextBox ID="TextBox35" runat="server"></asp:TextBox>
            &nbsp;
            <asp:Label ID="Label46" runat="server" Text="Project code"></asp:Label>
            <asp:TextBox ID="TextBox36" runat="server"></asp:TextBox>
            &nbsp;
            <asp:Label ID="Label47" runat="server" Text="External examiner ID"></asp:Label>
            <asp:TextBox ID="TextBox37" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label21" runat="server" Text="Supervise Industrial"></asp:Label>
            <asp:Button ID="Button7" runat="server" Text="Supervise" OnClick="SuperviseIndustrial" />
        </p>
        <p>
            <asp:Label ID="Label22" runat="server" Text="Lecturer ID"></asp:Label>
            <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
            <asp:Label ID="Label23" runat="server" Text="Project code"></asp:Label>
            <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label24" runat="server" Text="Grade Thesis"></asp:Label>
            <asp:Button ID="Button8" runat="server" Text="Grade" OnClick="LecGradeThesis" />
        </p>
        <p>
            <asp:Label ID="Label25" runat="server" Text="Lecturer ID"></asp:Label>
            <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
            <asp:Label ID="Label26" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="TextBox20" runat="server" ></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label27" runat="server" Text="Thesis title"></asp:Label>
            <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
            <asp:Label ID="Label28" runat="server" Text="Lecturer grade"></asp:Label>
            <asp:TextBox ID="TextBox22" runat="server" ></asp:TextBox>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label29" runat="server" Text="Grade Defense"></asp:Label>
            <asp:Button ID="Button9" runat="server" Text="Grade" OnClick="LecGradedefense" />
        </p>
        <p>
            <asp:Label ID="Label30" runat="server" Text="Lecturer ID"></asp:Label>
            <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
            <asp:Label ID="Label31" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="TextBox24" runat="server" ></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label32" runat="server" Text="Defense location"></asp:Label>
            <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
            <asp:Label ID="Label33" runat="server" Text="Lecturer grade"></asp:Label>
            <asp:TextBox ID="TextBox26" runat="server" ></asp:TextBox>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label34" runat="server" Text="Create progress report"></asp:Label>
            <asp:Button ID="Button10" runat="server" Text="Create" OnClick="LecCreatePR" />
        </p>
        <p>
            <asp:Label ID="Label35" runat="server" Text="Lecturer ID"></asp:Label>
            <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
            <asp:Label ID="Label36" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="TextBox28" runat="server" ></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label37" runat="server" Text="Date"></asp:Label>
            <asp:TextBox ID="TextBox29" runat="server"></asp:TextBox>
            <asp:Label ID="Label38" runat="server" Text="Conent"></asp:Label>
            <asp:TextBox ID="TextBox30" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label39" runat="server" Text="Grade Progress Report"></asp:Label>
            <asp:Button ID="Button11" runat="server" Text="Grade" OnClick="LecGradePR" />
        </p>
        <p>
            <asp:Label ID="Label40" runat="server" Text="Lecturer ID"></asp:Label>
            <asp:TextBox ID="TextBox31" runat="server"></asp:TextBox>
            <asp:Label ID="Label41" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="TextBox32" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label42" runat="server" Text="Date"></asp:Label>
            <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
            <asp:Label ID="Label43" runat="server" Text="Lecturer grade"></asp:Label>
            <asp:TextBox ID="TextBox34" runat="server" ></asp:TextBox>
        </p>
    </form>
</body>
</html>

