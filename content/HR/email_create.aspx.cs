using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_email_create : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
                databind();
        }
    }

    protected void click_discard(object sender, EventArgs e)
    {
        Response.Redirect("email");
    }

    protected void databind()
    {
        DataTable dt = dbhelper.getdata("select * from email where id=" + Request.QueryString["id"].ToString());
        if (dt.Rows.Count == 0)
            Response.Redirect("email");
        else
        {
            lb_draf.Visible = false;
            lb_discard.Visible = false;
            tb_title.Text = dt.Rows[0]["title"].ToString();
            compose_textarea.Text = dt.Rows[0]["content"].ToString();
        }
    }

    protected void click_save(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        if (check())
        {
            stateclass sc = new stateclass();
            if (Request.QueryString["id"] == null)
            {
                sc.a = "0";
                sc.b = btn.ID == "lb_save" ? "add" : "draft";
                sc.c = tb_title.Text.Trim();
                sc.d = compose_textarea.Text.Trim();
                sc.e = "0";
            }
            else
            {
                sc.a = Request.QueryString["id"].ToString();
                sc.b = "edit";
                sc.c = tb_title.Text.Trim();
                sc.d = compose_textarea.Text.Trim();
                sc.e = "0";
            }

            int x = bol.email(sc);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully save'); location.href = 'email'", true);
        }
    }

    protected bool check()
    {
        bool val = true;

        if (tb_title.Text.Replace(" ", "").Length == 0 || compose_textarea.Text.Replace(" ", "").Length == 0)
        {
            alert.Visible = true;
            lb_alert.Text = "Please conplete the details";
        }
        else
            alert.Visible = false;

        return val;
    }
}