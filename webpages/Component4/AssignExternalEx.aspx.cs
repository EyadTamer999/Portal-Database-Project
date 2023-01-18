using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace cordinator
{
    public partial class AssignExternalEx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            String ConStr = WebConfigurationManager.ConnectionStrings["cordinator"].ToString();
            SqlConnection conn = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand("AssignEE", conn);
            cmd.Parameters.Add(new SqlParameter("@coordinator_id", Text2.Value));
            cmd.Parameters.Add(new SqlParameter("@EE_id", Text1.Value));
            cmd.Parameters.Add(new SqlParameter("@proj_code",Text3.Value));
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            try
            {
                int t = cmd.ExecuteNonQuery();

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