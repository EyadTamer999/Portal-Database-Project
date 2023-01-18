using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cordinator
{
    public partial class AssignTAs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            String ConStr = WebConfigurationManager.ConnectionStrings["cordinator"].ToString();
            SqlConnection conn = new SqlConnection(ConStr);
            SqlCommand cmd = new SqlCommand("AssignTAs", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            cmd.Parameters.Add(new SqlParameter("@coordinator_id", TextBox1.Text));
            cmd.Parameters.Add(new SqlParameter("@TA_id", TextBox2.Text));
            cmd.Parameters.Add(new SqlParameter("@proj_code", TextBox3.Text));
            int t = cmd.ExecuteNonQuery();
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