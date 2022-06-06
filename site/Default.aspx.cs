using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class site_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadData();
    }

    protected void LoadData()
    {
        DataTable dt = dbhelper.getdata("select * from location where status is null");
        foreach (DataRow row in dt.Rows)
        {
            ddl_property.Items.Add(new ListItem(row["description"].ToString(), row["id"].ToString()));
        }

        loadPostion(ddl_property.SelectedValue);
    }

    protected void loadPostion(string id)
    {
        DataTable dt = getdata.position(id);
        ddl_position.Items.Clear();
        foreach (DataRow row in dt.Rows)
        {
            ddl_position.Items.Add(new ListItem(row["job_subject"].ToString(), row["id"].ToString()));
        }
    }

    protected void changeProperty(object sender, EventArgs e)
    {
        loadPostion(ddl_property.SelectedValue);
    }

    protected void clickSearch(object sender, EventArgs e)
    {
        string id = butyok.Encrypt(ddl_position.SelectedValue,true);
        Response.Redirect("job?key=" + id);
    }
}