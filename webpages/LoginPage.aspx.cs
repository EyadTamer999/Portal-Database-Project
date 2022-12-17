using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace WebApplication3.webpages
{
    public partial class LoginPage : System.Web.UI.Page
    {
        //Set connection string
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Portal"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login(object sender, EventArgs e)
        {
            //open connection
            conn.Open();

            //creating and using the procedure of login
            SqlCommand loginProc = new SqlCommand("LOGIN", conn);
            loginProc.CommandType = CommandType.StoredProcedure;

            //input from user
            SqlParameter emailNameEntered = loginProc.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar, 100));
            emailNameEntered.Value = Email.Text;
            SqlParameter passwordEntered = loginProc.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar, 10));
            passwordEntered.Value = Password.Text;

            //output of the proc
            SqlParameter success = loginProc.Parameters.Add(new SqlParameter("@success", SqlDbType.Int));
            success.Direction = ParameterDirection.Output;
            SqlParameter user_id = loginProc.Parameters.Add(new SqlParameter("@user_id", SqlDbType.Int));
            user_id.Direction = ParameterDirection.Output;

            //exec the login proc
            loginProc.ExecuteNonQuery();

            if (string.Equals(loginProc.Parameters["@success"].Value.ToString(), "1"))
            {
                InvalidLogin.Visible = false;
                switch (getUserType())
                {
                    case "Student": Response.Redirect("StudentPage.aspx?UserID=" + Server.UrlEncode(loginProc.Parameters["@user_id"].Value.ToString())); break;
                    case "Company": Response.Redirect("CompanyPage.aspx?UserID=" + Server.UrlEncode(loginProc.Parameters["@user_id"].Value.ToString())); break;
                    case "Lecturer": Response.Redirect("LecturerPage.aspx?UserID=" + Server.UrlEncode(loginProc.Parameters["@user_id"].Value.ToString())); break;
                    case "Teaching Assistant": Response.Redirect("TAPage.aspx?UserID=" + Server.UrlEncode(loginProc.Parameters["@user_id"].Value.ToString())); break;
                    case "External examiner": Response.Redirect("EEPage.aspx?UserID=" + Server.UrlEncode(loginProc.Parameters["@user_id"].Value.ToString())); break;
                    case "Coordinator": Response.Redirect("CoordinatorPage.aspx?UserID=" + Server.UrlEncode(loginProc.Parameters["@user_id"].Value.ToString())); break;
                    case "Employee": Response.Redirect("EmployeePage.aspx?UserID=" + Server.UrlEncode(loginProc.Parameters["@user_id"].Value.ToString())); break;
                    case "0": InvalidLogin.Text = "Unkown User"; InvalidLogin.Visible = true; break;
                }

            }
            else
            {
                InvalidLogin.Visible = true;
                InvalidLogin.Text = "Invalid Email or Password!";
            }

            //close connection
            conn.Close();
        }

        protected void Register(Object sender, EventArgs e)
        {
            Response.Redirect("RegisterUserPage.aspx");
        }

        protected String getUserType()
        {

            //creating and using the procedure of login
            SqlCommand getUserProc = new SqlCommand("UserType", conn);
            getUserProc.CommandType = CommandType.StoredProcedure;

            //input from user
            SqlParameter emailNameEntered = getUserProc.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar, 50));
            emailNameEntered.Value = Email.Text;

            //output of the proc
            SqlParameter role = getUserProc.Parameters.Add(new SqlParameter("@role", SqlDbType.VarChar, 20));
            role.Direction = ParameterDirection.Output;

            //exec the login proc
            getUserProc.ExecuteNonQuery();

            //return user type as string
            return getUserProc.Parameters["@role"].Value.ToString();
        }

    }
}