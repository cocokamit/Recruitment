using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gridviewrow_governmentlicenses();
            year();
        }
    }
    protected void year()
    {
        int i = 1955;
        for (; i < int.Parse(DateTime.Now.Year.ToString()); i++)
        {
           ddl_year.Items.Add((i + 1).ToString());
        }
    }
    protected void gridviewrow_governmentlicenses()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;

        //service
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

        ViewState["governmentlicenses"] = dt;
        grid_employmenthistory.DataSource = dt;
        grid_employmenthistory.DataBind();
    }
    protected void clickaddbutton_governmentlicenses(object sender, EventArgs e)
    {
        int x = addnewerow_governmentlicenses();
    }
    protected int addnewerow_governmentlicenses()
    {
        int save = 0;
        int rowIndex = 0;
        DataTable dtCurrentTable = (DataTable)ViewState["governmentlicenses"];
        DataRow drCurrentRow = null;

        if (dtCurrentTable.Rows.Count > 0)
        {
            for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
            {

                TextBox txt_employmenthistory_c_name_address = (TextBox)grid_employmenthistory.Rows[rowIndex].Cells[1].FindControl("txt_employmenthistory_c_name_address");
                TextBox txt_employmenthistory_position = (TextBox)grid_employmenthistory.Rows[rowIndex].Cells[2].FindControl("txt_employmenthistory_position");
                DropDownList ddl_employmenthistory_day = (DropDownList)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("ddl_employmenthistory_day");
                DropDownList ddl_employmenthistory_year = (DropDownList)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("ddl_employmenthistory_year");

                Label lbl_2ndemploymenthistory_c_name_address = (Label)grid_employmenthistory.Rows[rowIndex].Cells[1].FindControl("lbl_2ndemploymenthistory_c_name_address");
                Label lbl_2ndemploymenthistory_position = (Label)grid_employmenthistory.Rows[rowIndex].Cells[2].FindControl("lbl_2ndemploymenthistory_position");
                Label lbl_2ndemploymenthistory_fromto = (Label)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("lbl_2ndemploymenthistory_fromto");


                Label lbl_employmenthistory_c_name_address = (Label)grid_employmenthistory.Rows[rowIndex].Cells[1].FindControl("lbl_employmenthistory_c_name_address");
                Label lbl_employmenthistory_position = (Label)grid_employmenthistory.Rows[rowIndex].Cells[2].FindControl("lbl_employmenthistory_position");
                Label lbl_employmenthistory_fromto = (Label)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("lbl_employmenthistory_fromto");


                string datesss = (ddl_employmenthistory_day.Text.Replace("From", "") + ddl_employmenthistory_year.Text.Replace("To", ""));


                if (i == dtCurrentTable.Rows.Count)
                {
                    lbl_employmenthistory_fromto.Text = datesss.Length == 0 ? "empty" : "";
                    lbl_employmenthistory_position.Text = txt_employmenthistory_position.Text.Length == 0 ? "empty" : "";
                    lbl_employmenthistory_c_name_address.Text = txt_employmenthistory_c_name_address.Text.Length == 0 ? "empty" : "";
                }
                if ((lbl_employmenthistory_fromto.Text + "" + lbl_employmenthistory_position.Text + "" + lbl_employmenthistory_c_name_address.Text).Contains("empty"))
                    goto exit;


                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumber"] = i + 1;
                dtCurrentTable.Rows[i - 1]["col_1"] = txt_employmenthistory_c_name_address.Text.Length == 0 ? lbl_2ndemploymenthistory_c_name_address.Text : txt_employmenthistory_c_name_address.Text;
                dtCurrentTable.Rows[i - 1]["col_2"] = txt_employmenthistory_position.Text.Length == 0 ? lbl_2ndemploymenthistory_position.Text : txt_employmenthistory_position.Text;
                dtCurrentTable.Rows[i - 1]["col_3"] = datesss.Length == 0 ? lbl_2ndemploymenthistory_fromto.Text : ddl_employmenthistory_day.Text.Replace("From", "") + "-" + ddl_employmenthistory_year.Text.Replace("To", "");



                rowIndex++;
            }
            dtCurrentTable.Rows.Add(drCurrentRow);
            ViewState["governmentlicenses"] = dtCurrentTable;

            grid_employmenthistory.DataSource = dtCurrentTable;
            grid_employmenthistory.DataBind();

        }
        setPreviousData_governmentlicenses();
        return 1;
    exit:
        return rowIndex;
    }
    protected void setPreviousData_governmentlicenses()
    {
        int rowIndex = 0;
        if (ViewState["governmentlicenses"] != null)
        {
            DataTable dt = (DataTable)ViewState["governmentlicenses"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    TextBox txt_employmenthistory_c_name_address = (TextBox)grid_employmenthistory.Rows[rowIndex].Cells[1].FindControl("txt_employmenthistory_c_name_address");
                    TextBox txt_employmenthistory_position = (TextBox)grid_employmenthistory.Rows[rowIndex].Cells[2].FindControl("txt_employmenthistory_position");
                    DropDownList ddl_employmenthistory_day = (DropDownList)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("ddl_employmenthistory_day");
                    DropDownList ddl_employmenthistory_year = (DropDownList)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("ddl_employmenthistory_year");
                    ImageButton can = (ImageButton)grid_employmenthistory.Rows[rowIndex].Cells[4].FindControl("can");




                    Label lbl_2ndemploymenthistory_c_name_address = (Label)grid_employmenthistory.Rows[rowIndex].Cells[1].FindControl("lbl_2ndemploymenthistory_c_name_address");
                    Label lbl_2ndemploymenthistory_position = (Label)grid_employmenthistory.Rows[rowIndex].Cells[2].FindControl("lbl_2ndemploymenthistory_position");
                    Label lbl_2ndemploymenthistory_fromto = (Label)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("lbl_2ndemploymenthistory_fromto");
                   
                    if (i != dt.Rows.Count - 1)
                    {

                        ddl_employmenthistory_day.Visible = false;
                        ddl_employmenthistory_year.Visible = false;
                        txt_employmenthistory_position.Visible = false;
                        txt_employmenthistory_c_name_address.Visible = false;
                        

                    }
                    else
                        can.Visible = false;
                    grid_employmenthistory.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
                    lbl_2ndemploymenthistory_c_name_address.Text = dt.Rows[i]["col_1"].ToString();
                    lbl_2ndemploymenthistory_position.Text = dt.Rows[i]["col_2"].ToString();
                    lbl_2ndemploymenthistory_fromto.Text = dt.Rows[i]["col_3"].ToString();
                  

                    rowIndex++;
                }
            }
        }
    }
    protected void Deleting_employmenthistory(object sender, GridViewDeleteEventArgs e)
    {
        if (ViewState["governmentlicenses"] != null)
        {
            DataTable dt = (DataTable)ViewState["governmentlicenses"];
            DataRow drCurrentRow = null;
            int rowIndex = Convert.ToInt32(e.RowIndex);
            if (dt.Rows.Count > 1)
            {
                dt.Rows.Remove(dt.Rows[rowIndex]);
                drCurrentRow = dt.NewRow();
                ViewState["governmentlicenses"] = dt;
                grid_employmenthistory.DataSource = dt;
                grid_employmenthistory.DataBind();

                for (int i = 0; i < grid_employmenthistory.Rows.Count - 1; i++)
                {
                    grid_employmenthistory.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
                }
                setPreviousData_governmentlicenses();
            }

        }
    }
    protected void Databound_employmenthistory(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList ddl_employmenthistory_year = (DropDownList)e.Row.FindControl("ddl_employmenthistory_year");
            DropDownList ddl_employmenthistory_day = (DropDownList)e.Row.FindControl("ddl_employmenthistory_day");
            int i = 1955;
            for (; i < int.Parse(DateTime.Now.Year.ToString()); i++)
            {
                ddl_employmenthistory_year.Items.Add((i + 1).ToString());
                ddl_employmenthistory_day.Items.Add((i + 1).ToString());
            }
        }
    }
    protected void click_save(object sender, EventArgs e)
    {
        string type = string.Empty;
        if (FileUpload1.HasFile)
        {
            if(Path.GetExtension(FileUpload1.PostedFile.FileName)==".doc" || Path.GetExtension(FileUpload1.PostedFile.FileName)==".docx")
            {

                DataTable dt = dbhelper.getdata("insert into applicant(date_app,name,pos_desire,present_add,provencial_add,tel_no,cell_no,email,dateofbirth,job_id,resume_file)values(getdate(),'" + txt_fname.Text + ' ' + txt_mname.Text + ' ' + txt_lname.Text + "','" + drop_type.Text + "','" + txt_pread.Text + "','" + txt_provad.Text + "','" + txt_tel.Text + "','" + txt_cel.Text + "','" + txt_email.Text + "','" + ddl_month.Text + '/' + ddl_day.Text + '/' + ddl_year.Text + "'," + Request.QueryString["app_id"].ToString() + ",'" + FileUpload1.PostedFile.FileName + "') select scope_identity() id ");
                DirectoryInfo nw = Directory.CreateDirectory(Server.MapPath("~/document/app_id_"+dt.Rows[0]["id"].ToString()));
                FileUpload1.SaveAs(Server.MapPath("~/document/app_id_"+dt.Rows[0]["id"].ToString()+"/" + FileUpload1.PostedFile.FileName));
                for (int i = 0; i <= 5; i++)
                {
                    DataTable educhistory = new DataTable();
                    switch (i)
                    {
                        case 1:
                            educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'Elementary','" + txt_elemschool.Text + "','" + txt_elemyear.Text + "','" + txt_elemaddress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
                            break;
                        case 2:
                            educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'Secondary','" + txt_secondschool.Text + "','" + txt_secondyear.Text + "','" + txt_secondaddress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
                            break;
                        case 3:
                            educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'College','" + txt_collegeschool.Text + "','" + txt_collegeyear.Text + "','" + txt_collegeaddress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
                            break;
                        case 4:
                            educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'Vocational','" + txt_vocationalschool.Text + "','" + txt_vocationalyear.Text + "','" + txt_vocationaladdress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
                            break;
                        case 5:
                            educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'Specials Skills','" + txt_specialschool.Text + "','" + txt_specialyear.Text + "','" + txt_specialaddress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
                            break;
                    }
                }
                DataTable grid = (DataTable)ViewState["governmentlicenses"];
                foreach (DataRow dr in grid.Rows)
                {
                    if (dr[1].ToString() != "")
                    {
                        DataTable emp_history = dbhelper.getdata("insert into EmploymentHistory(app_id,company,position,fromto,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'" + dr[1] + "','" + dr[2] + "','" + dr[3] + "'," + Request.QueryString["app_id"].ToString() + ")");
                    }
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully'); window.location='formapp'", true);
            }
        }
        
    }
    protected void click_supload(object sender, EventArgs e)
    {
        string type = string.Empty;
        if (FileUpload1.HasFile)
        {
            switch (Path.GetExtension(FileUpload1.PostedFile.FileName))
            {
                case ".doc":

                    type = "application/word";
                    FileUpload1.SaveAs(Server.MapPath("~/document/" + FileUpload1.PostedFile.FileName));
                    break;

                case ".docx":

                    type = "application/word";
                    FileUpload1.SaveAs(Server.MapPath("~/document/" + FileUpload1.PostedFile.FileName));
                    break;

            }
           
        }
    }

}