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
            String userNameEntered = Username.Text;
            String passwordEntered = Password.Text;

            //SqlCommand loginProc = new SqlCommand("", check lab8 video min 8:37 
        }

        protected void Register(Object sender, EventArgs e)
        {

        }

    }
}