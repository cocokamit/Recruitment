using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class blog_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindData();
    }

    protected void BindData()
    {
        ViewState["post"] = blog(); 
        ViewState["latest"] = dbhelper.getdata("select top 5 DATENAME(MM, date_created) + RIGHT(CONVERT(VARCHAR(12), date_created, 107), 9) entry_date, * from blog_details where [status]=1 order by date_created desc");
    }

    public DataTable blog()
    {
        DataTable dt;

        if (Request.QueryString["title"] != null && Request.QueryString["category"] == null)
            dt = getdata.post(Request.QueryString["title"].ToString());
        else if (Request.QueryString["title"] == null && Request.QueryString["category"] != null)
            dt = getdata.blog_category(Request.QueryString["category"].ToString());
        else if (Request.QueryString["title"] != null && Request.QueryString["category"] != null)
            dt = getdata.post(Request.QueryString["title"].ToString(), Request.QueryString["category"].ToString());
        else
            dt = getdata.post(1);

        return dt;
    }

    protected void click_search(object sender, EventArgs e)
    {
        ViewState["post"] = dbhelper.getdata(getdata.post() + " where subject like '%" + tb_search.Text.Trim() + "%'");
    }
}