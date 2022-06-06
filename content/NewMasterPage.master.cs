using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class content_NewMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("quit");

        string[] uri = HttpContext.Current.Request.Url.AbsolutePath.ToString().Split('/');

        switch (uri[1])
        {
            case "mp":
                Li9.Attributes.Add("class", "curr");
                break;
            case "hired":
                li_h.Attributes.Add("class", "curr");
                lim_h.Attributes.Add("class", "curr");
                Li19.Attributes.Add("class", "curr");
                break;
            case "reject":
                li_r.Attributes.Add("class", "curr");
                break;
            case "appl":
                li_a.Attributes.Add("class", "curr");
                Li13.Attributes.Add("class", "curr");
                Li17.Attributes.Add("class", "curr");
                break;
            case "evalresult":
                li_er.Attributes.Add("class", "curr");
                break;
            case "evaluation":
                li_eh.Attributes.Add("class", "curr");
                break;
            case "joblist":
                li_jb.Attributes.Add("class", "curr");
                break;
            case "jobdetails":
                li_jt.Attributes.Add("class", "curr");
                break;
            case "jobtypelist":
                li_jl.Attributes.Add("class", "curr");
                break;
            case "examinition":
            case "questionnaire":
                li_ex.Attributes.Add("class", "curr");
                break;
            case "users":
                li_u.Attributes.Add("class", "curr");
                break;
            case "viewmp":
                li_mp.Attributes.Add("class", "curr");
                break;
            case "location":
                li_l.Attributes.Add("class", "curr");
                break;
            case "source":
                li_s.Attributes.Add("class", "curr");
                break;
        }
    }
}
