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
    public partial class WebForm15 : System.Web.UI.Page
    {
        static Boolean orderconfirm;
        static int quantityavailable;
        static Boolean availabledesignid = false;

        SqlConnection con = new SqlConnection("Data Source=10.112.60.43;Initial Catalog=Student;User ID=student;Password=student");
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "select *from fruitreg where user_name=@uname";
            cmd3.Parameters.AddWithValue("@uname", Session["user"].ToString());

            cmd3.Connection = con;
            con.Open();
            SqlDataReader dr3 = cmd3.ExecuteReader();
            while (dr3.Read())
            {
                TextBox1.Text = dr3["first_name"].ToString() + " " + dr3["last_name"].ToString();
                TextBox2.Text = dr3["address"].ToString();
                //TextBox3.Text = dr3["txtcity"].ToString();
                TextBox4.Text = dr3["email"].ToString();
                TextBox5.Text = dr3["contact_no"].ToString();
            }

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

                if (Request.QueryString["productid"] != null)
                {
                    if (Session["addtocart"] == null)
                    {

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


            }
            Label2.Text = DateTime.Now.ToShortDateString();
            findorderid();
        }
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["addtocart"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }
        public void findorderid()
        {
            String pass = "abcdefghijklmnopqrstuvwxyz123456789";
            Random r = new Random();
            char[] mypass = new char[5];
            for (int i = 0; i < 5; i++)
            {
                mypass[i] = pass[(int)(35 * r.NextDouble())];

            }
            String orderid;
            orderid = "Order" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(mypass);

            Label1.Text = orderid;


        }
        public void saveaddress()
        {
            String updatepass = "insert into fruitaddress(orderid,fullname,address,email,contactno) values('" + Label1.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox4.Text + "'," + TextBox5.Text + ")";
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatepass;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //DataTable dt;
            //dt = (DataTable)Session["addtocart"];



            //for (int i = 0; i <= dt.Rows.Count - 1; i++)
            //{

            //    String updatepass = "insert into fruitorderdetails(orderid,sno,productid,productname,price,quantity,dateoforder) values('" + Label1.Text + "'," + dt.Rows[i]["sno"] + "," + dt.Rows[i]["productid"] + ",'" + dt.Rows[i]["productname"] + "'," + dt.Rows[i]["price"] + "," + dt.Rows[i]["quantity"] + ",'" + Label2.Text + "')";
            //    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());
            //    con.Open();
            //    SqlCommand cmd = new SqlCommand();
            //    cmd.CommandText = updatepass;
            //    cmd.Connection = con;
            //    cmd.ExecuteNonQuery();
            //    con.Close();

            //}
            //saveaddress();
            //Response.Redirect("ordersuccessfull.aspx");
            DataTable dt;
            dt = (DataTable)Session["addtocart"];



            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                String updatepass = "insert into fruitorderdetails(orderid,sno,productid,productname,price,quantity,dateoforder) values('" + Label1.Text + "'," + dt.Rows[i]["sno"] + "," + dt.Rows[i]["productid"] + ",'" + dt.Rows[i]["productname"] + "'," + dt.Rows[i]["price"] + "," + dt.Rows[i]["quantity"] + ",'" + Label2.Text + "')";

                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = updatepass;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();


                con.Close();

            }
            saveaddress();

            DataTable dt1;
            dt1 = (DataTable)Session["addtocart"];
            int designid;
            int quantity;
            foreach (DataRow row in dt1.Rows)
            {
                designid = Convert.ToInt16(row["productid"].ToString());
                quantity = Convert.ToInt16(row["quantity"].ToString());
                checkavailability(designid, quantity);
                if (orderconfirm == false)
                {
                    break;
                }
            }
            if (orderconfirm == true)
            {
                foreach (DataRow row in dt1.Rows)
                {
                    designid = Convert.ToInt16(row["productid"].ToString());
                    quantity = Convert.ToInt16(row["quantity"].ToString());
                    updatestock(designid, quantity);
                }

            }
            Session["addtocart"] = null;
            Response.Redirect("showbill.aspx?orderid=" + Label1.Text);
        }
        private void checkavailability(int designid, int numbersold)
        {
            int pavailable = 0;
            int psold = 0;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());
            String myquery = "Select * from fruitaddproduct where productid=" + designid;

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                pavailable = Convert.ToInt16(ds.Tables[0].Rows[0]["available"].ToString());

                psold = Convert.ToInt16(ds.Tables[0].Rows[0]["soldout"].ToString());

            }
            con.Close();

            if (pavailable >= numbersold)
            {
                orderconfirm = true;
            }
            else
            {
                orderconfirm = false;
                //Label3.Text = "Design ID " + designid + " Quantity " + pavailable + " only Available. Order Could Not Be Placed";
            }
        }
        private void updatestock(int designid, int numbersold)
        {
            int pavailable = 0;
            int psold = 0;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());
            String myquery = "Select * from fruitaddproduct where productid=" + designid;

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                pavailable = Convert.ToInt16(ds.Tables[0].Rows[0]["available"].ToString());
                psold = Convert.ToInt16(ds.Tables[0].Rows[0]["soldout"].ToString());

            }
            con.Close();

            int newavailable;
            int newsold;
            if (pavailable >= numbersold)
            {
                newavailable = pavailable - numbersold;
                newsold = psold + numbersold;
                String updatedata = "Update fruitaddproduct set available=" + newavailable + ", soldout=" + newsold + " where productid=" + designid;

                con.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = updatedata;
                cmd1.Connection = con;
                cmd1.ExecuteNonQuery();

            }
            else
            {
                //Label3.Text = "Design ID " + designid + " Quantity " + pavailable + " only Available. Order Could Not Be Placed";

            }


        }

    }
}

