using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3.webpages
{
    public partial class CompanyPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowEmployees(object sender, EventArgs e)
        {
            if (!EmployeesLabelHeading.Visible)
            {
                EmployeesLabelHeading.Visible = true;
            }
            else
            {
                EmployeesLabelHeading.Visible = false;
            }

            if (!this.IsPostBack)
            {
                System.Data.DataTable dt = new System.Data.DataTable();
                dt.Columns.AddRange(new System.Data.DataColumn[6] {
            new System.Data.DataColumn("EmployeeID"),
            new System.Data.DataColumn("UserName"),
            new System.Data.DataColumn("Password"),
            new System.Data.DataColumn("Field"),
            new System.Data.DataColumn("Email"),
            new System.Data.DataColumn("Phone") });
                dt.Rows.Add(1, "John Hammond", "United States");
                dt.Rows.Add(2, "Mudassar Khan", "India");
                dt.Rows.Add(3, "Suzanne Mathews", "France");
                dt.Rows.Add(4, "Robert Schidner", "Russia");
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }


        }

        protected void AddNewEmployee(object sender, EventArgs e)
        {
            ShowEmployeeFields();

        }

        protected void ShowEmployeeFields()
        {
            if (!Username.Visible)
            {
                Username.Visible = true;
                UsernameLabel.Visible = true;
                Password.Visible = true;
                PasswordLabel.Visible = true;
                Email.Visible = true;
                EmailLabel.Visible = true;
                Field.Visible = true;
                FieldLabel.Visible = true;
                Phone.Visible = true;
                PhoneLabel.Visible = true;
            }
            else
            {
                Username.Visible = false;
                UsernameLabel.Visible = false;
                Password.Visible = false;
                PasswordLabel.Visible = false;
                Email.Visible = false;
                EmailLabel.Visible = false;
                Field.Visible = false;
                FieldLabel.Visible = false;
                Phone.Visible = false;
                PhoneLabel.Visible = false;
            }

        }

        protected void ShowStudents(object sender, EventArgs e)
        {

        }

    }
}