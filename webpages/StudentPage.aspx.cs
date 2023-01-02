using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3.webpages
{
    public partial class StudentPage : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Portal"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
        }
        //proc not found?!?
        protected void ViewThesis_Click(object sender, EventArgs e)
        {

            SqlCommand ViewThesis = new SqlCommand("ViewMyThesis", conn);
            ViewThesis.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = ViewThesis.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            conn.Open();
            SqlDataReader reader = ViewThesis.ExecuteReader();
            GridView1.DataSource = reader; GridView1.DataBind();
            conn.Close();
        }
        //proc not found?!?
        protected void ViewDefense_Click(object sender, EventArgs e)
        {

            SqlCommand ViewDef = new SqlCommand("ViewMyDefense", conn);
            ViewDef.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = ViewDef.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            conn.Open();
            SqlDataReader reader = ViewDef.ExecuteReader();
            GridView2.DataSource = reader; GridView2.DataBind();
            conn.Close();

        }
        //works
        protected void ViewPR_Click(object sender, EventArgs e)
        {

            SqlCommand ViewPR = new SqlCommand("ViewMyProgressReports", conn);
            ViewPR.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = ViewPR.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            String date = year.Text + "-" + month.Text + "-" + day.Text;
            DateTime datee = DateTime.ParseExact(date, "yyyy-MM-dd", null);
            ViewPR.Parameters.Add(new SqlParameter("@date", datee));
            conn.Open();
            SqlDataReader reader = ViewPR.ExecuteReader();
            GridView3.DataSource = reader; GridView3.DataBind();
            conn.Close();

        }
        //works
        protected void ViewProjectGrade_Click(object sender, EventArgs e)
        {

            SqlCommand ViewMyGrade = new SqlCommand("ViewMyBachelorProjectGrade", conn);
            ViewMyGrade.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = ViewMyGrade.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            SqlParameter grade = ViewMyGrade.Parameters.Add(new SqlParameter("@BachelorGrade", SqlDbType.Int));
            grade.Direction = ParameterDirection.Output;
            conn.Open();
            ViewMyGrade.ExecuteNonQuery();
            conn.Close();
            projgrade.Text = grade + "";
        }
        //works
        protected void ViewBookedMeeting_Click(object sender, EventArgs e)
        {

            SqlCommand ViewBookedMeetings = new SqlCommand("ViewBooked", conn);
            ViewBookedMeetings.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = ViewBookedMeetings.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            conn.Open();
            SqlDataReader reader = ViewBookedMeetings.ExecuteReader();
            GridView4.DataSource = reader; GridView4.DataBind();
            conn.Close();
        }
        //Problem in procedure
        protected void ViewMeetings_Click(object sender, EventArgs e)
        {

            SqlCommand ViewMeetings = new SqlCommand("ViewNotBookedMeetings", conn);
            ViewMeetings.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = ViewMeetings.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            conn.Open();
            SqlDataReader reader = ViewMeetings.ExecuteReader();
            GridView5.DataSource = reader; GridView5.DataBind();
            conn.Close();
        }

        protected void MakePreference_Click(object sender, EventArgs e)
        {
            SqlCommand MakePreference = new SqlCommand("MakePreferencesLocalProject", conn);
            MakePreference.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = MakePreference.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            int pref = Int16.Parse(Pref.Text);
            int bach = Int16.Parse(Bachid.Text);
            MakePreference.Parameters.Add(new SqlParameter("@Bachelor_code", bach));
            MakePreference.Parameters.Add(new SqlParameter("@prefrences_number", pref));
            conn.Open();
            MakePreference.ExecuteNonQuery();
            conn.Close();
        }
        //works
        protected void SubmitThesis_Click(object sender, EventArgs e)
        {
            SqlCommand SubmitMyThesis = new SqlCommand("SubmitMyThesis", conn);
            SubmitMyThesis.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = SubmitMyThesis.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            String title = ProjTitle.Text;
            String pdfDoc = PDF.Text;
            SubmitMyThesis.Parameters.Add(new SqlParameter("@title", title));
            SubmitMyThesis.Parameters.Add(new SqlParameter("@PDF_Document", pdfDoc));
            conn.Open();
            SubmitMyThesis.ExecuteNonQuery();
            conn.Close();
        }
        //works
        protected void UpdateDefense_Click(object sender, EventArgs e)
        {
            SqlCommand UpdateDefense = new SqlCommand("UpdateMyDefense", conn);
            UpdateDefense.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = UpdateDefense.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            String DefenseContents = DefenseContent.Text;
            UpdateDefense.Parameters.Add(new SqlParameter("@defense_content", DefenseContents));
            conn.Open();
            UpdateDefense.ExecuteNonQuery();
            conn.Close();
        }
        //Problem in procedure
        protected void BookMeeting_Click(object sender, EventArgs e)
        {
            SqlCommand BookMeeting = new SqlCommand("BookMeeting", conn);
            BookMeeting.CommandType = CommandType.StoredProcedure;
            SqlParameter userIdEntered = BookMeeting.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            userIdEntered.Value = Int32.Parse(Request.QueryString["UserID"]);
            int BookId = Int16.Parse(BookID.Text);
            BookMeeting.Parameters.Add(new SqlParameter("@meeting_id", BookId));
            conn.Open();
            BookMeeting.ExecuteNonQuery();
            conn.Close();
        }
        //Problem in procedure
        protected void ToDoList_Click(object sender, EventArgs e)
        {
            SqlCommand ToDoList = new SqlCommand("StudentAddToDo", conn);
            ToDoList.CommandType = CommandType.StoredProcedure;
            String meetingid = Meetingid1.Text;
            String List = DoList.Text;
            ToDoList.Parameters.Add(new SqlParameter("@meeting_id", meetingid));
            ToDoList.Parameters.Add(new SqlParameter("@to_do_list", List));
            conn.Open();
            ToDoList.ExecuteNonQuery();
            conn.Close();
        }





    }
}