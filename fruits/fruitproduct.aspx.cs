using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fruits
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName== "viewdetails")
            {
                Response.Redirect("viewdetails.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //protected void Button3_Click(object sender, EventArgs e)
        //{
        //    if (TextBox1.Text != "")
        //    {
        //        DataList1.DataSourceID = null;
        //        DataList1.DataSource = SqlDataSource2;
        //        DataList1.DataBind();
        //    }
        //}

        //protected void LinkButton1_Click(object sender, EventArgs e)
        //{
        //    DataList1.DataSourceID = null;
        //    DataList1.DataSource = SqlDataSource1;
        //    DataList1.DataBind();
        //}
    }
}