using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class site_jobs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            loadData();
    }

    protected void loadData()
    {
        string job = butyok.Decrypt(Request.QueryString["key"].ToString(), true);
        DataTable dt = getdata.job(job);
        ViewState["postion"] = lblPostion.Text = dt.Rows[0]["job_subject"].ToString();
        ViewState["property"] = lblProperty.Text = dt.Rows[0]["description"].ToString();
        lblDept.Text = dt.Rows[0]["job_type"].ToString();
        lblDetails.InnerHtml = dt.Rows[0]["qualification"].ToString().Replace("\n", "<br/>");
        string location = dt.Rows[0]["loc_id"].ToString();


        string query = "select COUNT(*) as all_jobs from Jobs where status='1' and status <> 'deleted' and loc_id=" + location;
        dt = dbhelper.getdata(query);

        lbl_all.Text = dt.Rows[0]["all_jobs"].ToString();

        query = "select count(b.jobtype_id) as cnnt, a.job_type, b.loc_id, " +
        "b.jobtype_id " +
        "from JobType a " +
        "left join Jobs b on a.jobtype_id=b.jobtype_id " +
        "where b.status='1' and b.status <> 'deleted' and b.loc_id=" + location + " " +
        "and a.status is null " +
        "group by a.job_type,b.loc_id, b.jobtype_id ";
        DataSet ds = bol.displayData(query);
        grid_type.DataSource = ds;
        grid_type.DataBind();
    }

    protected void checkPage()
    {
        if (Request.QueryString["key"] == null)
            Response.Redirect("career");

        if(butyok.Decrypt(Request.QueryString["key"].ToString(), true) == "0")
            Response.Redirect("career");
    }

    protected void search(object sender, EventArgs e)
    {
        Response.Redirect("vacancies?key=" + tbSearch.Text.Trim());
    }

    protected void viewCategories(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            Response.Redirect("vacancies?prop=" + row.Cells[1].Text + "&cat=" + row.Cells[0].Text);
        }
    }

}