using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text;
using System.Drawing;
using System.Text.RegularExpressions;

public partial class content_HR_Form : System.Web.UI.Page
{
    public static string query, id,idd;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DataBind();

        Session["job_id"] = hd_jobid.Value;
        Session["captcha"] = hf_captcha.Value;

        SetProfile();
    }

    protected void click_refresh(object sender, EventArgs e)
    {
        hf_policy.Value = "1";
        policy.Visible = false;
        overlay.Visible = false;
    }

    protected void DataBind()
    {
        property();
        hf_policy.Value = "0";
        year();
        FillCapctha();
        countrylist();
        courses();
        gridviewrow_governmentlicenses();
        gridviewrow();

        if (txt_resume.Text.Length > 0)
        {
            fdoc.InnerText = filename.Text;
            if (txt_resume.Text == ".pdf")
                educ_span.Attributes.Add("style", "background:url(style/img/icon/i-pdf.png) center no-repeat; border:1px solid #3c94b4; border-radius:3px");
            else
                educ_span.Attributes.Add("style", "background:url(style/img/icon/i-word.png) center no-repeat; border:1px solid #3c94b4; border-radius:3px");
        }
    }

    protected void click_save(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = dbhelper.getdata("select * from applicant where job_id=" + hd_jobid.Value + " and email='" + txt_email.Text.Replace(" ", "").Replace("'", "''") + "' and status<>'Hired' and status<>'reject' and status<>'cancel'");
        overlay.Visible = true;
        if (dt.Rows.Count == 0)
        {
            bool cont = true;
            if (checkfeilds())
            {
                try
                {
                    setrowemployment();
                    setrowskills();

                    string query = "declare @appid int ";
                    string country = ddl_country.Text;
                    string city = ddl_city.Text;
                    string region = ddl_region.Text.Length > 2 ? ddl_region.Text.Substring(0, ddl_region.Text.IndexOf("|")) : ddl_region.Text;
                    string province = ddl_province.Text;
                    string baranggay = txt_baranggay.Text.Length == 0 ? "None" : txt_baranggay.Text.Trim();
                    string present = country + "|" + region + "|" + province + "|" + city + "|" + baranggay;

                    query += "insert into applicant(date_app,name,present_add,tel_no,cell_no,email,dateofbirth,job_id,resume_file,status,captcha,gender,property) values " +
                    "(getdate(),'" + txt_fname.Text.Trim().Replace("'", "''") + ' ' + txt_mname.Text.Trim().Replace("'", "''") + ' ' + txt_lname.Text.Trim().Replace("'", "''") + "','" + present + "','" +
                    txt_tel.Text.Replace("'", "''") + "','" + txt_cel.Text.Replace("'", "''") + "','" + txt_email.Text.Replace("'", "''") + "','" + txt_from.Text.Replace(" ", "") + "'," + hd_jobid.Value + ",'" +
                    txt_fname.Text.Replace(" ", "").Replace("'", "''") + "_" + txt_lname.Text.Replace(" ", "").Replace("'", "''") + txt_resume.Text.Replace("'", "''") + "','new applicant','" + txtCaptcha.Text + "','" + ddl_gender.Text + "'," + hf_property.Value + ") set @appid = scope_identity(); " +

                   "insert into Education values(@appid,'" + ddl_attainment.SelectedItem + "','" + ddl_courses.SelectedItem + "','-','-'," + hd_jobid.Value + ") ";
                  

                   //"insert into Education(app_id,level,school,year,address,job_id)values(@appid,'Elementary','" + txt_elemschool.Text.Trim().Replace("'", "''") + "','" + ddl_elemmonth.Text + "-" + ddl_elemyear.Text + "','" + txt_elemaddress.Text.Trim().Replace("'", "''") + "'," + hd_jobid.Value + ") " +
                   //"insert into Education(app_id,level,school,year,address,job_id)values(@appid,'Secondary','" + txt_secondschool.Text.Trim().Replace("'", "''") + "','" + ddl_secondmonth.Text + "-" + ddl_secondyear.Text + "','" + txt_secondaddress.Text.Trim().Replace("'", "''") + "'," + hd_jobid.Value + ") " +
                   //"insert into Education(app_id,level,school,year,address,job_id)values(@appid,'College','" + txt_collegeschool.Text.Trim().Replace("'", "''") + "','" + ddl_collegemonth.Text + "-" + ddl_collegeyear.Text + "','" + txt_collegeaddress.Text.Trim().Replace("'", "''") + "'," + hd_jobid.Value + ") " +
                   //"insert into Education(app_id,level,school,year,address,job_id)values(@appid,'Vocational','" + txt_vocationalschool.Text.Trim().Replace("'", "''") + "','" + ddl_vocationalmonth.Text + "-" + ddl_vocationalyear.Text + "','" + txt_vocationaladdress.Text.Trim().Replace("'", "''") + "'," + hd_jobid.Value + ") ";

                    DataTable employment = (DataTable)ViewState["governmentlicenses"];
                    foreach (DataRow row in employment.Rows)
                        query += "insert into EmploymentHistory(app_id,company,position,fromto,job_id)values(@appid,'" + row["col_1"].ToString().Trim().Replace("'", "''") + "','" + row["col_2"].ToString().Trim().Replace("'", "''") + "','" + row["col_3"].ToString().Trim().Replace("'", "''") + "'," + hd_jobid.Value + ") ";

                    DataTable special = ViewState["Item_List"] as DataTable;
                    stateclass a = new stateclass();
                    foreach (DataRow row in special.Rows)
                        query += "insert into special_skills (app_id,skills,[date]) values (@appid,'" + row["col_1"].ToString().Trim().Replace("'", "''") + "',GETDATE()) ";

                    query += "insert into app_profile values (getdate(), @appid ,'.png') select @appid id";

                    dt = dbhelper.getdata(query);
                    hf_reload_id.Value = dt.Rows[0]["id"].ToString();
                }
                catch
                {
                    cont = false;
                    Response.Redirect("error?key=1");
                }

                if (cont)
                {
                    try
                    {
                        string base64 = dataURLInto.Text;
                        byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);
                        DirectoryInfo nw = Directory.CreateDirectory(Server.MapPath("~/UploadImages/prof_id_" + dt.Rows[0]["id"].ToString() + "/"));
                        using (System.IO.FileStream stream = new System.IO.FileStream(Server.MapPath("~/UploadImages/prof_id_" + dt.Rows[0]["id"].ToString() + "/" + dt.Rows[0]["id"].ToString() + ".png"), System.IO.FileMode.Create))
                        {
                            stream.Write(bytes, 0, bytes.Length);
                            stream.Flush();
                        }

                        string aaa = Server.MapPath("~/temp/" + paraupload.Text + txt_resume.Text);
                        string b = Server.MapPath("~/document/app_id_" + dt.Rows[0]["id"].ToString() + "/" + txt_fname.Text.Replace(" ", "") + "_" + txt_lname.Text.Replace(" ", "") + txt_resume.Text);
                        nw = Directory.CreateDirectory(Server.MapPath("~/document/app_id_" + dt.Rows[0]["id"].ToString() + "/"));
                        System.IO.File.Move(aaa, b);

                    }
                    catch (Exception x)
                    {
                        cont = false;
                    }

                    if (cont)
                    {
                        Session.RemoveAll();
                        Response.Redirect("evalform?app_id=" + butyok.Encrypt(dt.Rows[0]["id"].ToString(), true));
                    }
                    else
                    {
                        dbhelper.getdata("update applicant set status='cancel', date_cancelled=getdate(), remarks='error' where id=" + hf_reload_id.Value);
                        Response.Redirect("error?key=1");
                    }
                }
            }
        }
        else
            Response.Redirect("error?key=0");
    }

    protected bool checkfeilds()
    {
        bool ret = true;

        l_addpic.ForeColor = fromhtml(dataURLInto.Text.Length > 0);
        l_educ.ForeColor = fromhtml(txt_resume.Text.Length > 0);
        l_fname.ForeColor = fromhtml(txt_fname.Text.Length > 0);
        l_lname.ForeColor = fromhtml(txt_lname.Text.Length > 0);

        int educational = int.Parse(ddl_attainment.SelectedValue);
        l_hea.ForeColor = fromhtml(educational> 0);

        if (educational > 3)
            Label3.ForeColor = fromhtml(ddl_courses.SelectedValue.Length > 0);

        if (ddl_country.Text == "Country")
        {
            l_coun.ForeColor = ColorTranslator.FromHtml("#c94e4e");
        }
        else if (ddl_country.Text == "Philippines")
        {
            l_coun.Text = "Present Address *";
            l_coun.ForeColor = ColorTranslator.FromHtml("#2188ae");

            if (txt_baranggay.Text.Length == 0)
            {
                l_coun.Text = "Invalid Input Barangay/Street *";
                l_coun.ForeColor = ColorTranslator.FromHtml("#c94e4e");
            }

            if (ddl_city.Text.Length == 0)
            {
                l_coun.Text = "Invalid Input City *";
                l_coun.ForeColor = ColorTranslator.FromHtml("#c94e4e");
            }

            if (ddl_province.Text.Length == 0)
            {
                l_coun.Text = "Invalid Input Province *";
                l_coun.ForeColor = ColorTranslator.FromHtml("#c94e4e");
            }

            if (ddl_region.Text.Length == 0)
            {
                l_coun.Text = "Invalid Input Region *";
                l_coun.ForeColor = ColorTranslator.FromHtml("#c94e4e");
            }
        }
        else if (ddl_country.Text != "Philippines")
        {

            l_coun.Text = "Present Address *";
            l_coun.ForeColor = ColorTranslator.FromHtml("#2188ae");

            if (txt_baranggay.Text.Replace(" ", "").Length == 0)
            {
                l_coun.Text = "Invalid Input Barangay/Street *";
                l_coun.ForeColor = ColorTranslator.FromHtml("#c94e4e");
            }

            if (ddl_city.Text.Trim().Replace(" ", "").Length == 0)
            {
                l_coun.Text = "Invalid Input City *";
                l_coun.ForeColor = ColorTranslator.FromHtml("#c94e4e");
            }

            if (ddl_province.Text.Replace(" ", "").Trim().Length == 0)
            {
                l_coun.Text = "Invalid Input Province *";
                l_coun.ForeColor = ColorTranslator.FromHtml("#c94e4e");
            }

            if (ddl_region.Text.Replace(" ", "").Trim().Length == 0)
            {
                l_coun.Text = "Invalid Input Region *";
                l_coun.ForeColor = ColorTranslator.FromHtml("#c94e4e");
            }
        }
        else
        {
            l_coun.Text = "Present Address *";
            l_coun.ForeColor = ColorTranslator.FromHtml("#2188ae");
        }

        l_mn.ForeColor = fromhtml(txt_cel.Text.Replace(" ", "").Length > 0);
        l_ea.ForeColor = fromhtml(Regex.IsMatch(txt_email.Text, "^([0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$"));
        l_db.ForeColor = fromhtml(txt_from.Text.Replace(" ", "") != "");

        try
        {
            if (txtCaptcha.Text.Trim().Length == 0 || txtCaptcha.Text != Session["captcha"].ToString())
                txtCaptcha.Style.Add("border", "1px solid red");
            else
                txtCaptcha.Style.Add("border", "1px solid #3c94b4");
        }
        catch (Exception ex) {}

        if (txtCaptcha.Style.Value.Contains("red") || (l_educ.ForeColor.ToString() + l_addpic.ForeColor.ToString() + l_fname.ForeColor.ToString() + l_mname.ForeColor.ToString() + l_lname.ForeColor.ToString() + l_coun.ForeColor.ToString() + l_mn.ForeColor.ToString() + l_ea.ForeColor.ToString()).Contains("[A=255, R=201, G=78, B=78]"))
            ret = false;

        return ret;
    }

    protected Color fromhtml(bool val)
    {
        return val ? ColorTranslator.FromHtml("#2188ae") : ColorTranslator.FromHtml("#c94e4e");
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        FillCapctha();
    }

    private void gridviewrow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dt.Columns.Add(new DataColumn("col_1", typeof(string)));

        dr = dt.NewRow();
        dr["RowNumber"] = "1.";
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

                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumber"] = i + 1;
                dtCurrentTable.Rows[i - 1]["col_1"] = txt_description.Text;

                if (i == dtCurrentTable.Rows.Count)
                    lbl_descripton.Text = txt_description.Text.Replace(" ", "").Length == 0 ? "empty" : "";

                if ((lbl_descripton.Text).Contains("empty"))
                    goto exit;

                rowIndex++;
            }

            dtCurrentTable.Rows.Add(drCurrentRow);
            ViewState["Item_List"] = dtCurrentTable;

            grid_item.DataSource = dtCurrentTable;
            grid_item.DataBind();
        }


    exit:
        setPreviousData();
        return rowIndex;
    }

    protected void setPreviousData()
    {
        if (ViewState["Item_List"] != null)
        {
            DataTable dt = (DataTable)ViewState["Item_List"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Label Label1 = (Label)grid_item.Rows[i].Cells[0].FindControl("Label1");
                    TextBox txt_description = (TextBox)grid_item.Rows[i].Cells[1].FindControl("txt_description");
                    Label1.Text = Convert.ToString(i + 1) + ".";
                    txt_description.Text = dt.Rows[i]["col_1"].ToString();
                }
            }
        }
    }

    protected void grid_item_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (ViewState["Item_List"] != null)
        {
            setrowskills();
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

                setPreviousData();
            }
            else
                gridviewrow();
        }
    }

    protected void setrowskills()
    {
        DataTable dtCurrentTable = new DataTable();
        DataRow drCurrentRow = null;
        dtCurrentTable.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("col_1", typeof(string)));

        if (grid_item.Rows.Count > 0)
        {
            for (int i = 0; i < grid_item.Rows.Count; i++)
            {
                TextBox txt_description = (TextBox)grid_item.Rows[i].Cells[1].FindControl("txt_description");
                Label lbl_descripton = (Label)grid_item.Rows[i].Cells[1].FindControl("lbl_descripton");

                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumber"] = i;
                drCurrentRow["col_1"] = txt_description.Text;
                dtCurrentTable.Rows.Add(drCurrentRow);
            }

            ViewState["Item_List"] = dtCurrentTable;
            grid_item.DataSource = dtCurrentTable;
            grid_item.DataBind();
        }
    }

    protected void Deleting_employmenthistory(object sender, GridViewDeleteEventArgs e)
    {
        if (ViewState["governmentlicenses"] != null)
        {
            setrowemployment();
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

                setPreviousData_governmentlicenses();
            }
            else
                gridviewrow_governmentlicenses();
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
        dr["RowNumber"] = "1.";
        dr["col_1"] = string.Empty;
        dr["col_2"] = string.Empty;
        dr["col_3"] = string.Empty;

        dt.Rows.Add(dr);

        ViewState["governmentlicenses"] = dt;
        grid_employmenthistory.DataSource = dt;
        grid_employmenthistory.DataBind();
    }

    protected void setrowemployment()
    {
        DataTable dtCurrentTable = new DataTable();
        DataRow drCurrentRow = null;
        dtCurrentTable.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("col_1", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("col_2", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("col_3", typeof(string)));

        if (grid_employmenthistory.Rows.Count > 0)
        {
            for (int i = 0; i < grid_employmenthistory.Rows.Count; i++)
            {
                TextBox txt_employmenthistory_c_name_address = (TextBox)grid_employmenthistory.Rows[i].Cells[1].FindControl("txt_employmenthistory_c_name_address");
                TextBox txt_employmenthistory_position = (TextBox)grid_employmenthistory.Rows[i].Cells[2].FindControl("txt_employmenthistory_position");
                TextBox txt_from = (TextBox)grid_employmenthistory.Rows[i].Cells[3].FindControl("txt_from");
                TextBox txt_to = (TextBox)grid_employmenthistory.Rows[i].Cells[3].FindControl("txt_to");

                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumber"] = i;
                drCurrentRow["col_1"] = txt_employmenthistory_position.Text;
                drCurrentRow["col_2"] = txt_employmenthistory_c_name_address.Text;
                drCurrentRow["col_3"] = txt_from.Text + "-" + txt_to.Text;
                dtCurrentTable.Rows.Add(drCurrentRow);
            }

            ViewState["governmentlicenses"] = dtCurrentTable;
            grid_employmenthistory.DataSource = dtCurrentTable;
            grid_employmenthistory.DataBind();
        }
    }

    protected void setPreviousData_governmentlicenses()
    {
        if (ViewState["governmentlicenses"] != null)
        {
            DataTable dt = (DataTable)ViewState["governmentlicenses"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Label Label1 = (Label)grid_employmenthistory.Rows[i].Cells[0].FindControl("Label1");
                    TextBox txt_employmenthistory_c_name_address = (TextBox)grid_employmenthistory.Rows[i].Cells[1].FindControl("txt_employmenthistory_c_name_address");
                    TextBox txt_employmenthistory_position = (TextBox)grid_employmenthistory.Rows[i].Cells[2].FindControl("txt_employmenthistory_position");
                    TextBox txt_from = (TextBox)grid_employmenthistory.Rows[i].Cells[3].FindControl("txt_from");
                    TextBox txt_to = (TextBox)grid_employmenthistory.Rows[i].Cells[3].FindControl("txt_to");

                    Label1.Text = Convert.ToString(i + 1) + ".";
                    txt_employmenthistory_c_name_address.Text = dt.Rows[i]["col_1"].ToString();
                    txt_employmenthistory_position.Text = dt.Rows[i]["col_2"].ToString();
                    string[] date = dt.Rows[i]["col_3"].ToString().Split('-');
                    if (date.Length == 2)
                    {
                        txt_from.Text = date[0];
                        txt_to.Text = date[1];
                    }
                }
            }
        }
    }

    protected void clickaddbutton_governmentlicenses(object sender, EventArgs e)
    {
        int x = addnewerow_governmentlicenses();
    }

    protected int addnewerow_governmentlicenses()
    {
        int rowIndex = 0;
        DataTable dtCurrentTable = (DataTable)ViewState["governmentlicenses"];
        DataRow drCurrentRow = null;

        if (dtCurrentTable.Rows.Count > 0)
        {
            for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
            {
                TextBox txt_employmenthistory_c_name_address = (TextBox)grid_employmenthistory.Rows[rowIndex].Cells[1].FindControl("txt_employmenthistory_c_name_address");
                TextBox txt_employmenthistory_position = (TextBox)grid_employmenthistory.Rows[rowIndex].Cells[2].FindControl("txt_employmenthistory_position");
                TextBox txt_from = (TextBox)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("txt_from");
                TextBox txt_to = (TextBox)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("txt_to");

                Label lbl_employmenthistory_c_name_address = (Label)grid_employmenthistory.Rows[rowIndex].Cells[1].FindControl("lbl_employmenthistory_c_name_address");
                Label lbl_employmenthistory_position = (Label)grid_employmenthistory.Rows[rowIndex].Cells[2].FindControl("lbl_employmenthistory_position");
                Label lbl_employmenthistory_from = (Label)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("lbl_employmenthistory_from");
                Label lbl_employmenthistory_to = (Label)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("lbl_employmenthistory_to");

                if (i == dtCurrentTable.Rows.Count)
                {
                    lbl_employmenthistory_from.Text = (txt_from.Text).Length == 0 ? "empty" : "";
                    lbl_employmenthistory_to.Text = (txt_to.Text).Length == 0 ? "empty" : "";
                    lbl_employmenthistory_position.Text = txt_employmenthistory_position.Text.Length == 0 ? "empty" : "";
                    lbl_employmenthistory_c_name_address.Text = txt_employmenthistory_c_name_address.Text.Length == 0 ? "empty" : "";
                }

                if ((lbl_employmenthistory_to.Text + lbl_employmenthistory_from.Text + lbl_employmenthistory_position.Text + lbl_employmenthistory_c_name_address.Text).Contains("empty"))
                    goto exit;

                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumber"] = i + 1;
                dtCurrentTable.Rows[i - 1]["col_1"] = txt_employmenthistory_c_name_address.Text;
                dtCurrentTable.Rows[i - 1]["col_2"] = txt_employmenthistory_position.Text;
                dtCurrentTable.Rows[i - 1]["col_3"] = (txt_from.Text + "-" + txt_to.Text).ToString();
                rowIndex++;

            }

            dtCurrentTable.Rows.Add(drCurrentRow);
            ViewState["governmentlicenses"] = dtCurrentTable;
            grid_employmenthistory.DataSource = dtCurrentTable;
            grid_employmenthistory.DataBind();
        }

    exit:
        setPreviousData_governmentlicenses();
        return rowIndex;
    }

    protected void SetProfile()
    {
        string base64 = dataURLInto.Text;
        if (base64.Length > 0)
        {
            setAspectRatio.Src = dataURLInto.Text;
            setAspectRatio.Height = 100;
            setAspectRatio.Attributes.Add("style", " border:1px solid #3c94b4; padding:5px");
        }

        //if (hf_policy.Value == "0")
        //{
            policy.Visible = false;
           // overlay.Visible = false;
      //  }
    }

    protected void year()
    {
        int i = DateTime.Now.Year + 1;
        for (; i > 1980; i--)
        {
            ddl_elemmonth.Items.Add((i - 1).ToString());
            ddl_secondmonth.Items.Add((i - 1).ToString());
            ddl_collegemonth.Items.Add((i - 1).ToString());
            ddl_vocationalmonth.Items.Add((i - 1).ToString());

            ddl_collegeyear.Items.Add((i - 1).ToString());
            ddl_elemyear.Items.Add((i - 1).ToString());
            ddl_secondyear.Items.Add((i - 1).ToString());
            ddl_vocationalyear.Items.Add((i - 1).ToString());
        }
    }

    protected void countrylist()
    {
        string[] country_arr = { "Afghanistan", "Albania", "Algeria", "American Samoa", "Angola", "Anguilla", "Antartica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Ashmore and Cartier Island", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burma", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Clipperton Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo, Democratic Republic of the", "Congo, Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czeck Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Europa Island", "Falkland Islands (Islas Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern and Antarctic Lands", "Gabon", "Gambia, The", "Gaza Strip", "Georgia", "Germany", "Ghana", "Gibraltar", "Glorioso Islands", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard Island and McDonald Islands", "Holy See (Vatican City)", "Honduras", "Hong Kong", "Howland Island", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Ireland, Northern", "Israel", "Italy", "Jamaica", "Jan Mayen", "Japan", "Jarvis Island", "Jersey", "Johnston Atoll", "Jordan", "Juan de Nova Island", "Kazakhstan", "Kenya", "Kiribati", "Korea, North", "Korea, South", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Man, Isle of", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Midway Islands", "Moldova", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcaim Islands", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romainia", "Russia", "Rwanda", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Scotland", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and South Sandwich Islands", "Spain", "Spratly Islands", "Sri Lanka", "Sudan", "Suriname", "Svalbard", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Tobago", "Toga", "Tokelau", "Tonga", "Trinidad", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "Uruguay", "USA", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands", "Wales", "Wallis and Futuna", "West Bank", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe" };
        ddl_country.Items.Add("Country");
        foreach (string val in country_arr)
        {
            ddl_country.Items.Add(val);
        }
    }

    protected void courses()
    {
        DataTable dt = dbhelper.getdata("select * from courses where [status]=1 order by name");
        foreach (DataRow row in dt.Rows)
        {
            ddl_courses.Items.Add(row["name"].ToString());
        }
    }

    protected void FillCapctha()
    {
        Random random = new Random();
        string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        StringBuilder captcha = new StringBuilder();

        for (int i = 0; i < 6; i++)
            captcha.Append(combination[random.Next(combination.Length)]);

        Session["captcha"] = captcha.ToString();
        hf_captcha.Value = Session["captcha"].ToString();
        imgCaptcha.ImageUrl = "../../GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
    }

    protected void click_upload(object sender, EventArgs e)
    {
        string path = "temp/" + hd_jobid.Value + "_" + Session["captcha"].ToString();
        string fname = Path.GetFileName(FileUpload1.FileName);
        string FileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);
        FileUpload1.SaveAs(Server.MapPath("~/" + path) + FileExtension);

        txt_resume.Text = FileExtension;
        filename.Text = fname;
        paraupload.Text = hd_jobid.Value + "_" + Session["captcha"].ToString();

        fdoc.InnerText = fname.Substring(0, 7) + ".." + FileExtension;
        if (txt_resume.Text == ".pdf")
            educ_span.Attributes.Add("style", "background:url(style/img/icon/i-pdf.png) center no-repeat; border-radius:3px");
        else
            educ_span.Attributes.Add("style", "background:url(style/img/icon/i-word.png) center no-repeat; border-radius:3px");

        l_educ.Style.Add("margin", "-14px 0 0 -42px");
    }

    protected void click_apply(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("select * from Jobs where id = " + hd_jobid.Value);
        hf_property.Value = dt.Rows[0]["loc_id"].ToString();
        Session["job_id"] = hd_jobid.Value;
        SetProfile();
        //Response.Redirect("formapp");
        popmodal(true);
    }

    protected void close_modal(object sender, EventArgs e)
    {
        popmodal(false);
    }

    protected void popmodal(bool x)
    {
        overlay.Visible = x;
        modal.Visible = x;
    }

    protected void home(object sender, EventArgs e)
    {
        Response.Redirect("recruitment");
    }

    protected void view_all(object sender, EventArgs e)
    {
        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
        "b.job_type " +
        "from Jobs a " +
        "left join JobType b on a.jobtype_id=b.jobtype_id " +
        "where a.status='1' and a.loc_id='" + TextBox1.Text + "' order by CONVERT(varchar,a.job_subject)";

        ds = bol.displayData(query);
        grid_subject.DataSource = ds;
        grid_subject.DataBind();

        DataTable dt = ds.Tables[0];
        lbl_header.Text = lbl_brr.Text;
        pnl_det.Visible = false;
        pnl_pos.Visible = true;
    }

    protected void boundgridsub(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Label lbl = (Label)e.Row.FindControl("lbl_details");
            //if(lbl.Text.Length < 300)
            //    lbl.Text = lbl.Text.Replace("\n", "<br/>");
            //else
            //    lbl.Text = lbl.Text.Replace("\n", "<br/>").Substring(0, 300) + "...";
        }
    }

    protected void view(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {

            id = row.Cells[0].Text;
            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
            "b.job_type " +
            "from Jobs a " +
            "left join JobType b on a.jobtype_id=b.jobtype_id " +
            "where a.status='1' and a.loc_id='" + TextBox1.Text + "' and b.jobtype_id=" + id + "  order by CONVERT(varchar,a.job_subject)";

            ds = bol.displayData(query);
            grid_subject.DataSource = ds;
            grid_subject.DataBind();

            DataTable dt = ds.Tables[0];
            lbl_header.Text = lbl_brr.Text + " > " + dt.Rows[0]["job_type"].ToString();

            pnl_det.Visible = false;
            pnl_pos.Visible = true; 

        }
    }

    protected void goForm(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Response.Write("<script>alert('a')</script>");

            idd = row.Cells[0].Text;
            hd_jobid.Value = idd;

           // Response.Redirect("FormDetails?frm_id=" + idd + "");

            LinkButton lb = (LinkButton)row.FindControl("lnkEdit");
            pnl_det.Visible = true;
            pnl_pos.Visible = false;
            lbl_header.Text = lbl_header.Text + " > " + lb.Text;

            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date],a.section,a.qualification, " +
            "b.job_type " +
            "from Jobs a " +
            "left join JobType b on a.jobtype_id=b.jobtype_id " +
            "where a.id=" + idd + " ";
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(query);

            if (dt.Rows[0]["section"].ToString().Trim() == "")
                sec.Visible = false;
            else
                sec.Visible = true;
               
            lbl_section.Text = dt.Rows[0]["section"].ToString();
            //if (dt.Rows[0]["qualification"].ToString().Trim() == "")
            //    qua.Visible = false;
            //else
            //{
            //    qua.Visible = true;
            //    lbl_qualification.Text = dt.Rows[0]["qualification"].ToString().Replace("\n", "<br/>");
            //}
            if (dt.Rows[0]["qualification"].ToString().Trim() == "")
                job.Visible = false;
            else
            {
                job.Visible = true;
                txt_details.Text = dt.Rows[0]["qualification"].ToString().Replace("\n", "<br/>");
            }

            lbl_title.Text = dt.Rows[0]["job_subject"].ToString();
            lbl_type.Text = dt.Rows[0]["job_type"].ToString();

        }
    }

    protected void maribago(object sender, EventArgs e)
    {
        LinkButton2.Visible = true;
        hd_logo.Value = "1";

        lbl_brr.Text = "Maribago";
        logoo.Visible = false;
        suwaatt.Visible = false;


        string query = "select COUNT(*) as all_jobs from Jobs where status='1' and status <> 'deleted' and loc_id=1 ";
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);

        lbl_all.Text = "All(" + dt.Rows[0]["all_jobs"].ToString() + ")";

        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
            "b.jobtype_id " +
            "from JobType a " +
            "left join Jobs b on a.jobtype_id=b.jobtype_id " +
            "where b.status='1' and b.status <> 'deleted' and b.loc_id=1 " +
             "and a.status is null " +
            "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_type.DataSource = ds;
        grid_type.DataBind();

       


        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                "b.job_type " +
                "from Jobs a " +
                "left join JobType b on a.jobtype_id=b.jobtype_id " +
                "where (a.status='1' or a.status <> 'deleted') and b.status is null and a.loc_id=1 ";

        if (grid_type.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_type.Rows[0].Cells[0].Text + "'";
            Label1.Text = "";
            lbl_header.Text = "";
        }
        else
            Label1.Text = "No Data Found";

        ds = bol.displayData(query);
        grid_subject.DataSource = ds;
        grid_subject.DataBind();

        panel.Visible = true;
        TextBox1.Text = "1";
    }


    protected void property()
    {
        string[] url = Request.RawUrl.ToString().Split('/');
        string x = url[url.Length - 1].ToLower();

        if (x.Length > 0 && url[url.Length - 1].ToLower() != "recruitment")
        {

        LinkButton2.Visible = true;
        logoo.Visible = false;
        suwaatt.Visible = false;
        pnl_det.Visible = false;
        pnl_pos.Visible = true;

        switch (url[url.Length-1].ToLower())
        {
            case "maribago":
                hd_logo.Value = "1";
                lbl_header.Text = "Maribago";
                lbl_brr.Text = "Maribago";
                break;
            case "panglao":
                hd_logo.Value = "2";
                lbl_header.Text = "Panglao";
                lbl_brr.Text = "Panglao";
                break;
            case "sumilon":
                hd_logo.Value = "3";
                lbl_header.Text = "Sumilon";
                lbl_brr.Text = "Sumilon";
                break;
            case "amuma":
                hd_logo.Value = "5";
                lbl_header.Text = "Amuma Spa";
                lbl_brr.Text = "Amuma Spa";
                break;
            case "almont":
                hd_logo.Value = "4";
                lbl_header.Text = "Almont";
                lbl_brr.Text = "Almont";
                break;
            case "arc":
                hd_logo.Value = "8";
                lbl_header.Text = "ARC Hospitals";
                lbl_brr.Text = "ARC Hospitals";
                break;
            case "onecentral":
                hd_logo.Value = "9";
                lbl_header.Text = "One Central Hotel";
                lbl_brr.Text = "One Central Hotel";
                break;
            case "bluebubble":
                hd_logo.Value = "10";
                lbl_header.Text = "Blue Bubble";
                lbl_brr.Text = "Blue Bubble";
                break;
        }

       
            string query = "select COUNT(*) as all_jobs from Jobs where status='1' and status <> 'deleted' and loc_id=" + hd_logo.Value;
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(query);
            lbl_all.Text = "All (" + dt.Rows[0]["all_jobs"].ToString() + ")";

            query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
           "b.jobtype_id " +
           "from JobType a " +
           "left join Jobs b on a.jobtype_id=b.jobtype_id " +
           "where b.status='1' and b.status <> 'deleted' and b.loc_id=" + hd_logo.Value + " " +
           "and a.status is null " +
           "group by a.job_type,b.jobtype_id ";
            ds = bol.displayData(query);
            grid_type.DataSource = ds;
            grid_type.DataBind();

            query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
           "b.job_type " +
           "from Jobs a " +
           "left join JobType b on a.jobtype_id=b.jobtype_id " +
           "where a.status='1' and a.loc_id='" + hd_logo.Value + "' and b.status is null order by CONVERT(varchar,a.job_subject) ";

            ds = bol.displayData(query);
            grid_subject.DataSource = ds;
            grid_subject.DataBind();

            panel.Visible = true;
            TextBox1.Text = hd_logo.Value;
        }
    }
   

    protected void click_property(object sender, EventArgs e)
    {
        LinkButton bt = (LinkButton)sender;

        LinkButton2.Visible = true;
        hd_logo.Value = bt.CommandName;
        lbl_brr.Text = bt.ToolTip;
        logoo.Visible = false;
        suwaatt.Visible = false;
        lbl_header.Text = bt.ToolTip;
        pnl_det.Visible = false;
        pnl_pos.Visible = true;

        string query = "select COUNT(*) as all_jobs from Jobs where status='1' and status <> 'deleted' and loc_id=" + bt.CommandName;
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);
        lbl_all.Text = "All (" + dt.Rows[0]["all_jobs"].ToString() + ")";
        
        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
        "b.jobtype_id " +
        "from JobType a " +
        "left join Jobs b on a.jobtype_id=b.jobtype_id " +
        "where b.status='1' and b.status <> 'deleted' and b.loc_id=" + bt.CommandName + " " +
        "and a.status is null " +
        "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_type.DataSource = ds;
        grid_type.DataBind();

        //query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
        //"b.job_type " +
        //"from Jobs a " +
        //"left join JobType b on a.jobtype_id=b.jobtype_id " +
        //"where (a.status='1' or a.status <> 'deleted') and b.status is null and a.loc_id=" + bt.CommandName;

        //if (grid_type.Rows.Count != 0)
        //{
        //    query += "and b.jobtype_id='" + grid_type.Rows[0].Cells[0].Text + "'";
        //    Label1.Text = "";
        //    lbl_header.Text = "";
        //}
        //else
        //{
        //    //logoo.Visible = true;
        //    //suwaatt.Visible = true;
        //    Label1.Text = "No Data Found";
        //}

        //ds = bol.displayData(query);
        //grid_subject.DataSource = ds;
        //grid_subject.DataBind();

        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
        "b.job_type " +
        "from Jobs a " +
        "left join JobType b on a.jobtype_id=b.jobtype_id " +
        "where a.status='1' and a.loc_id='" + bt.CommandName + "' order by CONVERT(varchar,a.job_subject) ";

        ds = bol.displayData(query);
        grid_subject.DataSource = ds;
        grid_subject.DataBind();

        panel.Visible = true;
        TextBox1.Text = bt.CommandName;

    }

    protected void panglao(object sender, EventArgs e)
    {
        LinkButton2.Visible = true;
        hd_logo.Value = "2";
        lbl_brr.Text = "Panglao";
        logoo.Visible = false;
        suwaatt.Visible = false;

        string query = "select COUNT(*) as all_jobs from Jobs where status='1' and status <> 'deleted' and loc_id=2 ";
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);
        lbl_all.Text = "All(" + dt.Rows[0]["all_jobs"].ToString() + ")";


        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
            "b.jobtype_id " +
            "from JobType a " +
            "left join Jobs b on a.jobtype_id=b.jobtype_id " +
            "where b.status='1' and b.status <> 'deleted' and b.loc_id=2 " +
             "and a.status is null " +
            "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_type.DataSource = ds;
        grid_type.DataBind();

        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                "b.job_type " +
                "from Jobs a " +
                "left join JobType b on a.jobtype_id=b.jobtype_id " +
                "where (a.status='1' or a.status <> 'deleted') and b.status is null and a.loc_id=2 ";

        if (grid_type.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_type.Rows[0].Cells[0].Text + "'";
            Label1.Text = "";
            lbl_header.Text = "";
        }
        else
        {
            //logoo.Visible = true;
            //suwaatt.Visible = true;
            Label1.Text = "No Data Found";
        }
        ds = bol.displayData(query);
        grid_subject.DataSource = ds;
        grid_subject.DataBind();
        panel.Visible = true;
        TextBox1.Text = "2";
    }

    protected void Sumilon(object sender, EventArgs e)
    {
        LinkButton2.Visible = true;
        hd_logo.Value = "3";
        lbl_brr.Text = "Sumilon";
        logoo.Visible = false;
        suwaatt.Visible = false;

        string query = "select COUNT(*) as all_jobs from Jobs where status='1' and status <> 'deleted' and loc_id=3 ";
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);
        lbl_all.Text = "All(" + dt.Rows[0]["all_jobs"].ToString() + ")";


        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
            "b.jobtype_id " +
            "from JobType a " +
            "left join Jobs b on a.jobtype_id=b.jobtype_id " +
            "where b.status='1' and b.status <> 'deleted' and b.loc_id=3 " +
             "and a.status is null " +
            "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_type.DataSource = ds;
        grid_type.DataBind();

        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                "b.job_type " +
                "from Jobs a " +
                "left join JobType b on a.jobtype_id=b.jobtype_id " +
                "where (a.status='1' or a.status <> 'deleted') and b.status is null and a.loc_id=3 ";

        if (grid_type.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_type.Rows[0].Cells[0].Text + "'";
            Label1.Text = "";
            lbl_header.Text = "";
        }
        else
        {
            //logoo.Visible = true;
            //suwaatt.Visible = true;
            Label1.Text = "No Data Found";
        }
        ds = bol.displayData(query);
        grid_subject.DataSource = ds;
        grid_subject.DataBind();
        panel.Visible = true;
        TextBox1.Text = "3";
    }

    protected void Almont(object sender, EventArgs e)
    {
        LinkButton2.Visible = true;
        hd_logo.Value = "4";
        lbl_brr.Text = "Almont";
        logoo.Visible = false;
        suwaatt.Visible = false;

        string query = "select COUNT(*) as all_jobs from Jobs where status='1' and status <> 'deleted' and loc_id=4 ";
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);
        lbl_all.Text = "All(" + dt.Rows[0]["all_jobs"].ToString() + ")";


        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
            "b.jobtype_id " +
            "from JobType a " +
            "left join Jobs b on a.jobtype_id=b.jobtype_id " +
            "where b.status='1' and b.status <> 'deleted' and b.loc_id=4 " +
             "and a.status is null " +
            "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_type.DataSource = ds;
        grid_type.DataBind();

        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                 "b.job_type " +
                 "from Jobs a " +
                 "left join JobType b on a.jobtype_id=b.jobtype_id " +
                 "where (a.status='1' or a.status <> 'deleted') and b.status is null and a.loc_id=4 ";

        if (grid_type.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_type.Rows[0].Cells[0].Text + "'";
            Label1.Text = "";
            lbl_header.Text = "";
        }
        else
        {
            //logoo.Visible = true;
            //suwaatt.Visible = true;
            Label1.Text = "No Data Found";
        }
        ds = bol.displayData(query);
        grid_subject.DataSource = ds;
        grid_subject.DataBind();
        panel.Visible = true;
        TextBox1.Text = "4";
    }

    protected void Amuma(object sender, EventArgs e)
    {
        LinkButton2.Visible = true;
        hd_logo.Value = "5";
        lbl_brr.Text = "Amuma";
        logoo.Visible = false;
        suwaatt.Visible = false;

        string query = "select COUNT(*) as all_jobs from Jobs where status='1' and status <> 'deleted' and loc_id=5 ";
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);
        lbl_all.Text = "All(" + dt.Rows[0]["all_jobs"].ToString() + ")";

        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
            "b.jobtype_id " +
            "from JobType a " +
            "left join Jobs b on a.jobtype_id=b.jobtype_id " +
            "where b.status='1' and b.status <> 'deleted' and b.loc_id=5 " +
             "and a.status is null " +
            "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_type.DataSource = ds;
        grid_type.DataBind();

        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                "b.job_type " +
                "from Jobs a " +
                "left join JobType b on a.jobtype_id=b.jobtype_id " +
                "where (a.status='1' or a.status <> 'deleted') and b.status is null and a.loc_id=5 ";

        if (grid_type.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_type.Rows[0].Cells[0].Text + "'";
            Label1.Text = "";
            lbl_header.Text = "";
        }
        else
        {
            //logoo.Visible = true;
            //suwaatt.Visible = true;
            Label1.Text = "No Data Found";
        }
        ds = bol.displayData(query);
        grid_subject.DataSource = ds;
        grid_subject.DataBind();
        panel.Visible = true;
        TextBox1.Text = "5";
    }

    protected void Others(object sender, EventArgs e)
    {
        LinkButton2.Visible = true;
        hd_logo.Value = "6";
        lbl_brr.Text = "Others";
        logoo.Visible = false;
        suwaatt.Visible = false;

        string query = "select COUNT(*) as all_jobs from Jobs where status='1' and status <> 'deleted' and loc_id=6 ";
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);
        lbl_all.Text = "All(" + dt.Rows[0]["all_jobs"].ToString() + ")";


        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
            "b.jobtype_id " +
            "from JobType a " +
            "left join Jobs b on a.jobtype_id=b.jobtype_id " +
            "where b.status='1' and b.status <> 'deleted' and b.loc_id=6 " +
             "and a.status is null " +
            "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_type.DataSource = ds;
        grid_type.DataBind();


        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
               "b.job_type " +
               "from Jobs a " +
               "left join JobType b on a.jobtype_id=b.jobtype_id " +
               "where (a.status='1' or a.status <> 'deleted')  and b.status is null and a.loc_id=6 ";

        if (grid_type.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_type.Rows[0].Cells[0].Text + "'";
            Label1.Text = "";
            lbl_header.Text = "";
        }
        else
        {
            //logoo.Visible = true;
            //suwaatt.Visible = true;
            Label1.Text = "No Data Found";
        }
        ds = bol.displayData(query);
        grid_subject.DataSource = ds;
        grid_subject.DataBind();
        panel.Visible = true;
        TextBox1.Text = "6";
    }

    protected void arch(object sender, EventArgs e)
    {
        LinkButton2.Visible = true;
        hd_logo.Value = "7";
        lbl_brr.Text = "ARC Hospital";
        logoo.Visible = false;
        suwaatt.Visible = false;

        string query = "select COUNT(*) as all_jobs from Jobs where status='1' and status <> 'deleted' and loc_id=7 ";
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);
        lbl_all.Text = "All(" + dt.Rows[0]["all_jobs"].ToString() + ")";


        query = "select count(b.jobtype_id) as cnnt, a.job_type, " +
            "b.jobtype_id " +
            "from JobType a " +
            "left join Jobs b on a.jobtype_id=b.jobtype_id " +
            "where b.status='1' and b.status <> 'deleted' and b.loc_id=7 " +
             "and a.status is null " +
            "group by a.job_type,b.jobtype_id ";
        ds = bol.displayData(query);
        grid_type.DataSource = ds;
        grid_type.DataBind();


        query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
               "b.job_type " +
               "from Jobs a " +
               "left join JobType b on a.jobtype_id=b.jobtype_id " +
               "where (a.status='1' or a.status <> 'deleted')  and b.status is null and a.loc_id=7 ";

        if (grid_type.Rows.Count != 0)
        {
            query += "and b.jobtype_id='" + grid_type.Rows[0].Cells[0].Text + "'";
            Label1.Text = "";
            lbl_header.Text = "";
        }
        else
        {
            //logoo.Visible = true;
            //suwaatt.Visible = true;
            Label1.Text = "No Data Found";
        }
        ds = bol.displayData(query);
        grid_subject.DataSource = ds;
        grid_subject.DataBind();
        panel.Visible = true;
        TextBox1.Text = "7";
    }

    protected void txt_TextChanged(object sender, EventArgs e)
    {
        Response.Redirect("search?key=" + txt_search.Text + "");
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Successfully');window.open('','_new').location.href='search/" + txt_search.Text + "'", true);
    }
}