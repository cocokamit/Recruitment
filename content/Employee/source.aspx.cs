using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_Employee_source : System.Web.UI.Page
{
    public static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("quit");
        getdata();
    }

    protected void getdata()
    {
        string query = "Select * from source where status is null order by id desc";
        DataSet ds = new DataSet();
        ds = bol.displayData(query);

        grid_view.DataSource = ds.Tables["table"];
        grid_view.DataBind();
        alert.Visible = grid_view.Rows.Count == 0 ? true : false;

    }

    protected void view(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            string query = "select [description] from source where id=" + id + " ";
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(query);

            txt_class.Text = dt.Rows[0]["description"].ToString();

            modaledit.Style.Add("display", "block");
        }
    }

    protected void view_save(object sender, EventArgs e)
    {
        modaladd.Style.Add("display", "block");

    }

    protected void add_close(object sender, EventArgs e)
    {
        Response.Redirect("source", false);
    }

    protected void add_solution(object sender, EventArgs e)
    {
    }
    
    protected void delete(object sender, EventArgs e)
    {

        if (TextBox1.Text == "Yes")
        {

            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                //Response.Write("<script>alert('a')</script>");

                id = row.Cells[0].Text;
                string query = "update source set status='deleted' where  id=" + id + " ";
                dbhelper.getdata(query);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted Successfully'); window.location='source'", true);


            }
        }
    }


    protected void edit(object sender, EventArgs e)
    {
        if (checker())
        {
            string query = "update source set description='" + txt_class.Text + "' where  id=" + id + " ";
            dbhelper.getdata(query);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Edited Successfully'); window.location='source'", true);
        }


    }

    protected void save(object sender, EventArgs e)
    {
        stateclass a = new stateclass();
        a.sa = txt_type.Text;
        bol.source(a);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='source'", true);
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