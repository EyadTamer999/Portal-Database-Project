using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cordinator
{
    public partial class ViewRecommendation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder t = new StringBuilder();
            String ConStr = WebConfigurationManager.ConnectionStrings["cordinator"].ToString();
            SqlConnection conn = new SqlConnection(ConStr);
            conn.Open();

           

            String s = TextBox1.Text;
            int lid = int.Parse(s);
            SqlCommand viewreco = new SqlCommand("ViewRecommendation", conn);
            viewreco.Parameters.Add(new SqlParameter("@lecture_id", lid));
            viewreco.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataReader rdr = viewreco.ExecuteReader(System.Data.CommandBehavior.CloseConnection);


            t.Append("<table border = '1'>");
            t.Append("<tr><th>Lecturer_Id</th><th>EE_id</th><th>PCode</th>");
            t.Append("</tr>");
            while (rdr.Read())
            {
                t.Append("<tr>");
                t.Append("<tr>");

                t.Append("<td>" + rdr[0] + "</td>");

                t.Append("<td>" + rdr[1] + "</td>");

                t.Append("<td>" + rdr[2] + "</td>");



                t.Append("</tr");
                t.Append("</tr");
            }
            t.Append("/table");
            this.Controls.Add(new Literal { Text = t.ToString() });
            rdr.Close();

        }
    }
}