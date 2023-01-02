using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebApplication3.webpages
{
    public partial class LecturerPage : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Portal"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("LoginPage.aspx");
            }

        }

        protected void LecturerCreateLocalProject(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand LecturerCreateLocalProject = new SqlCommand("LecturerCreateLocalProject", conn);
            LecturerCreateLocalProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = LecturerCreateLocalProject.Parameters.Add(new SqlParameter("@Lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter title = LecturerCreateLocalProject.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar, 50));
            title.Value = TextBox4.Text;
            SqlParameter description = LecturerCreateLocalProject.Parameters.Add(new SqlParameter("@description", SqlDbType.VarChar, 200));
            description.Value = TextBox5.Text;
            SqlParameter majorcode = LecturerCreateLocalProject.Parameters.Add(new SqlParameter("@major_code", SqlDbType.Int));
            majorcode.Value = TextBox3.Text;
            SqlParameter project = LecturerCreateLocalProject.Parameters.Add(new SqlParameter("@proj_code", SqlDbType.Int));
            project.Value = TextBox38.Text;


            LecturerCreateLocalProject.ExecuteNonQuery();

            conn.Close();

        }

        protected void SpecifyThesisDeadline(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand SpecifyThesisDeadline = new SqlCommand("SpecifyThesisDeadline", conn);
            SpecifyThesisDeadline.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = SpecifyThesisDeadline.Parameters.Add(new SqlParameter("@deadline", SqlDbType.Date));
            userIdEntered.Value = TextBox6.Text;

            SpecifyThesisDeadline.ExecuteNonQuery();
            conn.Close();
        }

        protected void CreateMeeting(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateMeeting = new SqlCommand("CreateMeeting", conn);
            CreateMeeting.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = CreateMeeting.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter startTime = CreateMeeting.Parameters.Add(new SqlParameter("@start_time", SqlDbType.Time));
            startTime.Value = TextBox8.Text;
            SqlParameter endTime = CreateMeeting.Parameters.Add(new SqlParameter("@end_time", SqlDbType.Time));
            endTime.Value = TextBox9.Text;
            SqlParameter date = CreateMeeting.Parameters.Add(new SqlParameter("@date", SqlDbType.Date));
            date.Value = TextBox10.Text;
            SqlParameter meetingPoint = CreateMeeting.Parameters.Add(new SqlParameter("@meeting_point", SqlDbType.Int));
            meetingPoint.Value = TextBox11.Text;

            CreateMeeting.ExecuteNonQuery();
            conn.Close();
        }

        protected void LecturerAddToDo(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand LecturerAddToDo = new SqlCommand("LecturerAddToDo", conn);
            LecturerAddToDo.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = LecturerAddToDo.Parameters.Add(new SqlParameter("@meeting_id", SqlDbType.Int));
            userIdEntered.Value = TextBox12.Text;
            SqlParameter toDoList = LecturerAddToDo.Parameters.Add(new SqlParameter("@to_do_list", SqlDbType.VarChar, 50));
            toDoList.Value = TextBox13.Text;

            LecturerAddToDo.ExecuteNonQuery();
            conn.Close();
        }

        protected void ViewMeetingLecturer(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand ViewMeetingLecturer = new SqlCommand("ViewMeetingLecturer", conn);
            ViewMeetingLecturer.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = ViewMeetingLecturer.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter meeting = ViewMeetingLecturer.Parameters.Add(new SqlParameter("@meeting_id", SqlDbType.VarChar, 50));
            meeting.Value = TextBox15.Text;

            string cmd = "SELECT * FROM [Meeting]";
            SqlDataAdapter getMeeting = new SqlDataAdapter(cmd, conn);

            DataTable DT = new DataTable();

            getMeeting.Fill(DT);

            viewMeeting.DataSource = DT;
            viewMeeting.DataBind();
            if (!StudentsLabelHeading.Visible)
            {
                StudentsLabelHeading.Visible = true;
            }
            else
            {
                StudentsLabelHeading.Visible = false;
            }
        }

        protected void viewExEx(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand ViewMeetingLecturer = new SqlCommand("ViewEE", conn);
            ViewMeetingLecturer.CommandType = CommandType.StoredProcedure;

            string cmd = "SELECT * FROM [External_Examiner]";
            SqlDataAdapter viewExternalExaminer = new SqlDataAdapter(cmd, conn);

            DataTable DT = new DataTable();

            viewExternalExaminer.Fill(DT);

            viewEE.DataSource = DT;
            viewEE.DataBind();
            if (!Div1.Visible)
            {
                Div1.Visible = true;
            }
            else
            {
                Div1.Visible = false;
            }
        }

        protected void SuperviseIndustrial(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand SuperviseIndustrial = new SqlCommand("SuperviseIndustrial", conn);
            SuperviseIndustrial.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = SuperviseIndustrial.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter studentId = SuperviseIndustrial.Parameters.Add(new SqlParameter("@proj_Code", SqlDbType.VarChar, 50));
            studentId.Value = TextBox18.Text;

            SuperviseIndustrial.ExecuteNonQuery();
            conn.Close();
        }

        protected void LecGradeThesis(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand LecGradeThesis = new SqlCommand("LecGradeThesis", conn);
            LecGradeThesis.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = LecGradeThesis.Parameters.Add(new SqlParameter("@Lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter meeting = LecGradeThesis.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            meeting.Value = TextBox20.Text;
            SqlParameter thesis_title = LecGradeThesis.Parameters.Add(new SqlParameter("@thesis_title", SqlDbType.VarChar, 50));
            thesis_title.Value = TextBox21.Text;
            SqlParameter Lecturer_grade = LecGradeThesis.Parameters.Add(new SqlParameter("@Lecturer_grade", SqlDbType.Decimal));
            Lecturer_grade.Value = TextBox22.Text;


            LecGradeThesis.ExecuteNonQuery();
            conn.Close();
        }

        protected void LecGradedefense(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand LecGradedefense = new SqlCommand("LecGradedefense", conn);
            LecGradedefense.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = LecGradedefense.Parameters.Add(new SqlParameter("@Lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter meeting = LecGradedefense.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            meeting.Value = TextBox24.Text;
            SqlParameter Title = LecGradedefense.Parameters.Add(new SqlParameter("@Title", SqlDbType.VarChar, 50));
            Title.Value = TextBox39.Text;
            SqlParameter defense_location = LecGradedefense.Parameters.Add(new SqlParameter("@defense_location", SqlDbType.VarChar, 50));
            defense_location.Value = TextBox25.Text;
            SqlParameter Lecturer_grade = LecGradedefense.Parameters.Add(new SqlParameter("@Lecturer_grade", SqlDbType.Decimal));
            Lecturer_grade.Value = TextBox26.Text;


            LecGradedefense.ExecuteNonQuery();
            conn.Close();
        }

        protected void LecCreatePR(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand LecCreatePR = new SqlCommand("LecCreatePR", conn);
            LecCreatePR.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = LecCreatePR.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter meeting = LecCreatePR.Parameters.Add(new SqlParameter("@sid", SqlDbType.VarChar, 50));
            meeting.Value = TextBox28.Text;
            SqlParameter Date = LecCreatePR.Parameters.Add(new SqlParameter("@date", SqlDbType.Date));
            Date.Value = TextBox29.Text;
            SqlParameter Content = LecCreatePR.Parameters.Add(new SqlParameter("@content", SqlDbType.VarChar, 200));
            Content.Value = TextBox30.Text;

            LecCreatePR.ExecuteNonQuery();
            conn.Close();
        }

        protected void LecGradePR(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand LecGradePR = new SqlCommand("LecGradePR", conn);
            LecGradePR.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = LecGradePR.Parameters.Add(new SqlParameter("@Lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter meeting = LecGradePR.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            meeting.Value = TextBox32.Text;
            SqlParameter Date = LecGradePR.Parameters.Add(new SqlParameter("@date", SqlDbType.Date));
            Date.Value = TextBox33.Text;
            SqlParameter lecturerGrade = LecGradePR.Parameters.Add(new SqlParameter("@Lecturer_grade", SqlDbType.Decimal));
            lecturerGrade.Value = TextBox34.Text;

            LecGradePR.ExecuteNonQuery();
            conn.Close();
        }

        protected void RecommendEE(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand RecommendEE = new SqlCommand("RecommendEE", conn);
            RecommendEE.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = RecommendEE.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter projCode = RecommendEE.Parameters.Add(new SqlParameter("@proj_code", SqlDbType.Int));
            projCode.Value = TextBox36.Text;
            SqlParameter externalExaminer = RecommendEE.Parameters.Add(new SqlParameter("@EE_id", SqlDbType.Int));
            externalExaminer.Value = TextBox37.Text;


            RecommendEE.ExecuteNonQuery();
            conn.Close();
        }

    }
}



