using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_examineer_viewansweredform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("quit");
        if (!IsPostBack)
        {
            disp();
        }
    }
    protected void disp()
    {
        DataTable dtans = dbhelper.getdata("select * from examineer where  id=" + Request.QueryString["ex_id"].ToString() + "");
        DataTable quest = dbhelper.getdata("select * from question where e_id=" + dtans.Rows[0]["e_id"].ToString() + "");
        foreach (DataRow disp in quest.Rows)
        {
            DataTable ex_ans = dbhelper.getdata("select * from examineer_answer where q_id=" + disp["id"].ToString() + " and ex_id=" + dtans.Rows[0]["id"].ToString() + "");
            lb_con.Controls.Add(new LiteralControl(disp["quest"].ToString() + "<br/>"));
            switch (disp["status"].ToString())
            {
                case "1":
                    DataTable choices = dbhelper.getdata("select * from choices where q_id=" + disp["id"].ToString() + " ");
                    //string[] choices = disp["choices"].ToString().Split(',');
                    RadioButtonList rdl = new RadioButtonList();
                    Label lbl = new Label();
                    rdl.ID = "rbl_ll_" + disp["id"].ToString();
                    rdl.Attributes.Add("class", "b");
                    foreach (DataRow dtchoices in choices.Rows)
                    {
                     
                        rdl.Items.Add(new ListItem(dtchoices["description"].ToString()));
                        if (disp["answer"].ToString() == dtchoices["id"].ToString())
                        {
                            lbl.ID = "lbl_lbl" + disp["id"].ToString();
                            lbl.Text = "Correct Answer:" + dtchoices["description"].ToString();
                            lbl.Attributes.Add("class", "label");
                        }
                    }
                    if (ex_ans.Rows.Count > 0)
                    {
                        rdl.Text = ex_ans.Rows[0]["ans_text"].ToString();
                    }
                    rdl.Enabled = false;
                    lb_con.Controls.Add(rdl);
                    lb_con.Controls.Add(lbl);
                    lb_con.Controls.Add(new LiteralControl("<br/>"));
                    break;
                case "2":
                    TextBox txt = new TextBox();
                    txt.ID = "txt_essay_" + disp["id"].ToString();
                    txt.TextMode = TextBoxMode.MultiLine;
                    txt.Attributes.Add("style", "resize:none");
                    if (ex_ans.Rows.Count > 0)
                    {
                        txt.Text = ex_ans.Rows[0]["essay_ans"].ToString();
                    }
                    txt.Enabled = false;
                    lb_con.Controls.Add(txt);
                    break;
            }
        }
        //DataTable dtans = dbhelper.getdata("select * from examineer_answer where  ex_id=" + Request.QueryString["ex_id"].ToString() + "");
        //foreach (DataRow disp in dtans.Rows)
        //{
        //    lb_con.Controls.Add(new LiteralControl(disp["question_text"].ToString() + "<br/>"));
        //    switch (disp["q_type"].ToString())
        //    {
        //        case "choices":
        //            string[] choices = disp["choices"].ToString().Split(',');
        //            RadioButtonList rdl = new RadioButtonList();
        //            rdl.ID = "rbl_ll_" + disp["id"].ToString();
        //            rdl.Attributes.Add("class", "b");
        //            foreach (string dtchoices in choices)
        //            {
        //                rdl.Items.Add(new ListItem(dtchoices.ToString()));
        //            }
        //            rdl.Text = disp["ans_text"].ToString();
        //            rdl.Enabled = false;
        //            lb_con.Controls.Add(rdl);
        //            Label lbl = new Label();
        //            lbl.ID = "lbl_lbl" + disp["id"].ToString();
        //            lbl.Text = "Correct Answer:" + disp["correct_ans_text"].ToString();
        //            lbl.Attributes.Add("class", "label");
        //            lb_con.Controls.Add(lbl);
        //            break;
        //        case "essay":
        //            TextBox txt = new TextBox();
        //            txt.ID = "txt_essay_" + disp["id"].ToString();
        //            txt.TextMode = TextBoxMode.MultiLine;
        //            txt.Attributes.Add("style", "resize:none");
        //            txt.Text = disp["essay_ans"].ToString();
        //            txt.Enabled = false;
        //            lb_con.Controls.Add(txt);
        //            break;
        //    }
        //    lb_con.Controls.Add(new LiteralControl("<br/>"));
        //}
     
    }
      
}