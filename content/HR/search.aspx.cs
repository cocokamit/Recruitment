using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_search : System.Web.UI.Page
{
    public static string query, jobs,idd,id;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            getdata();
    }

    protected void click_apply(object sender, EventArgs e)
    {
        string a = Request.QueryString["key"].ToString();
        Response.Redirect("formapp?app_id=" + a.Substring(0,a.IndexOf("@")-1)+ "");
    }

    public void getdata()
    {
        int count = 0;
        string a = Request.QueryString["key"].ToString();
       
        jobs = a;

        txt_search.Text = a.Contains("@") ? a.Substring(a.IndexOf("|") + 1) : "";
        if (a.Contains("@"))
        {
            Div9.Visible = false;
            string b = a.Substring(a.IndexOf("@") + 1, a.IndexOf("|")-3);
            Div8.Visible = true;
            img_logo.ImageUrl = "~/style/img/logo/" + b.Replace("|", "") + ".png";

            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date],a.section,a.qualification, " +
            "b.job_type " +
            "from Jobs a " +
            "left join JobType b on a.jobtype_id=b.jobtype_id " +
            "where a.id=" + a.Substring(0, a.IndexOf("@")) + " ";
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(query);

            if (dt.Rows[0]["section"].ToString().Trim() == "")
                sec.Visible = false;
            else
            {
                sec.Visible = true;
                lbl_section.Text = dt.Rows[0]["section"].ToString();
            }


            if (dt.Rows[0]["qualification"].ToString().Trim() == "")
                job.Visible = false;
            else
            {
                job.Visible = true;
                txt_details.Text = dt.Rows[0]["qualification"].ToString().Replace("\n", "<br/>");
            }
             
            lbl_title.Text = dt.Rows[0]["job_subject"].ToString();
            lbl_type.Text = dt.Rows[0]["job_type"].ToString();

             
        }

        //bubble
        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
           "b.jobtype_id " +
           "from JobType a " +
           "left join Jobs b on a.jobtype_id=b.jobtype_id " +
           "where b.status='1' and b.status <> 'deleted' and b.loc_id=10 " +
           "and b.job_subject like '%" + jobs + "%' " +
            "and a.status is null " +
           "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        GridView5.DataSource = ds;
        GridView5.DataBind();

        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
        "b.job_type " +
        "from Jobs a " +
        "left join JobType b on a.jobtype_id=b.jobtype_id " +
        "where (a.status='1' or a.status <> 'deleted') and a.job_subject like '%" + jobs + "%'  and b.status is null and a.loc_id=10 ";
        ds = bol.displayData(query);

        if (GridView5.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + GridView5.Rows[0].Cells[0].Text + "'";
            lbl_mar_sub.Text = "";
            lbl_mar_head.Text = "";
            GridView6.DataSource = ds;
            GridView6.DataBind();
        }
        else
        {
            count++;
            UpdatePanel3.Visible = false;
        }


        //arch
        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
           "b.jobtype_id " +
           "from JobType a " +
           "left join Jobs b on a.jobtype_id=b.jobtype_id " +
           "where b.status='1' and b.status <> 'deleted' and b.loc_id=8 " +
           "and b.job_subject like '%" + jobs + "%' " +
            "and a.status is null " +
           "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
        "b.job_type " +
        "from Jobs a " +
        "left join JobType b on a.jobtype_id=b.jobtype_id " +
        "where (a.status='1' or a.status <> 'deleted') and a.job_subject like '%" + jobs + "%'  and b.status is null and a.loc_id=8 ";
        ds = bol.displayData(query);

        if (GridView1.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + GridView1.Rows[0].Cells[0].Text + "'";
            lbl_mar_sub.Text = "";
            lbl_mar_head.Text = "";
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
        else
        {
            count++;
            UpdatePanel1.Visible = false;
        }

        //maribago
        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
            "b.jobtype_id " +
            "from JobType a " +
            "left join Jobs b on a.jobtype_id=b.jobtype_id " +
            "where b.status='1' and b.status <> 'deleted' and b.loc_id=1 " +
            "and b.job_subject like '%" + jobs + "%' " +
             "and a.status is null " +
            "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_maribago.DataSource = ds;
        grid_maribago.DataBind();

        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                "b.job_type " +
                "from Jobs a " +
                "left join JobType b on a.jobtype_id=b.jobtype_id " +
                "where (a.status='1' or a.status <> 'deleted') and a.job_subject like '%" + jobs + "%'  and b.status is null and a.loc_id=1 ";
        ds = bol.displayData(query);

        if (grid_maribago.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_maribago.Rows[0].Cells[0].Text + "'";
            lbl_mar_sub.Text = "";
            lbl_mar_head.Text = "";
            grid_maribago_sub.DataSource = ds;
            grid_maribago_sub.DataBind();
        }
        else
        {
            count++;
            update_maribago.Visible = false;

        }

        //panglao
        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
            "b.jobtype_id " +
            "from JobType a " +
            "left join Jobs b on a.jobtype_id=b.jobtype_id " +
            "where b.status='1' and b.status <> 'deleted' and b.loc_id=2 " +
            "and b.job_subject like '%" + jobs + "%' " +
             "and a.status is null " +
            "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_panglao.DataSource = ds;
        grid_panglao.DataBind();

        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                "b.job_type " +
                "from Jobs a " +
                "left join JobType b on a.jobtype_id=b.jobtype_id " +
                "where (a.status='1' or a.status <> 'deleted') and a.job_subject like '%" + jobs + "%'  and b.status is null and a.loc_id=2 ";
        ds = bol.displayData(query);

        if (grid_panglao.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_panglao.Rows[0].Cells[0].Text + "'";
            lbl_panglao_sub.Text = "";
            lbl_panglao_head.Text = "";
            grid_panglao_sub.DataSource = ds;
            grid_panglao_sub.DataBind();
        }
        else
        {
            count++;
            update_panglao.Visible = false;
        }

        //sumilon
        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
           "b.jobtype_id " +
           "from JobType a " +
           "left join Jobs b on a.jobtype_id=b.jobtype_id " +
           "where b.status='1' and b.status <> 'deleted' and b.loc_id=3 " +
           "and b.job_subject like '%" + jobs + "%' " +
            "and a.status is null " +
           "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_sumilon.DataSource = ds;
        grid_sumilon.DataBind();

        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                "b.job_type " +
                "from Jobs a " +
                "left join JobType b on a.jobtype_id=b.jobtype_id " +
                "where (a.status='1' or a.status <> 'deleted') and a.job_subject like '%" + jobs + "%'  and b.status is null and a.loc_id=3 ";
        ds = bol.displayData(query);

        if (grid_sumilon.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_sumilon.Rows[0].Cells[0].Text + "'";

            lbl_sumilon_head.Text = "";
            grid_sumilon_sub.DataSource = ds;
            grid_sumilon_sub.DataBind();
        }
        else
        {
            count++;
            update_sumilon.Visible = false;
        }

        //almont
        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
           "b.jobtype_id " +
           "from JobType a " +
           "left join Jobs b on a.jobtype_id=b.jobtype_id " +
           "where b.status='1' and b.status <> 'deleted' and b.loc_id=4 " +
           "and b.job_subject like '%" + jobs + "%' " +
            "and a.status is null " +
           "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_almont.DataSource = ds;
        grid_almont.DataBind();

        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                "b.job_type " +
                "from Jobs a " +
                "left join JobType b on a.jobtype_id=b.jobtype_id " +
                "where (a.status='1' or a.status <> 'deleted') and a.job_subject like '%" + jobs + "%'  and b.status is null and a.loc_id=4 ";
        ds = bol.displayData(query);

        if (grid_almont.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_almont.Rows[0].Cells[0].Text + "'";
            lbl_almont_sub.Text = "";
            lbl_almont_head.Text = "";
            grid_almont_sub.DataSource = ds;
            grid_almont_sub.DataBind();
        }
        else
        {
            count++;
            update_almont.Visible = false;
        }


        //amuma
        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
           "b.jobtype_id " +
           "from JobType a " +
           "left join Jobs b on a.jobtype_id=b.jobtype_id " +
           "where b.status='1' and b.status <> 'deleted' and b.loc_id=5 " +
           "and b.job_subject like '%" + jobs + "%' " +
           "and a.status is null " +
           "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_amuma.DataSource = ds;
        grid_amuma.DataBind();


        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                "b.job_type " +
                "from Jobs a " +
                "left join JobType b on a.jobtype_id=b.jobtype_id " +
                "where (a.status='1' or a.status <> 'deleted') and a.job_subject like '%" + jobs + "%'  and b.status is null and a.loc_id=5 ";

        if (grid_amuma.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_amuma.Rows[0].Cells[0].Text + "'";
            lbl_amu_sub.Text = "";
            lbl_amu_head.Text = "";
            ds = bol.displayData(query);
            grid_amuma_sub.DataSource = ds;
            grid_amuma_sub.DataBind();
        }
        else
        {
            count++;
            update_amuma.Visible = false;
        }

        //others
        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
           "b.jobtype_id " +
           "from JobType a " +
           "left join Jobs b on a.jobtype_id=b.jobtype_id " +
           "where b.status='1' and b.status <> 'deleted' and b.loc_id=6 " +
           "and b.job_subject like '%" + jobs + "%' " +
           "and a.status is null " +
           "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_other.DataSource = ds;
        grid_other.DataBind();


        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                "b.job_type " +
                "from Jobs a " +
                "left join JobType b on a.jobtype_id=b.jobtype_id " +
                "where (a.status='1' or a.status <> 'deleted') and a.job_subject like '%" + jobs + "%'  and b.status is null and a.loc_id=6 ";

        if (grid_other.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_other.Rows[0].Cells[0].Text + "'";
            lbl_other_sub.Text = "";
            lbl_other_head.Text = "";
            ds = bol.displayData(query);
            grid_other_sub.DataSource = ds;
            grid_other_sub.DataBind();
        }
        else
        {
            count++;
            update_others.Visible = false;
        }

        //one hotel
        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
           "b.jobtype_id " +
           "from JobType a " +
           "left join Jobs b on a.jobtype_id=b.jobtype_id " +
           "where b.status='1' and b.status <> 'deleted' and b.loc_id=9 " +
           "and b.job_subject like '%" + jobs + "%' " +
            "and a.status is null " +
           "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        GridView3.DataSource = ds;
        GridView3.DataBind();

        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
        "b.job_type " +
        "from Jobs a " +
        "left join JobType b on a.jobtype_id=b.jobtype_id " +
        "where (a.status='1' or a.status <> 'deleted') and a.job_subject like '%" + jobs + "%'  and b.status is null and a.loc_id=9 ";
        ds = bol.displayData(query);

        if (GridView3.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + GridView3.Rows[0].Cells[0].Text + "'";
            lbl_mar_sub.Text = "";
            lbl_mar_head.Text = "";
            GridView4.DataSource = ds;
            GridView4.DataBind();
        }
        else
        {
            count++;
            UpdatePanel2.Visible = false;
        }

        if (count == 9 && !a.Contains("@"))
            Div9.Visible = true;
        else
            Div9.Visible = false;

    }

    protected void view_buble(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                   "b.job_type " +
                   "from Jobs a " +
                   "left join JobType b on a.jobtype_id=b.jobtype_id " +
                   "where a.status='1' and a.loc_id='5' and b.jobtype_id=" + id + " ";

            ds = bol.displayData(query);
            GridView6.DataSource = ds;
            GridView6.DataBind();

            DataTable dt = ds.Tables[0];
            Label6.Text = dt.Rows[0]["job_type"].ToString();

        }
    }

    protected void view_onehospital(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                   "b.job_type " +
                   "from Jobs a " +
                   "left join JobType b on a.jobtype_id=b.jobtype_id " +
                   "where a.status='1' and a.loc_id='5' and b.jobtype_id=" + id + " ";

            ds = bol.displayData(query);
            GridView4.DataSource = ds;
            GridView4.DataBind();

            DataTable dt = ds.Tables[0];
            Label4.Text = dt.Rows[0]["job_type"].ToString();

        }
    }

    protected void view_maribago(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                   "b.job_type " +
                   "from Jobs a " +
                   "left join JobType b on a.jobtype_id=b.jobtype_id " +
                   "where a.status='1' and a.loc_id='1' and b.jobtype_id=" + id + "";

            ds = bol.displayData(query);
            grid_maribago_sub.DataSource = ds;
            grid_maribago_sub.DataBind();

            DataTable dt = ds.Tables[0];
            lbl_mar_head.Text = dt.Rows[0]["job_type"].ToString();

        }
    }

    protected void view_panglao(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                   "b.job_type " +
                   "from Jobs a " +
                   "left join JobType b on a.jobtype_id=b.jobtype_id " +
                   "where a.status='1' and a.loc_id='2' and b.jobtype_id=" + id + " ";

            ds = bol.displayData(query);
            grid_panglao_sub.DataSource = ds;
            grid_panglao_sub.DataBind();

            DataTable dt = ds.Tables[0];
            lbl_panglao_head.Text = dt.Rows[0]["job_type"].ToString();

        }
    }

    protected void view_sumilon(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                   "b.job_type " +
                   "from Jobs a " +
                   "left join JobType b on a.jobtype_id=b.jobtype_id " +
                   "where a.status='1' and a.loc_id='3' and b.jobtype_id=" + id + " ";

            ds = bol.displayData(query);
            grid_sumilon_sub.DataSource = ds;
            grid_sumilon_sub.DataBind();

            DataTable dt = ds.Tables[0];
            lbl_sumilon_head.Text = dt.Rows[0]["job_type"].ToString();

        }
    }

    protected void view_almont(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                   "b.job_type " +
                   "from Jobs a " +
                   "left join JobType b on a.jobtype_id=b.jobtype_id " +
                   "where a.status='1' and a.loc_id='4' and b.jobtype_id=" + id + " ";

            ds = bol.displayData(query);
            grid_almont_sub.DataSource = ds;
            grid_almont_sub.DataBind();

            DataTable dt = ds.Tables[0];
            lbl_almont_head.Text = dt.Rows[0]["job_type"].ToString();

        }
    }

    protected void view_amuma(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                   "b.job_type " +
                   "from Jobs a " +
                   "left join JobType b on a.jobtype_id=b.jobtype_id " +
                   "where a.status='1' and a.loc_id='5' and b.jobtype_id=" + id + " ";

            ds = bol.displayData(query);
            grid_amuma_sub.DataSource = ds;
            grid_amuma_sub.DataBind();

            DataTable dt = ds.Tables[0];
            lbl_amu_head.Text = dt.Rows[0]["job_type"].ToString();

        }
    }

    protected void view_others(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                   "b.job_type " +
                   "from Jobs a " +
                   "left join JobType b on a.jobtype_id=b.jobtype_id " +
                   "where a.status='1' and a.loc_id='6' and b.jobtype_id=" + id + " ";

            ds = bol.displayData(query);
            grid_other_sub.DataSource = ds;
            grid_other_sub.DataBind();

            DataTable dt = ds.Tables[0];
            lbl_other_head.Text = dt.Rows[0]["job_type"].ToString();

        }
    }

    protected void goForm(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            idd = row.Cells[0].Text;
            LinkButton lb = (LinkButton)row.FindControl("lnkEdit");

            Response.Redirect("search?key="+ idd + "@" + lb.ToolTip + "|"+ lb.Text);
         
            

        }
    }

    protected void home(object sender, EventArgs e)
    {

        Response.Redirect("recruitment");

    }

    protected void txt_TextChanged(object sender, EventArgs e)
    {
        Response.Redirect("search?key=" + txt_search.Text + "");
    }
}