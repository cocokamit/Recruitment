using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;

public partial class form1_Statementofaccount : System.Web.UI.Page
{
    public static string onprint;
    protected void Page_Load(object sender, EventArgs e)
    {
        //onprint = butyok.Decrypt(Request.QueryString["onprint"].ToString(), true);
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction('" + onprint + "')", true);

    }



    [WebMethod]
    public static string viewers(string Id)
    {
        string result = "";

        DataTable dt = dbhelper.getdata("Select a.*,b.name,c.job_subject from IEF a left join Applicant b on a.AppId=b.id left join Jobs c on b.job_id=c.id where a.Id=" + Id);
        if (dt.Rows.Count > 0)
        {
           
        }

        return result;
    }
}