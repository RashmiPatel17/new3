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
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (Session["User"] == null)

               Response.Redirect("login.aspx");

            else
            {

                DropDownList qty = e.Item.FindControl("ddqty") as DropDownList;
            
                int value = Convert.ToInt32(qty.SelectedItem.Value);

                if (e.CommandName == "addtocart")
                {
                    Response.Redirect("addtocart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + value);
                }
            }

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Label quantity = e.Item.FindControl("quantity") as Label;
            Label msg = e.Item.FindControl("lblmsg") as Label;
            DropDownList ddl = e.Item.FindControl("ddqty") as DropDownList;
            Button btn = e.Item.FindControl("Button1") as Button;
            DataSet ds = new DataSet();
            DataTable tableqty = new DataTable("tblqty");
            tableqty.Columns.Add("quantity");
            DataRow dataRow = tableqty.NewRow();
            int cnt = 1;
            int qt = Convert.ToInt32(quantity.Text.ToString());
            while (qt != 0)
            {
                dataRow = tableqty.NewRow();
                dataRow["quantity"] = cnt.ToString();
                tableqty.Rows.Add(dataRow);
                cnt = cnt + 1;
                qt = qt - 1;
            }
            ds.Tables.Add(tableqty);
            ddl.DataSource = ds.Tables[0];
            ddl.DataTextField = "quantity";
            ddl.DataValueField = "quantity";
            ddl.DataBind();

            if (quantity.Text == "0")
            {
                msg.Text = "Out Of Stock";
                btn.Visible = false;
                //ddl.Visible = false;
            }
        }
    }
}