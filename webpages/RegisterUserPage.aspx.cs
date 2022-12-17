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
    public partial class RegisterUserPage : System.Web.UI.Page
    {
        //Set connection string
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Portal"].ToString());


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterUser(Object sender, EventArgs e)
        {
            if (Usertype.SelectedItem.Value.Equals(" "))
            {
                Error.Visible = true;
            }

            //clear all textboxes 
            //

            //open connection
            conn.Open();
            if (Usertype.SelectedItem.ToString().Equals("Employee"))
            {
                //Add employee method
                AddEmployee();

            }
            else
            {
                //UserRegister method
            }


            //close connection
            conn.Close();

        }


        protected void AddEmployee()
        {
            //Create Sql proc
            SqlCommand AddEmployee = new SqlCommand("AddEmployee", conn);
            AddEmployee.CommandType = CommandType.StoredProcedure;


            //input from user
            SqlParameter companyIdEntered = AddEmployee.Parameters.Add(new SqlParameter("@CompanyID", SqlDbType.Int));
            companyIdEntered.Value = Companyid.Text;
            SqlParameter emailEntered = AddEmployee.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar, 50));
            emailEntered.Value = Email.Text;
            SqlParameter nameEntered = AddEmployee.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar, 20));
            nameEntered.Value = Username.Text;
            SqlParameter phoneEntered = AddEmployee.Parameters.Add(new SqlParameter("@phone_number", SqlDbType.VarChar, 20));
            phoneEntered.Value = Password.Text;
            SqlParameter fieldEntered = AddEmployee.Parameters.Add(new SqlParameter("@field", SqlDbType.VarChar, 25));
            fieldEntered.Value = Field.Text;

            //output of the proc
            SqlParameter staffIdOut = AddEmployee.Parameters.Add(new SqlParameter("@Staff_id", SqlDbType.Int));
            staffIdOut.Direction = ParameterDirection.Output;
            SqlParameter CompanyIdOut = AddEmployee.Parameters.Add(new SqlParameter("@Company_id_out", SqlDbType.Int));
            CompanyIdOut.Direction = ParameterDirection.Output;  
            SqlParameter passwordOut = AddEmployee.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar,10));
            passwordOut.Direction = ParameterDirection.Output;


            AddEmployee.ExecuteNonQuery();
        }


        protected void Usertype_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (Usertype.SelectedItem.Value.ToString())
            {
                //check which useer type needs which field and set them to visible
                case "Student": showStudentRelated(); break;
                case "Company": showCompanyRelated(); break;
                case "EE": showUserRelated(); break;
                case "TA": showUserRelated(); break;
                case "Lecturer": showUserRelated(); break;
                case "Coordinator": showUserRelated(); break;
                case "Employee": showEmployeeRelated(); break;                
            }
        }

        public void showUserRelated()
        {
            hideStudent();
            hideCompany();
            hideEmployee();
        }

        public void showEmployeeRelated()
        {
            hideCompany();
            hideStudent();

            UsernameLabel.Text = "Name";
            Companyid.Visible = true;
            Field.Visible = true;
            CompanyidLabel.Visible = true;
            FieldLabel.Visible = true;
            Password.Visible = false;
            PasswordLabel.Visible = false;  
        }

        public void hideEmployee()
        {
            if (Companyid.Visible)
            {
                UsernameLabel.Text = "Username";
                Companyid.Visible = false;
                Field.Visible = false;
                FieldLabel.Visible = false;
                CompanyidLabel.Visible = false;
                FirstNameLabel.Visible = false;
                Password.Visible = true;
                PasswordLabel.Visible = true;
            }
        }

        protected void showCompanyRelated()
        {

            hideStudent();
            hideEmployee();
            FirstName.Visible = true;
            FirstNameLabel.Text = "Name";
            FirstNameLabel.Visible = true;
            RepName.Visible = true;
            RepEmail.Visible = true;
            RepNameLabel.Visible = true;
            RepEmailLabel.Visible = true;
            Address.Visible = true;
            AddressLabel.Visible = true;

        }

        public void hideCompany()
        {
            if (RepEmailLabel.Visible)
            {
                RepName.Visible = false;
                RepEmail.Visible = false;
                RepNameLabel.Visible = false;
                RepEmailLabel.Visible = false;
                FirstName.Visible = false;
                FirstNameLabel.Text = "First Name";
                FirstNameLabel.Visible = false;
                Address.Visible = false;
                AddressLabel.Visible = false;
            }
        }
        protected void showStudentRelated()
        {

            hideCompany();
            hideEmployee();
            FirstName.Visible = true;
            LastName.Visible = true;
            MajorCode.Visible = true;
            BirthDate.Visible = true;
            Address.Visible = true;
            Semester.Visible = true;
            GPA.Visible = true;
            FirstNameLabel.Visible = true;
            LastNameLabel.Visible = true;
            MajorCodeLabel.Visible = true;
            BirthDateLabel.Visible = true;
            AddressLabel.Visible = true;
            SemesterLabel.Visible = true;
            GPALabel.Visible = true;
        }

        public void hideStudent()
        {
            if (MajorCode.Visible)
            {
                FirstName.Visible = false;
                LastName.Visible = false;
                MajorCode.Visible = false;
                BirthDate.Visible = false;
                Address.Visible = false;
                Semester.Visible = false;
                GPA.Visible = false;
                FirstNameLabel.Visible = false;
                LastNameLabel.Visible = false;
                MajorCodeLabel.Visible = false;
                BirthDateLabel.Visible = false;
                AddressLabel.Visible = false;
                SemesterLabel.Visible = false;
                GPALabel.Visible = false;
            }
        }
    }
}