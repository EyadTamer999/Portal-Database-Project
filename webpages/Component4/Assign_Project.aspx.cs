using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cordinator
{
    public partial class Assign_Project : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {






          /*  if (Session["user_id"] == null)  
                Response.Redirect("LoginPage.aspx");
          */
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {

            String ConStr = WebConfigurationManager.ConnectionStrings["cordinator"].ToString();
            SqlConnection conn = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand("AssignAllStudentsToLocalProject", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
           int t =  cmd.ExecuteNonQuery();
            try
            {
                if (t == 0)
                    Response.Write("Wrong Data ");
                else
                    Response.Write("Assigned!!");

            }
            catch
            {
                Response.Write("Error");
            }
            conn.Close();
        }
    }
}