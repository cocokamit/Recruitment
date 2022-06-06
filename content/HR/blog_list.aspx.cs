using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_blog_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            bind();
    }

    protected void rowbound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton publish = (LinkButton)e.Row.FindControl("lb_publish");
            if (e.Row.Cells[1].Text == "0")
                publish.CssClass = "fa fa-toggle-off";
        }
    }

    protected void bind()
    {
        grid_job.DataSource = getdata.post_collection();
        grid_job.DataBind();
        alert.Visible = grid_job.Rows.Count == 0 ? true : false;
    }

    protected void add_blog(object sender, EventArgs e)
    {
        Response.Redirect("Blog");
    }

    protected void view(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            hf_id.Value = row.Cells[0].Text;
            string query = "select * from blog_details where id='" + hf_id.Value + "' ";
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(query);

            txt_subject.Text = dt.Rows[0]["subject"].ToString();

            txt_qualification.Text = dt.Rows[0]["description"].ToString();

            show(true);
             
        }
    }

    protected void update(object sender, EventArgs e)
    {
      
        dbhelper.getdata("update blog_details set subject='" + txt_subject.Text.Replace("'", "").Replace("`", "") + "',description='" + txt_qualification.Text.Replace("'", "").Replace("`", "").Replace("\n", "") + "' where id='" + hf_id.Value + "'  ");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record successfully saved'); window.location='bloglist'", true);

    }

    protected void delete(object sender, EventArgs e)
    {
        if (TextBox1.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                hf_id.Value = row.Cells[0].Text;
                dbhelper.getdata("update blog_details set status='2' where id='" + hf_id.Value + "'  ");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record successfully saved'); window.location='"+Request.RawUrl+"'", true);
            }
        }
    }

    protected void post(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            hf_id.Value = row.Cells[0].Text;
            string status = row.Cells[1].Text == "0" ? "1" : "0";
            dbhelper.getdata("update blog_details set status=" + status + " where id='" + hf_id.Value + "'  ");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record successfully saved'); window.location='" + Request.RawUrl + "'", true);
        }

    }

    protected void close_modal(object sender, EventArgs e)
    {
        show(false);
    }

    protected void show(bool val)
    {
        modal.Style.Add("display", val ? "block" : "none");
    }
}