using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Drawing;


public partial class appdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        disp();
    }
    

    protected void disp()
    {

        string applicant = Request.QueryString["app_id"].ToString();

        string query = "select convert(varchar,(select job_subject from jobs where id=a.job_id and status='1' ),5000) posdesire,case when pos_desire is null then '-' else convert(varchar,pos_desire,5000) end pd,* from applicant a where a.id=" + Request.QueryString["app_id"].ToString();
        DataTable dt = dbhelper.getdata(query);
        txt_fname.Text = dt.Rows[0]["name"].ToString().Replace(",", " ");

        string[] psd = dt.Rows[0]["posdesire"].ToString().Split(',');
        string[] oi = dt.Rows[0]["pd"].ToString().Split(',');

        drop_type.Text = dt.Rows[0]["pd"].ToString().Length == 1 ? dt.Rows[0]["posdesire"].ToString() : dt.Rows[0]["posdesire"].ToString() + "/" + dt.Rows[0]["pd"].ToString().Replace("|", "/");
        
        string dp = null;
        foreach (string row in psd)
        {
            if (!row.Contains("|"))
            {
                if (row.Length > 1)
                    dp += row + "/";
            }
        }

        foreach (string row in oi)
        {
            if (!row.Contains("|"))
            {
                if (row.Length > 1)
                    dp += row + "/";
            }
        }
        if (dp != null)
            drop_type.Text = dp.Substring(0, dp.Length - 1);

        txt_pread.Text=dt.Rows[0]["present_add"].ToString();
        txt_provad.Text=dt.Rows[0]["provencial_add"].ToString();
        txt_tel.Text = dt.Rows[0]["tel_no"].ToString();
        txt_cel.Text = dt.Rows[0]["cell_no"].ToString();
        txt_email.Text = dt.Rows[0]["email"].ToString();
        //string[] bd = dt.Rows[0]["dateofbirth"].ToString().Split('/');
        ddl_month.Text = dt.Rows[0]["dateofbirth"].ToString();
        //ddl_day.Text=bd[1].ToString();
        //ddl_year.Text=bd[2].ToString();
        lbl_password.Text = butyok.Encrypt(dt.Rows[0]["id"].ToString(), true);
        l_gender.Text = dt.Rows[0]["gender"].ToString();

        txt_fname.Enabled=false;
        txt_mname.Enabled = false;
        txt_lname.Enabled = false;
        drop_type.Enabled = false;
        txt_pread.Enabled = false;
        txt_provad.Enabled = false;
        txt_tel.Enabled = false;
        txt_cel.Enabled = false;
        txt_email.Enabled = false;

        ddl_month.Enabled = false;
        ddl_day.Enabled = false;
        ddl_year.Enabled = false;

        DataTable dtprof = dbhelper.getdata("select top 1 * from app_profile where app_id=" + Request.QueryString["app_id"].ToString() + " order by id desc");
        if (dtprof.Rows.Count > 0)
        {
            if (int.Parse(dtprof.Rows[0]["id"].ToString()) > 599)
                ImageButton1.Attributes.Add("src", "UploadImages/prof_id_" + dtprof.Rows[0]["app_id"].ToString() + "/" + dtprof.Rows[0]["app_id"].ToString() + dtprof.Rows[0]["img_file"].ToString());
            else
                ImageButton1.Attributes.Add("src", "UploadImages/prof_id_" + dtprof.Rows[0]["id"].ToString() + "/" + dtprof.Rows[0]["id"].ToString() + ".png");
        }

        query = "select * from education where app_id=" + Request.QueryString["app_id"].ToString() + " and level not like '%skill%'";
        DataSet dseduc = bol.displayData(query);
        grid_educ.DataSource=dseduc.Tables["table"];
        grid_educ.DataBind();

        query = "select * from EmploymentHistory where CONVERT(VARCHAR, company) ! = '' and app_id=" + Request.QueryString["app_id"].ToString() + "";
        DataSet dsemphs = bol.displayData(query);
        grid_employmenthistory.DataSource = dsemphs.Tables["table"];
        grid_employmenthistory.DataBind();

        query = "select a.id,a.app_id,a.skills from special_skills a left join Applicant b on a.app_id = b.id"
            +" where CONVERT(VARCHAR, a.skills) ! = '' and a.app_id=" + Request.QueryString["app_id"].ToString() + "";
        DataSet sk = bol.displayData(query);
        grid_skills.DataSource = sk.Tables["table"];
        grid_skills.DataBind();



    }

    protected void click_dl(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = dbhelper.getdata("select * from applicant where id=" + Request.QueryString["app_id"].ToString() + "");
            string filePath = "~/Document/app_id_" + Request.QueryString["app_id"].ToString() + "/" + dt.Rows[0]["resume_file"].ToString();
            Response.Clear();
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + dt.Rows[0]["resume_file"].ToString());
            Response.WriteFile(filePath);
            Response.End();
        }
        catch
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No file attached');", true);
        }
            //Response.Clear();
            //Response.AddHeader("Content-Disposition", "attachment; filename=" + filePath);
            //Response.AddHeader("Content-Length", filePath);
            //Response.ContentType = "application/octet-stream";
            //Response.WriteFile(filePath);
            //Response.End(); 
    }

    //protected void click_profile(object sender, EventArgs e)
    //{
    //    panelPopUpPanel.Style.Add("top", "20%");
    //    panelPopUpPanel.Style.Add("width", "450px");
    //    panelPopUpPanel.Style.Add("left", "30%");
    //    ppop(true);
    //}
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    if (UploadFile.HasFile)
    //    {
    //        string extension = Path.GetExtension(UploadFile.FileName).ToLower();
    //        if (extension == ".jpg" || extension == ".jpeg" || extension == ".png" || extension == ".gif" || extension == ".bmp")
    //        {

    //            Rectangle CropArea = new Rectangle(
    //                   Convert.ToInt32(X.Value.Contains('.') ? X.Value.Substring(0, X.Value.IndexOf(".")) : X.Value),
    //                   Convert.ToInt32(Y.Value.Contains('.') ? Y.Value.Substring(0, Y.Value.IndexOf(".")) : Y.Value),
    //                   Convert.ToInt32(W.Value.Contains('.') ? W.Value.Substring(0, W.Value.IndexOf(".")) : W.Value),
    //                   Convert.ToInt32(H.Value.Contains('.') ? H.Value.Substring(0, H.Value.IndexOf(".")) : H.Value));
    //            UploadFile.SaveAs(Server.MapPath("UploadImages/" + UploadFile.FileName));
    //            string imagePath = Server.MapPath("UploadImages/" + UploadFile.FileName);

    //            System.Drawing.Image previewzone = Bitmap.FromFile(imagePath);
    //            Bitmap btmap = new Bitmap(CropArea.Width, CropArea.Height);
    //            Graphics graphcs = Graphics.FromImage(btmap);
    //            graphcs.DrawImage(previewzone, new Rectangle(0, 0, btmap.Width, btmap.Height), CropArea, GraphicsUnit.Pixel);
    //            Guid name = Guid.NewGuid();
    //            DataTable ins = dbhelper.getdata("insert into app_profile(date_input,app_id,img_file)values(getdate()," + Request.QueryString["app_id"].ToString() + ",'" + extension + "') select scope_identity() id");
    //            string cropedImagePath = Server.MapPath("~/document/app_id_" + Request.QueryString["app_id"].ToString() + "/profile/" + ins.Rows[0]["id"].ToString() + extension);
    //            btmap.Save(cropedImagePath);
    //            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully'); window.location='appldet?app_id=" + Request.QueryString["app_id"].ToString() + "'", true);

    //        }
    //    }
    //}

    //protected void add_close(object sender, ImageClickEventArgs e)
    //{
    //    Response.Redirect("appldet?app_id=" + Request.QueryString["app_id"].ToString() + "", false);
    //}
    //protected void ppop(bool oi)
    //{
    //    panelOverlay.Visible = oi;
    //    panelPopUpPanel.Visible = oi;
    //}
}