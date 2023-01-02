<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerPage.aspx.cs" Inherits="WebApplication3.webpages.LecturerPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lecturer Page</title>
    <style type="text/css">
        .auto-style1 {
            direction: ltr;
        }

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
            <asp:Button ID="Button1" class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"  runat="server" OnClick="LecturerCreateLocalProject" Text="Create Project" />
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Project code"></asp:Label>
            <asp:TextBox ID="TextBox38" runat="server"></asp:TextBox>
            &nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="Major Code"></asp:Label>
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
            Specify deadline<asp:Button class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"  ID="Button2" runat="server" Text="Submit" OnClick="SpecifyThesisDeadline" />
        </p>
        Deadline<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <p>
            &nbsp;
        </p>
        <asp:Label ID="Label8" runat="server" Text="Create meetings"></asp:Label>
        <asp:Button ID="Button3" class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"  runat="server" OnClick="CreateMeeting" Text="Submit" Height="31px" Width="70px" />
        <p>
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
        <asp:Button ID="Button4" class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"  runat="server" Text="Submit" OnClick="LecturerAddToDo" />
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
        &nbsp;<asp:Button ID="Button5" class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"  runat="server" Text="view" OnClick="ViewMeetingLecturer" />&nbsp;<p>
            &nbsp;<asp:Label ID="Label19" runat="server" Text="Meeting ID"></asp:Label>
            <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
        </p>
        <div runat="server" visible="false" class="my-3 p-3 bg-white justify-content-center align-content-center rounded box-shadow" id="StudentsLabelHeading" style="margin-top: 5rem!important; height: 34rem!important;">
            <h6 class="border-bottom border-gray pb-2 mb-0">Meeting</h6>
            <div class="media text-muted pt-3">
                <asp:GridView ID="viewMeeting" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateColumns="False" Style="overflow-y: scroll">
                    <Columns>
                        <asp:BoundField DataField="Meeting_ID" HeaderText="Meeting ID" InsertVisible="False" ReadOnly="True" SortExpression="Meeting_ID" />
                        <asp:BoundField DataField="Lecturer_id" HeaderText="Lecturer_id" SortExpression="Lecturer_id" />
                        <asp:BoundField DataField="STime" HeaderText="STime" SortExpression="STime" />
                        <asp:BoundField DataField="ETime" HeaderText="ETime" SortExpression="ETime" />
                        <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                        <asp:BoundField DataField="Datee" HeaderText="Datee" SortExpression="Datee" />
                        <asp:BoundField DataField="Meeting_Point" HeaderText="Meeting_Point" SortExpression="Meeting_Point" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="MeetingSQL" runat="server" ConnectionString="<%$ ConnectionStrings:PortalConnectionString %>" SelectCommand="SELECT * FROM [Meeting]  ">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Meeting_ID" QueryStringField="UserID" Direction="Input" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label20" runat="server" Text="View external examiners"></asp:Label>
            <asp:Button ID="Button6" runat="server" Text="view" OnClick="viewExEx" />
        </p>
        <p>
            <div runat="server" visible="false" class="my-3 p-3 bg-white justify-content-center align-content-center rounded box-shadow" id="Div1" style="margin-top: 5rem!important; height: 34rem!important;">
                <h6 class="border-bottom border-gray pb-2 mb-0">External_Examiner</h6>
                <div class="media text-muted pt-3">
                    <asp:GridView ID="viewEE" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateColumns="False" Style="overflow-y: scroll">
                        <Columns>
                            <asp:BoundField DataField="EE_id" HeaderText="EE_ID" InsertVisible="False" ReadOnly="True" SortExpression="EE_id" />
                            <asp:BoundField DataField="Schedule" HeaderText="Schedule" SortExpression="Schedule" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PortalConnectionString %>" SelectCommand="SELECT * FROM [External_Examiner]  "></asp:SqlDataSource>
                </div>
            </div>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label44" runat="server" Text="Lecturer recommend external examiner"></asp:Label>
            <asp:Button ID="Button12" runat="server" class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"  Text="Recommend" OnClick="RecommendEE" />
        </p>
        <p>
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
            <asp:Button ID="Button7" runat="server" class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"  Text="Supervise" OnClick="SuperviseIndustrial" />
        </p>
        <p>
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
            <asp:Button ID="Button8" runat="server" class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"  Text="Grade" OnClick="LecGradeThesis" />
        </p>
        <p>
            <asp:Label ID="Label26" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label27" runat="server" Text="Thesis title"></asp:Label>
            <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
            <asp:Label ID="Label28" runat="server" Text="Lecturer grade"></asp:Label>
            <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label29" runat="server" Text="Grade Defense"></asp:Label>
            <asp:Button ID="Button9" runat="server" class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"  Text="Grade" OnClick="LecGradedefense" />
        </p>
        <p>
            <asp:Label ID="Label31" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox>
            <asp:Label ID="Title" runat="server" Text="Title"></asp:Label>
            <asp:TextBox ID="TextBox39" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label32" runat="server" Text="Defense location"></asp:Label>
            <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
            <asp:Label ID="Label33" runat="server" Text="Lecturer grade"></asp:Label>
            <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label34" runat="server" Text="Create progress report"></asp:Label>
            <asp:Button ID="Button10" runat="server" class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"  Text="Create" OnClick="LecCreatePR" />
        </p>
        <p>
            <asp:Label ID="Label36" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox>
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
            <asp:Button ID="Button11" runat="server" class="button" Style="min-width: 10rem; min-height: 2rem; background: linear-gradient(90deg, rgb(176 160 55) 0%, rgb(182 33 75) 100%); box-shadow: 12px 12px 24px rgb(174 166 44 / 64%);"  Text="Grade" OnClick="LecGradePR" />
        </p>
        <p>
            <asp:Label ID="Label41" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="TextBox32" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label42" runat="server" Text="Date"></asp:Label>
            <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
            <asp:Label ID="Label43" runat="server" Text="Lecturer grade"></asp:Label>
            <asp:TextBox ID="TextBox34" runat="server"></asp:TextBox>
        </p>
    </form>
</body>
</html>

