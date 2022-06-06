using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Text;

public partial class content_examineer_evaluation : System.Web.UI.Page
{
    public static DataTable dt, dt_rate;
    public static List<string> list = new List<string>();
    public static string very;
    public static int cnt = 11;

    protected void Page_Load(object sender, EventArgs e)
    {
        viewing();
     
        if (!IsPostBack)
            defaultdata();
    }

    protected void defaultdata()
    {
        DataTable source = dbhelper.getdata("select * from source where status is null");
        foreach (DataRow sr in source.Rows)
        {
            ddl_source.Items.Add(new ListItem(sr["description"].ToString()));
        }
    }

    public void viewing()
    {
        dt = dbhelper.getdata("select * from quest_eval where status is null order by id asc");
        foreach (DataRow dr in dt.Rows)
        {
            switch(dr["type"].ToString())
            {
                case"1":
                    RadioButtonList rdl = new RadioButtonList();
                    rdl.ID = "star_" + dr["id"].ToString();
                    rdl.Attributes.Add("name", "rating_" + dr["id"].ToString());
                    rdl.RepeatDirection = RepeatDirection.Horizontal;
                    rdl.RepeatLayout = RepeatLayout.Flow;
                    rdl.Attributes.Add("class", "rating");
                    lv_pii.Controls.Add(new LiteralControl(dr["quest"].ToString() + "<br/>"));
                    //for (int i = 5; i >= 1; i--)
                    //{
                    //      rdl.Items.Add(new ListItem(i.ToString(),i.ToString()));
                        
                    //}
                   
                    lv_pii.Controls.Add(rdl);
                    lv_pii.Controls.Add(new LiteralControl("<br/>"));
                    break;
            }

        }
    }

    public bool checkfields()
    {
        bool d = true;
        if (txt_comment.Text == "")
        {
            d = false;
            lbl_err_comment.Text = "*";
        }
        else
        {
            lbl_err_comment.Text = "";
        }
        if (ddl_source.Text == "Select")
        {
            d = false;
            lbl_err_source.Text = "*";
        }
        else
        {
            lbl_err_source.Text = "";
        }
        return d;
    }

    protected void click_save(object sender, EventArgs e)
    {

        //CheckBox cbl = (CheckBox)lv_pii.FindControl("chk_pii_" + drpr["id"].ToString()).FindControl("chk_pii_" + drpr["id"].ToString()).FindControl("chk_pii_" + drpr["id"].ToString());
        //RadioButtonList rl = new RadioButtonList();
        //rl.ID = "lv_pii_star_1";
        //Response.Write("<script>alert('"+rl.Text+"')</script>");

        if (checkfields())
        {
            Button1.Enabled = false;
            Button1.Visible = false;
            dt = dbhelper.getdata("select * from quest_eval where status is null order by id asc");
            foreach (DataRow dr in dt.Rows)
            {
                switch (dr["type"].ToString())
                {
                    case "1":
                        RadioButtonList rl = (RadioButtonList)lv_pii.FindControl("star_" + dr["id"].ToString());
                        string selected = (rl.SelectedValue.Length == 0 ? "0" : rl.SelectedValue).ToString();
                        DataTable insrate = dbhelper.getdata("insert into ans_quest_eval values(" + butyok.Decrypt(Request.QueryString["app_id"].ToString(),true) + ",'" + dr["quest"].ToString() + "'," + selected + ",'" + dr["type"].ToString() + "'," + dr["id"].ToString() + ")");
                        break;
                }
            }
            DataTable inscomment = dbhelper.getdata("insert into eval_comments values(" + butyok.Decrypt(Request.QueryString["app_id"].ToString(), true) + ",'" + txt_comment.Text.Replace("'", "''") + "')");
            DataTable inssource = dbhelper.getdata("insert into eval_source values(" + butyok.Decrypt(Request.QueryString["app_id"].ToString(), true) + ",'" + ddl_source.Text + "')");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully'); window.location='recruitment'", true);
        }
    }

}