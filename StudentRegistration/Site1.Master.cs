using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentRegistration
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LinkButton1.Visible = true; // student login link button
                    LinkButton2.Visible = false; // non-permission to student

                    LinkButton3.Visible = false; //logout link button
                    LinkButton7.Visible = false; //hello user link button

                    LinkButton6.Visible = true; //admin login
                    LinkButton4.Visible = false; //student registration
                    LinkButton10.Visible = false; //student mngmnt

                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; // student login link button
                    LinkButton2.Visible = false; // non-permission to student

                    LinkButton3.Visible = true; //logout link button
                    LinkButton7.Visible = true; //hello user link button
                    LinkButton7.Text = "Hello " + Session["username"].ToString();

                    LinkButton6.Visible = true; //admin login
                    LinkButton4.Visible = false; //student registration
                    LinkButton10.Visible = false; //student mngmnt

                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false; // student login link button
                    LinkButton2.Visible = false; // non-permission to student

                    LinkButton3.Visible = true; //logout link button
                    LinkButton7.Visible = true; //hello user link button
                    LinkButton7.Text = "Hello Admin";

                    LinkButton6.Visible = false; //admin login
                    LinkButton4.Visible = true; //student registration
                    LinkButton10.Visible = true; //student mngmnt

                }

            }
            catch(Exception ex)
            {

            }
            
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminusermanagement.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }

        //logout
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true; // student login link button
            LinkButton2.Visible = false; // non-permission to student

            LinkButton3.Visible = false; //logout link button
            LinkButton7.Visible = false; //hello user link button

            LinkButton6.Visible = true; //admin login
            LinkButton4.Visible = false; //student registration
            LinkButton10.Visible = false; //student mngmnt
        }
    }
}