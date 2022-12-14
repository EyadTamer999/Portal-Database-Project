using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3.webpages
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //input from user
            String emailNameEntered = Email.Text;
            String passwordEntered = Password.Text;

            //creating and using the procedure of login
            SqlCommand loginProc = new SqlCommand("LOGIN",conn);  
            loginProc.Parameters.AddWithValue("@email", emailNameEntered);
            loginProc.Parameters.AddWithValue("@password", passwordEntered);

            //output of the proc
            SqlParameter success = loginProc.Parameters.Add("@success", SqlDbType.Bit);
            SqlParameter user_id = loginProc.Parameters.Add("@user_id", SqlDbType.Int);

            success.Direction = ParameterDirection.Output;
            user_id.Direction = ParameterDirection.Output;

            //exec the login proc
            conn.Open();
            loginProc.ExecuteNonQuery();
            conn.Close();

            if(success.Value.ToString() == "1")
            {
                Response.Write("Access Granted! Welcome");
            }
            else
            {
                Response.Write("Invalid Email or Password");
            }

        }

        protected void Register(Object sender, EventArgs e)
        {

        }

    }
}