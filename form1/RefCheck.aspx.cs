using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;

public partial class form1_RefCheck : System.Web.UI.Page
{
    public static string onprint;
    protected void Page_Load(object sender, EventArgs e)
    {
        onprint = butyok.Decrypt(Request.QueryString["onprint"].ToString(), true);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction('" + onprint + "')", true);

    }


    [WebMethod]
    public static string viewersref(string Id)
    {
        string result = "";

        DataTable dt = dbhelper.getdata("Select a.*,b.FullName from RefCheck a left join NewApplicant b on a.AppId=b.id where a.Id=" + Id);
        if (dt.Rows.Count > 0)
        {
            result += dt.Rows[0]["Quest"].ToString() + "~";
            result += dt.Rows[0]["ReferenceName"].ToString() + "~";
            result += dt.Rows[0]["Company"].ToString() + "~";
            result += dt.Rows[0]["CurrentPosition"].ToString() + "~";
            result += Convert.ToDateTime(dt.Rows[0]["StartDate"].ToString()).ToString("MM/dd/yyyy") + "~";
            result += Convert.ToDateTime(dt.Rows[0]["SeparateDate"].ToString()).ToString("MM/dd/yyyy")  + "~";
            result += dt.Rows[0]["LastPosition"].ToString() + "~";
            result += dt.Rows[0]["NatureSeparate"].ToString() + "~";
            result += dt.Rows[0]["Remarks"].ToString() + "~";
            result += dt.Rows[0]["Userfname"].ToString() + "~";
            result += Convert.ToDateTime(dt.Rows[0]["Date"].ToString()).ToString("MM/dd/yyyy") + "~";
            result += dt.Rows[0]["FullName"].ToString();

        }

        return result;
    }
}