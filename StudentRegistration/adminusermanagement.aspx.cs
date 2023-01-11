using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentRegistration
{
    public partial class adminusermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //profile button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getStudentByID();

        }

        //active button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updateStudentStatusByID("active");
        }

        //pending button
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateStudentStatusByID("pending");
        }

        //deactive button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            updateStudentStatusByID("deactive");
        }

        //delete button
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteStudentById();
        }







        //user defined function

        //for get data using registration number
        void getStudentByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from student_master_tbl where registration_number='" + TextBox1.Text.Trim() + "'", con);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(0).ToString();
                        TextBox7.Text = dr.GetValue(10).ToString();
                        TextBox8.Text = dr.GetValue(7).ToString();
                        TextBox3.Text = dr.GetValue(2).ToString();
                        TextBox4.Text = dr.GetValue(4).ToString();
                        TextBox5.Text = dr.GetValue(3).ToString();
                        TextBox6.Text = dr.GetValue(5).ToString();



                    }
                    


                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //update status

        void updateStudentStatusByID(string status)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE student_master_tbl SET account_status='"+status+ "' WHERE registration_number='"+TextBox1.Text.Trim() +"' ", con);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Student Status Updated');</script>");
                

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        //delete student

        void deleteStudentById()
        {
            if(TextBox1.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Registration number cannot be blank');</script>");
            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM student_master_tbl WHERE registration_number='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('student deleted successfully');</script>");
                    clearForm();
                    GridView1.DataBind();


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }

            
        }

        //clear form function

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
        }



    }
}