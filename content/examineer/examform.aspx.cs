using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class content_examineer_examform : System.Web.UI.Page
{
    public static int cnt,second,dow=0,hhhe=0;
    public static int back_id=0,cc,cl=0;
    public static string quest_id, select_ans = "0", select_ans_text,hold_c;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
        {
            cc = 0;
            cnt = 0;
            Session.RemoveAll();
        }
        if (!IsPostBack)
        {
            disp();
        }
    }

    protected void disp()
    {
        hhhe = 1;
        DataTable dt = dbhelper.getdata("select * from examineer where app_id=" + Request.QueryString["app_id"].ToString() + " and e_id=" + Request.QueryString["e_id"].ToString() + " and mess_id=" + Request.QueryString["mess_id"].ToString() + " ");
        if (dt.Rows.Count > 0)
        {
            if (dow == 1)
            {
                lbl_mssg.Text = "Finish!";
            }
            if (dow == 2)
            {
                lbl_mssg.Text = "Time is Up!";
            }
            Session.RemoveAll();
            btn_back.Visible = false;
            button.Visible = false;
            cnt = 0;
            cc = 0;
            UpdateTimer.Enabled = false;
            string stat="";
            string query = "select (select COUNT(*) from examineer_answer where answer=corr_answer and ex_id=a.id and q_type<>'essay') as score " +
                           "from examineer a where id=" + dt.Rows[0]["id"].ToString() + "";
            DataTable getscore = dbhelper.getdata(query);
            DataTable quest = dbhelper.getdata("select (select count(*) from question where e_id=a.e_id)cnt, * from question a where e_id=" + dt.Rows[0]["e_id"].ToString() + "");
            DataTable examinition = dbhelper.getdata("select passing from examinition where id=" + dt.Rows[0]["e_id"].ToString() + " and status='1'");
            float score = (float.Parse(getscore.Rows[0]["score"].ToString()));
            float totalmultiplechoice = float.Parse(quest.Rows[0]["cnt"].ToString());
            lbl_score.Text = "Score:" + getscore.Rows[0]["score"].ToString() + "|" + (score >= (totalmultiplechoice) / 100 * float.Parse(examinition.Rows[0]["passing"].ToString()) ? "Passed" : "Failed").ToString();
            foreach(DataRow disp in quest.Rows)
            {
                DataTable ex_ans = dbhelper.getdata("select * from examineer_answer where q_id=" + disp["id"].ToString() + " and ex_id=" + dt.Rows[0]["id"].ToString() + "");
                lb_con.Controls.Add(new LiteralControl(disp["quest"].ToString() + "<br/>"));
                switch (disp["status"].ToString())
                {
                    case "1":
                        DataTable choices = dbhelper.getdata("select * from choices where q_id="+disp["id"].ToString()+" ");
                        //string[] choices = disp["choices"].ToString().Split(',');
                        RadioButtonList rdl = new RadioButtonList();
                        rdl.ID = "rbl_ll_" + disp["id"].ToString();
                        rdl.Attributes.Add("class", "b");
                        rdl.RepeatDirection = RepeatDirection.Horizontal;
                        rdl.RepeatLayout = RepeatLayout.Flow;
                        foreach (DataRow dtchoices in choices.Rows)
                        {
                            rdl.Items.Add(new ListItem(dtchoices["description"].ToString()));
                        }
                        if (ex_ans.Rows.Count > 0)
                        {
                            rdl.Text = ex_ans.Rows[0]["ans_text"].ToString();
                        }
                        rdl.Enabled = false;
                        lb_con.Controls.Add(rdl);
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
                    case "4":
                        DataTable tfs = dbhelper.getdata("select * from choices where q_id=" + disp["id"].ToString() + " ");
                        //string[] choices = disp["choices"].ToString().Split(',');
                        RadioButtonList tf = new RadioButtonList();
                        tf.ID = "rbl_ll_" + disp["id"].ToString();
                        tf.Attributes.Add("class", "b");
                        tf.RepeatDirection = RepeatDirection.Horizontal;
                        tf.RepeatLayout = RepeatLayout.Flow;
                        foreach (DataRow dtchoices in tfs.Rows)
                        {
                            tf.Items.Add(new ListItem(dtchoices["description"].ToString()));
                        }
                        if (ex_ans.Rows.Count > 0)
                        {
                            tf.Text = ex_ans.Rows[0]["ans_text"].ToString();
                        }
                        tf.Enabled = false;
                        lb_con.Controls.Add(tf);
                        break;
                    case"3":

                      


                        DataSet ds = dbhelper.despData("select * from question where e_id="+ Request.QueryString["e_id"].ToString() +" and status = '3' order by id desc","data");
                        grid_question.DataSource = ds.Tables["data"];
                        grid_question.DataBind();
                        //DataSet ds = dbhelper.despData("select * from examineer_answer where e_id=" + Request.QueryString["e_id"].ToString() + " and status = 'matchingtype'", "data");
                        //     grid_question.DataSource = ds.Tables["data"];
                        //     grid_question.DataBind();


                        break;
                }
                lb_con.Controls.Add(new LiteralControl("<br/>"));
            }
        }
        else
        {
            lb_con.Controls.Add(new LiteralControl("Direction: (Answer Carefully!)Test only."));
        }
    }
    protected void gv5(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string[] apl = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };

            GridView gv = (GridView)sender;

            if (gv.ID == "GridView5")
            {
                Label lbl_a = (Label)e.Row.FindControl("lbl_a");
                lbl_a.Text = apl[e.Row.RowIndex];
            }
            else
            {
                string sv = "select * from choices a left join question b on a.q_id=b.id where a.status='response' and a.q_id=" + e.Row.Cells[0].Text + " order by a.herarchy";
                DataSet ds = dbhelper.despData("select * from choices a left join question b on a.q_id=b.id where a.status='response' and a.q_id=" + e.Row.Cells[0].Text + " order by a.herarchy", "tbl");
                DataTable dt = ds.Tables["tbl"];
                DropDownList ddl_b = (DropDownList)e.Row.FindControl("ddl_b");

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    
                        ddl_b.Items.Insert(i, new ListItem(apl[i], dt.Rows[i]["description"].ToString()));
                   
                }


            }
        }
    }
    protected void next()
    {
        if (button.Text == "Next")
        {

            if (lbl_qid.Text.Length != 0)
            {
                DataTable selectexamineerans = dbhelper.getdata("select * from examineer_answer where ex_id=" + Session["ex_id"].ToString() + "");
                if (lbl_essay.Text == "1" || lbl_essay.Text == "4")
                {

                    DataTable rbl = dbhelper.getdata("insert into examineer_answer (date,ex_id,q_id,answer,herarchy,corr_answer,essay_ans,question_text,ans_text,correct_ans_text,choices,q_type)values(getdate()," + Session["ex_id"].ToString() + "," + lbl_qid.Text + "," + select_ans + "," + selectexamineerans.Rows.Count + "," + lbl_coransid.Text + ",NULL,'" + lbl_questiontext.Text + "','" + select_ans_text + "','" + lbl_corranstext.Text + "','" + hold_c + "','choices')");
                    btn_back.Visible = true;
                    RadioButtonList1.Items.Clear();
                }
                if (lbl_essay.Text == "2")
                {
                    DataTable ess = dbhelper.getdata("insert into examineer_answer (date,ex_id,q_id,answer,herarchy,corr_answer,essay_ans,question_text,q_type)values(getdate()," + Session["ex_id"].ToString() + "," + lbl_qid.Text + ",1," + selectexamineerans.Rows.Count + "," + lbl_coransid.Text + ",'" + txt_essay.Text + "','" + lbl_questiontext.Text + "','essay')");
                    btn_back.Visible = true;
                    txt_essay.Visible = false;
                }
                if (lbl_essay.Text == "3")
                {
                    int cn = 1;
                    GridView gv = (GridView)grid_question.Rows[0].FindControl("GridView4");
                    foreach (GridViewRow row in gv.Rows)
                    {
                        hold_c = "";
                        DropDownList dl = (DropDownList)row.FindControl("ddl_b");
                        foreach (ListItem li in dl.Items)
                        {
                            hold_c += li.Value + ",";
                        }

                        DataTable rbl = dbhelper.getdata("insert into examineer_answer (date,ex_id,q_id,answer,herarchy,corr_answer,essay_ans,question_text,ans_text,correct_ans_text,choices,q_type)values"+
                        "(getdate()," + Session["ex_id"].ToString() + "," + lbl_qid.Text + "," + row.Cells[1].Text + "," + cn + "," + row.Cells[2].Text + ",NULL,'" + lbl_questiontext.Text + "','" + dl.SelectedValue + "','" + row.Cells[2].Text + "','" + hold_c.Substring(0, hold_c.Length - 1) + "','matchingtype')");
                      
                        cn++;

                    }
                    grid_question.DataSource = null;
                    grid_question.DataBind(); 
                
                }
            }
            hold_c = "";
            cnt++;
            //displayside
            if (cc < grid_disp.Rows.Count)
            {
              
                lb_con.Controls.Add(new LiteralControl(grid_disp.Rows[cc].Cells[2].Text));
                lb_con.Controls.Add(new LiteralControl("<br/>"));
                DataTable dtchoices = dbhelper.getdata("select * from choices where q_id=" + grid_disp.Rows[cc].Cells[0].Text + " and status='1'");
                switch (grid_disp.Rows[cc].Cells[4].Text)
                {
                    case "1":
                            RadioButtonList1.RepeatDirection = RepeatDirection.Horizontal;
                            foreach (DataRow row5 in dtchoices.Rows)
                            {
                                txt_essay.Visible = false;
                                RadioButtonList1.Items.Add(new ListItem(row5["description"].ToString(), row5["id"].ToString()));
                                if (grid_disp.Rows[cc].Cells[3].Text == row5["id"].ToString())
                                    lbl_corranstext.Text = row5["description"].ToString();
                                    hold_c += row5["description"].ToString() + ",";
                            }
                            hold_c = hold_c.Substring(0, hold_c.LastIndexOf(','));
                        break;
                    case "2":
                            txt_essay.Visible = true;
                             break;
        //            case "3":
        //                     string[] apl = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
        //                     string sv = "select * from choices a left join question b on a.q_id=b.id where a.status='response' and a.q_id=" + grid_disp.Rows[cc].Cells[0].Text + " order by a.herarchy";
        //                     DataSet ds = dbhelper.despData("select * from choices a left join question b on a.q_id=b.id where a.status='response' and a.q_id=" + grid_disp.Rows[cc].Cells[0].Text + " order by a.herarchy", "tbl");
        //        DataTable dt = ds.Tables["tbl"];
        //        DropDownList ddl_b = (DropDownList)GridView4.FindControl("ddl_b");

        //        for (int i = 0; i < dt.Rows.Count; i++)
        //            ddl_b.Items.Insert(i, new ListItem(apl[i], dt.Rows[i]["description"].ToString()));
        //        ddl_b.SelectedValue = "0";
        ////                     DataSet ds = dbhelper.despData("select * from question where e_id="+ Request.QueryString["id"].ToString() +" and status <> '0' order by id desc","data");
        ////grid_question.DataSource = ds.Tables["data"];
        ////grid_question.DataBind();
        //                     break;
                    case "4":
                             RadioButtonList1.RepeatDirection = RepeatDirection.Horizontal;
                             foreach (DataRow row5 in dtchoices.Rows)
                             {
                                 txt_essay.Visible = false;
                                 RadioButtonList1.Items.Add(new ListItem(row5["description"].ToString(), row5["id"].ToString()));
                                 if (grid_disp.Rows[cc].Cells[3].Text == row5["id"].ToString())
                                     lbl_corranstext.Text = row5["description"].ToString();
                                 hold_c += row5["description"].ToString() + ",";
                             }
                             hold_c = hold_c.Substring(0, hold_c.LastIndexOf(','));
                             break;
                    case "3":
                             DataSet ds = dbhelper.despData("select * from question where e_id=" + Request.QueryString["e_id"].ToString() + " and status = '3'", "data");
                             grid_question.DataSource = ds.Tables["data"];
                             grid_question.DataBind();


                             break;

                }
                lbl_essay.Text = grid_disp.Rows[cc].Cells[4].Text;
                lbl_qid.Text = grid_disp.Rows[cc].Cells[0].Text;
                lbl_qid2.Text = grid_disp.Rows[cc].Cells[0].Text;
                lbl_coransid.Text = grid_disp.Rows[cc].Cells[3].Text;
                lbl_questiontext.Text = grid_disp.Rows[cc].Cells[2].Text;
                button.Width = 250;
               
            }
            else
            {
                dow = 1;
                Response.Redirect("exmrfrm?e_id=" + Request.QueryString["e_id"].ToString() + "&app_id=" + Request.QueryString["app_id"].ToString() + "&mess_id=" + Request.QueryString["mess_id"].ToString() + "");
               
                Session.RemoveAll();
                btn_back.Visible = false;
                button.Enabled = false;
                cnt = 0;
                cc = 0;
                back_id = 0;
            }
        }
    }
    protected void button_Click(object sender, EventArgs e)
    {
        DataTable dtran = dbhelper.getdata("select * from question where e_id=" + Request.QueryString["e_id"].ToString() + "  and (status='1' or status='2' or status='4' or status='3')  ORDER BY status desc,NEWID()");
        if (button.Text == "Start")
        {
            DataTable insertexamineer = dbhelper.getdata("insert into examineer (date,e_id,app_id,mess_id,noofitems)values(getdate()," + Request.QueryString["e_id"].ToString() + "," + Request.QueryString["app_id"].ToString() + "," + Request.QueryString["mess_id"].ToString() + "," + dtran.Rows.Count + ") select scope_identity() id ");
            Session["ex_id"] = insertexamineer.Rows[0]["id"].ToString();
            DataTable selectexamination = dbhelper.getdata("select * from examinition where id=" + Request.QueryString["e_id"].ToString() + "");
            string[] timelimit = selectexamination.Rows[0]["time_limit"].ToString().Split(':');
            UpdateTimer.Enabled = true;
            Session["sec"] = 0;
            Session["min"] = int.Parse(timelimit[1].ToString());
            Session["hour"] = int.Parse(timelimit[0].ToString());
            Session["timeout"] = 0;

        }
        button.Text = "Next";
        if (cnt <= 0)
        {
            Session["c"] = 0;
        }
        else
        {
            Session["c"] = int.Parse(Session["c"].ToString()) + 1;
        }
        cc = int.Parse(Session["c"].ToString());
        lb_con.Controls.Clear();
        if (grid_disp.Rows.Count == 0)
        {
            grid_disp.DataSource = dtran;
            grid_disp.DataBind();
        }
        if (lbl_qid2.Text == "")
        {
            lbl_qid2.Text = "0";
        }
        select_ans = RadioButtonList1.SelectedValue == "" ? "0" : RadioButtonList1.SelectedValue;
        select_ans_text = RadioButtonList1.SelectedValue == "" ? "0" : RadioButtonList1.SelectedItem.Text;
        DataTable ifnaa = dbhelper.getdata("select * from examineer a left join examineer_answer b on a.id=b.ex_id where a.app_id=" + Request.QueryString["app_id"].ToString() + " and a.e_id=" + Request.QueryString["e_id"].ToString() + " and b.q_id=" + lbl_qid2.Text + "");
        if (ifnaa.Rows.Count > 0)
        {
            if (ifnaa.Rows[0]["q_type"].ToString() == "choices")
            {
                DataTable dtupdate = dbhelper.getdata("update examineer_answer set answer=" + select_ans + ",ans_text='" + select_ans_text + "' where ex_id=" + ifnaa.Rows[0]["id"].ToString() + " and q_id=" + ifnaa.Rows[0]["q_id"].ToString() + " ");
            }
            if (ifnaa.Rows[0]["q_type"].ToString() == "essay")
            {
                DataTable dtess= dbhelper.getdata("update examineer_answer set essay_ans='"+txt_essay.Text+"' where ex_id=" + ifnaa.Rows[0]["id"].ToString() + " and q_id=" + ifnaa.Rows[0]["q_id"].ToString() + " ");
            }
            DataTable dtchoices = dbhelper.getdata("select * from choices where q_id=" + grid_disp.Rows[cc].Cells[0].Text + "");
            DataTable ifexist = dbhelper.getdata("select * from examineer_answer where q_id=" + grid_disp.Rows[cc].Cells[0].Text + " and ex_id=" + Session["ex_id"].ToString() + "");
            lb_con.Controls.Add(new LiteralControl(grid_disp.Rows[cc].Cells[2].Text));
            lb_con.Controls.Add(new LiteralControl("<br/>"));
            switch (grid_disp.Rows[cc].Cells[4].Text)
            {
                case "1":
                    txt_essay.Visible = false;
                    RadioButtonList1.Items.Clear();
                    RadioButtonList1.RepeatDirection = RepeatDirection.Horizontal;
                    foreach (DataRow row5 in dtchoices.Rows)
                    {
                        RadioButtonList1.Items.Add(new ListItem(row5["description"].ToString(), row5["id"].ToString()));
                    }
                    if (ifexist.Rows.Count > 0)
                    {
                        if (ifexist.Rows[0]["answer"].ToString() != "0")
                        {
                            RadioButtonList1.SelectedValue = ifexist.Rows[0]["answer"].ToString();
                        }
                    }
                
                    break;
                case"2":
                    RadioButtonList1.Items.Clear();
                    txt_essay.Visible = true;
                    if (ifexist.Rows.Count > 0)
                    {
                        txt_essay.Text = ifexist.Rows[0]["essay_ans"].ToString();
                    }
                    break;
                case "4":
                    txt_essay.Visible = false;
                    RadioButtonList1.Items.Clear();
                    RadioButtonList1.RepeatDirection = RepeatDirection.Horizontal;
                    foreach (DataRow row5 in dtchoices.Rows)
                    {
                        RadioButtonList1.Items.Add(new ListItem(row5["description"].ToString(), row5["id"].ToString()));
                    }
                    if (ifexist.Rows.Count > 0)
                    {
                        if (ifexist.Rows[0]["answer"].ToString() != "0")
                        {
                            RadioButtonList1.SelectedValue = ifexist.Rows[0]["answer"].ToString();
                        }
                    }
                    break;
                case "3":
                    DataSet ds = dbhelper.despData("select * from question where e_id=" + Request.QueryString["e_id"].ToString() + " and status <> '0' order by id desc", "data");
                    grid_question.DataSource = ds.Tables["data"];
                    grid_question.DataBind();

                    break;

            }
            lbl_qid2.Text = grid_disp.Rows[cc].Cells[0].Text;
        }
        else
        {
            next();
        }
    
    }
    protected void button_back(object sender, EventArgs e)
    {
       
            lb_con.Controls.Clear();
            RadioButtonList1.Items.Clear();
            DataTable dtran = new DataTable();
            lb_con.Controls.Clear();
            if (cc > 0)
            {
                Session["c"] = int.Parse(Session["c"].ToString()) - 1;
            }
            cc = int.Parse(Session["c"].ToString());

            dtran = dbhelper.getdata("select * from examineer_answer where ex_id=" + Session["ex_id"].ToString() + " and q_id=" + grid_disp.Rows[cc].Cells[0].Text + " ");
            DataTable dtchoices = dbhelper.getdata("select * from choices where q_id=" + grid_disp.Rows[cc].Cells[0].Text + "");
            lb_con.Controls.Add(new LiteralControl(grid_disp.Rows[cc].Cells[2].Text));
            switch (grid_disp.Rows[cc].Cells[4].Text)
            {
                case "1":
                    txt_essay.Visible = false;
                    RadioButtonList1.RepeatDirection = RepeatDirection.Horizontal;
                    foreach (DataRow row5 in dtchoices.Rows)
                    {
                        RadioButtonList1.Items.Add(new ListItem(row5["description"].ToString(), row5["id"].ToString()));
                    }
                    if (dtran.Rows[0]["answer"].ToString() != "0")
                    {
                        RadioButtonList1.SelectedValue = dtran.Rows[0]["answer"].ToString();
                    }
                   
                    button.Width = 250;
                    break;
                case"2":
                    txt_essay.Visible = true;
                    txt_essay.Text = dtran.Rows[0]["essay_ans"].ToString();
                    break;
                case "4":
                    txt_essay.Visible = false;
                    RadioButtonList1.RepeatDirection = RepeatDirection.Horizontal;
                    foreach (DataRow row5 in dtchoices.Rows)
                    {
                        RadioButtonList1.Items.Add(new ListItem(row5["description"].ToString(), row5["id"].ToString()));
                    }
                    if (dtran.Rows[0]["answer"].ToString() != "0")
                    {
                        RadioButtonList1.SelectedValue = dtran.Rows[0]["answer"].ToString();
                    }

                    button.Width = 250;
                    break;
                case "3":
                    DataSet ds = dbhelper.despData("select * from question where e_id=" + Request.QueryString["e_id"].ToString() + " and status <> '0' order by id desc", "data");
                    grid_question.DataSource = ds.Tables["data"];
                    grid_question.DataBind();
                    break;
            }
         lbl_qid2.Text = grid_disp.Rows[cc].Cells[0].Text;
    }
    protected void button_Review(object sender, EventArgs e)
    {
        DataTable dtdisp = dbhelper.getdata("select * from question where e_id=" + Request.QueryString["e_id"].ToString() + " and (status='1' or status='2')  order by herarchy asc");
        foreach (DataRow disp in dtdisp.Rows)
        {
            lb_con.Controls.Add(new LiteralControl(disp["quest"].ToString() + "<br/>"));
            DataTable dtch = dbhelper.getdata("select * from choices where q_id=" + disp["id"].ToString() + "");
            RadioButtonList rdl = new RadioButtonList();
            rdl.ID = "rbl_ll_" + disp["id"].ToString();
            rdl.RepeatDirection = RepeatDirection.Horizontal;
            rdl.Attributes.Add("class", "b");
            foreach (DataRow dtchoices in dtch.Rows)
            {
                rdl.Items.Add(new ListItem(dtchoices["description"].ToString(), dtchoices["id"].ToString()));
            }
            DataTable dtans = dbhelper.getdata("select * from examineer_answer where q_id=" + disp["id"].ToString() + "");
            rdl.SelectedValue = dtans.Rows[0]["answer"].ToString();
            lb_con.Controls.Add(rdl);
        }
    }
    protected void UpdateTimer_Tick(object sender, EventArgs e)
    {
        if (Session["timeout"].ToString() == "0")
        {
            int hour = int.Parse(Session["hour"].ToString());
            int min = int.Parse(Session["min"].ToString());
            int sec = int.Parse(Session["sec"].ToString());
            if (hour == 0 && min <= 5)
            {
                if (cl == 0)
                {
                    DateStampLabel.Attributes.Add("style", "color:red; text-decoration:blink; font-weight:bold; font-size:xx-large;");
                    cl = 1;
                }
                else
                {
                    DateStampLabel.Attributes.Add("style", "color:Maroon; text-decoration:blink; font-weight:bold; font-size:xx-large;");
                    cl = 0;
                }
            }
            if (hour == 0 && min == 0 && sec == 0)
            {
                Session["timeout"] = 1;
                dow = 2;
                Response.Redirect("exmrfrm?e_id=" + Request.QueryString["e_id"].ToString() + "&app_id=" + Request.QueryString["app_id"].ToString() + "&mess_id=" + Request.QueryString["mess_id"].ToString() + "");

            }
            else
            {
                DateStampLabel.Text = "Hour:" + hour + " Min:" + min + " sec:" + sec;
                if (sec > 0)
                {
                    Session["sec"] = (int.Parse(Session["sec"].ToString()) - 1);
                    sec = int.Parse(Session["sec"].ToString());
                    DateStampLabel.Text = "Hour:" + hour + " Min:" + min + " sec:" + sec;
                }
                else
                {
                    if (sec == 0)
                    {
                        Session["min"] = (int.Parse(Session["min"].ToString()) - 1);
                        if (min == 0)
                        {
                            Session["hour"] = (int.Parse(Session["hour"].ToString()) - 1);
                            Session["min"] = 60;
                            DateStampLabel.Text = "Hour:" + hour + " Min:" + min + " sec:" + sec;
                        }
                        else
                        {
                            Session["sec"] = 60;
                            DateStampLabel.Text = "Hour:" + hour + " Min:" + min + " sec:" + sec;
                        }
                    }
                }
            }
        }
    }
    protected void grid_bound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           // Label lb = (Label)e.Row.FindControl("lbl_questiongrid");
          //  lb.Text = lb.Text.Replace("\n", "<br/>");

            GridView gv = (GridView)e.Row.FindControl("grid_choices");
            DataSet ds = dbhelper.despData("select * from choices a left join question b on a.q_id=b.id where a.q_id=" + e.Row.Cells[1].Text, "tbl");
            gv.DataSource = ds.Tables["tbl"];
            gv.DataBind();

            gv = (GridView)e.Row.FindControl("GridView4");
            ds = dbhelper.despData("select a.id,  c.answer, * from choices a left join question b on a.q_id=b.id left join mt_ans c on a.id=c.c_id where a.status='premise' and a.q_id=" + e.Row.Cells[1].Text, "tbl");
            gv.DataSource = ds.Tables["tbl"];
            gv.DataBind();

            gv = (GridView)e.Row.FindControl("GridView5");
            ds = dbhelper.despData("select a.id,* from choices a left join question b on a.q_id=b.id where a.status='response' and a.q_id=" + e.Row.Cells[1].Text, "tbl");
            gv.DataSource = ds.Tables["tbl"];
            gv.DataBind();

            //Panel pl_a = (Panel)e.Row.FindControl("pl_a");
            //Panel pl_b = (Panel)e.Row.FindControl("pl_b");
            //LinkButton lnk_edit = (LinkButton)e.Row.FindControl("lnk_edit");
            //if (lnk_edit.CommandName == "3")
            //{
            //    pl_a.Visible = false;
            //    pl_b.Visible = true;
            //}
            //else
            //{
            //    pl_a.Visible = true;
            //    pl_b.Visible = false;
            //}
        }
    }
    protected void grid_bound_sub(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            RadioButton rb = (RadioButton)e.Row.FindControl("rb");
            bool pass = false;
            string[] m = e.Row.Cells[1].Text.Split(',');

            foreach (string val in m)
            {
                pass = val == e.Row.Cells[0].Text ? true : false;
                if (pass)
                    break;
            }

            if (pass)
                rb.Checked = true;
            else
                rb.Enabled = false;
        }
    }
}