using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class content_HR_JobsList : System.Web.UI.Page
{
    public static string query,id;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        //need to fix dli tugma sa recruitment ang display
        //need to fix process
        if (Session.Count == 0)
            Response.Redirect("quit");

        if (!IsPostBack)
            dataBind();
    }

    protected void show(bool val)
    {
        modal.Style.Add("display", val ? "block" : "none");
    }

    protected void clear()
    {
        drop_type.SelectedIndex = 0;
        dro_loc.SelectedIndex = 0;
    }

    protected void click_add(object sender, EventArgs e)
    {
        show(true);
        hf_action.Value = "add";
        modaltitle.InnerText = "Add Position";
        Button2.Visible = true;

        //Button2.Text = "Save";
        //ppop(true);
        //fload();
        //Response.Redirect("jobdetails");
    }

    protected void close_modal(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
        show(false);
    }

    protected void dataBind()
    {
        string pro = drop_loc.SelectedValue == "0" ? "" : "and c.id='" + drop_loc.SelectedValue + "'";
        query = "select a.id,a.job_subject,a.job_details,a.[date], " +
        "case when a.status is null then 'pending' else case when a.status='1' then 'approved' else a.status end end as status, " +
        "b.job_type, " +
        "c.id as loc_id,c.description " +
        "from Jobs a " +
        "left join JobType b on a.jobtype_id=b.jobtype_id " +
        "left join location c on a.loc_id=c.id " +
        "where (a.[status] is null or a.[status] <> 'deleted') and b.status is null " + pro + "order by convert(varchar,a.job_subject)";
    
        ds = bol.displayData(query);
        grid_job.DataSource = ds;
        grid_job.DataBind();
        alert.Visible = grid_job.Rows.Count == 0 ? true : false;
        fload();
        location();
    }

    protected void search(object sender, EventArgs e)
    {
        string pro = drop_loc.SelectedValue.Length == 0 ? "" : "and c.id='" + drop_loc.SelectedValue + "'";
        query = "select a.id,a.job_subject,a.job_details,a.[date], " +
                "case when a.status is null then 'pending' else case when a.status='1' then 'approved' else a.status end end as status, " +
                "b.job_type, " +
                "c.id as loc_id,c.description " +
                "from Jobs a " +
                "left join JobType b on a.jobtype_id=b.jobtype_id " +
                "left join location c on a.loc_id=c.id " +
                "where (a.[status] is null or a.[status] <> 'deleted') and b.status is null  " + pro + "  order by convert(varchar,a.job_subject)";
        //DataSet ds = new DataSet();
        ds = bol.displayData(query);
        grid_job.DataSource = ds;
        grid_job.DataBind();

        fload();
        alert.Visible = grid_job.Rows.Count == 0 ? true : false;

    }

    protected void fload()
    {
        query = "select job_type,jobtype_id from JobType where status is null order by job_type desc";
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);
        drop_type.Items.Clear();
        for (int i = 0; i < dt.Rows.Count; i++)
            drop_type.Items.Insert(0, new ListItem(dt.Rows[i]["job_type"].ToString(), dt.Rows[i]["jobtype_id"].ToString()));
        drop_type.Items.Insert(0, "");
    }

    protected void location()
    {
        query = "select description,id from location where status is null";
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);
        dro_loc.Items.Clear();
        for (int i = 0; i < dt.Rows.Count; i++)
            dro_loc.Items.Insert(0, new ListItem(dt.Rows[i]["description"].ToString(), dt.Rows[i]["id"].ToString()));
        dro_loc.Items.Insert(0, "");
    }

    protected void chkboxSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox ChkBoxHeader = (CheckBox)grid_job.HeaderRow.FindControl("chkboxSelectAll");
        int i = 0;
        foreach (GridViewRow row in grid_job.Rows)
        {
            CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkEmp");
            if (ChkBoxHeader.Checked == true)
            {
                ChkBoxRows.Checked = true;
                i++;
            }
            else
            {

                ChkBoxRows.Checked = false;
                if (i > 0)
                {
                    i--;
                }
            }
        }


        if (i > 0)
        {

            if(i==1)
                lbl_del_notify.Text = i + " row selected".ToString();
            else
                lbl_del_notify.Text = i + " rows selected".ToString();

            ib_del.Style.Add("display", "block");
        }
        else
        {
            lbl_del_notify.Text = "";
            ib_del.Style.Add("display", "none");
        }
    }

    protected void delete2(object sender, EventArgs e)
    {
        string test = "";
        for (int i = 0; i <= grid_job.Rows.Count - 1; i++)
        {
            CheckBox chkEmp = (CheckBox)grid_job.Rows[i].FindControl("chkEmp");
            if (chkEmp.Checked == true)
            {
                test = "naa";
                dbhelper.getdata("update jobs set status='deleted',date_cancelled=getdate() where id=" + grid_job.Rows[i].Cells[0].Text + "");
            }
        }
        if (test.Trim().Length > 0)
        {
            dataBind();
            ppop(false);
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='joblist'", true);
        }
    }

    protected void cbsel(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((CheckBox)sender).Parent.Parent)
        {
            CheckBox chkEmp = (CheckBox)row.FindControl("chkEmp");
            if(chkEmp.Checked)
                ib_del.Visible = true;
            else
                ib_del.Visible = false;
        }
    }

    protected void view(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            id = row.Cells[0].Text;
            hf_action.Value = "Update";
            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date],a.loc_id,a.section,a.qualification, " +
                   "b.job_type " +
                   "from Jobs a " +
                   "left join JobType b on a.jobtype_id=b.jobtype_id " +
                   "where a.id="+id+" ";
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(query);

            txt_details.Text = dt.Rows[0]["job_details"].ToString();
            txt_subject.Text = dt.Rows[0]["job_subject"].ToString();

            txt_section.Text = dt.Rows[0]["section"].ToString();
            txt_qualification.Text = dt.Rows[0]["qualification"].ToString();

            drop_type.SelectedValue = dt.Rows[0]["jobtype_id"].ToString();
            dro_loc.SelectedValue = dt.Rows[0]["loc_id"].ToString();
            show(true);

            if (row.Cells[5].Text.Contains("DRAFT"))
            {
                Button1.Visible = true;
                Button2.Text = "For Approval";
            }
            else
            {
                Button1.Visible = false;
                Button2.Text = "Update";
                modaltitle.InnerText = "Edit Position";
            }
        }
    }

    protected void grid_app_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnk = (LinkButton)e.Row.FindControl("lnk_approve");
            if (e.Row.Cells[5].Text == "approved")
            {
                lnk.CssClass = "fa fa-toggle-on no-border no-pad-right";
            }
            else if (e.Row.Cells[5].Text == "closed")
            {
                lnk.CssClass = "fa fa-toggle-off no-border no-pad-right";
            }
            else if (e.Row.Cells[5].Text == "draft")
            {
                lnk.Enabled = false;
                lnk.OnClientClick="Null";
                lnk.CssClass = "fa fa-thumbs-up no-border no-pad-right";
                lnk.Style.Add("color", "#eee");
                e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<small class='bg-primary pull-right' style='border-radius:3px;padding:3px 5px; color:white'>draft</small>";
            }
            else
            {
                lnk.CssClass = "fa fa-thumbs-up no-border no-pad-right";
                e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<small class='bg-green pull-right' style=' border-radius:3px; padding:3px 5px; color:white'>for approval</small>";
            }

            if (Session["deg_id"].ToString() == "38")
            {
                grid_job.Columns[6].Visible = false;
            }
        }
    }

    protected void Approved(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            id = row.Cells[0].Text;
            if (TextBox1.Text == "Yes")
                query = "update Jobs set status='1' where id=" + id;
            else
            {
                if (TextBox1.Text.Length == 0)
                {
                    string status = row.Cells[5].Text == "approved" ? "closed" : "1";
                    query = "update Jobs set status='" + status + "' where id=" + id;
                }
            }

            dbhelper.getdata(query);
            dataBind();
            ppop(false);
            TextBox1.Text = "";
        }
    }

    protected void delete(object sender, EventArgs e)
    {
        if (TextBox1.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                id = row.Cells[0].Text;
                query = "update Jobs set status='deleted',date_cancelled=getdate()  where id=" + id + " ";
                dbhelper.getdata(query);
                dataBind();
                ppop(false);
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted Successfully'); window.location='JobList'", true);
            }
        }
    }

    protected void click_action(object sender, EventArgs e)
    {
        if (hf_action.Value == "Update")
        {
            query = "update Jobs set jobtype_id='" + drop_type.SelectedValue + "',job_subject='" + txt_subject.Text.Replace("'", "''") + "',loc_id='" + dro_loc.SelectedValue + "',section='" + txt_section.Text.Replace("'", "''") + "',qualification='" + txt_qualification.Text.Replace("'", "''").Replace("\n", "") + "' where id=" + id + " ";
            dbhelper.getdata(query);
            dataBind();
            show(false);
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated Successfully'); window.location='JobList'", true);
        }
        //else if (hf_action.Value == "ForApproval")
        //{
        //    query = "update Jobs set jobtype_id='" + drop_type.SelectedValue + "',job_subject='" + txt_subject.Text.Replace("'", "''") + "',loc_id='" + dro_loc.SelectedValue + "',section='" + txt_section.Text.Replace("'", "''") + "',qualification='" + txt_qualification.Text.Replace("'", "''") + "', status='2' where id=" + id + " ";
        //    dbhelper.getdata(query);
        //    dataBind();
        //    show(false);
        //    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated Successfully'); window.location='JobList'", true);
        //}
        else
        {
            stateclass sc = new stateclass();
            if (checker())
            {
                sc.a = int.Parse(drop_type.SelectedValue).ToString();
                sc.b = txt_subject.Text;
                sc.c = "";
                sc.aa = int.Parse(dro_loc.SelectedValue);
                sc.d = txt_section.Text;
                sc.e = txt_qualification.Text.Replace("\n", "");
                string x = bol.jobs(sc);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated Successfully'); window.location='JobList'", true);
            }
        }
    }

    protected void savedraft(object sender, EventArgs e)
    {
        if (checker())
        {
            if (Button2.Text == "For Approval")
            {
                query = "update Jobs set jobtype_id='" + drop_type.SelectedValue + "',job_subject='" + txt_subject.Text.Replace("'", "''") + "',loc_id='" + dro_loc.SelectedValue + "',section='" + txt_section.Text.Replace("'", "''") + "',qualification='" + txt_qualification.Text.Replace("'", "''") + "' where id=" + id + " ";
                dbhelper.getdata(query);
                //dataBind();
                //ppop(false);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated Successfully'); window.location='JobList'", true);

            }
            else
            {
                string query = "insert into Jobs (status,jobtype_id,job_subject,[date],loc_id,section,qualification) values ('draft'," + drop_type.SelectedValue + ",'" + txt_subject.Text.Replace("'", "''") + "',GETDATE()," + drop_loc.SelectedValue + ",'" + txt_section.Text.Replace("'", "''") + "','" + txt_qualification.Text.Replace("'", "''") + "')";
                DataTable dt = dbhelper.getdata(query);
                //dataBind();
                //ppop(false);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='joblist'", true);
            }
            
            
        }
    }

    protected bool checker()
    {
        bool oi = true;

        if (drop_type.Text == "")
        {
            oi = false;
            Label1.Text = "empty";
        }
        else
            Label1.Text = "";

        if (txt_subject.Text == "")
        {
            oi = false;
            lbl_title.Text = "empty";
        }
        else
            lbl_title.Text = "";

        //if (txt_details.Text == "")
        //{
        //    oi = false;
        //    lbl_details.Text = "empty";
        //}
        //else
        //    lbl_details.Text = "";

        if (dro_loc.Text == "")
        {
            oi = false;
            Label2.Text = "empty";
        }
        else
            Label2.Text = "";

        if (txt_qualification.Text == "")
        {
            oi = false;
            lbl_qualification.Text = "empty";
        }
        else
            lbl_qualification.Text = "";

        //if (txt_section.Text == "")
        //{
        //    oi = false;
        //    lbl_section.Text = "empty";
        //}
        //else
        //    lbl_section.Text = "";


        return oi;
    }

    protected void add_close(object sender, ImageClickEventArgs e)
    {
        dataBind();
        ppop(false);
//        Response.Redirect("JobList", false);
    }

    protected void add_solution(object sender, EventArgs e)
    {
        ppop(true);
    }

    protected void ppop(bool oi)
    {
        panelOverlay.Visible = oi;
        panelPopUpPanel.Visible = oi;
    }

    protected void gridItemSorting(object sender, GridViewSortEventArgs e)
    {
      

        dataBind();
        DataTable dt = new DataTable();
        dt = ds.Tables[0];
        {
            string SortDir = string.Empty;

            if (dir == SortDirection.Ascending)
            {
                dir = SortDirection.Descending;

                SortDir = " Desc";
            }
            else
            {

                dir = SortDirection.Ascending;
                SortDir = " Asc";

            }
            DataView sortedView = new DataView(dt);
            sortedView.Sort = e.SortExpression + " " + SortDir;
            grid_job.DataSource = sortedView;
            grid_job.DataBind();

        }
    }

    public SortDirection dir
    {
        get
        {
            if (ViewState["dirState"] == null)
            {
                ViewState["dirState"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["dirState"];

        }
        set
        {
            ViewState["dirState"] = value;

        }
    }
}