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
                UserRegister();
            }

            //close connection
            conn.Close();

        }

        protected void UserRegister()
        {

            SqlCommand RegisterUser = new SqlCommand("UserRegister", conn);
            RegisterUser.CommandType = CommandType.StoredProcedure;

            //input
            SqlParameter UsertypeIn = RegisterUser.Parameters.Add(new SqlParameter("@usertype", SqlDbType.VarChar, 20));
            UsertypeIn.Value = Usertype.SelectedItem.Value;
            SqlParameter UserNameIn = RegisterUser.Parameters.Add(new SqlParameter("@userName", SqlDbType.VarChar, 20));
            UserNameIn.Value = Username.Text;
            SqlParameter phoneEntered = RegisterUser.Parameters.Add(new SqlParameter("@phone_number", SqlDbType.VarChar, 20));
            phoneEntered.Value = Password.Text;
            SqlParameter emailEntered = RegisterUser.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar, 100));
            emailEntered.Value = Email.Text;
            SqlParameter PasswordIn = RegisterUser.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar, 10));
            PasswordIn.Value = Password.Text;


            //output
            SqlParameter UserIdOut = RegisterUser.Parameters.Add(new SqlParameter("@user_id", SqlDbType.Int));
            UserIdOut.Direction = ParameterDirection.Output;

            //student stuff
            SqlParameter FNameIn = RegisterUser.Parameters.Add(new SqlParameter("@first_name", SqlDbType.VarChar, 20));
            FNameIn.Value = FirstName.Text;
            SqlParameter LNameIn = RegisterUser.Parameters.Add(new SqlParameter("@last_name", SqlDbType.VarChar, 20));
            LNameIn.Value = LastName.Text;
            SqlParameter MCodeIn = RegisterUser.Parameters.Add(new SqlParameter("@major_code", SqlDbType.VarChar, 10));
            MCodeIn.Value = MajorCode.Text;
            SqlParameter FCodeIn = RegisterUser.Parameters.Add(new SqlParameter("@faculty_code", SqlDbType.VarChar, 10));
            FCodeIn.Value = FacultyCode.Text;
            SqlParameter dobIn = RegisterUser.Parameters.Add(new SqlParameter("@birth_date", SqlDbType.DateTime));
            dobIn.Value = BirthDate.Text;
            SqlParameter AddressIn = RegisterUser.Parameters.Add(new SqlParameter("@address", SqlDbType.VarChar, 100));
            AddressIn.Value = Address.Text;
            SqlParameter semesterIn = RegisterUser.Parameters.Add(new SqlParameter("@semester", SqlDbType.Int));
            semesterIn.Value = Semester.Text;
            SqlParameter gpaIn = RegisterUser.Parameters.Add(new SqlParameter("@GPA", SqlDbType.Decimal));
            gpaIn.Value =  decimal.Parse(GPA.Text.ToString());

            //company stuff
            SqlParameter CompanyNameIn = RegisterUser.Parameters.Add(new SqlParameter("@company_name", SqlDbType.VarChar, 20));
            CompanyNameIn.Value = FirstName.Text;
            SqlParameter LocationIn = RegisterUser.Parameters.Add(new SqlParameter("@country_of_residence", SqlDbType.VarChar, 10));
            LocationIn.Value = Address.Text;
            SqlParameter RepEmailIn = RegisterUser.Parameters.Add(new SqlParameter("@representative_email", SqlDbType.VarChar, 100));
            RepEmailIn.Value = RepEmail.Text;
            SqlParameter RepNameIn = RegisterUser.Parameters.Add(new SqlParameter("@representative_name", SqlDbType.VarChar, 20));
            RepNameIn.Value = RepName.Text;

            RegisterUser.ExecuteNonQuery();

        }


        protected void AddEmployee()
        {
            //Create Sql proc
            SqlCommand AddEmployee = new SqlCommand("AddEmployee", conn);
            AddEmployee.CommandType = CommandType.StoredProcedure;


            //input from user
            SqlParameter companyIdEntered = AddEmployee.Parameters.Add(new SqlParameter("@CompanyID", SqlDbType.Int));
            companyIdEntered.Value = Companyid.Text;
            SqlParameter emailEntered = AddEmployee.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar, 100));
            emailEntered.Value = Email.Text;
            SqlParameter nameEntered = AddEmployee.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar, 20));
            nameEntered.Value = Username.Text;
            SqlParameter phoneEntered = AddEmployee.Parameters.Add(new SqlParameter("@phone_number", SqlDbType.VarChar, 20));
            phoneEntered.Value = PhoneNumber.Text;
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
            FacultyCode.Visible = true;
            FacultyCodeLabel.Visible = true;
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
                FacultyCode.Visible = false;
                FacultyCodeLabel.Visible = false;
            }
        }
    }
}