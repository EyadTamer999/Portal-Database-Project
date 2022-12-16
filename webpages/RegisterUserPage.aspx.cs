using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3.webpages
{
    public partial class RegisterUserPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterUser(Object sender, EventArgs e)
        {

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

            Companyid.Visible = true;
            Field.Visible = true;
            CompanyidLabel.Visible = true;
            FieldLabel.Visible = true;
        }

        public void hideEmployee()
        {
            if (Companyid.Visible)
            {
                Companyid.Visible = false;
                Field.Visible = false;
                CompanyidLabel.Visible = false;
                FirstNameLabel.Visible = false;
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