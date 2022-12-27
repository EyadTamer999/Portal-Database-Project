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

        protected void CreateProjectClicked(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("LecturerCreateLocalProject", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = CreateProject.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter title = CreateProject.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar, 50));
            title.Value = Label6.Text;
            SqlParameter description = CreateProject.Parameters.Add(new SqlParameter("@description", SqlDbType.VarChar, 200));
            description.Value = Label7.Text;
            SqlParameter majorcode = CreateProject.Parameters.Add(new SqlParameter("@major_code", SqlDbType.VarChar, 10));
            majorcode.Value = Label5.Text;

            SqlParameter projCode = CreateProject.Parameters.Add(new SqlParameter("@proj_code", SqlDbType.Int));
            projCode.Value = Label4.Text;

            CreateProject.ExecuteNonQuery();
            conn.Close();

        }

        protected void SpecifyThesisDeadline(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("SpecifyThesisDeadline", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = CreateProject.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);

            CreateProject.ExecuteNonQuery();
            conn.Close();
        }

        protected void CreateMeeting(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("CreateMeeting", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = CreateProject.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter startTime = CreateProject.Parameters.Add(new SqlParameter("@start_time", SqlDbType.VarChar, 50));
            startTime.Value = Label10.Text;
            SqlParameter endTime = CreateProject.Parameters.Add(new SqlParameter("@end_time", SqlDbType.VarChar, 200));
            endTime.Value = Label11.Text;
            SqlParameter date = CreateProject.Parameters.Add(new SqlParameter("@date", SqlDbType.VarChar, 10));
            date.Value = Label12.Text;
            SqlParameter meetingPoint = CreateProject.Parameters.Add(new SqlParameter("@meeting_point", SqlDbType.Int));
            meetingPoint.Value = Label13.Text;

            CreateProject.ExecuteNonQuery();
            conn.Close();
        }

        protected void LecturerAddToDo(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("LecturerAddToDo", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = CreateProject.Parameters.Add(new SqlParameter("@meeting_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter toDoList = CreateProject.Parameters.Add(new SqlParameter("@to_do_list", SqlDbType.VarChar, 50));
            toDoList.Value = Label16.Text;

            CreateProject.ExecuteNonQuery();
            conn.Close();
        }

        protected void ViewMeetingLecturer(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("ViewMeetingLecturer", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = CreateProject.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["lecturer_id"]);
            SqlParameter meeting = CreateProject.Parameters.Add(new SqlParameter("@meeting_id", SqlDbType.VarChar, 50));
            meeting.Value = Int32.Parse(Request.QueryString["meeting_id"]);

            CreateProject.ExecuteNonQuery();
            conn.Close();
        }

        protected void viewEE(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("ViewEE", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;

            CreateProject.ExecuteNonQuery();
            conn.Close();
        }

        protected void SuperviseIndustrial(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("SuperviseIndustrial", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = CreateProject.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["lecturer_id"]);
            SqlParameter studentId = CreateProject.Parameters.Add(new SqlParameter("@proj_Code", SqlDbType.VarChar, 50));
            studentId.Value = Int32.Parse(Request.QueryString["proj_Code"]);

            CreateProject.ExecuteNonQuery();
            conn.Close();
        }

        protected void LecGradeThesis(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("LecGradeThesis", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = CreateProject.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["lecturer_id"]);
            SqlParameter meeting = CreateProject.Parameters.Add(new SqlParameter("@sid", SqlDbType.VarChar, 50));
            meeting.Value = Int32.Parse(Request.QueryString["sid"]);
            SqlParameter thesis_title = CreateProject.Parameters.Add(new SqlParameter("@thesis_title", SqlDbType.VarChar, 50));
            thesis_title.Value = Label27.Text;
            SqlParameter Lecturer_grade = CreateProject.Parameters.Add(new SqlParameter("@Lecturer_grade", SqlDbType.VarChar, 200));
            Lecturer_grade.Value = Label28.Text;


            CreateProject.ExecuteNonQuery();
            conn.Close();
        }

        protected void LecGradedefense(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("LecGradedefense", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = CreateProject.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["lecturer_id"]);
            SqlParameter meeting = CreateProject.Parameters.Add(new SqlParameter("@sid", SqlDbType.VarChar, 50));
            meeting.Value = Int32.Parse(Request.QueryString["sid"]);
            SqlParameter defense_location = CreateProject.Parameters.Add(new SqlParameter("@defense_location", SqlDbType.VarChar, 50));
            defense_location.Value = Label32.Text;
            SqlParameter Lecturer_grade = CreateProject.Parameters.Add(new SqlParameter("@Lecturer_grade", SqlDbType.VarChar, 200));
            Lecturer_grade.Value = Label33.Text;


            CreateProject.ExecuteNonQuery();
            conn.Close();
        }

        protected void LecCreatePR(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("LecCreatePR", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = CreateProject.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["lecturer_id"]);
            SqlParameter meeting = CreateProject.Parameters.Add(new SqlParameter("@sid", SqlDbType.VarChar, 50));
            meeting.Value = Int32.Parse(Request.QueryString["sid"]);
            SqlParameter Date = CreateProject.Parameters.Add(new SqlParameter("@date", SqlDbType.VarChar, 50));
            Date.Value = Label37.Text;
            SqlParameter Content = CreateProject.Parameters.Add(new SqlParameter("@content", SqlDbType.VarChar, 200));
            Content.Value = Label38.Text;

            CreateProject.ExecuteNonQuery();
            conn.Close();
        }

        protected void LecGradePR(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("LecGradePR", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = CreateProject.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["lecturer_id"]);
            SqlParameter meeting = CreateProject.Parameters.Add(new SqlParameter("@sid", SqlDbType.VarChar, 50));
            meeting.Value = Int32.Parse(Request.QueryString["sid"]);
            SqlParameter Date = CreateProject.Parameters.Add(new SqlParameter("@date", SqlDbType.VarChar, 50));
            Date.Value = Label42.Text;
            SqlParameter lecturerGrade = CreateProject.Parameters.Add(new SqlParameter("@lecturer_grade", SqlDbType.VarChar, 200));
            lecturerGrade.Value = Label43.Text;

            CreateProject.ExecuteNonQuery();
            conn.Close();
        }

        protected void RecommendEE(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("RecommendEE", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = CreateProject.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["lecturer_id"]);
            SqlParameter projCode = CreateProject.Parameters.Add(new SqlParameter("@proj_code", SqlDbType.VarChar, 50));
            projCode.Value = Int32.Parse(Request.QueryString["proj_code"]);
            SqlParameter externalExaminer = CreateProject.Parameters.Add(new SqlParameter("@EE_id", SqlDbType.VarChar, 50));
            externalExaminer.Value = Int32.Parse(Request.QueryString["EE_id"]);


            CreateProject.ExecuteNonQuery();
            conn.Close();
        }

        protected void ViewEE(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand CreateProject = new SqlCommand("ViewEE", conn);
            CreateProject.CommandType = CommandType.StoredProcedure;


            CreateProject.ExecuteNonQuery();
            conn.Close();
        }
    }
}
