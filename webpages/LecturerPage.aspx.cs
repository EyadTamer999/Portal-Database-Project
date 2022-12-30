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

        protected void LecturerCreateLocalProject(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand LecturerCreateLocalProject = new SqlCommand("LecturerCreateLocalProject", conn);
            LecturerCreateLocalProject.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = LecturerCreateLocalProject.Parameters.Add(new SqlParameter("@Lecturer_id", SqlDbType.Int));
            userIdEntered.Value = TextBox1.Text;
            SqlParameter title = LecturerCreateLocalProject.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar, 50));
            title.Value = TextBox1.Text;
            SqlParameter description = LecturerCreateLocalProject.Parameters.Add(new SqlParameter("@description", SqlDbType.VarChar, 200));
            description.Value = TextBox5.Text;
            SqlParameter majorcode = LecturerCreateLocalProject.Parameters.Add(new SqlParameter("@major_code", SqlDbType.VarChar, 10));
            majorcode.Value = TextBox3.Text;
            SqlParameter projCode = LecturerCreateLocalProject.Parameters.Add(new SqlParameter("@proj_code", SqlDbType.VarChar));
            projCode.Value = TextBox2.Text;


            LecturerCreateLocalProject.ExecuteNonQuery();

            conn.Close();

        }

        protected void SpecifyThesisDeadline(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand SpecifyThesisDeadline = new SqlCommand("SpecifyThesisDeadline", conn);
            SpecifyThesisDeadline.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = SpecifyThesisDeadline.Parameters.Add(new SqlParameter("@deadline", SqlDbType.Int));
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
            userIdEntered.Value = TextBox7.Text;
            SqlParameter startTime = CreateMeeting.Parameters.Add(new SqlParameter("@start_time", SqlDbType.VarChar, 50));
            startTime.Value = TextBox8.Text;
            SqlParameter endTime = CreateMeeting.Parameters.Add(new SqlParameter("@end_time", SqlDbType.VarChar, 200));
            endTime.Value = TextBox9.Text;
            SqlParameter date = CreateMeeting.Parameters.Add(new SqlParameter("@date", SqlDbType.VarChar, 10));
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
            userIdEntered.Value = TextBox14.Text;
            SqlParameter meeting = ViewMeetingLecturer.Parameters.Add(new SqlParameter("@meeting_id", SqlDbType.VarChar, 50));
            meeting.Value = TextBox15.Text;

            ViewMeetingLecturer.ExecuteNonQuery();
            conn.Close();
        }

        protected void viewEE(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand viewEE = new SqlCommand("ViewEE", conn);
            viewEE.CommandType = CommandType.StoredProcedure;

            viewEE.ExecuteNonQuery();
            conn.Close();
        }

        protected void SuperviseIndustrial(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand SuperviseIndustrial = new SqlCommand("SuperviseIndustrial", conn);
            SuperviseIndustrial.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = SuperviseIndustrial.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = TextBox17.Text;
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
            SqlParameter userIdEntered = LecGradeThesis.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = TextBox19.Text;
            SqlParameter meeting = LecGradeThesis.Parameters.Add(new SqlParameter("@sid", SqlDbType.VarChar, 50));
            meeting.Value = TextBox20.Text;
            SqlParameter thesis_title = LecGradeThesis.Parameters.Add(new SqlParameter("@thesis_title", SqlDbType.VarChar, 50));
            thesis_title.Value = TextBox21.Text;
            SqlParameter Lecturer_grade = LecGradeThesis.Parameters.Add(new SqlParameter("@Lecturer_grade", SqlDbType.VarChar, 200));
            Lecturer_grade.Value = TextBox22.Text;


            LecGradeThesis.ExecuteNonQuery();
            conn.Close();
        }

        protected void LecGradedefense(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand LecGradedefense = new SqlCommand("LecGradedefense", conn);
            LecGradedefense.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = LecGradedefense.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = TextBox23.Text;
            SqlParameter meeting = LecGradedefense.Parameters.Add(new SqlParameter("@sid", SqlDbType.VarChar, 50));
            meeting.Value = TextBox24.Text;
            SqlParameter defense_location = LecGradedefense.Parameters.Add(new SqlParameter("@defense_location", SqlDbType.VarChar, 50));
            defense_location.Value = TextBox25.Text;
            SqlParameter Lecturer_grade = LecGradedefense.Parameters.Add(new SqlParameter("@Lecturer_grade", SqlDbType.VarChar, 200));
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
            userIdEntered.Value = TextBox27.Text;
            SqlParameter meeting = LecCreatePR.Parameters.Add(new SqlParameter("@sid", SqlDbType.VarChar, 50));
            meeting.Value = TextBox28.Text;
            SqlParameter Date = LecCreatePR.Parameters.Add(new SqlParameter("@date", SqlDbType.VarChar, 50));
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
            SqlParameter userIdEntered = LecGradePR.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = TextBox27.Text;
            SqlParameter meeting = LecGradePR.Parameters.Add(new SqlParameter("@sid", SqlDbType.VarChar, 50));
            meeting.Value = TextBox28.Text;
            SqlParameter Date = LecGradePR.Parameters.Add(new SqlParameter("@date", SqlDbType.VarChar, 50));
            Date.Value = TextBox29.Text;
            SqlParameter lecturerGrade = LecGradePR.Parameters.Add(new SqlParameter("@lecturer_grade", SqlDbType.VarChar, 200));
            lecturerGrade.Value = TextBox30.Text;

            LecGradePR.ExecuteNonQuery();
            conn.Close();
        }

        protected void RecommendEE(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand RecommendEE = new SqlCommand("RecommendEE", conn);
            RecommendEE.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = RecommendEE.Parameters.Add(new SqlParameter("@lecturer_id", SqlDbType.Int));
            userIdEntered.Value = TextBox35.Text;
            SqlParameter projCode = RecommendEE.Parameters.Add(new SqlParameter("@proj_code", SqlDbType.VarChar, 50));
            projCode.Value = TextBox36.Text;
            SqlParameter externalExaminer = RecommendEE.Parameters.Add(new SqlParameter("@EE_id", SqlDbType.VarChar, 50));
            externalExaminer.Value = TextBox37.Text;


            RecommendEE.ExecuteNonQuery();
            conn.Close();
        }

       /* protected void ViewEE(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand ViewEE = new SqlCommand("ViewEE", conn);
            ViewEE.CommandType = CommandType.StoredProcedure;


            ViewEE.ExecuteNonQuery();
            conn.Close();
        }*/
    }
}



