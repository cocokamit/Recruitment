using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_examresult : System.Web.UI.Page
{
    public static string email, app_id, pd;
    protected void Page_Load(object sender, EventArgs e)
    {
        disp();
    }
    protected void disp()
    {
        string query = "select b.id as app_id,a.date,a.e_id,a.id,convert(varchar,(select job_subject from jobs where id=b.job_id and status='1' ),5000)  +''+  case when convert(varchar,b.pos_desire,5000) is null then '' else replace(convert(varchar,b.pos_desire,5000),'|','') end pos_desire,b.name,b.cell_no,b.tel_no,b.email,  " +
                     "(select COUNT(*) from examineer_answer where answer=corr_answer and ex_id=a.id and q_type='choices') as score, " +
                     "a.noofitems " +
                     "from examineer a  " +
                     "left join Applicant b on a.app_id=b.id ";
        DataSet ds = bol.displayData(query);
        grid_app.DataSource = ds.Tables["table"];
        grid_app.DataBind();
        alert.Visible = grid_app.Rows.Count == 0 ? true : false;
    }

    protected void view(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
             ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "window.open('','_new').location.href='vwanrdfrm?ex_id=" + row.Cells[1].Text + "&e_id=" + row.Cells[2].Text + "'", true);
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
            DataTable dt = dbhelper.getdata("select count(*)cnt from question where e_id="+e.Row.Cells[2].Text+" and status='1'");
            DataTable examinition = dbhelper.getdata("select passing from examinition where id=" + e.Row.Cells[2].Text + " and status='1'");
            Label lbl = (Label)e.Row.FindControl("Label2");
            LinkButton stat = (LinkButton)e.Row.FindControl("lnk_st");
            float score =(float.Parse(e.Row.Cells[6].Text));
            float totalmultiplechoice=float.Parse(dt.Rows.Count>0?dt.Rows[0]["cnt"].ToString():"0.00");
            if (score >= (totalmultiplechoice) / 100 * float.Parse(examinition.Rows.Count>0?examinition.Rows[0]["passing"].ToString():"0.00"))
            {
                //lbl.Text = (totalmultiplechoice / 100 * 75).ToString();
                stat.Text = "Pass";
            }
            else
            {
                //lbl.Text = (totalmultiplechoice / 100 * 75).ToString();
                stat.Text = "Fail";
            }
        }
       
    }
    protected void add_close(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("exmrlt", false);
    }
    protected void ppop(bool oi)
    {
        panelOverlay.Visible = oi;
        panelPopUpPanel.Visible = oi;
    }
    protected void click_pd(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            DataTable dt = dbhelper.getdata("select * from applicant where id=" + row.Cells[0].Text + "");
            pd = dt.Rows[0]["pos_desire"].ToString();
            string[] lnl = dt.Rows[0]["pos_desire"].ToString().Split(',');
            app_id = row.Cells[0].Text;
            foreach (string ss in lnl)
            {
                Label lbl = new Label();
                lbl.ID = "lv_lbl_" + ss;
                lbl.Text = ss;
                lv.Controls.Add(lbl);
                lv.Controls.Add(new LiteralControl("<br/>"));
            }
            ppop(true);
        }
    }
}