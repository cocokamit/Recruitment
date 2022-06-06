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
            Response.Redirect("login");
        getdata();
    }
    protected void getdata()
    {
        string query = "Select * from JobType where status is null order by jobtype_id desc";
        DataSet ds = new DataSet();
        ds = bol.displayData(query);

        grid_view.DataSource = ds.Tables["table"];
        grid_view.DataBind();

    }


    protected void view(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            string query = "select job_type from JobType where jobtype_id=" + id + " ";
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(query);

            txt_class.Text = dt.Rows[0]["job_type"].ToString();

            ppop(true);

        }
    }
    protected void add_close(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("JobTypeList", false);
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

    protected void delete(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            string query = "update JobType set status='deleted' where  jobtype_id=" + id + " ";
            dbhelper.getdata(query);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Delete Successfully'); window.location='JobTypeList'", true);


        }
    }


    protected void edit(object sender, EventArgs e)
    {
        if (checker())
        {
            string query = "update JobType set job_type='" + txt_class.Text + "' where  jobtype_id=" + id + " ";
            dbhelper.getdata(query);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Edit Successfully'); window.location='JobTypeList'", true);
        }


    }


    protected bool checker()
    {
        bool oi = true;

        if (txt_class.Text == "")
        {
            oi = false;
            lbl_class.Text = "empty";
        }
        else
            lbl_class.Text = "";

        return oi;
    }
}