using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class content_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] uri = HttpContext.Current.Request.Url.AbsolutePath.ToString().Split('/');
        
        switch (uri[1])
        {
            case "joblist":
            case "jobdetails":
                jl.Attributes.Add("class", "curr");
                break;
            case "jobtypelist":
                Li1.Attributes.Add("class", "curr");
                break;
            case "Examinition":
            case "questionnaire":
                Li4.Attributes.Add("class", "curr");
                break;

        }
    }
}
