using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Text;

/// <summary>
/// Summary description for emailsender
/// </summary>
public class emailsender
{
	public emailsender()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static List<string> NetworkCredential()
    {
        List<string> Credential = new List<string>();
        DataTable dt = dbhelper.getdata("select * from sys_EmailConfig");
        Credential.Add(dt.Rows[0]["smtp"].ToString());
        Credential.Add(dt.Rows[0]["username"].ToString());
        Credential.Add(dt.Rows[0]["password"].ToString());
        return Credential;
    }

    public static void MailSenderAttachment(string msg, string address, string subject, DataTable dt)
    {
        List<string> Credential = NetworkCredential();
        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient(Credential[0]);
        mail.From = new MailAddress(Credential[1]);
        mail.To.Add(address);
        mail.Subject = subject;
        mail.Body = msg;
        mail.Attachments.Add(new Attachment(HttpContext.Current.Server.MapPath("~/document/app_id_" + dt.Rows[0]["id"].ToString() + "/" + dt.Rows[0]["resume_file"].ToString())));
        mail.IsBodyHtml = true;
        SmtpServer.Port = 587;
        SmtpServer.UseDefaultCredentials = true;
        SmtpServer.Credentials = new System.Net.NetworkCredential(Credential[1], Credential[2]);
        SmtpServer.EnableSsl = true;
        SmtpServer.Send(mail);
    }

    public static void dev(string msg, string address, string subject)
    {
        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
        mail.From = new MailAddress("mycliportal@gmail.com");
        mail.To.Add(address);
        mail.Subject = subject;
        mail.Body = msg;
        mail.IsBodyHtml = true;
        SmtpServer.Port = 587;
        SmtpServer.Credentials = new System.Net.NetworkCredential("mycliportal@gmail.com", "Landmasters!");
        SmtpServer.EnableSsl = true;
        SmtpServer.Send(mail);
    }

    public static void mail(string msg, string address, string subject)
    {
        List<string> Credential = NetworkCredential();
        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient(Credential[0]);
        mail.From = new MailAddress(Credential[1]);
        mail.To.Add(address);
        mail.Subject = subject;
        mail.Body = msg;
        mail.IsBodyHtml = true;
        SmtpServer.Port = 587;
        SmtpServer.Credentials = new System.Net.NetworkCredential(Credential[1], Credential[2]);
        SmtpServer.EnableSsl = true;
        SmtpServer.Send(mail);
    }

    public static bool MailSender(string msg, string address, string subject, string bcc)
    {
      

        List<string> Credential = NetworkCredential();
        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient(Credential[0]);
        mail.From = new MailAddress(Credential[1]);
        mail.To.Add(address);
        //mail.Bcc.Add(bcc);
        mail.Subject = subject + " Application From Cebu LandMasters.";
        mail.Body = msg;
        SmtpServer.Port = 587;
        SmtpServer.Credentials = new System.Net.NetworkCredential(Credential[1], Credential[2]);
        SmtpServer.EnableSsl = true;
        SmtpServer.Send(mail);

        return true;
    }

    public static bool emailsender1(string msg, DataTable dt, string address, string subject, string bcc)
    {
        //try
        //{
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("mycliportal@gmail.com");
            mail.To.Add(address);
            mail.Bcc.Add(bcc);
            mail.Subject = dt.Rows[0]["status"].ToString();
            mail.Body = msg;
            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("mycliportal@gmail.com", "Landmasters!");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
            return true;

        //}
        //catch
        //{
        //    return false;
        //}
    }

    public static bool emailsender2(string msg, DataTable dt, string address, string subject, string bcc)
    {
        //try
        //{
        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

        mail.From = new MailAddress("mycliportal@gmail.com");
        mail.To.Add(address);
        mail.Bcc.Add(bcc);
        mail.Subject = dt.Rows[0]["description"].ToString() + " " + "("+dt.Rows[0]["job_type"].ToString()+")";
        mail.Body = msg;
        SmtpServer.Port = 587;
        SmtpServer.Credentials = new System.Net.NetworkCredential("mycliportal@gmail.com", "Landmasters!");
        SmtpServer.EnableSsl = true;
        SmtpServer.Send(mail);
        return true;

        //}
        //catch
        //{
        //    return false;
        //}
    }
}