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
    public partial class WebForm8 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
           




            //else
            //{
            //    Response.Write("plz upload your image");
            //}

        }

        //protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        //{

        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            var pn = productname.Text;
            SqlConnection db1 = new SqlConnection();
            db1.ConnectionString = ConfigurationManager.ConnectionStrings["rashmi"].ToString();
            //try
            //{
            SqlCommand cmd = new SqlCommand("select * from fruitaddproduct where productname=@productname", db1);
            cmd.Parameters.AddWithValue("@productname", productname.Text.Trim());
            //cmd.Parameters.AddWithValue("@email", email.Text.Trim());
            //cmd1.Parameters.AddWithValue("@F_name", Textfn.Text.Trim());
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = db1;
            db1.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                //Response.Redirect("managehouse.aspx");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('product name is already exist!!');window.location='addproduct.aspx';", true);

            }
            else
            {
                if (f2.HasFile)
                {
                    string str = f2.FileName;
                    f2.PostedFile.SaveAs(Server.MapPath(".") + "//image//" + str);
                    string a = "~//image//" + str.ToString();

                    //cat = DropDownList1.SelectedValue.Trim().ToString();

                    con.Open();
                    SqlCommand cmd1 = con.CreateCommand();
                    cmd1.CommandType = CommandType.Text;
                    cmd1.CommandText = "";
                    //object quantity = null;
                    cmd1.CommandText = "insert into fruitaddproduct values('" + productname.Text + "','" + a.ToString() + "','" + price.Text + "','" + description.Text + "','" + quantity.Text + "','" + quantity.Text + "',0)";
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    Response.Write("upload successfully");
                }

                else
                {
                    Response.Write("plz upload your image");
                }
                //int row;
                //try
                //{

                //    row = cmd1.ExecuteNonQuery();
                //    if (row > 0)
                //    {

                //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('upload successfully');window.location='addproduct.aspx';", true);

                //    }
                //    else
                //    {
                //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('plz upload your image');window.location='addproduct.aspx';", true);

                //    }
                //}
                //catch (Exception ex)
                //{
                //    throw;
                //}
                //finally
                //{
                //    if (con.State == ConnectionState.Open)
                //        con.Close();
                //}
                //productname.Text = string.Empty;
            }
            
        }
    }
}
