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
        DataTable dt = dbhelper.getdata("select * from location where status is null");
        foreach (DataRow row in dt.Rows)
        {
            ddl_property.Items.Add(new ListItem(row["description"].ToString(), row["id"].ToString()));
        }

        if (Request.QueryString["cat"] != null)
        {
            pnlSearchResult.Visible = false;
            ddl_property.SelectedValue = Request.QueryString["prop"].ToString();
            getCategories(ddl_property.SelectedValue);
            ddlCategories.SelectedValue = Request.QueryString["cat"].ToString();
            loadPostion();
        }
        else if (Request.QueryString["key"] == null)
        {
            pnlSearchResult.Visible = false;
            getJobCollection();
        }
        else
        {
            string key = Request.QueryString["key"].ToString().Trim();
            getJob(key);
        }
    }

    protected void getJobCollection()
    {
        //VACANCIES
        grid_subject.DataSource = getdata.position("0");
        grid_subject.DataBind();
    }

    protected void getCategories(string property)
    {
        //CATEGORIES
        string query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
        "b.jobtype_id " +
        "from JobType a " +
        "left join Jobs b on a.jobtype_id=b.jobtype_id " +
        "where b.status='1' and b.status <> 'deleted' and b.loc_id=" + property + " " +
        "and a.status is null " +
        "group by a.job_type,b.jobtype_id ";
        DataTable dt = dbhelper.getdata(query);

        ddlCategories.Items.Clear();
        ddlCategories.Items.Add(new ListItem("All", "0"));

        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ddlCategories.Items.Add(new ListItem(row["job_type"].ToString(), row["jobtype_id"].ToString()));
            }
        }
        else
            ddl_property.SelectedValue = "0";

    }

    protected void changeProperty(object sender, EventArgs e)
    {
        getCategories(ddl_property.SelectedValue);
        loadPostion();
        pnlSearchResult.Visible = false;
        tbSearch.Text = string.Empty;
    }

    protected void changeCategory(object sender, EventArgs e)
    {
        loadPostion();
    }

    protected void loadPostion()
    {
        if (ddl_property.SelectedValue == "0")
            getJobCollection();
        else
        {
            DataTable dt = getdata.positionCategories(ddl_property.SelectedValue, ddlCategories.SelectedValue);
            grid_subject.DataSource = dt;
            grid_subject.DataBind();
        }
    }

    protected void searchJob(object sender, EventArgs e)
    {
        getJob(tbSearch.Text.Trim());
    }

    protected void getJob(string key)
    {
        if (key.Length > 0)
        {
            pnlSearchResult.Visible = true;
            lblKey.Text = key;
            grid_subject.DataSource = getdata.positionSearch(key);
            grid_subject.DataBind();
            getCategories("0");
        }
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
        Response.Redirect("vacancies?key=" );
    }

    protected void clickViewJob(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            string id = butyok.Encrypt(row.Cells[0].Text, true);
            Response.Redirect("job?key=" + id);
        }
    }

}