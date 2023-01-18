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
    public partial class ScheduleDefence : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["cordinator"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand SD = new SqlCommand("ScheduleDefense", conn);
            SD.CommandType = CommandType.StoredProcedure;
            SD.Parameters.Add(new SqlParameter("@sid ", SID.Value));
            SD.Parameters.Add(new SqlParameter("@date ", DATE.Value));
            SD.Parameters.Add(new SqlParameter("@location ", LOCATION.Value));
            SD.Parameters.Add(new SqlParameter("@time ", TIME.Value));
        }
    }
}
