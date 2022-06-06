using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class content_HR_setting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static void delete(string id)
    {
       
        try
        {
            dbhelper.getdata("delete mycarousel where id=" + id);

        }
        catch (Exception ex)
        {
            System.Web.Services.WebService wsError = new System.Web.Services.WebService();
            wsError.Context.Response.StatusCode = 500;

            wsError.Context.Response.AppendHeader("error", ex.Message);

        }
    }

    protected void click_add(object sender, EventArgs e)
    {
        modaladd.Style.Add("display", "block");
    }

    protected void close(object sender, EventArgs e)
    {
        modaladd.Style.Add("display", "none");
    }

    protected void upload(object sender, EventArgs e)
    {
        if (fu_banner.HasFile)
        {
            l_msg.Text = null;

            HttpFileCollection files = Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                string fileName = Path.GetFileName(file.FileName);
                file.SaveAs(Server.MapPath("~/style/img/slider/") + fileName);

                DataTable dt = dbhelper.getdata("select * from mycarousel");
                dbhelper.getdata("insert myCarousel values ('" + fileName + "'," + (dt.Rows.Count + 1) + ")");

                System.Drawing.Image image = System.Drawing.Image.FromFile(Server.MapPath("~/style/img/slider/") + fileName);
                float h = image.Height;
                float w = image.Width;
                float imgSize = h > w ? h : w;

                float imgResize = imgSize <= 500 ? (int)1.0 : 500 / imgSize;
                w *= imgResize; h *= imgResize;
                System.Drawing.Image thumb = image.GetThumbnailImage((int)w, (int)h, delegate() { return false; }, (IntPtr)0);
                thumb.Save(Server.MapPath("~/style/img/slider/thumb/") + fileName);
                thumb.Dispose();
                image.Dispose();
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Successfully uploaded');", true);
            modaladd.Style.Add("display", "none");

        }
        else
            l_msg.Text = "* Empty";
    }

    protected void click_delete(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("delete mycarousel where id=" + TextBox2.Text);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Successfully Deleted');", true);
    }

    protected void click_save(object sender, EventArgs e)
    {
        string query = null;
        string[] her = TextBox1.Text.Replace("cnt", "").Split(' ');
        for (int i = 0; i < her.Length; i++ )
        {
            query += "update mycarousel set herar=" + i + " where id=" + her[i];
        }
        dbhelper.getdata(query);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Successfully Deleted');", true);
    }
}