using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_Rejected : System.Web.UI.Page
{
    public static string email, app_id, pd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("quit");

        disp();
    }

    protected void click_refresh(object sender, EventArgs e)
    {
        disp();
    }

    protected void click_advance(object sender, EventArgs e)
    {
        if (advance.Visible)
        {
            advance.Visible = false;
            lb_advance.CssClass = "fa fa-sliders";
        }
        else
        {
            advance.Visible = true;
            lb_advance.CssClass = "fa fa-times-circle";
        }
    }

    protected void search(object sender, EventArgs e)
    {
        if (txt_from.Text != "")
        {
            string query = "select a.app_id,a.[date],a.[status], " +
                           "b.id,b.pos_desire,b.name " +
                           "from app_message a " +
                           "left join applicant b on a.app_id=b.id " +
                           "where b.name like '%" + txt_name.Text + "%' " +
                           "and b.pos_desire like '%" + drop_type.Text + "%' " +
                           "and a.[status]='reject' " +
                           "and a.[date] between (left(convert(varchar,'" + txt_from.Text + "',101),10)) and (left(convert(varchar,'" + txt_to.Text + "',101),10)) order by a.[date] desc";
            DataSet ds = bol.displayData(query);
            grid_app.DataSource = ds.Tables["table"];
            grid_app.DataBind();

            alert.Visible = grid_app.Rows.Count == 0 ? true : false;
        }
        else
        {
            if (txt_skills.Text != "")
            {
                string query = "select a.app_id,a.[date],a.[status], " +
                               "b.id,b.pos_desire,b.name " +
                               "from app_message a  " +
                               "left join applicant b on a.app_id=b.id " +
                               "left join special_skills c on a.app_id=c.app_id " +
                               "where b.name like '%" + txt_name.Text + "%' " +
                               "and b.pos_desire like '%" + drop_type.Text + "%' " +
                               "and c.skills like '%" + txt_skills.Text + "%' " +
                               "and a.[status]='reject' " +
                               "order by a.[date] desc ";
                DataSet ds = bol.displayData(query);
                grid_app.DataSource = ds.Tables["table"];
                grid_app.DataBind();

                alert.Visible = grid_app.Rows.Count == 0 ? true : false;
            }
            else
            {
                string query = "select a.app_id,a.[date],a.[status], " +
                                "b.id,b.pos_desire,b.name " +
                                "from app_message a " +
                                "left join applicant b on a.app_id=b.id " +
                                "where b.name like '%" + txt_name.Text + "%' " +
                                "and b.pos_desire like '%" + drop_type.Text + "%' " +
                                "and a.[status]='reject' order by a.[date] desc";
                DataSet ds = bol.displayData(query);
                grid_app.DataSource = ds.Tables["table"];
                grid_app.DataBind();


                alert.Visible = grid_app.Rows.Count == 0 ? true : false;
            }
        }
    }

    protected void disp()
    {
        string query = "select a.id,LEFT(CONVERT(varchar,a.date_app,101),10)applydate,a.name,(select job_subject from Jobs where id = a.job_id)Position from Applicant a where a.status like '%Rejection%'";
        DataSet ds = bol.displayData(query);
        grid_app.DataSource = ds.Tables["table"];
        grid_app.DataBind();
        alert.Visible = grid_app.Rows.Count == 0 ? true : false;
    }
    protected void click_view(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "window.open('','_new').location.href='appldet?app_id=" + row.Cells[0].Text + "'", true);
        }
    }
    protected void grid_app_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnk = (LinkButton)e.Row.FindControl("lnk_pd");
            if (lnk.Text.Length >= 30)
            {
                lnk.Text = lnk.Text.ToString().Substring(0, 30) + "..";
            }
        }
    }
    protected void add_close(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("reject", false);
    }

    protected void click_pd(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            DataTable dt = dbhelper.getdata("select(select job_subject from Jobs where id = a.job_id)job_desire, * from Applicant a where a.id = " + row.Cells[0].Text + "");
            pd = dt.Rows[0]["job_desire"].ToString();
            string[] lnl = dt.Rows[0]["job_desire"].ToString().Split(',');
            app_id = row.Cells[0].Text;
            foreach (string ss in lnl)
            {
                Label lbl = new Label();
                lbl.ID = "lv_lbl_" + ss;
                lbl.Text = ss;
                lv.Controls.Add(lbl);
                lv.Controls.Add(new LiteralControl("<br/>"));
            }
            joblist.Style.Add("display", "block");
        }
    }
    protected void close(object sender, EventArgs e)
    {
        joblist.Style.Add("display", "none");
    }
}