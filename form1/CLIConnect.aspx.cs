using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;

public partial class form1_CLIConnect : System.Web.UI.Page
{
    public static string onprint;
    protected void Page_Load(object sender, EventArgs e)
    {
        onprint = butyok.Decrypt(Request.QueryString["onprint"].ToString(), true);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction('" + onprint + "')", true);
    }


    [WebMethod]
    public static string viewers(string Id)
    {
        string result = "";

        DataTable dt = dbhelper.getdata("Select a.*,b.Fullname,c.job_subject from ConForm a left join NewApplicant b on a.AppId=b.id left join Jobs c on b.PositionDesire=c.id where a.Id=" + Id);
        if (dt.Rows.Count > 0)
        {
            result += dt.Rows[0]["Quest"].ToString() + "~";
            result += Convert.ToDateTime(dt.Rows[0]["sysdate"].ToString()).ToString("MM/dd/yyyy") + "~";
            result += dt.Rows[0]["Fullname"].ToString() + "~";
            result += dt.Rows[0]["job_subject"].ToString() + "~";
            result += dt.Rows[0]["UserName"].ToString() + "~";
            result += dt.Rows[0]["UserDept"].ToString() + "~";
            result += dt.Rows[0]["Others"].ToString() + "~";
            result += dt.Rows[0]["conquest1"].ToString() + "~";
            result += dt.Rows[0]["conquest2"].ToString() + "~";
            result += dt.Rows[0]["conquest3"].ToString() + "~";
            result += dt.Rows[0]["conquest4"].ToString();
        }

        return result;
    }
}