using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_Manager_ManPower : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("insert into Manpower(description,date,acc_id)values('"+txt_mp.Text+"',getdate(),'" + Session["deg_id"].ToString() + "')");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully'); window.location='MP'", true);
    }
}