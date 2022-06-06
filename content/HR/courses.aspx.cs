using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_courses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("quit");

        if(!IsPostBack) 
            bind();
    }

    protected void bind()
    {
        datatable("order by name");
    }

    protected void datatable(string condition)
    {
        DataSet ds = bol.displayData("select * from courses where status=1 " + condition);
        grid_view.DataSource = ds.Tables["table"];
        grid_view.DataBind();
       
        alert.Visible = grid_view.Rows.Count == 0 ? true : false;
    }

    protected void search(object sender, EventArgs e)
    {
        datatable("and name like '%" + tb_search.Text.Trim() + "%'");
    }

    protected void click_add(object sender, EventArgs e)
    {
        hf_action.Value = "Create";
        modaladd.Style.Add("display", "block");
    }

    protected void click_close(object sender, EventArgs e)
    {
        modaladd.Style.Add("display", "none");
    }

    protected void click_action(object sender, EventArgs e)
    {
        if (tb_courses.Text.Replace(" ", "").Length > 0)
        {
            dbhelper.getdata(hf_action.Value == "Create" ? "insert into courses values ('" + tb_courses.Text.Trim() + "',1)" : "update courses set name='"+tb_courses.Text.Trim()+"' where id=" + hf_id.Value);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record successfully saved'); window.location='courses'", true);
        }
        else
            lbl_courses.Text = "*";
    }

    protected void click_edit(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            hf_action.Value = "Edit";
            hf_id.Value = row.Cells[0].Text;
            tb_courses.Text = row.Cells[1].Text;
            modaladd.Style.Add("display", "block");
        }
    }

    protected void click_delete(object sender, EventArgs e)
    {
        if (TextBox1.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                dbhelper.getdata("update courses set status=0 where id=" + row.Cells[0].Text);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record successfully deleted'); window.location='courses'", true);
            }
        }
    }
}