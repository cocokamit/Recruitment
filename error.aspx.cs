using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string key = Request.QueryString["key"].ToString();
            if (key == "0")
            {
                l_msg.Text = "You Have Already Send Application For This Position";
                l_sub.Text = "Kindly Select Another Position";
            }
            else
            {
                l_sub.Text = "Please Check Your Connectivity";
                l_msg.Text = "Connection Server Was Lost!";
            }
        }
        catch
        {
            l_sub.Text = "Please Check Your Connectivity";
            l_msg.Text = "Connection Server Was Lost!";
        }
    }
}