using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_examineer_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write(butyok.Encrypt("1142", true));
    }

    protected void click_submit(object sender, EventArgs e)
    {
        string value;
        try { value = butyok.Decrypt(tb_code.Text.Replace(" ", ""), true); }
        catch { value = "0"; }

        DataTable dt = dbhelper.getdata("select * from applicant a left join jobs b on a.job_id=b.id where a.id=" + value);
        if (dt.Rows.Count == 0)
            alert.Visible=true;
        else
        {
            ViewState["data"] = dt;
            p_verify.Visible = false;
            p_profile.Visible = true;
        }
    }

    protected string parsebirthdate(string date)
    {
        try
        {
            DateTime now = DateTime.Today;
            DateTime pass = DateTime.Parse(date);
            int age = now.Year - pass.Year;
            date = pass.ToString("MMMM dd, yyyy") + " (" + age + " years old)";
        }
        catch { }

        return date;
    }
}