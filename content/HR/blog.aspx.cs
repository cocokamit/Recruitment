using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;


public partial class content_HR_blog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("quit");

        if (!IsPostBack)
        {
            if (Request.QueryString["key"] != null)
                getpost(Request.QueryString["key"].ToString());
        }
    }

    protected void getpost(string x)
    {
        hf_action.Value = "1";
        lbl_header.Text = lbl_breadcrub.Text = "Edit Post";
        DataTable dt = dbhelper.getdata( "select * from blog_details where id=" + x );
        txt_subject.Text = dt.Rows[0]["subject"].ToString();
        txt_qualification.Text = dt.Rows[0]["description"].ToString();
        tb_featured.Text = dt.Rows[0]["featured"].ToString();
        ib_freatured.ImageUrl = "~/blogger/upload/" + x + ".jpg";
        p_edit_img.Visible = true;
        ddl_category.Text = dt.Rows[0]["category"].ToString();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (checker())
        {
            int x;
            string path = "~/blogger/upload/";
            if (hf_action.Value == "0")
            {
                stateclass a = new stateclass();
                a.sa = txt_subject.Text.Replace("'", "").Replace("`", "");
                a.sb = txt_qualification.Text.Replace("'", "").Replace("`", "").Replace("\n", "");
                a.a = tb_featured.Text.Replace("'", "").Replace("`", "").Trim();
                a.b = ddl_category.Text;
                x = bol.blog(a);
            }
            else
            {
                x = int.Parse(Request.QueryString["key"].ToString());
                string query = "update blog_details set category='" + ddl_category.Text + "', featured='" + tb_featured.Text.Replace("'", "").Replace("`", "").Trim() + "', subject='" + txt_subject.Text.Replace("'", "").Replace("`", "") + "',description='" + txt_qualification.Text.Replace("'", "").Replace("`", "").Replace("\n", "") + "' where id=" + x;
                dbhelper.getdata(query);
            }

            if (fu_featured.HasFile)
                fu_featured.SaveAs(Server.MapPath(path) + x + ".jpg");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record successfully saved'); window.location='post'", true);
        }
    }

    protected bool checker()
    {
        bool oi = true;

        if (txt_subject.Text == "")
        {
            oi = false;
            lbl_title.Text = "*";
        }
        else
            lbl_title.Text = "";

        if (txt_qualification.Text == "")
        {
            oi = false;
            lbl_qualification.Text = "*";
        }
        else
            lbl_qualification.Text = "";


        if (tb_featured.Text.Replace(" ","").Length == 0)
        {
            oi = false;
            Label2.Text = "*";
        }
        else
            Label2.Text = "";


        if (Request.QueryString["key"] == null)
        {
            if (!fu_featured.HasFile)
            {
                oi = false;
                Label1.Text = "*";
            }
            else
                Label1.Text = "";
        }



        return oi;
    }
}