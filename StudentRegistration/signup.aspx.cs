using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.EnterpriseServices;
using System.Net;

namespace StudentRegistration
{
    public partial class signup : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //registration button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('Testing');</script>");

            if (checkstudentexists())
            {
                Response.Write("<script>alert('Student Already Exist !!');</script>");
            }
            else
            {
                string name = TextBox3.Text.Trim();
                string regno = TextBox4.Text.Trim();
                string contact = TextBox5.Text.Trim();
                string nic = TextBox6.Text.Trim();
                string email = TextBox7.Text.Trim();
                string address = TextBox8.Text.Trim();
                string username = TextBox11.Text.Trim();
                string password = TextBox12.Text.Trim();
                
                if (string.IsNullOrEmpty(name))
                {
                    Response.Write("<script>alert('Name is empty');</script>");
                }
                else if(string.IsNullOrEmpty(regno))
                {
                    Response.Write("<script>alert('Registration number is empty');</script>");
                }
                else if (string.IsNullOrEmpty(contact))
                {
                    Response.Write("<script>alert('Contact number is empty');</script>");     
                }
                else if (string.IsNullOrEmpty(nic))
                {
                    Response.Write("<script>alert('NIC is empty');</script>");
                }
                else if (string.IsNullOrEmpty(email))
                {
                    Response.Write("<script>alert('Email is empty');</script>");
                }
                else if (string.IsNullOrEmpty(address))
                {
                    Response.Write("<script>alert('Address is empty');</script>");
                }
                else if (string.IsNullOrEmpty(username))
                {
                    Response.Write("<script>alert('Username is empty');</script>");
                }
                else if (string.IsNullOrEmpty(password))
                {
                    Response.Write("<script>alert('Password is empty');</script>");
                }
                else
                {
                    studentregister();
                }
                
            }

        }

        //user defined method

        //check student exsisting or not
        bool checkstudentexists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from student_master_tbl where username='"+TextBox11.Text.Trim()+"';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                { 
                    return false;
                }

              
                con.Close();
                Response.Write("<script>alert('Student Registration Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }


            
        }

        //student registration
        void studentregister()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into student_master_tbl(full_name,registration_number,contact,nic,email,address,gender,bod,username,password,account_status) values(@full_name,@registration_number,@contact,@nic,@email,@address,@gender,@bod,@username,@password,@account_status)", con);

                cmd.Parameters.AddWithValue("@full_name", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@registration_number", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@nic", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@bod", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@username", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Student Registration Successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}