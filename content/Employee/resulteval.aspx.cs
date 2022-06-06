using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_Employee_resulteval : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            grid_view.DataBind();
            disp();
        }
    }

    protected void disp()
    {
        DataSet ds = bol.displayData("select replace(a.name,',',' ') name,convert(varchar,(select job_subject from jobs where id=a.job_id ),5000)  +'' + " +
       "case when convert(varchar,a.pos_desire,5000) is null then '' else replace(convert(varchar,a.pos_desire,5000),'|','') end pos_desire , * " +
       "from applicant a  left join ans_quest_eval b on a.id=b.app_id where a.status<>'cancel' and b.id is not null order by a.id desc"); 
        grid_view.DataSource = ds.Tables["table"];
        grid_view.DataBind();
        alert.Visible = grid_view.Rows.Count == 0 ? true : false;
    }

    protected void viewresult(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
           
            DataTable rate = dbhelper.getdata("select * from ans_quest_eval where app_id="+row.Cells[0].Text+"");
            DataTable source = dbhelper.getdata("select * from eval_source where app_id=" + row.Cells[0].Text + "");
            DataTable comment = dbhelper.getdata("select * from eval_comments where app_id=" + row.Cells[0].Text + "");
            if (rate.Rows.Count > 0 || source.Rows.Count > 0 || comment.Rows.Count > 0)
            {
                modalview.Style.Add("display", "block");
                foreach (DataRow dr in rate.Rows)
                {
                    ListView lv_rate = new ListView();
                    lv_rate.ID = "lv_rate" + dr["id"].ToString();
                    lv_rate.Controls.Add(new LiteralControl("<div class='oi'>"));
                    lv_rate.Controls.Add(new LiteralControl("<h5>"+ dr["quest"].ToString() + "</h5>"));
                    RadioButtonList rdl = new RadioButtonList();
                    rdl.ID = "star_" + dr["id"].ToString();
                    rdl.Attributes.Add("name", "rating_" + dr["id"].ToString());
                    rdl.RepeatDirection = RepeatDirection.Horizontal;
                    rdl.RepeatLayout = RepeatLayout.Flow;
                    rdl.Attributes.Add("class", "rating");
                    for (int i = 5; i >= 1; i--)
                    {
                        rdl.Items.Add(new ListItem(i.ToString(), i.ToString()));
                    }
                    rdl.Text = dr["rate"].ToString();
                    lv_rate.Controls.Add(rdl);
                    lv_pii.Controls.Add(lv_rate);
                    lv_rate.Controls.Add(new LiteralControl("</div>"));
                }

                ListView lv_source = new ListView();
                lv_source.ID = "lv_comment" + source.Rows[0]["id"].ToString();
                lv_source.Controls.Add(new LiteralControl("<h5>Source :<h5/>"));
                TextBox txt_s = new TextBox();
                txt_s.ID = "txt_comment" + source.Rows[0]["id"].ToString();
                txt_s.TextMode = TextBoxMode.MultiLine;
                txt_s.Text = source.Rows[0]["source"].ToString();
                txt_s.Attributes.Add("style", "resize:none;");
                txt_s.CssClass = "form-control";
                txt_s.Enabled = false;
                lv_source.Controls.Add(txt_s);
                lv_pii.Controls.Add(lv_source);



                ListView lv_comment = new ListView();
                lv_comment.ID = "lv_comment" + comment.Rows[0]["id"].ToString();
                lv_comment.Controls.Add(new LiteralControl("<h5>Comment :<h5/>"));
                TextBox txt = new TextBox();
                txt.ID = "txt_comment" + comment.Rows[0]["id"].ToString();
                txt.TextMode = TextBoxMode.MultiLine;
                txt.Text = comment.Rows[0]["comments"].ToString();
                txt.CssClass = "form-control";
                txt.Enabled = false;
                lv_comment.Controls.Add(txt);
                lv_pii.Controls.Add(lv_comment);
            }
            else
            {
                Response.Write("<script>alert('No Data Found!')</script>");
            }
        }
    }

    protected void search(object sender,EventArgs e)
    {
        if (txt_search.Text.Length != 0)
        {
            DataSet ds = bol.displayData("select replace(name,',',' ') name, * from applicant where status<>'cancel' and name like'%" + txt_search.Text + "%' or pos_desire like'%" + txt_search.Text + "%'  order by id desc");
            grid_view.DataSource = ds.Tables["table"];
            grid_view.DataBind();
        }
    }

    protected void add_close(object sender, EventArgs e)
    {
        Response.Redirect("evalresult", false);
    }

     
}