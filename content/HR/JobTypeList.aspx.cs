using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_JobTypeList : System.Web.UI.Page
{
    public static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("quit");
        getdata();
    }
    
    protected void close_modal(object sender, EventArgs e)
    {
        show(false);
    }

    protected void show(bool val)
    {
        modal.Style.Add("display", val ? "block" : "none");
    }

    protected void getdata()
    {
        string query = "Select * from JobType where status is null order by jobtype_id desc";
        DataSet ds = new DataSet();
        ds = bol.displayData(query);
        grid_view.DataSource = ds.Tables["table"];
        grid_view.DataBind();
        alert.Visible = grid_view.Rows.Count == 0 ? true : false;
    }

    protected void click_edit(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            id = row.Cells[0].Text;
            modaltitle.InnerText = "Edit Department";
            hf_action.Value = "edit";
            tb_dept.Text = row.Cells[1].Text;
            show(true);
        }
    }

    protected void click_add(object sender, EventArgs e)
    {
        hf_action.Value = "add";
        tb_dept.Text = "";
        modaltitle.InnerText = "Add Department";
        show(true);
    }

    protected void add_close(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("JobTypeList", false);
    }

    protected void delete(object sender, EventArgs e)
    {
        if (TextBox1.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                id = row.Cells[0].Text;
                string query = "update JobType set status='deleted' where  jobtype_id=" + id + " ";
                dbhelper.getdata(query);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted Successfully'); window.location='JobTypeList'", true);
            }
        }
    }

    protected void click_action(object sender, EventArgs e)
    {
        string msg = null;
        if (hf_action.Value == "add")
        {
            stateclass a = new stateclass();
            a.sa = tb_dept.Text;
            bol.JobType(a);
            msg = "Record Saved Successfully";
        }
        else
        {

            if (checker())
            {
                string query = "update JobType set job_type='" + tb_dept.Text + "' where  jobtype_id=" + id + " ";
                dbhelper.getdata(query);
                msg = "Record Saved Successfully";
            }
        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+msg+"'); window.location='JobTypeList'", true);
    }

    protected bool checker()
    {
        bool oi = true;
        if (tb_dept.Text == "")
        {
            oi = false;
            l_dept.Text = "empty";
        }
        else
            l_dept.Text = "";

        return oi;
    }
}