using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace fruits
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=10.112.60.43;Initial Catalog=Student;User ID=student;Password=student");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            {
                var pnn = user_name.Text;
                SqlConnection db11 = new SqlConnection();
                db11.ConnectionString = ConfigurationManager.ConnectionStrings["rashmi"].ToString();
                //try
                //{
                SqlCommand cmd2 = new SqlCommand("select * from fruitreg where user_name=@user_name", db11);
                cmd2.Parameters.AddWithValue("@user_name", user_name.Text.Trim());
                //cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                //cmd1.Parameters.AddWithValue("@F_name", Textfn.Text.Trim());
                cmd2.CommandType = System.Data.CommandType.Text;
                cmd2.Connection = db11;
                db11.Open();
                SqlDataReader dr = cmd2.ExecuteReader();
                if (dr.HasRows)
                {
                    //Response.Redirect("managehouse.aspx");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('username is already exist!!');window.location='registration.aspx';", true);

                }
                
                else
                {


                    var pn = email.Text;
                    SqlConnection db1 = new SqlConnection();
                    db1.ConnectionString = ConfigurationManager.ConnectionStrings["rashmi"].ToString();
                    //try
                    //{
                    SqlCommand cmd = new SqlCommand("select * from fruitreg where email=@email", db1);
                    cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                    //cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                    //cmd1.Parameters.AddWithValue("@F_name", Textfn.Text.Trim());
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Connection = db1;
                    db1.Open();
                    SqlDataReader drr = cmd.ExecuteReader();
                    if (drr.HasRows)
                    {
                        //Response.Redirect("managehouse.aspx");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('email is already exist!!');window.location='registration.aspx';", true);

                    }

                    else
                    {


                        var pn1 = contact_no.Text;
                        SqlConnection db2 = new SqlConnection();
                        db2.ConnectionString = ConfigurationManager.ConnectionStrings["rashmi"].ToString();
                        //try
                        //{
                        SqlCommand cmd3 = new SqlCommand("select * from fruitreg where contact_no=@contact_no", db2);
                        cmd3.Parameters.AddWithValue("@contact_no", contact_no.Text.Trim());
                        //cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                        //cmd1.Parameters.AddWithValue("@F_name", Textfn.Text.Trim());
                        cmd3.CommandType = System.Data.CommandType.Text;
                        cmd3.Connection = db2;
                        db2.Open();
                        SqlDataReader drrr = cmd3.ExecuteReader();
                        if (drrr.HasRows)
                        {
                            //Response.Redirect("managehouse.aspx");
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('pleas check your contact number!!');window.location='registration.aspx';", true);

                        }

                        else
                        {
                            drrr.Close();

                            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());
                            SqlCommand cmd1 = new SqlCommand("insert into fruitreg(First_name,Last_name,email,Address,Contact_no,User_name,Password) values(@First_name,@Last_name,@email,@Address,@Contact_no,@User_name,@Password)");
                            con.Open();
                            cmd1.Connection = con;
                            cmd1.CommandType = CommandType.Text;

                            cmd1.Parameters.AddWithValue("@First_name", first_name.Text.Trim().ToString());
                            cmd1.Parameters.AddWithValue("@Last_name", last_name.Text.Trim().ToString());
                            cmd1.Parameters.AddWithValue("@email", email.Text.Trim().ToString());
                            cmd1.Parameters.AddWithValue("@Address", address.Text.Trim().ToString());
                            cmd1.Parameters.AddWithValue("@Contact_no", contact_no.Text.Trim().ToString());
                            cmd1.Parameters.AddWithValue("@User_name", user_name.Text.Trim().ToString());
                            cmd1.Parameters.AddWithValue("@Password", password.Text.Trim().ToString());

                            int row;
                            try
                            {
                                row = cmd1.ExecuteNonQuery();
                                if (row > 0)
                                {
                                    lbltxt.Text = "<b>data sucess fully enter</b>";

                                    //Response.Write("data sucess fully enter");
                                    // Response.Redirect("login.aspx");
                                }
                                else
                                {
                                    lbltxt.Text = "<b>data sucess fully enter</b>";
                                    lbltxt.ForeColor = System.Drawing.Color.DarkSlateBlue;
                                }
                          

                                //else
                                //{
                                //    Response.Write("data not insert");
                                //}
                            }

                            catch (Exception)
                            {
                                throw;

                            }
                            finally

                            {

                                if (con.State == ConnectionState.Open)
                                    con.Close();
                            }
                            first_name.Text = string.Empty;
                            last_name.Text = string.Empty;
                            email.Text = string.Empty;
                            address.Text = string.Empty;
                            contact_no.Text = string.Empty;
                            user_name.Text = string.Empty;
                            password.Text = string.Empty;
                            cpassword.Text = string.Empty;


                        }

                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("registration.aspx");
        }
    }
}