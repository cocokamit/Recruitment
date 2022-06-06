using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void click_go(object sender, EventArgs e)
    {
        stateclass sc = new stateclass();
        sc.sa = txt_user.Text;
        sc.sb = txt_pass.Text;

        string val = bol.authentication(sc);

        if (val != "0")
        {
            Session["ngalan"] = val.Substring(0, val.IndexOf("-"));
            //Session["user_id"] = val.Substring(val.IndexOf("-") + 1);
            Session["deg_id"] =val.Substring(val.IndexOf("*") + 1);

            string user_class = val.Substring(0, val.IndexOf("-"));
            string user_id = val.Substring(val.IndexOf("-") + 1).Replace(val.Substring(val.IndexOf("*")),"");
            string deg_id = val.Substring(val.IndexOf("*") + 1);
            Session["user_id"] = user_id;

            //DataTable dt = dbhelper.getdata("select loc_id,deg_id, deg_text from account where id=" + user_id);
            string query = "select a.loc_id,a.ngalan, a.deg_id, a.deg_text, b.description,c.abbr  from account a " +
            "left join location b on a.loc_id=b.id " +
            "left join location_abbr c on a.loc_id=c.loc_id where a.id=" + user_id;
            DataTable dt = dbhelper.getdata(query);

            Session["property"] = dt.Rows[0]["loc_id"].ToString();
            Session["designation"] = dt.Rows[0]["deg_id"].ToString();
            Session["pro_name"] = dt.Rows[0]["description"].ToString();
            Session["pro_abbr"] = dt.Rows[0]["abbr"].ToString();
            Session["account_name"] = dt.Rows[0]["ngalan"].ToString();

            switch (val.Substring(0, val.IndexOf("-")))
            {
                case "HR":
                    Session["account"] = "hr";
                    Response.Redirect("dashboard");
                    break;
                case "HR_sub":
                    Session["account"] = "hr_sub";
                    Response.Redirect("appl");
                    break;
                case "Manager":
                    if (dt.Rows[0]["deg_text"].ToString().Length == 0)
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Contact Admin to set your designation'); window.location='quit'", true);
                    else
                    {
                        Session["account"] = "manager";
                        Response.Redirect("appl");
                    }
                    break;
            }
        }
        else
        { 
            lbl_msg.Text = "* Incorrect login account";
        }
    }
}