using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_config_email : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindData();
    }

    public void BindData()
    {
        try
        {
            DataTable dt = dbhelper.getdata("select * from sys_EmailConfig");
            tbSMTP.Text = dt.Rows[0]["smtp"].ToString();
            tbUser.Text = dt.Rows[0]["username"].ToString();
            tbPassword.Text = dt.Rows[0]["password"].ToString();
        }
        catch
        {
 
        }
    }

    protected void click_SaveSetting(object sender, EventArgs e)
    {
        if (checkfield())
        {
            dbhelper.getdata("update sys_EmailConfig set smtp='" + tbSMTP.Text.Replace(" ", "") + "',username='" + tbUser.Text.Replace(" ", "") + "',[password]='" + tbPassword.Text.Replace(" ", "") + "' ");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully save.'); window.location='"+ Request.RawUrl+"'", true);
        }
    }

    public bool checkfield()
    {
        lblSmtp.Text = tbSMTP.Text.Replace(" ", "").Length == 0 ? "*" : "";
        lblUsername.Text = tbUser.Text.Replace(" ", "").Length == 0 ? "*" : "";
        lblPassword.Text = tbPassword.Text.Replace(" ", "").Length == 0 ? "*" : "";

        return (lblSmtp.Text + lblUsername.Text + lblPassword.Text).Contains("*") ? false : true;
    }

}