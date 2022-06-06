using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_addJobType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
            gridviewrow();
    }

    private void gridviewrow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dt.Columns.Add(new DataColumn("col_1", typeof(string)));

        dr = dt.NewRow();
        dr["RowNumber"] = 1;
        dr["col_1"] = string.Empty;


        dt.Rows.Add(dr);

        ViewState["Item_List"] = dt;
        grid_item.DataSource = dt;
        grid_item.DataBind();


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


                TextBox txt_description = (TextBox)grid_item.Rows[rowIndex].Cells[1].FindControl("txt_description");



                Label lbl_descripton = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_descripton");
                Label lbl_descripton_desp = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_descripton_desp");



                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumber"] = i + 1;

                dtCurrentTable.Rows[i - 1]["col_1"] = txt_description.Text.Length == 0 ? lbl_descripton_desp.Text : txt_description.Text;




                if (i == dtCurrentTable.Rows.Count)
                {


                    lbl_descripton.Text = txt_description.Text.Length == 0 ? "empty" : "";


                }

                if ((lbl_descripton.Text).Contains("empty"))
                    goto exit;

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



                    TextBox txt_description = (TextBox)grid_item.Rows[rowIndex].Cells[1].FindControl("txt_description");
                    ImageButton can = (ImageButton)grid_item.Rows[rowIndex].Cells[2].FindControl("can");
                    Label lbl_descripton_desp = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_descripton_desp");


                    if (i != dt.Rows.Count - 1)
                    {
                        txt_description.Visible = false;

                    }
                    else
                        can.Visible = false;

                    grid_item.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
                    lbl_descripton_desp.Text = dt.Rows[i]["col_1"].ToString();


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
                dt.Rows.Remove(dt.Rows[rowIndex]);
                drCurrentRow = dt.NewRow();
                ViewState["Item_List"] = dt;
                grid_item.DataSource = dt;
                grid_item.DataBind();

                for (int i = 0; i < grid_item.Rows.Count - 1; i++)
                {
                    grid_item.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
                }
                setPreviousData();
            }
            else
            {
                Response.Redirect("addDepartment", false);
            }
        }
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        double rowcount = 0;
        string x = null;
        stateclass a = new stateclass();


        DataTable table = ViewState["Item_List"] as DataTable;

        if (table.Rows.Count == 1)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Empty Fields');", true);
        else
        {

            foreach (DataRow row in table.Rows)
            {
                if (table.Rows.Count - 1 != rowcount)
                {
                    a.sa = row.ItemArray[1] as string;
                    bol.JobType(a);
                }
                rowcount++;
            }
        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully'); window.location='addJobtype'", true);
    }

}