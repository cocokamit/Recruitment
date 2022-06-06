using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_FormDetails : System.Web.UI.Page
{
    public static string query;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
             getdata();
    }


    protected void getdata()
    {
        //string id = RouteData.Values["jobtype_id"].ToString();


        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date],a.section,a.qualification, " +
                  "b.job_type " +
                  "from Jobs a " +
                  "left join JobType b on a.jobtype_id=b.jobtype_id " +
                  "where a.id=" + Request.QueryString["frm_id"].ToString() + " ";
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
            qua.Visible = false;
        else
        {
            qua.Visible = true;
            lbl_qualification.Text = dt.Rows[0]["qualification"].ToString();
        }
        if (dt.Rows[0]["job_details"].ToString().Trim() == "")
            job.Visible = false;
        else
        {
            job.Visible = true;
            txt_details.Text = dt.Rows[0]["job_details"].ToString().Replace("\n", "<br/>");
        }
        lbl_title.Text = dt.Rows[0]["job_subject"].ToString();
        lbl_type.Text = dt.Rows[0]["job_type"].ToString();

       

       
       

        
    }
    protected void click_apply(object sender, EventArgs e)
    {
        Response.Redirect("formapp?app_id=" + Request.QueryString["frm_id"].ToString() + "");
       // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "window.open('','_new').location.href='formapp?app_id=" + Request.QueryString["frm_id"].ToString() + "'", true);
    }

    protected void home(object sender, EventArgs e)
    {
        Response.Redirect("recruitment");

    }
}