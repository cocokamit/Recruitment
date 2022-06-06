using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_examineer_questionnaire : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("quit");

        if (!IsPostBack)
        {
            gridviewrow();
            display();
        }
    }

    protected void click_match_edit(object sender, EventArgs e)
    {
        GridView1.Columns[2].Visible = true;
        GridView1.Enabled = true;
        GridView1.FooterRow.Visible = true;
        GridView2.Columns[2].Visible = true;
        GridView2.Enabled = true;
        GridView2.FooterRow.Visible = true;
        fs_answer.Visible = false;
        btn_edit.Visible = false;
        btn_save.Text = "Continue";
        ddl_type.SelectedValue = "3";
    }
    
    protected void click_delete(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {

            if (TextBox11.Text == "Yes")
            {
                dbhelper.getdata("update question set status=0 where id=" + row.Cells[2].Text);
                display();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully Deleted');", true);
            }
        }
    }

    protected DataTable typetf()
    {
        DataTable dt = (DataTable)ViewState["item"];
        DataRow dr = null;

        dt.Clear();
        dr = dt.NewRow();
        dr["RowNumber"] = 1;
        dr["col_0"] = "0";
        dr["col_1"] = "True";
        dr["col_2"] = rbl_tf.SelectedValue == "True" ? "yes" : "no";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["RowNumber"] = 2;
        dr["col_0"] = "0";
        dr["col_1"] = "False";
        dr["col_2"] = rbl_tf.SelectedValue == "False" ? "yes" : "no";
        dt.Rows.Add(dr);

        return dt;
    }

    protected void click_save(object sender, EventArgs e)
    {
        DataTable aa = (DataTable)ViewState["item"];
        DataTable bb = (DataTable)ViewState["premise"];
        DataTable cc = (DataTable)ViewState["response"];

        if (txt_question.Text.Trim().Length == 0)
        {
            if (ddl_type.SelectedValue == "1" || ddl_type.SelectedValue == "4")
            {
                lbl_msg.Text = "* Please input question";
            }
            else
                lbl_msg.Text = "* Please input instruction";
        }
        else
        {

            string query = null;
            string answer = "no";
            if(hf_command.Value != "edit")
                setrow();
            DataTable table = (DataTable)ViewState["item"];

            if (btn_save.Text == "Add")
            {
                switch (ddl_type.SelectedValue)
                {
                    case "4":
                        DataTable dt = typetf();
                        break;
                    case "3":
                        DataTable dtCurrentTable = (DataTable)ViewState["item"];
                        DataRow drCurrentRow = null;

                        int rowIndex = 0;
                        for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                        {
                            Label txt_discription = (Label)GridView3.Rows[rowIndex].Cells[1].FindControl("txt_discription");
                            DropDownList ddl_response = (DropDownList)GridView3.Rows[rowIndex].Cells[2].FindControl("ddl_response");

                            drCurrentRow = dtCurrentTable.NewRow();
                            drCurrentRow["RowNumber"] = i;
                            dtCurrentTable.Rows[i - 1]["col_0"] = txt_discription.Text;
                            dtCurrentTable.Rows[i - 1]["col_1"] = ddl_response.Text;
                            rowIndex++;

                        }
                        ViewState["item"] = dtCurrentTable;
                        break;
                }

                foreach (DataRow row in table.Rows)
                {
                    if (row.ItemArray[3] as string == "yes")
                        answer = "yes";
                }

                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please input choices');", true);
                if (answer == "no" && ddl_type.SelectedValue == "1" || answer == "no" && ddl_type.SelectedValue == "4")
                    lbl_msg.Text = "* Please input choices";
                else
                {

                    stateclass a = new stateclass();
                    a.a = Request.QueryString["id"].ToString();//need to supply
                    a.b = txt_question.Text;
                    a.c = "1";
                    a.aa = 1;
                    a.e = ddl_type.SelectedValue;
                    int x = bol.Question(a);

                    if (ddl_type.SelectedValue == "1" || ddl_type.SelectedValue == "4")
                    {
                        foreach (DataRow row in table.Rows)
                        {
                            if (row.ItemArray[2].ToString().Length > 0)
                            {
                                a.aa = x;
                                a.b = row.ItemArray[2] as string;
                                a.bb = int.Parse(row.ItemArray[0] as string);
                                a.d = "1";
                                a.e = row.ItemArray[3] as string;
                                string y = bol.Choices(a);
                                if (y != "0")
                                {
                                    query = "update question set answer='" + y + "' where id=" + x + "";
                                    dbhelper.getdata(query);
                                }
                            }
                        }
                    }
                    else
                    {
                        foreach (DataRow row in table.Rows)
                        {
                            a.aa = x;
                            a.b = row.ItemArray[1] as string;
                            a.bb = int.Parse(row.ItemArray[0] as string);
                            a.d = "premise";//status
                            a.e = row.ItemArray[2] as string;
                            bol.Choices(a);
                        }

                        DataTable dt = (DataTable)ViewState["response"];
                        foreach (DataRow row in dt.Rows)
                        {
                            a.aa = x;
                            a.b = row.ItemArray[1] as string;
                            a.bb = int.Parse(row.ItemArray[0] as string);
                            a.d = "response";//status
                            a.e = "0";
                            bol.Choices(a);
                        }
                    }
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='questionnaire?id=" + Request.QueryString["id"].ToString() + "'", true);
                }
            }
            else if (btn_save.Text == "Continue")
            {
                lbl_msg.Text = "";
                if (sr("premise") + sr("response") == 0)
                {
                    GridView1.Columns[2].Visible = false;
                    GridView1.Enabled = false;
                    GridView1.FooterRow.Visible = false;
                    GridView2.Columns[2].Visible = false;
                    GridView2.Enabled = false;
                    GridView2.FooterRow.Visible = false;
                    fs_answer.Visible = true;
                    btn_edit.Visible = true;
                    btn_save.Text = hf_command.Value == "edit" ? "Save" : "Add";

                    DataTable dt = (DataTable)ViewState["item"];
                    DataTable dtref = dt.Copy();
                    DataTable dtpre = (DataTable)ViewState["premise"];
                    DataTable dtres = (DataTable)ViewState["response"];
                    DataRow dr = null;


                    dt.Clear();
                    for (int i = 0; i < dtpre.Rows.Count; i++)
                    {
                        dr = dt.NewRow();
                        dr["RowNumber"] = i + 1;
                        dr["col_0"] = dtpre.Rows[i]["col_0"].ToString();
                        try
                        {
                            dr["col_1"] = dtref.Rows[i]["col_1"].ToString().Length == 0 ? "" : dtref.Rows[i]["col_1"].ToString();
                        }
                        catch
                        {
                            dr["col_1"] = "0";
                        }
                        dt.Rows.Add(dr);
                    }


                    ViewState["item"] = dt;
                    GridView3.DataSource = dt;
                    GridView3.DataBind();

                    
                }
                else
                    lbl_msg.Text = "* Please complete all column fields";
            }
            else
            {
                if (hf_command.Value == "edit")
                {
                    DataTable dtCurrentTable = (DataTable)ViewState["item"];
                    DataRow drCurrentRow = null;

                    int rowIndex = 0;
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        Label txt_discription = (Label)GridView3.Rows[rowIndex].Cells[1].FindControl("txt_discription");
                        DropDownList ddl_response = (DropDownList)GridView3.Rows[rowIndex].Cells[2].FindControl("ddl_response");

                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["RowNumber"] = i;
                        dtCurrentTable.Rows[i - 1]["col_0"] = txt_discription.Text;
                        dtCurrentTable.Rows[i - 1]["col_2"] = dtCurrentTable.Rows[i - 1]["col_1"];
                        dtCurrentTable.Rows[i - 1]["col_1"] = ddl_response.Text;
                        rowIndex++;

                    }
                    ViewState["item"] = dtCurrentTable;

                    query += "update question set quest='" + txt_question.Text + "' where id= " + hf_id.Value +" ";
                    int cnt = 0;

                    DataTable dtpre = (DataTable)ViewState["premise"];
                    DataTable dtres = (DataTable)ViewState["response"];

                    foreach (DataRow row in dtCurrentTable.Rows)
                    {
                        string ss = row.ItemArray[3].ToString();
                        if (row.ItemArray[3].ToString() == "0")
                        {
                            query += "insert into choices (q_id,[description],herarchy,[status]) values (" + hf_id.Value + ",'" + row.ItemArray[1] as string + "',1,'premise') ";
                            query += "insert into mt_ans values (SCOPE_IDENTITY(),'" + row.ItemArray[1] as string + "') ";
                        }
                        else
                        {
                            query += "update choices set description='" + row.ItemArray[1] as string + "' where id= " + dtpre.Rows[cnt][2].ToString()+" ";
                            query += "update mt_ans set answer='" + row.ItemArray[1] as string + "' where c_id=" + dtpre.Rows[cnt][2].ToString() + " ";
                        }
                        cnt++;
                    }

                    foreach (DataRow row in dtres.Rows)
                    {
                        if (row.ItemArray[2].ToString().Length == 0)
                            query += "insert into choices (q_id,[description],herarchy,[status]) values (" + hf_id.Value + ",'" + row.ItemArray[1] as string + "',1,'response') ";
                        else
                            query += "update choices set description='" + row.ItemArray[1] as string + "' where id= " + row.ItemArray[2] as string + " ";
                    }
                    dbhelper.getdata(query + " " + hf_status.Value);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='questionnaire?id=" + Request.QueryString["id"].ToString() + "'", true);
                }
                else
                {
                    int cnt = 0;
                    switch (ddl_type.SelectedValue)
                    {
                        case "4":
                            foreach (DataRow row in table.Rows)
                            {
                                if (row.ItemArray[3] as string == "0")
                                    answer = row.ItemArray[1] as string;
                            }
                            cnt = 1;
                            break;
                        default:
                            foreach (DataRow row in table.Rows)
                            {
                                if (row.ItemArray[3] as string == "yes")
                                {
                                    answer = cnt == 0 ? row.ItemArray[1] as string : answer + "," + row.ItemArray[1] as string;
                                    cnt++;
                                }

                                if (row.ItemArray[1].ToString().Length == 0)
                                {
                                    answer = row.ItemArray[3] as string == "yes" ? "new" : answer;
                                    query += " declare @id int insert into choices (q_id,[description],herarchy,[status]) values (" + hf_id.Value + ",'" + row.ItemArray[2] as string + "',1,1) set @id = SCOPE_IDENTITY()";
                                }
                                else
                                    query += "update choices set description='" + row.ItemArray[2] as string + "' where id= " + row.ItemArray[1] as string;
                            }
                            break;
                    }

                    if (cnt == 1)
                    {

                        answer = answer == "new" ? "@id " : answer;
                        query += "update question set quest='" + txt_question.Text + "',answer=" + answer + " where id= " + hf_id.Value;

                        if (answer == "no" && ddl_type.SelectedValue == "1")
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please input choices');", true);
                        else
                        {
                            dbhelper.getdata(query + " " + hf_status.Value);
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='questionnaire?id=" + Request.QueryString["id"].ToString() + "'", true);
                        }

                    }
                    else
                        lbl_msg.Text = "Pls pick one";
                }
            }
        }
    }

    protected void ddl_change(object sender, EventArgs e)
    {
        if (ddl_type.SelectedValue == "1")
        {
            lbl_qi.Text = "Question";
            li_grid.Visible = true;
            li_rbl.Visible = false;
            lbl_mat.Visible = false;
            btn_save.Text = "Add";
        }
        else if (ddl_type.SelectedValue == "4")
        {
            lbl_qi.Text = "Question";
            li_grid.Visible = false;
            li_rbl.Visible = true;
            lbl_mat.Visible = false;
            rbl_tf.ClearSelection();
            btn_save.Text = "Add";
        }
        else
        {
            lbl_qi.Text = "Instruction";
            li_grid.Visible = false;
            li_rbl.Visible = false;
            lbl_mat.Visible = true;
            btn_save.Text = "Continue";
        }
    }

    private void gridviewrow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dt.Columns.Add(new DataColumn("col_0", typeof(string)));
        dt.Columns.Add(new DataColumn("col_1", typeof(string)));
        dt.Columns.Add(new DataColumn("col_2", typeof(string)));

        dr = dt.NewRow();
        dr["RowNumber"] = 1;
        dr["col_0"] = string.Empty;
        dr["col_1"] = string.Empty;
        dr["col_2"] = string.Empty;
        dt.Rows.Add(dr);

        ViewState["item"] = dt;
        grid_item.DataSource = dt;
        grid_item.DataBind();

        GridView3.DataSource = dt;
        GridView3.DataBind();

        ViewState["response"] = dt;
        GridView1.DataSource = dt;
        GridView1.DataBind();

        ViewState["premise"] = dt;
        GridView2.DataSource = dt;
        GridView2.DataBind();

    }

    protected void click_add(object sender, EventArgs e)
    {
        ddl_type.SelectedValue = "1";
        li_t.Visible = true;
        li_td.Visible = true;
        panelOverlay.Visible = true;
        panelPopUpPanel.Visible = true;
        txt_question.Text = "";
        gridviewrow();
        btn_save.Text = "Add";
        li_rbl.Visible = false;
        li_grid.Visible = true;
        lbl_mat.Visible = false;
        fs_answer.Visible = false;
        btn_edit.Visible = false;

        GridView1.Enabled = true;
        GridView1.Columns[2].Visible = true;
        GridView2.Enabled = true;
        GridView2.Columns[2].Visible = true;

        hf_command.Value = "new";
        //GridView1.Columns[2].Visible = true;
        //GridView2.Columns[2].Visible = true;
    }

    protected void display()
    {
        //DataTable dt = dbhelper.getdata("select * from examinition where id=" + Request.QueryString["id"].ToString());
        //lbl_head.Text = dt.Rows[0]["description"].ToString();

        DataSet ds = dbhelper.despData("select * from question where e_id="+ Request.QueryString["id"].ToString() +" and status <> '0' order by id desc","data");
        grid_question.DataSource = ds.Tables["data"];
        grid_question.DataBind();
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
                DataSet  ds = dbhelper.despData("select * from choices a left join question b on a.q_id=b.id where a.status='response' and a.q_id=" + e.Row.Cells[0].Text +" order by a.herarchy", "tbl");
                DataTable dt = ds.Tables["tbl"];
                DropDownList ddl_b = (DropDownList)e.Row.FindControl("ddl_b");

                for (int i = 0; i < dt.Rows.Count; i++ )
                    ddl_b.Items.Insert(i, new ListItem(apl[i], dt.Rows[i]["description"].ToString()));

                ddl_b.SelectedValue = e.Row.Cells[1].Text;
            }
        }
    }

    protected void grid_bound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lb = (Label)e.Row.FindControl("lbl_question");
            lb.Text = lb.Text.Replace("\n","<br/>");

            GridView gv = (GridView)e.Row.FindControl("grid_choices");
            DataSet ds = dbhelper.despData("select * from choices a left join question b on a.q_id=b.id where a.q_id=" + e.Row.Cells[2].Text ,"tbl");
            gv.DataSource = ds.Tables["tbl"];
            gv.DataBind();

            gv = (GridView)e.Row.FindControl("GridView4");
            ds = dbhelper.despData("select  c.answer, * from choices a left join question b on a.q_id=b.id left join mt_ans c on a.id=c.c_id where a.status='premise' and a.q_id=" + e.Row.Cells[2].Text, "tbl");
            gv.DataSource = ds.Tables["tbl"];
            gv.DataBind();

            gv = (GridView)e.Row.FindControl("GridView5");
            ds = dbhelper.despData("select * from choices a left join question b on a.q_id=b.id where a.status='response' and a.q_id=" + e.Row.Cells[2].Text, "tbl");
            gv.DataSource = ds.Tables["tbl"];
            gv.DataBind();

            Panel pl_a = (Panel)e.Row.FindControl("pl_a");
            Panel pl_b = (Panel)e.Row.FindControl("pl_b");
            LinkButton lnk_edit = (LinkButton)e.Row.FindControl("lnk_edit");
            if (lnk_edit.CommandName == "3")
            {
                pl_a.Visible = false;
                pl_b.Visible = true;
            }
            else
            {
                pl_a.Visible = true;
                pl_b.Visible = false;
            }
        }
    }

    protected void grid3_bound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList ddl = (DropDownList)e.Row.FindControl("ddl_response");
            DataTable dtres = (DataTable)ViewState["response"];
            DataTable dtitem = (DataTable)ViewState["item"];
            if (ViewState["response"] != null)
            {
                for (int j = 0; j < dtres.Rows.Count; j++)
                    ddl.Items.Add(dtres.Rows[j]["col_0"].ToString());

                ddl.Text = e.Row.Cells[0].Text;
            }
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
                pass = val == e.Row.Cells[0].Text ? true:false;
                if (pass)
                    break;
            }

            if (pass)
                rb.Checked = true;
            else
                rb.Enabled = false;
        }
    }

    protected void choices_bound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox rb = (CheckBox)e.Row.FindControl("cb_ib");
            if (e.Row.Cells[5].Text == "1")
                rb.Checked = true;
            else
                rb.Checked = false;
        }
    }

    protected void click_edit(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            LinkButton lb = (LinkButton)sender;

            hf_id.Value = row.Cells[2].Text;
            btn_save.Text = "Save";
            panelOverlay.Visible = true;
            panelPopUpPanel.Visible = true;

            Label lbl = (Label)row.FindControl("lbl_question");
            txt_question.Text = lbl.Text.Replace("<br/>", "\n");
            string s = "select a.id, case when a.id=b.answer then '1' else '0' end ans,a.description from choices a left join question b on a.q_id=b.id where a.q_id=" + row.Cells[2].Text;
            DataTable dt_r = dbhelper.getdata("select a.id, case when b.answer like '%'+convert(varchar,a.id)+'%' then '1' else '0' end ans,a.description from choices a left join question b on a.q_id=b.id where a.q_id=" + row.Cells[2].Text);

            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("col_0", typeof(string)));
            dt.Columns.Add(new DataColumn("col_1", typeof(string)));
            dt.Columns.Add(new DataColumn("col_2", typeof(string)));

            switch (lb.CommandName)
            {
                case "1":
                    ViewState["item"] = dt;
                    for (int i = 0; i < dt_r.Rows.Count; i++)
                    {
                        dr = dt.NewRow();
                        dr["RowNumber"] = i + 1;
                        dr["col_0"] = dt_r.Rows[i]["id"].ToString();
                        dr["col_1"] = dt_r.Rows[i]["description"].ToString();
                        dr["col_2"] = dt_r.Rows[i]["ans"].ToString();
                        dt.Rows.Add(dr);
                    }

                    grid_item.DataSource = dt;
                    grid_item.DataBind();
                    ddl_type.SelectedValue = "1";
                    li_grid.Visible = true;
                    li_rbl.Visible = false;
                    lbl_mat.Visible = false;
                    break;
                case "4":

                    ViewState["item"] = dt;
                    for (int i = 0; i < dt_r.Rows.Count; i++)
                    {
                        dr = dt.NewRow();
                        dr["RowNumber"] = i + 1;
                        dr["col_0"] = dt_r.Rows[i]["id"].ToString();
                        dr["col_1"] = dt_r.Rows[i]["description"].ToString();
                        dr["col_2"] = dt_r.Rows[i]["ans"].ToString();
                        dt.Rows.Add(dr);
                    }

                    rbl_tf.SelectedValue = dt_r.Rows[0]["ans"].ToString() == "1" ? "True" : "False";
                    li_grid.Visible = false;
                    li_rbl.Visible = true;
                    lbl_mat.Visible = false;
                    ddl_type.SelectedValue = "4";
                    break;
                case "3":
                    li_grid.Visible = false;
                    li_rbl.Visible = false;
                    lbl_mat.Visible = true;
                    fs_answer.Visible = true;

                    DataSet ds = dbhelper.despData("select a.id, c.answer, * from choices a left join question b on a.q_id=b.id left join mt_ans c on a.id=c.c_id where a.status='premise' and a.q_id=" + row.Cells[2].Text, "tbl");
                    DataTable dtt = ds.Tables["tbl"];

                    DataTable dtCurrentTable = (DataTable)ViewState["premise"];
                    DataRow drCurrentRow = null;
                    dtCurrentTable.Clear();
                    for (int i = 0; i < dtt.Rows.Count; i++)
                    {
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["RowNumber"] = i + 1;
                        drCurrentRow["col_0"] = dtt.Rows[i]["description"].ToString();
                        drCurrentRow["col_1"] = dtt.Rows[i]["id"].ToString();                                                                                                                           
                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }
                    ViewState["premise"] = dtCurrentTable;
                    GridView1.DataSource = dtCurrentTable;
                    GridView1.DataBind();

                    ds = dbhelper.despData("select a.id, * from choices a left join question b on a.q_id=b.id where a.status='response' and a.q_id=" + row.Cells[2].Text + " order by a.herarchy", "tbl");
                    DataTable dttt = ds.Tables["tbl"];
                    DataTable dtCT = (DataTable)ViewState["response"];
                    drCurrentRow = null;
                    dtCT.Clear();
                    for (int i = 0; i < dttt.Rows.Count; i++)
                    {
                        drCurrentRow = dtCT.NewRow();
                        drCurrentRow["RowNumber"] = i + 1;
                        drCurrentRow["col_0"] = dttt.Rows[i]["description"].ToString();
                        drCurrentRow["col_1"] = dttt.Rows[i]["id"].ToString();
                        dtCT.Rows.Add(drCurrentRow);
                    }
                    ViewState["response"] = dtCT;
                    GridView2.DataSource = dtCT;
                    GridView2.DataBind();

                    dtCurrentTable.Clear();
                    for (int i = 0; i < dtt.Rows.Count; i++)
                    {
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["RowNumber"] = i + 1;
                        drCurrentRow["col_0"] = dtt.Rows[i]["description"].ToString();
                        drCurrentRow["col_1"] = dtt.Rows[i]["answer"].ToString();
                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }
                    ViewState["item"] = dtCurrentTable;
                    GridView3.DataSource = dtCurrentTable;
                    GridView3.DataBind();

                    GridView1.Enabled = false;
                    GridView1.Columns[2].Visible = false;
                    GridView1.FooterRow.Visible = false;

                    GridView2.Enabled = false;
                    GridView2.Columns[2].Visible = false;
                    GridView2.FooterRow.Visible = false;

                    btn_edit.Visible = true;
                    hf_command.Value = "edit";
                    break;

                    
                    
            }

            li_t.Visible = false;
            li_td.Visible = false;
        }
    }

    protected void click_addd(object sender, EventArgs e)
    {
        ImageButton ib = (ImageButton)sender;
        string test = ib.Parent.ID;
             
        int rowIndex = 0;
        sr(ib.CommandName.ToString());
        DataTable dtCurrentTable = (DataTable)ViewState[ib.CommandName.ToString()];
        DataRow drCurrentRow = null;
        if (dtCurrentTable.Rows.Count > 0)
        {
            for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
            {
                TextBox txt_discription;
                Label lbl_discription;
                Label lbl_disID;
                if (ib.CommandName.ToString() == "premise")
                {
                    txt_discription = (TextBox)GridView1.Rows[rowIndex].Cells[1].FindControl("txt_discription");
                    lbl_discription = (Label)GridView1.Rows[rowIndex].Cells[1].FindControl("lbl_discription");
                    lbl_disID = (Label)GridView1.Rows[rowIndex].Cells[1].FindControl("lbl_disID");
                }
                else
                {
                    txt_discription = (TextBox)GridView2.Rows[rowIndex].Cells[1].FindControl("txt_discription");
                    lbl_discription = (Label)GridView2.Rows[rowIndex].Cells[1].FindControl("lbl_discription");
                    lbl_disID = (Label)GridView2.Rows[rowIndex].Cells[1].FindControl("lbl_disID");
                }

                lbl_discription.Text = txt_discription.Text.Length == 0 ? "empty" : "";
                if ((lbl_discription.Text).Contains("empty"))
                    goto exit;

                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumber"] = i + 1;
                dtCurrentTable.Rows[i - 1]["col_0"] = txt_discription.Text;

                //if (hf_command.Value == "edit")
                //{
                //    if (lbl_disID.Text.Length == 0)
                //        dtCurrentTable.Rows[i - 1]["col_1"] = "0";
                //}
                rowIndex++;
            }

            dtCurrentTable.Rows.Add(drCurrentRow);
            ViewState[ib.CommandName.ToString()] = dtCurrentTable;

            if (ib.CommandName.ToString() == "premise")
            {
                GridView1.DataSource = dtCurrentTable;
                GridView1.DataBind();
            }
            else
            {
                GridView2.DataSource = dtCurrentTable;
                GridView2.DataBind();
            }
        }
        setPD(ib.CommandName.ToString());
    exit:
        display();
    }

    protected void setPD(string item)
    {
        int rowIndex = 0;
        if (ViewState[item] != null)
        {
            DataTable dt = (DataTable)ViewState[item];

            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    TextBox txt_discription;
                    ImageButton can;
                    if (item == "premise")
                    {
                        txt_discription = (TextBox)GridView1.Rows[rowIndex].Cells[1].FindControl("txt_discription");
                        can = (ImageButton)GridView1.Rows[rowIndex].Cells[2].FindControl("can");
                        //grid_item.Rows[i].Cells[0].Text = Convert.ToString(i + 1);

                    }
                    else
                    {
                        txt_discription = (TextBox)GridView2.Rows[rowIndex].Cells[1].FindControl("txt_discription");
                        can = (ImageButton)GridView2.Rows[rowIndex].Cells[2].FindControl("can");
                       // grid_item.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
                    }

                    txt_discription.Text = dt.Rows[i]["col_0"].ToString();
                    rowIndex++;
                }
            }
        }
    }

    protected int sr(string item)
    {
        int ret = 0;
        int rowIndex = 0;
        DataTable dt = (DataTable)ViewState[item];

        DataTable dtCurrentTable = new DataTable();
        DataRow drCurrentRow = null;
        dtCurrentTable.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("col_0", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("col_1", typeof(string)));

        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            TextBox txt_discription;
            Label lbl_discription;
            Label lbl_disID;

            if (item == "premise")
            {
                txt_discription = (TextBox)GridView1.Rows[rowIndex].Cells[1].FindControl("txt_discription");
                lbl_discription = (Label)GridView1.Rows[rowIndex].Cells[1].FindControl("lbl_discription");
                lbl_disID = (Label)GridView1.Rows[rowIndex].Cells[1].FindControl("lbl_disID");
                ImageButton can = (ImageButton)GridView1.Rows[rowIndex].Cells[2].FindControl("can");
                can.Visible = false;
            }
            else
            {
                txt_discription = (TextBox)GridView2.Rows[rowIndex].Cells[1].FindControl("txt_discription");
                lbl_discription = (Label)GridView2.Rows[rowIndex].Cells[1].FindControl("lbl_discription");
                lbl_disID = (Label)GridView2.Rows[rowIndex].Cells[1].FindControl("lbl_disID");
                can = (ImageButton)GridView2.Rows[rowIndex].Cells[2].FindControl("can");
                can.Visible = false;
            }
           
            lbl_discription.Text = txt_discription.Text.Length == 0 ? "empty" : "";

            if ((lbl_discription.Text).Contains("empty"))
            {
                ret = 1;
                goto exit;
            }

            if (i <= dt.Rows.Count && txt_discription.Text.Trim().Length > 0)
            {
                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumber"] = i;
                drCurrentRow["col_0"] = txt_discription.Text;
                drCurrentRow["col_1"] = lbl_disID.Text;
                dtCurrentTable.Rows.Add(drCurrentRow);
            }
            rowIndex++;
        }

        ViewState[item] = dtCurrentTable;
        if (item == "premise")
        {
            GridView1.DataSource = dtCurrentTable;
            GridView1.DataBind();
        }
        else
        {
            GridView2.DataSource = dtCurrentTable;
            GridView2.DataBind();
        }

    exit:
        return ret;

    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        int x = addnewrow();
    }

    protected int addnewrow()
    {

        int rowIndex = 0;
        DataTable dtCurrentTable = (DataTable)ViewState["item"];
        DataRow drCurrentRow = null;
        if (dtCurrentTable.Rows.Count > 0)
        {
            for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
            {

                TextBox txt_discription = (TextBox)grid_item.Rows[rowIndex].Cells[1].FindControl("txt_discription");
                CheckBox cb_ib = (CheckBox)grid_item.Rows[rowIndex].Cells[2].FindControl("cb_ib");
                Label lbl_discription = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_discription");
                
                lbl_discription.Text = txt_discription.Text.Length == 0 ? "empty" : "";
                if ((lbl_discription.Text).Contains("empty"))
                    goto exit;

                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumber"] = i + 1;

                dtCurrentTable.Rows[i - 1]["col_1"] = txt_discription.Text;
                dtCurrentTable.Rows[i - 1]["col_2"] = cb_ib.Checked ? "yes" : "no";

                rowIndex++;
            }

            dtCurrentTable.Rows.Add(drCurrentRow);
            ViewState["item"] = dtCurrentTable;

            grid_item.DataSource = dtCurrentTable;
            grid_item.DataBind();

        }
        setPreviousData();
        return 1;
    exit:
        return rowIndex;
    }

    protected void setPreviousData()
    {
        int rowIndex = 0;
        if (ViewState["item"] != null)
        {
            DataTable dt = (DataTable)ViewState["item"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    TextBox txt_discription = (TextBox)grid_item.Rows[rowIndex].Cells[1].FindControl("txt_discription");
                    ImageButton can = (ImageButton)grid_item.Rows[rowIndex].Cells[2].FindControl("can");
                    CheckBox cb_ib = (CheckBox)grid_item.Rows[rowIndex].Cells[3].FindControl("cb_ib");
                    grid_item.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
                    txt_discription.Text = dt.Rows[i]["col_1"].ToString();
                    cb_ib.Checked = dt.Rows[i]["col_2"].ToString() == "yes" ? true : false;
                    rowIndex++;
                }
            }
        }
    }

    protected void setrow()
    {
        int rowIndex = 0;
        DataTable dt = (DataTable)ViewState["item"];

        DataTable dtCurrentTable = new DataTable();
        DataRow drCurrentRow = null;
        dtCurrentTable.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("col_0", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("col_1", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("col_2", typeof(string)));

        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            TextBox txt_discription = (TextBox)grid_item.Rows[rowIndex].Cells[1].FindControl("txt_discription");
            CheckBox cb_ib = (CheckBox)grid_item.Rows[rowIndex].Cells[2].FindControl("cb_ib");
            Label lbl_discription = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_discription");

            lbl_discription.Text = txt_discription.Text.Length == 0 ? "empty" : "";
            if ((lbl_discription.Text).Contains("empty"))
                goto exit;

            if (i <= dt.Rows.Count && txt_discription.Text.Trim().Length > 0)
            {
                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumber"] = i;
                drCurrentRow["col_0"] = dt.Rows[i-1]["col_0"].ToString();
                drCurrentRow["col_1"] = txt_discription.Text;
                drCurrentRow["col_2"] = cb_ib.Checked ? "yes" : "no";
                dtCurrentTable.Rows.Add(drCurrentRow);
            }
            rowIndex++;
        }

       
        ViewState["item"] = dtCurrentTable;
        grid_item.DataSource = dtCurrentTable;
        grid_item.DataBind();


    exit:
        Response.Write("");

    }

    protected void gvp_item_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (ViewState["premise"] != null)
        {
            sr("premise");
            DataTable aa = (DataTable)ViewState["item"];
            DataTable dt = (DataTable)ViewState["premise"];
            DataRow drCurrentRow = null;
            int rowIndex = Convert.ToInt32(e.RowIndex);
            if (dt.Rows.Count > 1)
            {
                if (hf_command.Value == "edit")
                    hf_status.Value += "delete choices where id=" + dt.Rows[rowIndex]["col_1"].ToString() + " ";

                dt.Rows.Remove(dt.Rows[rowIndex]);
                drCurrentRow = dt.NewRow();
                ViewState["premise"] = dt;
                GridView1.DataSource = dt;
                GridView1.DataBind();

                aa.Rows.Remove(aa.Rows[Convert.ToInt32(e.RowIndex)]);
                drCurrentRow = aa.NewRow();
                ViewState["item"] = aa;
            }

            for (int i = 0; i < GridView1.Rows.Count; i++)
                GridView1.Rows[i].Cells[0].Text = Convert.ToString(i + 1) + ".";
        }
    }

    protected void gvr_item_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (ViewState["response"] != null)
        {

            DataTable dt = (DataTable)ViewState["response"];
            DataRow drCurrentRow = null;
            int rowIndex = Convert.ToInt32(e.RowIndex);
            if (dt.Rows.Count > 1)
            {
                if (hf_command.Value == "edit")
                    hf_status.Value += "delete choices where id=" + dt.Rows[rowIndex]["col_1"].ToString() + " ";

                dt.Rows.Remove(dt.Rows[rowIndex]);
                drCurrentRow = dt.NewRow();
                ViewState["response"] = dt;
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }

            for (int i = 0; i < GridView2.Rows.Count; i++)
                GridView2.Rows[i].Cells[0].Text = Convert.ToString(i + 1) + ".";
        }
    }

    protected void grid_item_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (ViewState["item"] != null)
        {
            DataTable dt = (DataTable)ViewState["item"];
            DataRow drCurrentRow = null;
            int rowIndex = Convert.ToInt32(e.RowIndex);
            if (dt.Rows.Count > 1)
            {
                hf_status.Value += "delete choices where id=" + dt.Rows[rowIndex]["col_0"].ToString() + " ";
                dt.Rows.Remove(dt.Rows[rowIndex]);
                drCurrentRow = dt.NewRow();
                ViewState["item"] = dt;
                grid_item.DataSource = dt;
                grid_item.DataBind();

                for (int i = 0; i < grid_item.Rows.Count; i++)
                {
                    grid_item.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
                    TextBox txt = (TextBox)grid_item.Rows[i].FindControl("txt_discription");
                    CheckBox cb = (CheckBox)grid_item.Rows[i].FindControl("cb_ib");
                
                    if (dt.Rows[i]["RowNumber"].ToString() == "-1")
                    {
                        txt.Style.Add("border", "1px solid red");
                        txt.Enabled = false;
                        cb.Enabled = false;
                    }

                    txt.Text = dt.Rows[i]["col_1"].ToString();
                    string x = dt.Rows[i]["col_2"].ToString();
                    int value;
                    if (int.TryParse(x, out value))
                        cb.Checked = dt.Rows[i]["col_2"].ToString() == "1" ? true : false;
                    else
                        cb.Checked = dt.Rows[i]["col_2"].ToString() == "yes" ? true : false;
                }
            }
            else
                Response.Redirect("questionnaire?id=" + Request.QueryString["id"].ToString(), false);
        }
    }

    protected void close(object sender, ImageClickEventArgs e)
    {
        panelOverlay.Visible = false;
        panelPopUpPanel.Visible = false;
        hf_status.Value = "";
    }
}