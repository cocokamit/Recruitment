using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string query = "select distinct(a.id),a.date_app,replace(a.name,',',' ') name,a.status,a.recommendation,case when (select top 1 loc from loc_per_app  where  app_id=a.id order by id desc) is null then (select description from location where id=b.loc_id and status is null) else (select top 1 loc from loc_per_app  where  app_id=a.id order by id desc) end  property, " +
           "case when (select COUNT(*) from examineer where app_id=a.id)=0 then 'Not Yet' else 'Done' end exam_stat, " +
           "convert(varchar,(select job_subject from jobs where id=a.job_id and status='1' ),5000)  +'' + " +
"case when convert(varchar,a.pos_desire,5000) is null then '' else replace(convert(varchar,a.pos_desire,5000),'|','') end pos_desire " +
           "from applicant a " +
           "left join Jobs b on a.job_id=b.id " +
           "order by a.date_app desc ";
        DataSet ds = bol.displayData(query);
        grid_app.DataSource = ds;
        grid_app.DataBind();
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

             


        }

    }
}