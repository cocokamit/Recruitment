using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_Manager_ViewMonPower : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
           disp();
    }

    protected void disp()
    {
        string query = "select a.id,a.[description], " +
                        "b.ngalan " +
                        "from ManPower a " +
                        "left join account b on a.acc_id=b.deg_id ";
        DataSet ds = bol.displayData(query);
        grid_data.DataSource = ds.Tables["table"];
        grid_data.DataBind();
    }
}