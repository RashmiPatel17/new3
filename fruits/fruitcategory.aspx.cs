using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace fruits
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());
            SqlCommand cmd = new SqlCommand("insert fruitcategory(category) values(@category)");
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@category", t1.Text.Trim().ToString());
            int row;
            try
            {
                row = cmd.ExecuteNonQuery();
                if (row > 0)
                {
                    Response.Write("You have successfully added");
                    Response.Redirect("addproduct.aspx");
                }
                else
                {
                    Response.Write("plz add category");
                }


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
        }
    }
}