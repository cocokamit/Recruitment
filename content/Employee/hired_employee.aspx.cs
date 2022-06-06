using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class content_Employee_hired_employee : System.Web.UI.Page
{
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

    protected void disp()
    {
        string query = "select a.app_id,a.date,a.status,b.pos_desire,(select job_subject from Jobs where id = b.job_id)job_id,b.name from app_message a left join Applicant b on a.app_id = b.id  where a.status like '%Hired%' or a.status like '%Transferred%'";
        DataSet ds = bol.displayData(query);
        grid_app.DataSource = ds.Tables["table"];
        grid_app.DataBind();
        alert.Visible = grid_app.Rows.Count == 0 ? true : false;
    }
    protected void search(object sender, EventArgs e)
    {

        if (Session["ngalan"].ToString() == "HR")
        {

            if (txt_name.Text == "" && drop_type.Text == "" && txt_skills.Text == "" && txt_from.Text == "" && txt_to.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Empty Fields'); window.location='Hired'", true);
            }
            else
            {


                if (txt_from.Text != "")
                {
                    string query = "select a.app_id,a.[date],a.[status], " +
                                   "convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end pos_desire,b.name " +
                                   "from app_message a " +
                                   "LEFT join Applicant b on a.app_id=b.id " +
                                   "where b.name like '%" + txt_name.Text + "%' " +
                                    "and convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end like '%" + drop_type.SelectedItem + "%'" +
                                   "and a.[status]='Hired' " +
                                   "and left(convert(varchar,a.date,101),10) between (left(convert(varchar,'" + txt_from.Text + "',101),10)) and (left(convert(varchar,'" + txt_to.Text + "',101),10)) order by a.[date] desc";
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
                                       "convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end pos_desire,b.name " +
                                       "from app_message a  " +
                                       "left join applicant b on a.app_id=b.id " +
                                       "left join special_skills c on a.app_id=c.app_id " +
                                       "where b.name like '%" + txt_name.Text + "%' " +
                                                                                               "and convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end like '%" + drop_type.SelectedItem + "%'" +
                                       "and c.skills like '%" + txt_skills.Text + "%' " +
                                       "and a.[status]='Hired' " +
                                       "order by a.[date] desc ";
                        DataSet ds = bol.displayData(query);
                        grid_app.DataSource = ds.Tables["table"];
                        grid_app.DataBind();

                        alert.Visible = grid_app.Rows.Count == 0 ? true : false;
                    }
                    else
                    {
                        string query = "select a.app_id,a.[date],a.[status], " +
                                        "convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end pos_desire,b.name " +
                                        "from app_message a " +
                                        "left join applicant b on a.app_id=b.id " +
                                        "where b.name like '%" + txt_name.Text + "%' " +
                                                                                                 "and convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end like '%" + drop_type.SelectedItem + "%'" +
                                        "and a.[status]='Hired' order by a.[date] desc";
                        DataSet ds = bol.displayData(query);
                        grid_app.DataSource = ds.Tables["table"];
                        grid_app.DataBind();


                        alert.Visible = grid_app.Rows.Count == 0 ? true : false;
                    }
                }

            }
        }
        else
        {
            if (txt_name.Text == "" && drop_type.Text == "" && txt_skills.Text == "" && txt_from.Text == "" && txt_to.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Empty Fields'); window.location='Hired'", true);
            }
            else
            {


                if (txt_from.Text != "")
                {
                    string query = "select a.app_id,a.[date],a.[status], " +
                                   "convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end pos_desire,b.name " +
                                   "from app_message a " +
                                   "left join Jobs c on b.job_id=c.id " +
                                   "left join account d on c.jobtype_id=d.deg_id " +
                                   "where d.deg_id='" + Session["deg_id"].ToString() + "' " +
                                   "and b.name like '%" + txt_name.Text + "%' " +
                                                                                             "and convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end like '%" + drop_type.SelectedItem + "%'" +
                                   "and a.[status]='Hired' " +
                                   "and left(convert(varchar,a.date,101),10) between (left(convert(varchar,'" + txt_from.Text + "',101),10)) and (left(convert(varchar,'" + txt_to.Text + "',101),10)) order by a.[date] desc";
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
                                       "convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end pos_desire,b.name " +
                                       "from app_message a  " +
                                       "left join applicant b on a.app_id=b.id " +
                                       "left join special_skills c on a.app_id=c.app_id " +
                                       "left join Jobs c on b.job_id=c.id " +
                                       "left join account d on c.jobtype_id=d.deg_id " +
                                       "where d.deg_id='" + Session["deg_id"].ToString() + "' " +
                                       "and b.name like '%" + txt_name.Text + "%' " +
                                                                                  "and convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end like '%" + drop_type.SelectedItem + "%'" +
                                       "and c.skills like '%" + txt_skills.Text + "%' " +
                                       "and a.[status]='Hired' " +
                                       "order by a.[date] desc ";
                        DataSet ds = bol.displayData(query);
                        grid_app.DataSource = ds.Tables["table"];
                        grid_app.DataBind();

                        alert.Visible = grid_app.Rows.Count == 0 ? true : false;
                    }
                    else
                    {
                        string query = "select a.app_id,a.[date],a.[status], " +
                                    "convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end pos_desire,b.name " +
                                    "from app_message a " +
                                    "left join applicant b on a.app_id=b.id " +
                                    "left join Jobs c on b.job_id=c.id " +
                                    "left join account d on c.jobtype_id=d.deg_id " +
                                    "where d.deg_id='" + Session["deg_id"].ToString() + "' " +
                                    "and b.name like '%" + txt_name.Text + "%' " +
                                     "and convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end like '%" + drop_type.SelectedItem + "%'" +
                                    "and a.[status]='Hired' order by a.[date] desc";

                        DataSet ds = bol.displayData(query);
                        grid_app.DataSource = ds.Tables["table"];
                        grid_app.DataBind();


                        alert.Visible = grid_app.Rows.Count == 0 ? true : false;
                    }
                }
            }
        }

    }

    protected void click_view(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "window.open('','_new').location.href='IEF?APOD=" + butyok.Encrypt(row.Cells[0].Text, true)+"'", true);
            //Response.Redirect("appldet?app_id=" + row.Cells[0].Text + "");
        }
    }
    protected void download(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            DataTable dt = dbhelper.getdata("select * from applicant where id=" + row.Cells[0].Text + "");
            string filePath = "~/Document/app_id_" + row.Cells[0].Text + "/" + dt.Rows[0]["resume_file"].ToString();
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }
    }
}