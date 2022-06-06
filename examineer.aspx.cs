using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class examineer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void click_login(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("select top 1 * from app_message where action='For Exam' and app_id=" + butyok.Decrypt(txt_appno.Text, true) + " order by id desc");
        if (dt.Rows.Count > 0)
        {
            //string s = "window.open('exmrfrm?e_id=" + dt.Rows[0]["e_id"].ToString() + "&app_id=" + dt.Rows[0]["app_id"].ToString() + "', 'null', 'width=1600,height=1100,status=0,directories=0,titlebar=0,scrollbars=1,menubar=0,toolbar=0,location=0,resizable=1');";
            ////s += "window.moveTo(0, 0)";
            //ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
            Response.Redirect("exmrfrm?e_id=" + dt.Rows[0]["e_id"].ToString() + "&app_id=" + dt.Rows[0]["app_id"].ToString() + "&mess_id=" + dt.Rows[0]["id"].ToString() + "");
        }
        else
        { 
            
        }
    }
}