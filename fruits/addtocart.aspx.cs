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
    public partial class WebForm14 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=10.112.60.43;Initial Catalog=Student;User ID=student;Password=student");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt_6 = new DataTable();
                DataRow dr;
                dt_6.Columns.Add("sno");
                dt_6.Columns.Add("productid");
                dt_6.Columns.Add("productname");
                dt_6.Columns.Add("productimage");
                dt_6.Columns.Add("price");
                dt_6.Columns.Add("quantity");
                dt_6.Columns.Add("description");
                dt_6.Columns.Add("totalprice");

                if (Request.QueryString["id"] != null)
                {
                    if (Session["addtocart"] == null)
                    {

                        dr = dt_6.NewRow();
                        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());

                        String myquery = "select * from fruitaddproduct where productid =" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = con;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = 1;
                        dr["productid"] = ds.Tables[0].Rows[0]["productid"].ToString();
                        dr["productimage"] = ds.Tables[0].Rows[0]["productimage"].ToString();

                        dr["productname"] = ds.Tables[0].Rows[0]["productname"].ToString();
                        dr["description"] = ds.Tables[0].Rows[0]["description"].ToString();
                        dr["price"] = ds.Tables[0].Rows[0]["price"].ToString();
                        dr["quantity"] = Request.QueryString["quantity"];
                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["price"].ToString());

                        int quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["totalprice"] = totalprice;

                        dt_6.Rows.Add(dr);
                        GridView1.DataSource = dt_6;
                        GridView1.DataBind();

                        Session["addtocart"] = dt_6;
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("addtocart.aspx");

                    }

                    else
                    {

                        dt_6 = (DataTable)Session["addtocart"];
                        int sr;
                        sr = dt_6.Rows.Count;

                        dr = dt_6.NewRow();
                        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());
                        String myquery = "select * from fruitaddproduct where productid=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = con;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = sr + 1;
                        dr["productid"] = ds.Tables[0].Rows[0]["productid"].ToString();
                        dr["productname"] = ds.Tables[0].Rows[0]["productname"].ToString();
                        dr["productimage"] = ds.Tables[0].Rows[0]["productimage"].ToString();
                        dr["description"] = ds.Tables[0].Rows[0]["description"].ToString();
                        dr["quantity"] = Request.QueryString["quantity"];
                        dr["price"] = ds.Tables[0].Rows[0]["price"].ToString();
                        int price = Convert.ToInt16(ds.Tables[0].Rows[0]["price"].ToString());
                        int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["totalprice"] = totalprice;
                        dt_6.Rows.Add(dr);
                        GridView1.DataSource = dt_6;
                        GridView1.DataBind();

                        Session["addtocart"] = dt_6;
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("addtocart.aspx");

                    }
                }
                else
                {
                    dt_6 = (DataTable)Session["addtocart"];
                    GridView1.DataSource = dt_6;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();

                    }

                    //Label2.Text = GridView1.Rows.Count.ToString();

                }
                DataTable dt = new DataTable();
                dt = (DataTable)Session["addtocart"];
                if (dt != null)
                {
                    Button1.Visible = true;
                    HyperLink1.Visible = false;
                    HyperLink2.Visible = true;
                   
                }
                else
                {
                    Button1.Visible = false;
                    HyperLink1.Visible = true;
                    HyperLink2.Visible = false;
                }

            }
        }

        private object grandtotal()
        {
            DataTable dt_6 = new DataTable();
            dt_6 = (DataTable)Session["addtocart"];
            int nrow = dt_6.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt_6.Rows[i]["totalprice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["addtocart"];


            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    //Label1.Text = "Item Has Been Deleted From Shopping Cart";
                    break;

                }
            }

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }

            Session["addtocart"] = dt;
            Response.Redirect("addtocart.aspx");
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("placeorder.aspx");
        }
    }
    
}