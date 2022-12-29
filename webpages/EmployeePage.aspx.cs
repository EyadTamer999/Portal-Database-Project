using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace WebApplication3.webpages
{
    public partial class EmployeePage : System.Web.UI.Page
    {
        //set connection string
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Portal"].ToString());


        protected void Page_Load(object sender, EventArgs e)
        {
            ShowStudents();
            if (Session["user"] == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
        }

        protected void ShowStudents()
        {
            string cmd = "SELECT * FROM [Student]";
            conn.Open();
            SqlDataAdapter getStudets = new SqlDataAdapter(cmd, conn);

            DataTable DT = new DataTable();

            getStudets.Fill(DT);

            StudentTable.DataSource = DT;
            StudentTable.DataBind();
            conn.Close();

        }

        protected void GradeThesis(object sender, EventArgs e)
        {
            SqlCommand GradeThesis = new SqlCommand("EmployeeGradeThesis", conn);
            GradeThesis.CommandType = CommandType.StoredProcedure;

            SqlParameter EmployeeID = GradeThesis.Parameters.Add(new SqlParameter("@Employee_id", SqlDbType.Int));
            EmployeeID.Value = Int32.Parse(Request.QueryString["UserID"].ToString());
            SqlParameter SID = GradeThesis.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            SID.Value = GradeSid.Text;
            SqlParameter thesisTitle = GradeThesis.Parameters.Add(new SqlParameter("@thesis_title", SqlDbType.VarChar, 50));
            thesisTitle.Value = ThesisTitle.Text;
            SqlParameter employeeGrade = GradeThesis.Parameters.Add(new SqlParameter("@Employee_grade", SqlDbType.Decimal));
            employeeGrade.Value = Convert.ToDecimal(EmployeeGrade.Text.ToString());

            conn.Open();
            GradeThesis.ExecuteNonQuery();
            conn.Close();

            SubmittedLabel.Visible = true;
        }

        protected void GradeDefense(object sender, EventArgs e)
        {
            SqlCommand GradeDefense = new SqlCommand("EmployeeGradeDefense", conn);
            GradeDefense.CommandType = CommandType.StoredProcedure;

            SqlParameter EmployeeID = GradeDefense.Parameters.Add(new SqlParameter("@Employee_id", SqlDbType.Int));
            EmployeeID.Value = Int32.Parse(Request.QueryString["UserID"].ToString());
            SqlParameter SID = GradeDefense.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            SID.Value = GradeSid.Text;
            SqlParameter DefLoc = GradeDefense.Parameters.Add(new SqlParameter("@defense_location", SqlDbType.VarChar, 50));
            DefLoc.Value = DefenseLocation.Text;
            SqlParameter employeeGrade = GradeDefense.Parameters.Add(new SqlParameter("@Employee_grade", SqlDbType.Decimal));
            employeeGrade.Value = Convert.ToDecimal(EmployeeGrade.Text.ToString());

            conn.Open();
            GradeDefense.ExecuteNonQuery();
            conn.Close();

            SubmittedLabel.Visible = true;

        }

        protected void CreatePR(object sender, EventArgs e)
        {
            SqlCommand CreatePR = new SqlCommand("EmployeeCreatePR", conn);
            CreatePR.CommandType = CommandType.StoredProcedure;

            SqlParameter EmployeeID = CreatePR.Parameters.Add(new SqlParameter("@Employee_id", SqlDbType.Int));
            EmployeeID.Value = Int32.Parse(Request.QueryString["UserID"].ToString());
            SqlParameter SID = CreatePR.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            SID.Value = GradeSid.Text;
            SqlParameter prDate = CreatePR.Parameters.Add(new SqlParameter("@date", SqlDbType.DateTime));
            prDate.Value = PRDate.Text;
            SqlParameter prContent = CreatePR.Parameters.Add(new SqlParameter("@content", SqlDbType.VarChar,1000));
            prContent.Value = PRContent.Text;
            
            conn.Open();
            CreatePR.ExecuteNonQuery();
            conn.Close();

            SubmittedLabel.Visible = true;
        }


        protected void ShowThesisRelated(object sender, EventArgs e)
        {
            //if thesis related is not visible make it visible 
            //else make it invisible
            if (!SubmitGradeThesis.Visible)
            {
                SubmittedLabel.Visible = false;
                GradeSid.Visible = true;
                GradeSid.Text = string.Empty;
                EmployeeGrade.Visible = true;
                EmployeeGrade.Text = string.Empty;

                SubmitGradeThesis.Visible = true;
                ThesisTitle.Visible = true;

                ThesisTitle.Text = string.Empty;

                SubmitGradeDefense.Visible = false;

                DefenseLocation.Visible = false;
                DefenseLocation.Text = string.Empty;

                SubmitGradePR.Visible = false;
                PRDate.Visible = false;
                PRContent.Visible = false;
                PRDate.Text = string.Empty;
                PRContent.Text = string.Empty;
            }
            else
            {
                GradeSid.Visible = false;
                EmployeeGrade.Visible = false;

                SubmitGradeThesis.Visible = false;
                ThesisTitle.Visible = false;
            }





        }

        protected void ShowDefenseRelated(object sender, EventArgs e)
        {
            //if thesis related is not visible make it visible 
            //else make it invisible
            if (!SubmitGradeDefense.Visible)
            {
                SubmittedLabel.Visible = false;
                GradeSid.Visible = true;
                GradeSid.Text = string.Empty;
                EmployeeGrade.Visible = true;
                EmployeeGrade.Text = string.Empty;

                SubmitGradeThesis.Visible = false;

                ThesisTitle.Visible = false;
                ThesisTitle.Text = string.Empty;

                SubmitGradeDefense.Visible = true;

                DefenseLocation.Visible = true;
                DefenseLocation.Text = string.Empty;

                SubmitGradePR.Visible = false;
                PRDate.Visible = false;
                PRContent.Visible = false;
                PRDate.Text = string.Empty;
                PRContent.Text = string.Empty;
            }
            else
            {
                GradeSid.Visible = false;
                EmployeeGrade.Visible = false;



                SubmitGradeDefense.Visible = false;
                DefenseLocation.Visible = false;
            }


        }

        protected void ShowPRRelated(object sender, EventArgs e)
        {
            //if thesis related is not visible make it visible 
            //else make it invisible
            if (!SubmitGradePR.Visible)
            {
                SubmittedLabel.Visible = false;
                GradeSid.Visible = true;
                GradeSid.Text = string.Empty;
                EmployeeGrade.Visible = true;
                EmployeeGrade.Text = string.Empty;

                SubmitGradeThesis.Visible = false;
                ThesisTitle.Visible = false;

                ThesisTitle.Text = string.Empty;

                SubmitGradeDefense.Visible = false;
                
                DefenseLocation.Visible = false;
                DefenseLocation.Text = string.Empty;

                SubmitGradePR.Visible = true;

                PRContent.Visible = true;
                PRDate.Visible = true;
                PRContent.Text = string.Empty;
                PRDate.Text = string.Empty;
            }
            else
            {
                GradeSid.Visible = false;
                EmployeeGrade.Visible = false;

                SubmitGradePR.Visible = false;
                PRDate.Visible = false;
                PRContent.Visible = false;  
            }
        }




        protected void LogOut(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("LoginPage.aspx");
        }
    }
}