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
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Portal"].ToString());

            //input from user
            String emailNameEntered = Email.Text;
            String passwordEntered = Password.Text;

            //creating and using the procedure of login
            SqlCommand loginProc = new SqlCommand("LOGIN",conn);  //check lab8 video min 8:37 
            loginProc.Parameters.Add("@email", emailNameEntered);
            loginProc.Parameters.Add("@password", passwordEntered);
        }

        protected void Register(Object sender, EventArgs e)
        {

        }

    }
}