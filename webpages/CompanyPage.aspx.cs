using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3.webpages
{
    public partial class CompanyPage : System.Web.UI.Page
    {

        //set connection string
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Portal"].ToString());

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

        }

        protected void AddNewEmployee(object sender, EventArgs e)
        {

            //open connection
            conn.Open();

            ShowEmployeeFields();
            if (!Username.Text.Equals(null))
            {

                //store varibles 
                String userNameIn = Username.Text.ToString();
                String PasswordIn = Password.Text.ToString();
                String EmailIn = Email.Text.ToString();
                String FieldIn = Field.Text.ToString();
                String PhoneIn = Phone.Text.ToString();


                //create proc
                SqlCommand AddEmployee = new SqlCommand("AddEmployee", conn);
                AddEmployee.CommandType = CommandType.StoredProcedure;

                //input from user
                
                SqlParameter emailNameEntered = AddEmployee.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar, 50));
                emailNameEntered.Value = Email.Text;


                //exec the Add employee procedure
            }


            //close connection
            conn.Close();

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