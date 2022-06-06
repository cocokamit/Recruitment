using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Net;
using System.Web.Services;
using System.Text;
using System.Web.Security;

public partial class content_HR_applicants : System.Web.UI.Page
{
    public static string email, app_id, pd;
    DataSet ds = new DataSet();

    public static string afterit = "";
    public static string[] spl = { "" };
    public static string[] spl2 = { "" };
    public static string[] spl3 = { "" };
    public static string[] spl4 = { "" };
    public static string[] spl5 = { "" };
    public string appid = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("quit");

        if (!IsPostBack)
            disp();
    }

    protected void click_forwardmail(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = (DataTable)ViewState["data"];
            DataTable attainment = (DataTable)ViewState["attainment"];
            DataTable history = (DataTable)ViewState["employmenthistory"];
            string special = (string)ViewState["skills"];
            string address = (string)ViewState["address"];
            string weblocation = "http://" + HttpContext.Current.Request.Url.Authority + "/IEF?APOD=" + butyok.Encrypt(dt.Rows[0]["id"].ToString(), true);
            string mail = message.applicant(dt, attainment, history, special, address, weblocation);
            b_forward.Visible = false;

            emailsender.MailSenderAttachment(mail, tb_mail.Text.Replace(" ", ""), "Applicant", dt);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Resume Sent Successfully.'); window.location='appl'", true);
        }
        catch (Exception es)
        {
            modaldanger.Style.Add("display", "block");

            if (tb_mail.Text.Replace(" ", "").Length == 0)
            {
                lblDangerTitle.Text = "Required Field";
                lblDangerContent.Text = "Supply Email.";
            }
            else
            {
                lblDangerTitle.Text = "Email Authentication";
                lblDangerContent.Text = "Please check email credential.";
            }
        }

    }

    protected void click_dl(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = dbhelper.getdata("select * from applicant where id=" + ViewState["app_id"].ToString() + "");
            string filePath = "~/Document/app_id_" + ViewState["app_id"].ToString() + "/" + dt.Rows[0]["resume_file"].ToString();
            Response.Clear();
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + dt.Rows[0]["resume_file"].ToString());
            Response.WriteFile(filePath);
            Response.End();
        }
        catch
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No File Attached!');", true);
        }

    }

    protected void click_savepostion(object sender, EventArgs e)
    {
        foreach (ListItem listItem in drop_type.Items)
        {
            if (listItem.Selected)
            {
                var val = listItem.Value;
                var txt = listItem.Text;
            }
        }
    }

    [WebMethod]
    public static string savepostion(string id, string val, string com)
    {
        string hold = "";
        if (val.Length > 0)
        {
            string[] pass = val.Split(',');
            foreach (string item in pass)
            {
                if (item != com)
                    hold += item + ",";
            }
        }

        val = hold.Length == 0 ? "" : "," + hold.Replace(com, "").Substring(0, hold.Length - 1);
        dbhelper.getdata("update applicant set pos_desire='" + val + "' where id=" + id + "");
        return "1";
    }

    [WebMethod]
    public static string addpostion(string id)
    {
        int cnt = 0;
        string builder = null;
        DataTable dt = dbhelper.getdata("select (select CAST(job_subject as varchar(1000)) from jobs where id=a.job_id) + case when pos_desire is null then '' else  cast(pos_desire as varchar(1000)) end pos_desire  from applicant a where a.id=" + id);
        string[] pos = dt.Rows[0]["pos_desire"].ToString().Split(',');

        dt = dbhelper.getdata("select CAST(job_subject as varchar(max)) job_subject from jobs where status='1' group by CAST(job_subject as varchar(max)) order by CAST(job_subject as varchar(max))");
        foreach (DataRow row in dt.Rows)
        {
            bool naa = false;
            string val = row["job_subject"].ToString();
            foreach (string item in pos)
            {
                if (item == row["job_subject"].ToString())
                {
                    naa = true;
                    val = "~" + val;
                    cnt++;
                }
            }
            builder += val + ",";
        }

        if (cnt == 0)
            builder += builder + "~" + pos[0];

        return builder;
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_app.PageIndex = e.NewPageIndex;
        this.searchapplicant();
    }

    protected void click_refresh(object sender, EventArgs e)
    {
        Response.Redirect("appl");
    }

    protected void click_advance(object sender, EventArgs e)
    {
        if (advance.Visible)
        {
            Response.Redirect("appl");
            advance.Visible = false;
            lb_advance.CssClass = "fa fa-sliders";
        }
        else
        {
            advance.Visible = true;
            lb_advance.CssClass = "fa fa-times-circle";
        }
    }

    protected string basequery(string condition)
    {
        return
        "select a.id,a.resume_file, a.date_app, a.present_add, a.gender,a.dateofbirth, a.cell_no, a.email, a.property pro_id,a.date_app,replace(a.name,',',' ') name,a.status,a.recommendation, " +
        "case when (select top 1 loc from loc_per_app  where  app_id=a.id order by id desc) is null then (select description from location where id=b.loc_id) else (select top 1 loc from loc_per_app  where  app_id=a.id order by id desc) end property, " +
        "case when (select COUNT(*) from examineer where app_id=a.id)=0 then 'Not Yet' else 'Done' end exam_stat, " +
        "(select CAST(job_subject as varchar(1000)) from jobs where id=a.job_id) + case when pos_desire is null then '' else  cast(pos_desire as varchar(1000)) end pos_desire " +
        "from applicant a " +
        "left join Jobs b on a.job_id=b.id " +
        "left join JobType c on b.jobtype_id=c.jobtype_id " +
        "where a.status<>'Transferred' and a.status<>'reject' and a.status<>'cancel' " + condition + " order by a.date_app desc ";
    }

    protected void single_trans(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //Button5.Visible = true;
            //Button4.Visible = false;
            //panelOverlay.Visible = true;
            //Div3.Visible = true;
            ViewState["trans_id"] = row.Cells[0].Text;
            modalproperty.Style.Add("display", "block");
            drop_prop.SelectedIndex = 0;
        }
    }

    protected void save_single_trans(object sender, EventArgs e)
    {
        string id = ViewState["trans_id"].ToString();
        if (drop_prop.Text.Length > 0)
        {
            string query = "insert into loc_per_app values(" + id + ",getdate(),'" + drop_prop.SelectedItem.ToString() + "', " + drop_prop.SelectedValue + ")";
            dbhelper.getdata(query);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully.'); window.location='appl'", true);
        }
    }

    protected void gridItemSorting(object sender, GridViewSortEventArgs e)
    {
        disp();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        string query = null;
        if (advance.Visible)
        {
            query += drop_typee.Text.Length == 0 ? "" : "and (select CAST(job_subject as varchar(1000)) from jobs where id=a.job_id) + case when pos_desire is null then '' else cast(pos_desire as varchar(1000)) end like '%" + drop_typee.Text + "%' ";
            query += drop_stat.Text.Length == 0 ? "" : "and a.status like '%" + drop_stat.Text + "%' ";
            query += drop_proper.SelectedIndex == 0 ? "" : "and case when (select top 1 loc from loc_per_app  where  app_id=a.id order by id desc) is null then (select description from location where id=b.loc_id) else (select top 1 loc from loc_per_app  where  app_id=a.id order by id desc) end like '%" + drop_proper.SelectedItem.ToString() + "%' ";
            query += txt_skills.Text.Trim().Length == 0 ? "" : "and case when (SELECT skills AS 'data()' FROM special_skills where app_id=a.id FOR XML PATH('')) is null then '' else (SELECT skills AS 'data()' FROM special_skills where app_id=a.id FOR XML PATH('')) end like '%" + txt_skills.Text.Trim() + "%' ";
            if (txt_from.Text.Trim().Length > 0 && txt_to.Text.Trim().Length > 0)
                query += "and CONVERT(datetime,date_app)  between CONVERT(datetime,'" + txt_from.Text + "') and CONVERT(datetime,'" + txt_to.Text + "') + 1 ";
        }

        string s = basequery(query);
        if (Session["ngalan"].ToString() == "HR")
            ds = bol.displayData(basequery(query));
        else
            ds = bol.displayData(basequery(query + "and case when (select top 1 property from loc_per_app  where  app_id=a.id order by id desc) is null then (select id from location where id=b.loc_id) else (select top 1 property from loc_per_app  where  app_id=a.id order by id desc) end=" + Session["property"].ToString()));


        dt = ds.Tables[0];
        {
            string SortDir = string.Empty;

            if (dir == SortDirection.Ascending)
            {
                dir = SortDirection.Descending;
                SortDir = " Desc";
            }
            else
            {
                dir = SortDirection.Ascending;
                SortDir = " Asc";
            }

            DataView sortedView = new DataView(dt);
            sortedView.Sort = e.SortExpression + " " + SortDir;
            grid_app.DataSource = sortedView;
            grid_app.DataBind();

        }
    }

    public SortDirection dir
    {
        get
        {
            if (ViewState["dirState"] == null)
            {
                ViewState["dirState"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["dirState"];
        }
        set
        {
            ViewState["dirState"] = value;
        }
    }

    protected void chkboxSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox ChkBoxHeader = (CheckBox)grid_app.HeaderRow.FindControl("chkboxSelectAll");
        int i = 0;
        foreach (GridViewRow row in grid_app.Rows)
        {
            CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkEmp");

            if (ChkBoxHeader.Checked == true)
            {
                ChkBoxRows.Checked = true;
                i++;
            }
            else
            {
                ChkBoxRows.Checked = false;
                if (i > 0)
                {
                    i--;
                }
            }

        }
        lbl_del_notify.Text = i + " rows".ToString();
    }

    protected void delete(object sender, EventArgs e)
    {
        if (TextBox1.Text == "Yes")
        {
            string query = "";
            for (int i = 0; i <= grid_app.Rows.Count - 1; i++)
            {
                CheckBox chkEmp = (CheckBox)grid_app.Rows[i].FindControl("chkEmp");
                if (chkEmp.Checked == true)
                {
                    butyok.Sys_log(Session["user_id"].ToString(), "delete", grid_app.Rows[i].Cells[0].Text);
                    query += "update Applicant set status='cancel',date_cancelled=getdate() where id=" + grid_app.Rows[i].Cells[0].Text + " ";
                }
            }

            if (query.Replace(" ", "").Length > 0)
            {
                dbhelper.getdata(query);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted Successfully!'); window.location='appl'", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select Applicant!'); window.location='appl'", true);
        }
    }

    protected void trans(object sender, EventArgs e)
    {
        //Button5.Visible = false;
        //Button4.Visible = true;
        //string test = "";
        //for (int i = 0; i <= grid_app.Rows.Count - 1; i++)
        //{
        //    CheckBox chkEmp = (CheckBox)grid_app.Rows[i].FindControl("chkEmp");
        //    if (chkEmp.Checked == true)
        //    {
        //        test = "naa";
        //    }
        //}

        //if (test.Trim().Length > 0)
        //{
        //    panelOverlay.Visible = true;
        //}
        //else
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Kindly select applicant'); window.location='appl'", true);

    }

    protected void save_trans(object sender, EventArgs e)
    {
        if (drop_prop.SelectedItem.ToString() != "")
        {
            string query = "";
            for (int i = 0; i <= grid_app.Rows.Count - 1; i++)
            {
                CheckBox chkEmp = (CheckBox)grid_app.Rows[i].FindControl("chkEmp");
                if (chkEmp.Checked == true)
                    query += "insert into loc_per_app values(" + grid_app.Rows[i].Cells[0].Text + ",getdate(),'" + drop_prop.SelectedItem.ToString() + "'," + drop_prop.SelectedValue + ")";
            }

            dbhelper.getdata(query);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully.'); window.location='appl'", true);
        }
        else
            drop_prop.Style.Add("style", "border:none; border: 1px solid red;");
    }

    protected void search(object sender, EventArgs e)
    {
        searchapplicant();
    }

    protected void searchapplicant()
    {
        DataSet ds = new DataSet();
        string query = null;

        query += txt_name.Text.Replace(" ", "").Length == 0 ? "" : "and a.name like '%" + txt_name.Text.Trim() + "%' ";
        if (advance.Visible)
        {
            query += drop_typee.Text.Length == 0 ? "" : "and (select CAST(job_subject as varchar(1000)) from jobs where id=a.job_id) + case when pos_desire is null then '' else cast(pos_desire as varchar(1000)) end like '%" + drop_typee.Text + "%' ";
            query += drop_stat.SelectedIndex == 0 ? "" : "and a.status = '" + drop_stat.SelectedItem + "' ";
            query += drop_proper.SelectedIndex == 0 ? "" : "and case when (select top 1 loc from loc_per_app  where  app_id=a.id order by id desc) is null then (select description from location where id=b.loc_id) else (select top 1 loc from loc_per_app  where  app_id=a.id order by id desc) end like '%" + drop_proper.SelectedItem.ToString() + "%' ";
            query += txt_skills.Text.Trim().Length == 0 ? "" : "and case when (SELECT skills AS 'data()' FROM special_skills where app_id=a.id FOR XML PATH('')) is null then '' else (SELECT skills AS 'data()' FROM special_skills where app_id=a.id FOR XML PATH('')) end like '%" + txt_skills.Text.Trim() + "%' ";
            if (txt_from.Text.Trim().Length > 0 && txt_to.Text.Trim().Length > 0)
                query += "and CONVERT(datetime,date_app)  between CONVERT(datetime,'" + txt_from.Text + "') and CONVERT(datetime,'" + txt_to.Text + "') + 1 ";
        }
        string s = basequery(query);
        if (Session["ngalan"].ToString() == "HR")
            ds = bol.displayData(basequery(query));
        else
            ds = bol.displayData(basequery(query + "and case when (select top 1 property from loc_per_app  where  app_id=a.id order by id desc) is null then (select id from location where id=b.loc_id) else (select top 1 property from loc_per_app  where  app_id=a.id order by id desc) end=" + Session["property"].ToString()));

        grid_app.DataSource = ds.Tables["table"];
        grid_app.DataBind();
    }

    protected void disp()
    {
        if (Session["ngalan"].ToString() == "HR")
            ds = bol.displayData(basequery(null));
        else
        {
            lnk_delete.Visible = false;
            string query = "and(";
            string[] desig = Session["designation"].ToString().Split(' ');
            for (int i = 0; i < desig.Length; i++)
            {
                string or = i == desig.Length - 2 ? "" : " or ";
                query += desig[i].Length > 0 ? "c.jobtype_id=" + desig[i] + or : "";
            }
            query += ")";
            //query = basequery("and case when (select top 1 property from loc_per_app  where  app_id=a.id order by id desc) is null then (select id from location where id=b.loc_id) else (select top 1 property from loc_per_app  where  app_id=a.id order by id desc) end=" + Session["property"].ToString() + query);
            ds = bol.displayData(basequery("and case when (select top 1 property from loc_per_app  where  app_id=a.id order by id desc) is null then (select id from location where id=b.loc_id) else (select top 1 property from loc_per_app  where  app_id=a.id order by id desc) end=" + Session["property"].ToString() + query));
        }

        grid_app.DataSource = ds;
        grid_app.DataBind();
        alert.Visible = grid_app.Rows.Count == 0 ? true : false;
        setaction();
    }

    protected void grid_app_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //LinkButton lnk = (LinkButton)e.Row.FindControl("lnk_pd");
            LinkButton chk = (LinkButton)e.Row.FindControl("lnk_con");
            DataTable dt = dbhelper.getdata("select * from applicant where id=" + e.Row.Cells[0].Text + "");
            string[] gg = dt.Rows[0]["pos_desire"].ToString().Split(',');

            //if (lnk.Text.Length >= 30)
            //    lnk.Text = lnk.Text.ToString().Substring(0, 29) + "..";
            if (Session["ngalan"].ToString() == "HR")
                chk.Visible = false;


            LinkButton lnk_st = (LinkButton)e.Row.FindControl("lnk_st");
            switch (lnk_st.Text)
            {
                case "Acknowledgment":
                    lnk_st.Text = "Acknowledged";
                    lnk_st.CssClass += "primary";
                    break;
                case "Interview":
                    lnk_st.Text = "For Interview";
                    lnk_st.CssClass += "orange";
                    break;
                case "Examination":
                    lnk_st.Text = "For Examination";
                    lnk_st.CssClass += "warning";
                    break;
                case "Final interview":
                    lnk_st.CssClass += "default";
                    break;
                case "Rejection":
                    lnk_st.CssClass += "danger";
                    break;
                default:
                    lnk_st.CssClass += "success";
                    break;
            }
        }
    }

    protected void click_view(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            DataTable dt;
            ViewState["data"] = dt = dbhelper.getdata(basequery("and a.id=" + row.Cells[0].Text));
            ViewState["app_id"] = row.Cells[0].Text;
            ViewState["app_no"] = butyok.Encrypt(row.Cells[0].Text, true);
            ViewState["applicant"] = l_name.Text = dt.Rows[0]["name"].ToString();
            ViewState["position"] = l_pos.Text = dt.Rows[0]["pos_desire"].ToString();
            ViewState["gender"] = dt.Rows[0]["gender"].ToString();
            ViewState["birth"] = parsebirthdate(dt.Rows[0]["dateofbirth"].ToString());
            ViewState["contact"] = dt.Rows[0]["cell_no"].ToString();
            ViewState["email"] = dt.Rows[0]["email"].ToString();
            ViewState["address"] = parseaddress(dt.Rows[0]["present_add"].ToString(), int.Parse(row.Cells[0].Text));
            ViewState["profile"] = "UploadImages/prof_id_" + row.Cells[0].Text + "/" + row.Cells[0].Text + ".png";

            ViewState["skills"] = parseskill(row.Cells[0].Text);

            l_app.Text = DateTime.Parse(dt.Rows[0]["date_app"].ToString()).ToString("MMMM dd, yyyy");

            ViewState["attainment"] = dt = dbhelper.getdata("select * from Education where CONVERT(varchar,[address]) = '-' and app_id=" + row.Cells[0].Text);
            ViewState["school"] = dt.Rows.Count == 0 ? "-" : dt.Rows[0]["level"].ToString();
            ViewState["degree"] = dt.Rows.Count == 0 ? "-" : dt.Rows[0]["school"].ToString();

            ViewState["employmenthistory"] = dt = dbhelper.getdata("select * from EmploymentHistory where app_id=" + row.Cells[0].Text + " order by datef desc");
            if (dt.Rows.Count > 0)
                ViewState["employeement"] = dt.Rows[0]["company"].ToString().Length == 0 ? "-" : dt.Rows[0]["position"].ToString();
            else
                ViewState["employeement"] = "-";

            string weblocation = "http://" + HttpContext.Current.Request.Url.Authority + "/IEF?APOD=" + butyok.Encrypt(row.Cells[0].Text, true);
          
            ViewState["emplink"]=weblocation;
            //Applicants Activity
            div_referral.Visible = false;
            ViewState["act_log"] = dt = dbhelper.getdata("select * from applicant_log where app_id=" + row.Cells[0].Text + " order by id desc");

            //UI Control
            modalinfo.Style.Add("display", "block");
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "window.open('','_new').location.href='appldet?app_id=" + row.Cells[0].Text+"'", true);
        }
    }

    protected void Click_SubmitMail(object sender, EventArgs e)
    {
        if (CheckMail())
        {
            try
            {
                string email = ViewState["email"].ToString();
                string app_id = ViewState["app_id"].ToString();
                dbhelper.getdata("update Applicant set status = '" + ddl_action.SelectedItem.ToString() + "' where id=" + app_id + " insert into applicant_log values (" + app_id + ", getdate(),'" + ddl_action.SelectedItem.ToString() + "'," + Session["user_id"].ToString() + ")");
                dbhelper.getdata("update NewApplicant set Status = '" + ddl_action.SelectedItem.ToString() + "',DateHired = GETDATE() where Id = " + app_id + "");

                emailsender.MailSender(compose_textarea.Text.Trim(), email, ddl_action.SelectedItem.ToString(), "");
               
                if (ddl_action.SelectedValue == "7")
                {
                    dbhelper.getdata("insert into app_message(date,app_id,status,msg,e_id,action)values(GETDATE()," + app_id + ",'" + ddl_action.SelectedItem.ToString() + "','" + compose_textarea.Text.Trim() + "','" + ddl_action.SelectedValue + "','" + ddl_action.SelectedItem.ToString() + "')");
                    //  emailsender.MailSender(compose_textarea.Text.Trim(), email, ddl_action.SelectedItem.ToString(), "");

                    DataTable dt = dbhelper.getdata2("insert into MEmployee(LastName,FirstName,MiddleName,FullName,Address,PhoneNumber,CellphoneNumber,EmailAddress,DateOfBirth,DateHired,Sex,BranchId,PositionId,CivilStatus,IdNumber,NonTaxableAllowance,NonTaxableActingCapacityAllowance,GrossMonthlyRate,NonTaxableNightShiftDifference,emp_status,Division2,PayrollGroupId,ProvincialAddress,PlaceOfBirth,PlaceOfBirthZipCodeId,CivilStatus,CitizenshipId,ReligionId,Height,Weight,bloodtype,bloodtype,health_card,SSSNumber,HDMFNumber,PHICNumber,TIN,GSISNumber,ZipCodeId)(Select LastName,FirstName,MiddleName,FullName,Address,PhoneNumber,CellphoneNumber,EmailAddress,DateOfBirth,DateHired,Gender,'0',PositionId,'0','000-000','0','0','0','0','1','0','8',ProvencialAddress,PlaceOfBirth,PlaceOfBirthZipCodeId,CivilStatus,CitizenshipId,ReligionId,Height,Weight,bloodtype,bloodtype,health_card,SSSNumber,HDMFNumber,PHICNumber,TIN,GSISNumber,AddressZipcode from CLI_Recruitment.dbo.NewApplicant where Status like '%Transferred%' and Review = '0' and Remarks is NULL )select SCOPE_IDENTITY() lastid ");
                    DataTable dtt = dbhelper.getdata2("insert into nobel_user(acc_id,emp_id,name,username,password)(select '3','" + dt.Rows[0]["lastid"].ToString() + "',FullName,'000-000','0000' from CLI_Recruitment.dbo.NewApplicant where Status like '%Transferred%' and Review = '0' and Remarks is NULL) select SCOPE_IDENTITY() lastid");
                    dbhelper.getdata2("insert into MUser(UserName,Password,FullName,EntryUserId,EntryDateTime,UpdateUserId,UpdateDateTime,IsLocked,dept_id,branch_id,position,emp_id,designation)select '000-000','000-000',FullName,'1',GETDATE(),'1',GETDATE(),'1','0','0','EMPLOYEE','" + dt.Rows[0]["lastid"].ToString() + "','EMPLOYEE' from CLI_Recruitment.dbo.NewApplicant where Status like '%Transferred%' and Review = '0' and Remarks is NULL");
                    dbhelper.getdata2("insert into sys_notification values(GETDATE(),'New Hired Applicant','0','" + dt.Rows[0]["lastid"].ToString() + "','employee?user_id=BDhMXZmHca4=&app_id=" + dt.Rows[0]["lastid"].ToString() + "&tp=ed','0','0','" + compose_textarea.Text.Trim() + "')");
                    dbhelper.getdata2("insert into EmergencyContact(UserId,EmpId,Name,Address,Contact,Sysdate)(Select " + dt.Rows[0]["lastid"].ToString() + ",'" + dt.Rows[0]["lastid"].ToString() + "',a.Name,a.Address,a.Contact,a.Sysdate from CLI_Recruitment.dbo.EmergencyContact a left join CLI_Recruitment.dbo.NewApplicant b on a.app_id=b.Id where b.Status like '%Transferred%' and b.Review = '0' and b.Remarks is NULL )");
                    dbhelper.getdata2("insert into Mskilline(date,empid,userid,skill)(Select a.date," + dt.Rows[0]["lastid"].ToString() + "," + dtt.Rows[0]["lastid"].ToString() + ",a.skills from CLI_Recruitment.dbo.special_skills a left join CLI_Recruitment.dbo.NewApplicant b on a.app_id=b.Id where b.Status like '%Transferred%' and b.Review = '0' and b.Remarks is NULL )");
                    dbhelper.getdata2("insert into Mjobhistory(date,empid,userid,position,company,datef,datet)(Select GETDATE()," + dt.Rows[0]["lastid"].ToString() + "," + dtt.Rows[0]["lastid"].ToString() + ",a.position,a.company,a.datef,a.datet from CLI_Recruitment.dbo.EmploymentHistory a left join CLI_Recruitment.dbo.NewApplicant b on a.app_id=b.Id where b.Status like '%Transferred%' and b.Review = '0' and b.Remarks is NULL )");
                    dbhelper.getdata2("insert into Meducattainment(date,empid,userid,class,school,address,yearf,yeart)(Select a.date," + dt.Rows[0]["lastid"].ToString() + "," + dtt.Rows[0]["lastid"].ToString() + ",a.class,a.school,a.address,a.yearf,a.yeart from CLI_Recruitment.dbo.Meducattainment a left join CLI_Recruitment.dbo.NewApplicant b on a.app_id=b.Id where b.Status like '%Transferred%' and b.Review = '0' and b.Remarks is NULL )");

                    DataTable dreqs = dbhelper.getdata2("Select * from orley_empsrequirement where description='Job Requirements'");
                    if (dreqs.Rows.Count == 0)
                    {
                        dreqs = dbhelper.getdata2("insert into orley_empsrequirement values('Job Requirements','ACTIVE') select scope_identity() id");
                    }

                    DataTable dtrn = dbhelper.getdata2("insert into file_trn(date,userid,empid,description,file_codes,action)(Select a.date," + dt.Rows[0]["lastid"].ToString() + "," + dtt.Rows[0]["lastid"].ToString() + ",a.Filename," + dreqs.Rows[0]["id"].ToString() + ",'1' from CLI_Recruitment.dbo.file_details a left join CLI_Recruitment.dbo.NewApplicant b on a.AppId=b.Id where b.Status like '%Transferred%' and b.Review = '0' and b.Remarks is NULL ) select scope_identity() id");

                    if (dtrn.Rows.Count > 0)
                    {
                        dbhelper.getdata2("insert into file_details(date,userid,empid,classid,location,filename,description,status,contenttype,trn_file_id,filecode,filename2)(Select a.date," + dt.Rows[0]["lastid"].ToString() + "," + dtt.Rows[0]["lastid"].ToString() + ",'2','files/archiving/" + dt.Rows[0]["lastid"].ToString() + "',a.Filename,a.Filename,'Active',a.Contenttype," + dtrn.Rows[0]["id"].ToString() + "," + dreqs.Rows[0]["id"].ToString() + ",a.Extension from CLI_Recruitment.dbo.file_details a left join CLI_Recruitment.dbo.NewApplicant b on a.AppId=b.Id where b.Status like '%Transferred%' and b.Review = '0' and b.Remarks is NULL )");

                        string filename = Server.MapPath("document/app_id_" + app_id + "/");
                        foreach (var file in Directory.GetFiles(filename))
                        {
                            string filepath2 = Server.MapPath("documentToHRIS/recruitmentfiles/" + app_id + "/");
                            DirectoryInfo di2 = Directory.CreateDirectory(filepath2);
                            var copyToPath = Path.Combine(filepath2, Path.GetFileName(file));
                            File.Copy(file, copyToPath);
                        }
                    }


                    Response.Write(dt);
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ddl_action.SelectedItem.ToString() + " Successfully Submitted'); ", true);
                CloseModal();
            }
            catch
            {
                modaldanger.Style.Add("display", "block");
                lblDangerTitle.Text = "Email Authentication";
                lblDangerContent.Text = "Please check email credential.";
            }
        }
    }

    protected bool CheckMail()
    {
        bool bol = true;
        l_MailAction.Text = ddl_action.SelectedIndex == 0 ? "*" : "";
        l_MailMessage.Text = compose_textarea.Text.Replace(" ", "").Length == 0 ? "*" : "";
        if ((l_MailAction.Text + l_MailMessage.Text).Contains("*"))
            bol = false;

        return bol;
    }

    protected void onchange_mail(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)ViewState["EmailTemplate"];
        DataRow[] dr = dt.Select("id=" + ddl_template.SelectedValue);
        compose_textarea.Text = dr.Length == 0 ? "" : dr[0][2].ToString();
    }

    protected void click_mail(object sender, EventArgs e)
    {
        modal_email.Style.Add("display", "block");
        compose_textarea.Text = null;
        ddl_template.SelectedIndex = 0;
        ddl_action.SelectedIndex = 0;
    }

    protected void click_closemail(object sender, EventArgs e)
    {
        modal_email.Style.Add("display", "none");
    }

    protected void setaction()
    {
        DataTable dt;
        int i = 0;
        ddl_action.Items.Clear();
        ddl_action.Items.Add(new ListItem("", "0"));
        drop_stat.Items.Clear();
        drop_stat.Items.Add(new ListItem("", "0"));
        drop_stat.Items.Add(new ListItem("New Applicant", "7"));
        ViewState["sys_status"] = dt = dbhelper.getdata("select * from applicant_status order by id");
        foreach (DataRow ow in dt.Rows)
        {
            ddl_action.Items.Add(new ListItem(ow["name"].ToString(), ow["id"].ToString()));
            if (i < 4)
                drop_stat.Items.Add(new ListItem(ow["name"].ToString(), ow["id"].ToString()));
            i++;
        }

        ddl_template.Items.Clear();
        ddl_template.Items.Add(new ListItem("None", "0"));
        ViewState["EmailTemplate"] = dt = dbhelper.getdata("select * from email order by title");
        foreach (DataRow ow in dt.Rows)
        {
            ddl_template.Items.Add(new ListItem(ow["title"].ToString(), ow["id"].ToString()));
        }
    }

    protected string parseskill(string id)
    {
        string hold = "";
        DataTable dt = dbhelper.getdata("select * from special_skills where app_id=" + id);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                if (row["skills"].ToString().Length > 0)
                    hold += row["skills"] + ",<br/> ";
            }
        }
        else
            hold = "-";

        return hold.Length < 3 ? "-" : hold.Substring(0, hold.Trim().Length - 1).ToLower();
    }

    protected static string statparseskill(string id)
    {
        string hold = "";
        DataTable dt = dbhelper.getdata("select * from special_skills where app_id=" + id);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                if (row["skills"].ToString().Length > 0)
                    hold += row["skills"] + ",<br/> ";
            }
        }
        else
            hold = "-";

        return hold.Length < 3 ? "-" : hold.Substring(0, hold.Trim().Length - 1).ToLower();
    }


    protected string parseaddress(string address, int id)
    {
        string hold = null;
        string[] add = address.Split('|');

        for (int i = add.Length; i > 0; i--)
        {
            if (i > 2)
                hold += add[i - 1] + " ";
        }
        return hold.ToLower();
    }

    protected static string statparseaddress(string address, int id)
    {
        string hold = "";
        string[] add = address.Split('|');

        if (add.Length > 1)
        {
            for (int i = add.Length; i > 0; i--)
            {
                if (i > 2)
                    hold += add[i - 1] + " ";
            }
        }
        else
        {
            hold = address;
        }
        return hold.ToLower();
    }


    protected string parsebirthdate(string date)
    {
        try
        {
            DateTime now = DateTime.Today;
            DateTime pass = DateTime.Parse(date);
            int age = now.Year - pass.Year;
            date = pass.ToString("MMMM dd, yyyy") + " (" + age + " years old)";
        }
        catch { }

        return date;
    }

    protected void click_addpd(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("select * from applicant where id=" + app_id + "");
        dbhelper.getdata("update applicant set pos_desire='" + dt.Rows[0]["pos_desire"].ToString() + "," + drop_type.Text + "' where id=" + app_id + "");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully.'); window.location='appl'", true);
    }

    protected void click_remarks(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            app_id = row.Cells[0].Text;
            DataTable dt = dbhelper.getdata("select * from applicant where id=" + app_id + " ");
            if (dt.Rows[0]["remarks"].ToString().Length > 0)
            {
                txt_note.Text = dt.Rows[0]["remarks"].ToString();
            }
            else
                txt_note.Text = "";
            modalremarks.Style.Add("display", "block");

        }
    }

    protected void click_allow(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            appid = row.Cells[0].Text;

            DataTable dt = dbhelper.getdata("select a.*,b.LastName+', '+b.FirstName name from CLI_Recruitment.dbo.IEFallower a left join CebuLandMasters7.dbo.Memployee b on a.empId=b.Id where a.appId=" + appid + " ");
            hfallows.Value = "";

            spl = dt.AsEnumerable().Select(r => r.Field<string>("name")).ToArray();
            spl2 = dt.AsEnumerable().Select(r => r.Field<string>("allowIEF")).ToArray();
            spl3 = dt.AsEnumerable().Select(r => r.Field<int>("empid").ToString()).ToArray();
            spl4 = dt.AsEnumerable().Select(r => r.Field<string>("allowIEF").Replace("1", "IE Form").Replace("2", "Reference Check Form").Replace("3", "BI-CLI Connection Form").Replace("4", "Overview")).ToArray();
            spl5 = dt.AsEnumerable().Select(r => r.Field<int>("NoSent").ToString()).ToArray();
            
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow r in dt.Rows)
                {
                    hfallows.Value += r["empid"].ToString() + "*" + r["NoSent"].ToString() + "*" + r["allowIEF"].ToString() + "-";
                }
            }

            dt = dbhelper.getdata2("Select LastName+', '+FirstName [name],Id from Memployee order by LastName asc ");

            ddl_emp.Items.Clear();
            ddl_emp.Items.Add(new ListItem("", ""));
            foreach (DataRow r in dt.Rows)
            {
                ddl_emp.Items.Add(new ListItem(r["name"].ToString(), r["Id"].ToString()));
            }

            modalallower.Style.Add("display", "block");

        }
    }

    protected void click_st(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            hf_id.Value = row.Cells[0].Text;
            modalstatus.Style.Add("display", "block");
            DataTable status = (DataTable)ViewState["sys_status"];
            DataTable activities = dbhelper.getdata("select distinct [action] from applicant_log where app_id=" + row.Cells[0].Text + " order by [action] desc");
            ViewState["applicantid"] = hf_id.Value;
            ddl_status.Items.Clear();
            foreach (DataRow item in status.Rows)
            {
                bool nobel = true;
                foreach (DataRow activity in activities.Rows)
                {

                    string a = item["name"].ToString().ToLower();
                    string b = activity["action"].ToString().ToLower();
                    if (a == b)
                    {

                        nobel = false;
                        break;
                    }
                }

                if (nobel)
                    ddl_status.Items.Add(new ListItem(item["name"].ToString(), item["id"].ToString()));
            }


            //LinkButton lnk_st = (LinkButton)row.FindControl("lnk_st");
            //DataTable dt = dbhelper.getdata("select * from Applicant where id=" + row.Cells[0].Text + "");
            //email = dt.Rows[0]["email"].ToString();
            //app_id = row.Cells[0].Text;
            //if (lnk_st.Text == "For appointment")
            //{
            //    ddl_status.Items.Clear();
            //    ddl_status.Items.Add("For Exam");
            //    ddl_status.Items.Add(new ListItem("Not Qualified", "Reject"));
            //    li_2.Visible = true;

            //}
            //else if (lnk_st.Text == "For Exam")
            //{
            //    DataTable dtcheck = dbhelper.getdata("select * from examineer where app_id=" + app_id + "");
            //    if (dtcheck.Rows.Count > 0)
            //    {
            //        ddl_status.Items.Clear();
            //        ddl_status.Items.Add("For Initial Interview");
            //        ddl_status.Items.Add(new ListItem("Not Qualified", "Reject"));
            //        li_2.Visible = false;
            //    }
            //    else
            //    {
            //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Examination is not yet done.'); window.location='appl'", true);
            //    }
            //}
            //else if (lnk_st.Text == "For Initial Interview")
            //{
            //    ddl_status.Items.Clear();
            //    ddl_status.Items.Add("For HR Interview");
            //    ddl_status.Items.Add(new ListItem("Not Qualified", "Reject"));
            //    li_2.Visible = false;

            //}
            //else if (lnk_st.Text == "For HR Interview")
            //{
            //    ddl_status.Items.Clear();
            //    ddl_status.Items.Add("For Dept Interview");
            //    ddl_status.Items.Add(new ListItem("Not Qualified", "Reject"));

            //}
            //else if (lnk_st.Text == "For Dept Interview")
            //{
            //    ddl_status.Items.Clear();
            //    ddl_status.Items.Add("For GM Interview");
            //    ddl_status.Items.Add(new ListItem("Not Qualified", "Reject"));
            //    li_2.Visible = false;

            //}
            //else if (lnk_st.Text == "For GM Interview")
            //{
            //    ddl_status.Items.Clear();
            //    ddl_status.Items.Add("Hired");
            //    ddl_status.Items.Add(new ListItem("Not Qualified", "Reject"));
            //    li_2.Visible = false;

            //}
        }
    }

    protected void download(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            DataTable dt = dbhelper.getdata("select * from applicant where id=" + row.Cells[0].Text + "");
            string filePath = "~/Document/app_id_" + row.Cells[0].Text + "/" + dt.Rows[0]["resume_file"].ToString();
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }
    }

    protected void save_remarks(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("update applicant set remarks='" + txt_note.Text + "' where id=" + app_id + "");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully.'); window.location='appl'", true);
    }

    protected void note_close(object sender, EventArgs e)
    {
        CloseModal();
        //modalproperty.Style.Add("display", "none");
        //modalremarks.Style.Add("display", "none");
        //modalstatus.Style.Add("display", "none");
        //modalinfo.Style.Add("display", "none");
        //modal_email.Style.Add("display", "none");
        //note(false);
        //Div3.Visible = false;
    }

    protected void closeDanger(object sender, EventArgs e)
    {
        b_forward.Visible = true;
        modaldanger.Style.Add("display", "none");
        modalallower.Style.Add("display", "none");
    }

    protected void CloseModal()
    {
        modalproperty.Style.Add("display", "none");
        modalremarks.Style.Add("display", "none");
        modalstatus.Style.Add("display", "none");
        modalinfo.Style.Add("display", "none");
        modal_email.Style.Add("display", "none");
        modalallower.Style.Add("display", "none");

    }

    protected void select_exam_type(object sender, EventArgs e)
    {
        if (ddl_status.Text == "For Exam")
        {
            li_2.Visible = true;
        }
        else
        {
            li_2.Visible = false;
        }

        if (ddl_status.SelectedValue == "Reject")
        {
            s.Visible = false;
        }
        else
        {
            s.Visible = true;
        }
    }

    protected bool chek()
    {
        bool h = true;
        if (ddl_status.SelectedValue != "Reject")
        {

            if (tb_time.Text == "")
            {
                lbl_time.Text = "*";
                h = false;
            }
            else { lbl_time.Text = ""; }


            if (txt_date.Text == "")
            {
                lbl_date.Text = "*";
                h = false;
            }
            else { lbl_date.Text = ""; }
        }

        if (txt_messge.Text == "")
        { lbl_message.Text = "*"; h = false; }
        else { lbl_message.Text = ""; }
        if (ddl_status.Text == "")
        {
            lbl_status.Text = "*";
            h = false;
        }
        else { lbl_status.Text = ""; }
        return h;

    }

    protected void click_send(object sender, EventArgs e)
    {
        ViewState["applicantid"] = hf_id.Value;
        if (ddl_status.SelectedItem.ToString() == "Hired")
        { }
        else
        {
            dbhelper.getdata("update Applicant set status = '" + ddl_status.SelectedItem.ToString() + "' where id=" + hf_id.Value + " ");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully.'); window.location='appl'", true);
            dbhelper.getdata("update NewApplicant set Status = '" + ddl_status.SelectedItem.ToString() + "' where Id = " + hf_id.Value + "");
        }
        //if (chek())
        //{
        //    string sd = DateTime.Parse(tb_time.Text).ToString("hh:mm tt");
        //    string[] sdz = sd.Split(' ');
        //    string c_id;
        //    if (ddl_status.Text == "For Exam")
        //    {
        //        c_id = ddl_typeofexam.SelectedValue;
        //    }
        //    else
        //    {
        //        c_id = "NULL";
        //    }
        //    if (ddl_status.SelectedValue == "Reject")
        //    {
        //        DataTable dt = dbhelper.getdata("insert into app_message(date,status,msg,app_id,e_id,action,spe_date,spe_time,spe_period)values(getdate(),'" + ddl_status.Text + "','" + txt_messge.Text + "'," + app_id + ",NULL,'" + ddl_status.SelectedValue + "',NULL,NULL,NULL)");
        //    }
        //    else
        //    {
        //        DataTable dt = dbhelper.getdata("insert into app_message(date,status,msg,app_id,e_id,action,spe_date,spe_time,spe_period)values(getdate(),'" + ddl_status.Text + "','" + txt_messge.Text + "'," + app_id + "," + c_id + ",'" + ddl_status.SelectedValue + "','" + txt_date.Text + "','" + sdz[0] + "','" + sdz[1] + "')");
        //    }
        //    DataTable dtup = dbhelper.getdata("update Applicant set status='" + ddl_status.SelectedValue + "' where id=" + app_id + "");
        //    if (ddl_status.SelectedValue != "Reject" || ddl_status.Text == "Hired")
        //    {
        //        //string msg = message.newso(getdata.fitchdata1(app_id), app_id);
        //        //emailsender.emailsender1(msg, getdata.fitchdata1(app_id), email, "Hello", "marlon_salaw@gmail.com");
        //    }
        //}
    }

    protected void check_chk(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            app_id = row.Cells[0].Text;
            //CheckBox chk = (CheckBox)row.FindControl("check_commend");
            if (TextBox1.Text == "Yes")
            {
                string query = "update Applicant set recommendation='1' where id='" + app_id + "'";
                dbhelper.getdata(query);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully.'); window.location='appl'", true);
            }

        }
    }

    [WebMethod]
    public static void saveallow(string appId, string hfemp)
    {
        string[] split1 = hfemp.Split('-');

        if (split1.Length > 1)
        {
            dbhelper.getdata("Delete from IEFallower where appId=" + appId + "");
            foreach (string s in split1)
            {
                if (s != "")
                {
                    string split2 = s.Split('*')[0];
                    string split3 = s.Split('*')[1];
                    string split4 = s.Split('*')[2];

                    dbhelper.getdata("insert into IEFallower values(" + appId + "," + split2 + ",'" + split4 + "'," + split3 + ")");
                }
            }
        }
    }

    [WebMethod]
    public static string saveallowed(string appIds, string empId, string proxemail,string nosent)
    {
        DataTable d4 = dbhelper.getdata2("select * from Memployee where Id=" + empId + "");
        string result = "";
        try
        {
            if (d4.Rows[0]["EmailAddress"].ToString() != "" || proxemail != "")
            {
                DataTable d1 = dbhelper.getdata("Select *,emailaddress [email],cellphoneNumber [cell_no],Fullname [name],ResumeFile [resume_file] from NewApplicant where Id=" + appIds);
                DataTable d2 = dbhelper.getdata("select * from Education where CONVERT(varchar,[address]) = '-' and app_id=" + appIds);
                DataTable d3 = dbhelper.getdata("select * from EmploymentHistory where app_id=" + appIds + " order by datef desc");
                string weblocation = "http://" + HttpContext.Current.Request.Url.Authority + "/IEF?APOD=" + butyok.Encrypt(d1.Rows[0]["id"].ToString(), true);

                string mail = message.applicant(d1, d2, d3, statparseskill(appIds), statparseaddress(d1.Rows[0]["Address"].ToString(), int.Parse(appIds)), weblocation);

                if (d4.Rows[0]["EmailAddress"].ToString() != "")
                {
                    emailsender.MailSenderAttachment(mail, d4.Rows[0]["EmailAddress"].ToString().Replace(" ", ""), "Applicant", d1);
                }
                else if (proxemail != "") {
                    emailsender.MailSenderAttachment(mail, proxemail.Replace(" ", ""), "Applicant", d1);
                }

                dbhelper.getdata("update IEFallower set NoSent=" + (Convert.ToInt32(nosent) + 1).ToString() + " where appId=" + appIds + " and empId="+empId+"");
                result = "pass";
            }
            else
            {
                result = "emailnot";
            }
        }
        catch (Exception ex)
        {
            result = "emailcred";
        }

        return result;

    }
}
