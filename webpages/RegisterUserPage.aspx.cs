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
            switch(Usertype.SelectedItem.Value.ToString())
            {
                //check which useer type needs which field and set them to visible
                case "Student": ShowStudentRelated(); break;
               /* case "Company": ShowCompanyRelated(); break;
                case "EE": ShowEERelated(); break;
                case "TA": ShowTARelated(); break;
               */ 



            }
        }

        protected void ShowStudentRelated()
        {

        }

    }
}