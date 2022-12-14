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
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login(object sender, EventArgs e)
        {
            //set connection string and open connection
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Portal"].ToString());
            conn.Open();
 
            //creating and using the procedure of login
            SqlCommand loginProc = new SqlCommand("LOGIN",conn);
            loginProc.CommandType= CommandType.StoredProcedure;

            //input from user
            SqlParameter emailNameEntered = loginProc.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar));
            emailNameEntered.Value = Email.Text;
            SqlParameter passwordEntered = loginProc.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar));
            passwordEntered.Value = Password.Text;

            //output of the proc
            SqlParameter success = loginProc.Parameters.Add(new SqlParameter("@success", SqlDbType.Int));
            success.Direction = ParameterDirection.Output;
            SqlParameter user_id = loginProc.Parameters.Add(new SqlParameter("@user_id", SqlDbType.Int));
            user_id.Direction = ParameterDirection.Output;

            //exec the login proc
            loginProc.ExecuteNonQuery();

            String s = loginProc.Parameters["@success"].Value.ToString();


            if (string.Equals(s,"1"))
            {
                Response.Write("Access Granted! Welcome");
                InvalidLogin.Visible = false;
            }
            else
            {
                InvalidLogin.Visible = true;
            }
            conn.Close();
        }

        protected void Register(Object sender, EventArgs e)
        {

        }

    }
}