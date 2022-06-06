using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_Manager_ViewMonPower : System.Web.UI.Page
{
    public static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
           disp();
    }

    protected void disp()
    {
        string query = "select a.id,a.[description], " +
                        "b.ngalan, " +
                        "c.job_type " +
                        "from ManPower a " +
                        "left join account b on a.acc_id=b.deg_id " +
                        "left join JobType c on b.deg_id=c.jobtype_id ";
        DataSet ds = bol.displayData(query);
        grid_data.DataSource = ds.Tables["table"];
        grid_data.DataBind();
    }

    protected void add_close(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("viewMP", false);
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

    protected void view_status(object sender, EventArgs e)
    {
         using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                id = row.Cells[0].Text;
               string query = "select status from ManPower where id="+id+"";
                DataTable dt = new DataTable();
                dt = dbhelper.getdata(query);

                drop_status.Text = dt.Rows[0]["status"].ToString();

                ppop(true);
             }
    }
    protected void save_status(object sender, EventArgs e)
    {
      
        DataTable dt = dbhelper.getdata("update ManPower set status='" + drop_status.Text + "' where id="+id+"");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='viewMP'", true);
        
    }
}