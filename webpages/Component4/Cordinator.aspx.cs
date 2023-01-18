using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cordinator
{
    public partial class Cordinator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["cordinator"].ToString();
            //create a new connection
            
            SqlConnection conn = new SqlConnection(connStr);
            //hn4el deh w n7ot bdalha session bta3 component el login
            Session["user"] = conn;
            String User = User_Type.Text;
            SqlCommand ViewUsers = new SqlCommand("ViewUsers" , conn);
            ViewUsers.Parameters.Add(new SqlParameter("@User_type", User));
            //ViewUsers.Parameters.Add(new SqlParameter("user", conn));
            

            ViewUsers.CommandType = CommandType.StoredProcedure;
            conn.Open();
            //excute the procedure
            SqlDataReader rdr = ViewUsers.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                //rdr["Userr_id"];
                String Userid = rdr.GetString(rdr.GetOrdinal("Userr_id"));
                UserLabel.Text = Userid;
                String UserNam = rdr.GetString(rdr.GetOrdinal("Username"));
                UserLabel.Text = UserNam;
                String Pass = rdr.GetString(rdr.GetOrdinal("Password"));
                UserLabel.Text = Pass;
                String email = rdr.GetString(rdr.GetOrdinal("Email"));
                UserLabel.Text = email;
                String role = rdr.GetString(rdr.GetOrdinal("Role"));
                UserLabel.Text = role;
                String phoneNo = rdr.GetString(rdr.GetOrdinal("phone_number"));
                UserLabel.Text = phoneNo;

                form1.Controls.Add(UserLabel);

            }
            

        }

        

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["cordinator"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ViewUsers = new SqlCommand("AssignAllStudentsToLocalProject", conn);
            ViewUsers.CommandType = CommandType.StoredProcedure;
            conn.Open();
            //excute the procedure
            SqlDataReader rdr = ViewUsers.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read()) 
            {
                String lecturerId = rdr.GetString(rdr.GetOrdinal("Lecturer_id"));
                UserLabel.Text = lecturerId;
                String eeId = rdr.GetString(rdr.GetOrdinal("EE_id"));
                UserLabel.Text = eeId;
                String academic = rdr.GetString(rdr.GetOrdinal("Academic_code"));
                UserLabel.Text = academic;
                form1.Controls.Add(UserLabel);
            }

        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("AssignTAs.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            /* string connStr = WebConfigurationManager.ConnectionStrings["cordinator"].ToString();
             //create a new connection
             SqlConnection conn = new SqlConnection(connStr);
             int lecture_id = Int16.Parse(UserName.Text);
             SqlCommand ViewRecommendation = new SqlCommand("ViewRecommendation", conn);
             ViewRecommendation.CommandType = CommandType.StoredProcedure;
             conn.Open();
             //excute the procedure
             SqlDataReader rdr = ViewRecommendation.ExecuteReader(CommandBehavior.CloseConnection);
             while (rdr.Read()) 
             {

             }
            */
            Response.Redirect("ViewRecommendation.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("AssignExternalEx.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["cordinator"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            int SID = Int16.Parse(UserName.Text);
            DateTime datetime = DateTime.Now;
            TimeSpan time = new TimeSpan();
            String loca = location.Text;  
           
            SqlCommand ScheduleDefense = new SqlCommand("ScheduleDefense", conn);
            ScheduleDefense.CommandType = CommandType.StoredProcedure;
            conn.Open();
            //excute the procedure
            SqlDataReader rdr = ScheduleDefense.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read()) 
            {
                String Student_id = rdr.GetString(rdr.GetOrdinal("sid"));
                UserLabel.Text = Student_id;
                String fName = rdr.GetString(rdr.GetOrdinal("first_name"));
                UserLabel.Text = fName;
                String Lname = rdr.GetString(rdr.GetOrdinal("last_name"));
                UserLabel.Text = Lname;
                String MajorCode = rdr.GetString(rdr.GetOrdinal("Major_code"));
                UserLabel.Text = MajorCode;
                String AssignedProject = rdr.GetString(rdr.GetOrdinal("Assigned_project"));
                UserLabel.Text = AssignedProject;
                String DOB = rdr.GetString(rdr.GetOrdinal("Date_Of_Birth"));
                UserLabel.Text = DOB;
                String ADDr = rdr.GetString(rdr.GetOrdinal("Address"));
                UserLabel.Text = ADDr;
                String age = rdr.GetString(rdr.GetOrdinal("Age"));
                UserLabel.Text = age;
                String semster = rdr.GetString(rdr.GetOrdinal("Semester"));
                UserLabel.Text = semster;
                String gpa = rdr.GetString(rdr.GetOrdinal("GPA"));
                UserLabel.Text = gpa;

                form1.Controls.Add(UserLabel);


            }



        }
    }
}