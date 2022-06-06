using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_Exam_examinition : System.Web.UI.Page
{
    public static string id,query;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            gridviewrow();
        getdata();
    }

    protected void setrow()
    {
        int rowIndex = 0;
        DataTable dtCurrentTable = (DataTable)ViewState["Item_List"];
        int tbrow = dtCurrentTable.Rows.Count - 1;
        dtCurrentTable.Clear();
        DataRow drCurrentRow = null;

        for (int i = 1 ; i <= tbrow; i++)
        {
            TextBox txt_discription = (TextBox)grid_item.Rows[rowIndex].Cells[1].FindControl("txt_discription");
            TextBox txt_ratings = (TextBox)grid_item.Rows[rowIndex].Cells[2].FindControl("txt_ratings");
            CheckBox cb_ib = (CheckBox)grid_item.Rows[rowIndex].Cells[2].FindControl("cb_ib");

            Label lbl_discription = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_discription");
            Label lbl_2nd_discription = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_2nd_discription");

            drCurrentRow = dtCurrentTable.NewRow();
            drCurrentRow["RowNumber"] = i;

            drCurrentRow["col_1"] = txt_discription.Text.Length == 0 ? lbl_2nd_discription.Text : txt_discription.Text;
            drCurrentRow["col_3"] = cb_ib.Checked ? "yes" : "no";
            dtCurrentTable.Rows.Add(drCurrentRow);
            rowIndex++;
        }

       
        ViewState["Item_List"] = dtCurrentTable;
    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        int x = addnewrow();
    }
    protected int addnewrow()
    {

        int rowIndex = 0;
        DataTable dtCurrentTable = (DataTable)ViewState["Item_List"];
        DataRow drCurrentRow = null;
        if (dtCurrentTable.Rows.Count > 0)
        {
            for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
            {

                TextBox txt_discription = (TextBox)grid_item.Rows[rowIndex].Cells[1].FindControl("txt_discription");
                TextBox txt_ratings = (TextBox)grid_item.Rows[rowIndex].Cells[2].FindControl("txt_ratings");
                CheckBox cb_ib = (CheckBox)grid_item.Rows[rowIndex].Cells[2].FindControl("cb_ib");

                Label lbl_discription = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_discription");
                Label lbl_2nd_discription = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_2nd_discription");
                if (i == dtCurrentTable.Rows.Count)
                {
                    lbl_discription.Text = txt_discription.Text.Length == 0 ? "empty" : "";
                }
                if ((lbl_discription.Text).Contains("empty"))
                    goto exit;
                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumber"] = i + 1;

                dtCurrentTable.Rows[i - 1]["col_1"] = txt_discription.Text.Length == 0 ? lbl_2nd_discription.Text : txt_discription.Text;
                dtCurrentTable.Rows[i - 1]["col_3"] = cb_ib.Checked ? "yes" : "no";

                rowIndex++;
            }

            dtCurrentTable.Rows.Add(drCurrentRow);
            ViewState["Item_List"] = dtCurrentTable;

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
        if (ViewState["Item_List"] != null)
        {
            DataTable dt = (DataTable)ViewState["Item_List"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    TextBox txt_discription = (TextBox)grid_item.Rows[rowIndex].Cells[1].FindControl("txt_discription");
                    ImageButton can = (ImageButton)grid_item.Rows[rowIndex].Cells[2].FindControl("can");
                    CheckBox cb_ib = (CheckBox)grid_item.Rows[rowIndex].Cells[3].FindControl("cb_ib");
                    Label lbl_2nd_discription = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_2nd_discription");

                    if (i != dt.Rows.Count - 1)
                        txt_discription.Visible = false;
                    else
                        can.Visible = false;

                    grid_item.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
                    lbl_2nd_discription.Text = dt.Rows[i]["col_1"].ToString();
                    cb_ib.Checked = dt.Rows[i]["col_3"].ToString() == "yes" ? true : false;

                    rowIndex++;
                }
            }
        }
    }
    protected void grid_item_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (ViewState["Item_List"] != null)
        {
            DataTable dt = (DataTable)ViewState["Item_List"];
            DataRow drCurrentRow = null;
            int rowIndex = Convert.ToInt32(e.RowIndex);
            if (dt.Rows.Count > 1)
            {

                //if (btn_addfield.Text == "Edit")
                //    dt.Rows[rowIndex]["RowNumber"] = "-1";
                //else
                    dt.Rows.Remove(dt.Rows[rowIndex]);

                drCurrentRow = dt.NewRow();
                ViewState["Item_List"] = dt;
                grid_item.DataSource = dt;
                grid_item.DataBind();

                for (int i = 0; i < grid_item.Rows.Count; i++)
                {

                    grid_item.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
                    TextBox txt = (TextBox)grid_item.Rows[i].FindControl("txt_discription");
                    CheckBox cb = (CheckBox)grid_item.Rows[i].FindControl("cb_ib");

                    //if (btn_addfield.Text == "Edit")
                    //{
                        if (dt.Rows[i]["RowNumber"].ToString() == "-1")
                        {
                            txt.Style.Add("border", "1px solid red");
                            txt.Enabled = false;

                            cb.Enabled = false;
                        }
                    //}

                    txt.Text = dt.Rows[i]["col_1"].ToString();
                    cb.Checked = dt.Rows[i]["col_3"].ToString() == "yes" ? true : false;

                }
                // setPreviousData();
            }
            else
            {
                Response.Redirect("Examinition", false);
            }
        }
    }
    private void gridviewrow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dt.Columns.Add(new DataColumn("col_1", typeof(string)));
        dt.Columns.Add(new DataColumn("col_2", typeof(string)));
        dt.Columns.Add(new DataColumn("col_3", typeof(string)));

        dr = dt.NewRow();
        dr["RowNumber"] = 1;
        dr["col_1"] = string.Empty;
        dr["col_2"] = string.Empty;
        dr["col_3"] = string.Empty;

        dt.Rows.Add(dr);

        ViewState["Item_List"] = dt;
        grid_item.DataSource = dt;
        grid_item.DataBind();
    }

    protected void save(object sender, EventArgs e)
    {
        int rowcount = 0;
        DataTable table = ViewState["Item_List"] as DataTable;
        stateclass a = new stateclass();

        if (table.Rows.Count == 1)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please input Choices');", true);
        else
        {
            int cnt = 0;
            foreach (DataRow row in table.Rows)
            {

                CheckBox cb = (CheckBox)grid_item.Rows[rowcount].FindControl("cb_ib");

                if (cb.Checked)
                    cnt++;

                rowcount++;
            }

            rowcount = 0;
            if (cnt > 0 && cnt < 2)
            {
                query = "select top 1(herarchy) from question where e_id=" + id + " order by id desc";
                DataTable q = new DataTable();
                q = dbhelper.getdata(query);

                a.a = id;
                a.b = txt_question.Text;
                a.c = "1";
                if (q.Rows.Count == 0)
                    a.aa = 0;
                else
                    a.aa = (int.Parse(q.Rows[0]["herarchy"].ToString()) + 1);
                a.e = "1";
                int x = bol.Question(a);

                setrow();
                foreach (DataRow row in table.Rows)
                {
                    if (table.Rows.Count != rowcount)
                    {
                        a.aa = x;
                        a.b = row.ItemArray[1] as string;
                        a.bb = rowcount;
                        a.d = "1";
                        a.e = row.ItemArray[3] as string;
                        string y = bol.Choices(a);
                        if (y != "0")
                        {
                            query = "update question set answer='" + y + "' where id=" + x + "";
                            dbhelper.getdata(query);
                        }
                    }
                    rowcount++;
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully'); window.location='Examinition'", true);
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error Select One Answer Only'); window.location='Examinition'", true);
            //exam.Visible = true;
            //customize.Visible = false;
            //ppop(true);
        }
    }

    protected void getdata()
    {
        string query = "Select * from Examinition order by id desc";
        DataSet ds = new DataSet();
        ds = bol.displayData(query);

        grid_view.DataSource = ds.Tables["table"];
        grid_view.DataBind();

    }
    protected void add(object sender, EventArgs e)
    {
        if (checker())
        {
            stateclass a = new stateclass();

            a.a = txt_exam.Text;
            a.b = txt_limit.Text;
            a.c = "1";

            bol.Examinition(a);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Update Successfully'); window.location='Examinition'", true);

        }

    }
    protected void exam_view(object sender, EventArgs e)
    {
        exam.Visible = true;
        customize.Visible = false;
        ppop(true);
    }
    protected void customize_view(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            id = row.Cells[0].Text;
            query = "select description from Examinition where id=" + id + "";
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(query);

            lbl_type.Text = dt.Rows[0]["description"].ToString();

            exam.Visible = false;
            customize.Visible = true;
            ppop(true);

        }
    }
    protected void add_close(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Examinition", false);
    }
    protected void add_solution(object sender, EventArgs e)
    {
        ppop(true);
    }
    protected void ppop(bool oi)
    {
        panelOverlay.Visible = oi;
        panelPopUpPanel.Visible = oi;
    }
    protected bool checker()
    {
        bool oi = true;

        if (txt_exam.Text == "")
        {
            oi = false;
            lbl_exam.Text = "empty";
        }
        else
            lbl_exam.Text = "";

        if (txt_limit.Text == "")
        {
            oi = false;
            lbl_limit.Text = "empty";
        }
        else
            lbl_limit.Text = "";

        return oi;
    }

}