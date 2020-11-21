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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["addtocart"];
            if (dt != null)
            {

                Labelitem.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Labelitem.Text = "0";
            }


            if (Session["admin"] != null)
            {
                home.Visible = false;
                pro.Visible = false;
                product1.Visible = false;
                product.Visible = false;
                contact.Visible = false;
                reg.Visible = false;
                login.Visible = false;
                home2.Visible = true;
                //home1.Visible = true;
                lnk1.Visible = true;
                lnk2.Visible = true;
                logout.Visible = true;
                regdetails.Visible = true;
                //status.Visible = true;
                report.Visible = true;
                order.Visible = true;
            }
            if (Session["user"] != null)
            {


                login.Visible = false;
                logout.Visible = true;
                reg.Visible = false;
                u_n.Visible = true;
                product1.Visible = false;
                product.Visible = true;
                pro.Visible = true;
                regdetails.Visible = false;
                //status.Visible = false;
                report.Visible = false;
                order.Visible = false;



            }
            if (Session["home"] != null)
            {
                product.Visible = false;
                product1.Visible = true;
                pro.Visible = false;



            }





        }
    }
}