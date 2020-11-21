using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.IO;


namespace fruits
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());
        string comp, emailid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                con.Open();
                //SqlCommand md = new SqlCommand("select * from doctor_reg201 where Office='" + Label1.Text + "' and status='pending'", conn);
                SqlCommand md = new SqlCommand("select * from fruitreg  where status=0", con);
                SqlDataReader dr = md.ExecuteReader();

                GridView1.DataSource = dr;
                GridView1.CssClass = "table table-bordered table-highlight";

                GridView1.DataBind();
                con.Close();
            }
            if (Request.QueryString["id"] != null)
            {
                var id = Int32.Parse(Request.QueryString["id"]);
                SqlCommand cmd1 = new SqlCommand("Update fruitreg set status = 1 where Id=@Id", con);
                con.Open();
                cmd1.Parameters.AddWithValue("@Id", id);
                cmd1.ExecuteNonQuery();
                con.Close();
                try
                {
                    SqlCommand cmd = new SqlCommand("select * from fruitreg where Id=@user_name");
                    cmd.Parameters.AddWithValue("@user_name", id);
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dar = cmd.ExecuteReader();
                    if (dar.Read())
                    {
                        comp = dar["user_name"].ToString();
                        emailid = dar["email"].ToString();
                    }
                    MailMessage mail = new MailMessage();
                    mail.CC.Add(emailid);
                    mail.From = new MailAddress("patelrashmi17899@gmail.com");
                    mail.Subject = " Registration Successfully...";
                    string Body = "Your email ID " + emailid + "  has been registered successfully.Welcome TO my site....";
                    mail.Body = Body;
                    mail.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Port = 587;
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new System.Net.NetworkCredential("patelrashmi17899@gmail.com", "8469510509");
                    smtp.Send(mail);
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Accepted & Email Sent.');", true);
                    //  Response.Redirect("login.aspx");
                    //Session["log"] = 1;
                }

                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    Response.Write("message sent");
                    con.Close();
                    //GridView2.Visible = false;
                }
            }
            if (Request.QueryString["rid"] != null)
            {
                var rid = Int32.Parse(Request.QueryString["rid"]);
                SqlCommand cmd = new SqlCommand("delete from fruitreg where Id=@rid", con);
                con.Open();
                cmd.Parameters.AddWithValue("@rid", rid);

                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert(' Rejected.');", true);
                Response.Redirect("userregstatus.aspx");
                //GridView2.Visible = false;
            }
        }
    }
}