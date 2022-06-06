using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_Employee_location : System.Web.UI.Page
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
        string query = "Select * from location where status is null order by id asc";
        DataSet ds = new DataSet();
        ds = bol.displayData(query);

        grid_view.DataSource = ds.Tables["table"];
        grid_view.DataBind();
        alert.Visible = grid_view.Rows.Count == 0 ? true : false;


        query = "Select * from company where status is null order by id asc";
        ds = new DataSet();
        ds = bol.displayData(query);

        grid_view2.DataSource = ds.Tables["table"];
        grid_view2.DataBind();
        alert2.Visible = grid_view2.Rows.Count == 0 ? true : false;

    }

    protected void searchlocation(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("select * from location where status is NULL and description like '%" + txt_location.Text.Replace("'", "") + "%'");
        grid_view.DataSource = dt;
        grid_view.DataBind();
    }
    protected void searchlocation2(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("select * from company where status is NULL and description like '%" + txt_location2.Text.Replace("'", "") + "%'");
        grid_view2.DataSource = dt;
        grid_view2.DataBind();
    }
    protected void view(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            string query = "select [description] from location where id=" + id + " ";
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(query);
            txt_class.Text = dt.Rows[0]["description"].ToString();
            modaledit.Style.Add("display", "block");
        }
    }


    protected void view2(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            id = row.Cells[0].Text;
            string query = "select [description] from location where id=" + id + " ";
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(query);
            txt_class2.Text = dt.Rows[0]["description"].ToString();
            modaledit2.Style.Add("display", "block");
        }
    }

    protected void view_save(object sender, EventArgs e)
    {
        modaladd.Style.Add("display","block");
    }

    protected void view_save2(object sender, EventArgs e)
    {
        modaladd2.Style.Add("display", "block");
    }

    protected void add_close(object sender, EventArgs e)
    {
        modaladd.Style.Add("display", "none");
        modaladd2.Style.Add("display", "none");
        modaledit2.Style.Add("display", "none");
        modaledit.Style.Add("display", "none");
    }

    protected void delete(object sender, EventArgs e)
    {

        if (TextBox1.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                id = row.Cells[0].Text;
                string query = "update location set status='deleted' where  id=" + id + " ";
                dbhelper.getdata(query);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted Successfully'); window.location='location'", true);
            }
        }
    }

    protected void delete2(object sender, EventArgs e)
    {
        if (TextBox2.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                id = row.Cells[0].Text;
                string query = "update company set Status='deleted' where  id=" + id + " ";
                dbhelper.getdata(query);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted Successfully'); window.location='location'", true);
            }
        }
    }


    protected void edit(object sender, EventArgs e)
    {
        if (checker())
        {
            string query = "update location set description='" + txt_class.Text + "' where  id=" + id + " ";
            dbhelper.getdata(query);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Edited Successfully'); window.location='location'", true);
        }


    }

    protected void edit2(object sender, EventArgs e)
    {
        if (checker2())
        {
            string query = "update company set description='" + txt_class2.Text + "' where  id=" + id + " ";
            dbhelper.getdata(query);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Edited Successfully'); window.location='location'", true);
        }


    }

    protected void save(object sender, EventArgs e)
    {
        stateclass a = new stateclass();
        a.sa = txt_type.Text;
        bol.location(a);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='location'", true);
    }

    protected void save2(object sender, EventArgs e)
    {
        stateclass a = new stateclass();
        a.sa = txt_type2.Text;
        bol.location2(a);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='location'", true);
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

    protected bool checker2()
    {
        bool oi = true;

        if (txt_class2.Text == "")
        {
            oi = false;
            lbl_class2.Text = "empty";
        }
        else
            lbl_class2.Text = "";
        
        return oi;
    }
}