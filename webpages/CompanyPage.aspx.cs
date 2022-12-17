using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
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

        protected void ShowMyProfile(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.ToString()))
            {
                if (!ShowMyProfileDiv.Visible)
                {
                    ShowMyProfileDiv.Visible = true;
                }
                else
                {
                    ShowMyProfileDiv.Visible = false;
                }

                conn.Open();
                SqlCommand showMyProfile = new SqlCommand("ViewProfile", conn);
                int value = Int32.Parse(Request.QueryString["UserID"].ToString());
                showMyProfile.CommandType = CommandType.StoredProcedure;
                //input from user
                SqlParameter userIdEntered = showMyProfile.Parameters.Add(new SqlParameter("@Userr_id", SqlDbType.Int));
                userIdEntered.Value = value;

                SqlDataReader sqlReader = showMyProfile.ExecuteReader();

                while (sqlReader.Read())
                {
                    MyCompanyID.Text = $"My Company ID: {sqlReader["Company_id"].ToString()}";
                    MyUserName.Text = $"My User Name: {sqlReader["Username"].ToString()}";
                    MyPassword.Text = $"My Password: {sqlReader["Password"].ToString()}";
                    MyName.Text = $"My Name: {sqlReader["Name"].ToString()}";
                    MyEmail.Text = $"My Email: {sqlReader["Email"].ToString()}";
                    MyPhone.Text = $"My Phone Number: {sqlReader["phone_number"].ToString()}";
                    MyLocation.Text = $"My Location: {sqlReader["Location"].ToString()}";
                    MyRepEmail.Text = $"My Representative Email: {sqlReader["Representative_Email"].ToString()}";
                    MyRepName.Text = $"My Representative Name: {sqlReader["Representative_name"].ToString()}";


                }

            }


        }

        protected void ShowEmployees(object sender, EventArgs e)
        {
            if (!EmployeeTable.Visible)
            {
                EmployeeTable.Visible = true;
            }
            else
            {
                EmployeeTable.Visible = false;
            }

            /*
            string cmd = "SELECT [Staff_id], [Username], [Password], [Email], [Field], [Phone] FROM [Employee] WHERE ([Company_id] = '3') ORDER BY [Staff_id]";
            conn.Open();
            SqlDataAdapter getEmployees = new SqlDataAdapter(cmd, conn);

            DataTable DT = new DataTable();

            getEmployees.Fill(DT);

            EmployeeTable.DataSource = DT;
            EmployeeTable.DataBind();
            conn.Close();
            */

            if (!EmployeesLabelHeading.Visible)
            {
                EmployeesLabelHeading.Visible = true;
            }
            else
            {
                EmployeesLabelHeading.Visible = false;  
            }

        }
        protected void ShowStudents(object sender, EventArgs e)
        {

        }

        protected void AddNewEmployee(object sender, EventArgs e)
        {
            //open connection
            conn.Open();

            ShowEmployeeFields();
            if (!Username.Text.Equals(""))
            {
                SqlCommand AddEmployee = new SqlCommand("AddEmployee", conn);
                AddEmployee.CommandType = CommandType.StoredProcedure;

                //input from user
                SqlParameter companyIdEntered = AddEmployee.Parameters.Add(new SqlParameter("@CompanyID", SqlDbType.Int));
                companyIdEntered.Value = Int32.Parse(Request.QueryString["UserID"].ToString());
                SqlParameter emailEntered = AddEmployee.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar, 100));
                emailEntered.Value = Email.Text;
                SqlParameter nameEntered = AddEmployee.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar, 20));
                nameEntered.Value = Username.Text;
                SqlParameter phoneEntered = AddEmployee.Parameters.Add(new SqlParameter("@phone_number", SqlDbType.VarChar, 20));
                phoneEntered.Value = Phone.Text;
                SqlParameter fieldEntered = AddEmployee.Parameters.Add(new SqlParameter("@field", SqlDbType.VarChar, 25));
                fieldEntered.Value = Field.Text;

                //output of the proc
                SqlParameter staffIdOut = AddEmployee.Parameters.Add(new SqlParameter("@Staff_id", SqlDbType.Int));
                staffIdOut.Direction = ParameterDirection.Output;
                SqlParameter CompanyIdOut = AddEmployee.Parameters.Add(new SqlParameter("@Company_id_out", SqlDbType.Int));
                CompanyIdOut.Direction = ParameterDirection.Output;
                SqlParameter passwordOut = AddEmployee.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar, 10));
                passwordOut.Direction = ParameterDirection.Output;


                AddEmployee.ExecuteNonQuery();
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
                Email.Visible = false;
                EmailLabel.Visible = false;
                Field.Visible = false;
                FieldLabel.Visible = false;
                Phone.Visible = false;
                PhoneLabel.Visible = false;
            }

        }

    }
}