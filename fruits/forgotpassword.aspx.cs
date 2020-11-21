using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Collections.Specialized;

namespace fruits
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["rashmi"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            // string UserName = "";
            //string Password = "";

            //SqlCommand cmd = new SqlCommand("select user_name, password from fruitreg where email=@email and user_name=@user_name", con);
            //cmd.Parameters.AddWithValue("@user_name", uname.Text);
            //cmd.Parameters.AddWithValue("@email", email.Text);
            //con.Open();
            //using (SqlDataReader sdr = cmd.ExecuteReader())

            //{

            //    if (sdr.Read())
            //    {
            //        UserName = sdr["user_name"].ToString();
            //        Password = sdr["password"].ToString();
            //        Response.Write("Plese check your email account.");
            //    }

            //}
            //con.Close();

            //if (!string.IsNullOrEmpty(Password))
            //{
            //    MailMessage msg = new MailMessage();
            //    msg.From = new MailAddress("patelrashmi17899@gmail.com");
            //    msg.To.Add(email.Text);
            //    msg.Subject = "  your Password";
            //    msg.Body = ("Your Password is:" + Password);
            //    msg.IsBodyHtml = true;

            //    SmtpClient smt = new SmtpClient();
            //    smt.Host = "smtp.gmail.com";
            //    System.Net.NetworkCredential ntwd = new NetworkCredential();
            //    ntwd.UserName = "patelrashmi17899@gmail.com";
            //    ntwd.Password = "8469510509";
            //    smt.UseDefaultCredentials = true;
            //    smt.Credentials = ntwd;
            //    smt.Port = 587;
            //    smt.EnableSsl = true;
            //    smt.Send(msg);
            //    lbltxt.Text = "<b>UserName and Password Sent Successfully</b>";
            //    lbltxt.ForeColor = System.Drawing.Color.DarkSlateBlue;
            //}
            //else
            //{
            //    lbltxt.Text = "<b>Invalid of EmailId</b>";
            //    lbltxt.ForeColor = System.Drawing.Color.DarkSlateBlue;
            //}
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string UserName = "";
            string Password = "";

            SqlCommand cmd = new SqlCommand("select user_name, password from fruitreg where email=@email and user_name=@user_name", con);
            cmd.Parameters.AddWithValue("@user_name", uname.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())

            {

                if (sdr.Read())
                {
                    UserName = sdr["user_name"].ToString();
                    Password = sdr["password"].ToString();
                    Response.Write("Plese check your email account.");
                }

            }
            con.Close();

            if (!string.IsNullOrEmpty(Password))
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("patelrashmi17899@gmail.com");
                msg.To.Add(email.Text);
                msg.Subject = "  your Password";
                msg.Body = ("Your Password is:" + Password);
                msg.IsBodyHtml = true;

                SmtpClient smt = new SmtpClient();
                smt.Host = "smtp.gmail.com";
                System.Net.NetworkCredential ntwd = new NetworkCredential();
                ntwd.UserName = "patelrashmi17899@gmail.com";
                ntwd.Password = "8469510509";
                smt.UseDefaultCredentials = true;
                smt.Credentials = ntwd;
                smt.Port = 587;
                smt.EnableSsl = true;
                smt.Send(msg);
                lbltxt.Text = "<b>UserName and Password Sent Successfully</b>";
                lbltxt.ForeColor = System.Drawing.Color.DarkSlateBlue;
            }
            else
            {
                lbltxt.Text = "<b>Invalid of EmailId</b>";
                lbltxt.ForeColor = System.Drawing.Color.DarkSlateBlue;
            }

        }
    }
}