using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_forApproval : System.Web.UI.Page
{
    public static string app_id,query,id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //fload();
            getdata();
        }
      
    }



    public void getdata()
    {

        app_id = Request.QueryString["app_id"].ToString();

        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
               "b.job_type,c.[description] " +
               "from Jobs a " +
               "left join JobType b on a.jobtype_id=b.jobtype_id " +
               "left join location c on a.loc_id=c.id " +
               "where a.id=" + app_id + " ";
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);

        lbl_type.Text = dt.Rows[0]["job_type"].ToString();
        lbl_location.Text = dt.Rows[0]["description"].ToString();
        txt_details.Text = dt.Rows[0]["job_details"].ToString();
        txt_subject.Text = dt.Rows[0]["job_subject"].ToString();
        id = dt.Rows[0]["id"].ToString();
        //drop_type.SelectedValue = dt.Rows[0]["jobtype_id"].ToString();

    }


    //protected void fload()
    //{
    //    query = "select job_type,jobtype_id from JobType where status is null";
    //    DataTable dt = new DataTable();
    //    dt = dbhelper.getdata(query);
    //    drop_type.Items.Clear();
    //    for (int i = 0; i < dt.Rows.Count; i++)
    //        drop_type.Items.Insert(0, new ListItem(dt.Rows[i]["job_type"].ToString(), dt.Rows[i]["jobtype_id"].ToString()));
    //    drop_type.Items.Insert(0, "");
    //}

    protected void update(object sender, EventArgs e)
    {
        query = "update Jobs set job_subject='" + txt_subject.Text + "',job_details='" + txt_details.Text + "' where id=" + app_id + " ";
        query += "update Jobs set status='1' where id = "+id+"";
        dbhelper.getdata(query);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated Successfully'); window.location='Approval?app_id="+app_id+"'", true);

    }
}