using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class content_HR_JobDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("quit");
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        stateclass sc = new stateclass();

        if (checker())
        {
            sc.a = int.Parse(drop_type.SelectedValue).ToString();
            sc.b = txt_subject.Text;
            sc.c = txt_details.Text;
            sc.aa = int.Parse(drop_loc.SelectedValue);
            sc.d = txt_section.Text;
            sc.e = txt_qualification.Text;
            string x = bol.jobs(sc);

           //string msg = message.forapprove(getdata.fitchdata2(x), x);
           //emailsender.emailsender2(msg, getdata.fitchdata2(x), "maribagobluewaterbeachandspa@gmail.com",
           //"Hello", "dropshadow3@yahoo.com");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='joblist'", true);
        }
    }

    protected bool checker()
    {
        bool oi = true;

        if (drop_type.Text == "")
        {
            oi = false;
            lbl_type.Text = "empty";
        }
        else
            lbl_type.Text = "";

        if (txt_subject.Text == "")
        {
            oi = false;
            lbl_subject.Text = "empty";
        }
        else
            lbl_subject.Text = "";

        //if (txt_details.Text == "")
        //{
        //    oi = false;
        //    lbl_details.Text = "empty";
        //}
        //else
        //    lbl_details.Text = "";

        if (drop_loc.Text == "")
        {
            oi = false;
            lbl_loc.Text = "empty";
        }
        else
            lbl_loc.Text = "";

        if (txt_qualification.Text == "")
        {
            oi = false;
            lbl_qualification.Text = "empty";
        }
        else
            lbl_qualification.Text = "";

        //if (txt_section.Text == "")
        //{
        //    oi = false;
        //    lbl_section.Text = "empty";
        //}
        //else
        //    lbl_section.Text = "";


        return oi;
    }
}