using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cordinator
{
    public partial class Create_progress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["cordinator"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string i = TAID.Text;

            String s = SID.Text;
            int sid = int.Parse(s);
            DateTime date = DateTime.Parse(Date.Text);
            string content = Content.Text;
            SqlCommand PR = new SqlCommand("TACreatePR", conn);
            PR.CommandType = CommandType.StoredProcedure;
            PR.Parameters.Add(new SqlParameter("@TA_id", id));
            PR.Parameters.Add(new SqlParameter("@sid", sid));
            PR.Parameters.Add(new SqlParameter("@date", date));
            PR.Parameters.Add(new SqlParameter("@content", content));
            conn.Open();
            PR.ExecuteNonQuery();
            conn.Close();
        }
    }
}