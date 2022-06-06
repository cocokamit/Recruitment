using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.IO;

public partial class content_Manager_ViewMonPower : System.Web.UI.Page
{
    public static string id;
    public static string[] spl = { "" };
    public static string[] spl2 = { "" };
    public static string afterit = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("login");

        if (!IsPostBack)
            disp();
    }
    protected void download(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            LinkButton lnk_viewreq = (LinkButton)grid_req.Rows[row.RowIndex].Cells[1].FindControl("lnk_download");
            Response.Write("<script>window.open('http://localhost:51800/HRIS%20BACKUP/FDLR?LsIWsawER=" + lnk_viewreq.CommandName.ToString() + "&dswi=ORYg4UBENSw&dddel=sdeLSDsoxWl','_blank');</script>");
        }
    }

    protected void disp()
    {
        string query = "Select (select COUNT(*) from ManpowerLine where mpformId=a.id)appliNo,(case when (Select Count(*) from CLI_Recruitment.dbo.ManPower f where f.hrNotif=1 and f.id=a.id )>0 then 1 else 0 end ) mark,b.Branch,d.Department,LTRIM(ISNULL(c.LastName,'')+', '+ISNULL(c.FirstName,'')+' '+ ISNULL(c.MiddleName,'')+' '+ ISNULL(c.ExtensionName,'')) Fullname,a.* from CLI_Recruitment.dbo.ManPower a left join CebuLandMasters7.dbo.MBranch b on a.locationId=b.Id left join CebuLandMasters7.dbo.MEmployee c on a.acc_id=c.Id left join CebuLandMasters7.dbo.MDepartment d on a.departmentId=d.Id where a.status <> 'deleted' and (a.formstatus like '%approved%' or a.formstatus like '%hr%' or a.formstatus like '%hrd%' or a.formstatus like '%it%' or a.formstatus like '%itr%') order by a.date desc";
        DataSet ds = bol.displayData(query);
        grid_data.DataSource = ds.Tables["table"];
        grid_data.DataBind();

        alert.Visible = grid_data.Rows.Count == 0 ? true : false;


        DataTable dt = dbhelper.getdata2("Select a.Lastname+', '+a.Firstname+' '+Middlename [fullname],a.id,a.PositionId from MEmployee a order by lastname asc");
        drop_it2.Items.Clear();
        drop_it2.Items.Add(new ListItem(" ", "0"));
        foreach (DataRow dr in dt.Rows)
        {
            drop_it2.Items.Add(new ListItem(dr["fullname"].ToString(), dr["id"].ToString()));
        }
    }

    protected void add_close(object sender, EventArgs e)
    {
        Response.Redirect("viewmp", false);
    }

    protected void add_solution(object sender, EventArgs e)
    {
    }
    protected void view_App(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            id = row.Cells[0].Text;
            hfmanid.Value = id;
            hfcount.Value = row.Cells[6].Text;
            lbl_del_notify.Text = row.Cells[7].Text + "/" + hfcount.Value;
            hfmanstatus.Value = row.Cells[8].Text;
            DataTable dt = dbhelper.getdata("Select d.[status],a.*,case when (Select count(*) from ManpowerLine where applicantId=a.Id and mpformId=" + id + ")>0 then 1 else 0 end [checkers],(select CAST(job_subject as varchar(1000)) from jobs where id=a.PositionId) + case when PositionDesire is null then '' else  cast(PositionDesire as varchar(1000)) end pos_desire from NewApplicant a left join Jobs b on a.PositionId=b.id left join ManpowerLine c on a.Id=c.applicantId left join ManPower d on c.mpformId=d.id where a.[Status]='Hired' and (c.mpformId is NULL or c.mpformId=" + id + ") order by [checkers] desc");
          

            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["status"].ToString() == "Done")
                {
                    foreach (DataRow rows in dt.Rows)
                    {
                        if (rows["status"].ToString() == "")
                        {
                            rows.Delete();
                        }
                    }
                }
            }
            grid_view.DataSource = dt;
            grid_view.DataBind();

            Div4.Style.Add("display", "block");
        }
    }
    protected void view_ko(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {

            id = row.Cells[0].Text;
            
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(getdatas(id));

            if (dt.Rows[0]["hrNotif"].ToString() == "1")
            {
                dbhelper.getdata("update ManPower set hrNotif=0 where id=" + id + "");
            }
            drop_n.Text = dt.Rows[0]["manpower_needed"].ToString();
            drop_r.Text = dt.Rows[0]["nature_request"].ToString();
            txt_p.Text = dt.Rows[0]["position"].ToString();
            txt_np.Text = dt.Rows[0]["no_pax"].ToString();
            txt_dn.Text = dt.Rows[0]["date_needed"].ToString();
            txt_q.Text = dt.Rows[0]["qualifications"].ToString();
            txt_r.Text = dt.Rows[0]["description"].ToString();

            dorp_b.Text = dt.Rows[0]["Branch"].ToString();
            drop_d.Text = dt.Rows[0]["Department"].ToString();
            drop_rep.Text = dt.Rows[0]["Fullname2"].ToString();
            drop_l.Text = dt.Rows[0]["Division2"].ToString();
            drop_con.Text = dt.Rows[0]["positiontype"].ToString();
            txt_du.Text = dt.Rows[0]["duration"].ToString();
            drop_all.Text = dt.Rows[0]["allocation"].ToString();
            txt_s.Text = dt.Rows[0]["summaryfunc"].ToString();
            txt_sp.Text = dt.Rows[0]["exreq"].ToString();
            txt_ex.Text = dt.Rows[0]["exknowledge"].ToString();
            txt_req.Text = dt.Rows[0]["Fullname"].ToString();
            approvername.Text = dt.Rows[0]["Fullname3"].ToString();
            drop_appr.Text = dt.Rows[0]["formstatus"].ToString().Replace("DH", "");
            txtdate.Text = dt.Rows[0]["date"].ToString();
            txtfnum.Text = id;
            TextBox1.Text = dt.Rows[0]["description"].ToString();
            txt_appr.Text = dt.Rows[0]["appRemark"].ToString();
            txt_just.Text = dt.Rows[0]["justify"].ToString();   
            if (dt.Rows[0]["eligibility"].ToString() != "")
            {
                radiolist1.Items.FindByValue(dt.Rows[0]["eligibility"].ToString()).Selected = true;
            }

            afterit = "";
            //check if na.i HR
            if (dt.Rows[0]["hrStatus"].ToString() != "")
            {
                afterit = "1";
                hrcolor1.Attributes.Add("style", "");
                hrcolor2.Attributes.Add("style", "");
                Div2.Attributes.Add("style", "");
                hrstatus.Attributes.Add("style", "display:block;");
                Label3.Text = dt.Rows[0]["Fullname5"].ToString().Trim() == "," ? "Recruitment HR" : dt.Rows[0]["Fullname5"].ToString();
                Label4.Text = dt.Rows[0]["hrStatus"].ToString().Replace("hr", "");
                Button1.Attributes.Add("style", "display:none");
                Button2.Attributes.Add("style", "display:none");
                chcklist3.Attributes.Add("onclick", "return false;");

                radiolist1.Attributes.Add("onclick", "return false;");
                TextBox1.Attributes.Add("ReadOnly", "ReadOnly");

            }


            if (dt.Rows[0]["tooldept"].ToString() != "")
            {
                string[] split1 = dt.Rows[0]["tooldept"].ToString().Split('~')[0].Split(',');
                string[] split2 = dt.Rows[0]["tooldept"].ToString().Split('~')[1].Split(',');
                for (int i = 0; i < chcklist2.Items.Count; i++)
                {
                    for (int j = 0; j < split1.Count(); j++)
                    {
                        if (split1[j] == chcklist2.Items[i].Value)
                        {
                            chcklist2.Items[i].Selected = true;
                        }
                    }
                }

                spl = split2;
            }

            if (dt.Rows[0]["toolIT"].ToString() != "")
            {
                string[] split1 = dt.Rows[0]["toolIT"].ToString().Split('~')[0].Split(',');
                string[] split2 = dt.Rows[0]["toolIT"].ToString().Split('~')[1].Split(',');
                for (int i = 0; i < chcklist3.Items.Count; i++)
                {
                    for (int j = 0; j < split1.Count(); j++)
                    {
                        if (split1[j] == chcklist3.Items[i].Value)
                        {
                            chcklist3.Items[i].Selected = true;
                        }
                    }
                }

                spl2 = split2;
            }

           

            if (dt.Rows[0]["execReview"].ToString() != "")
            {
                Div2.Attributes.Add("style", "display:none;");
                Div1.Attributes.Add("style", "display:block;");
                Label5.Text = dt.Rows[0]["Fullname6"].ToString();
                Label6.Text = dt.Rows[0]["execStatus"].ToString().Replace("hrd", "");
            }

            if (dt.Rows[0]["execStatus"].ToString() != "")
            {
                Button4.Attributes.Add("style", "display:block");
                Button5.Attributes.Add("style", "display:block");
            }
          

            dt = dbhelper.getdata("Select * from mpfile_details where AppId=" + id);

            grid_req.DataSource = dt;
            grid_req.DataBind();
            div_msg.Visible = dt.Rows.Count == 0 ? true : false;

            modalview.Style.Add("display", "block");
        }
    }

    protected string getdatas(string id)
    {
        return "Select f.Division2,b.Branch,d.Department,LTRIM(ISNULL(c.LastName,'')+', '+ISNULL(c.FirstName,'')+' '+ ISNULL(c.MiddleName,'')+' '+ ISNULL(c.ExtensionName,'')) Fullname,"
                        + "LTRIM(ISNULL(e.LastName,'')+', '+ISNULL(e.FirstName,'')+' '+ ISNULL(e.MiddleName,'')+' '+ ISNULL(e.ExtensionName,'')) Fullname2,"
                        + "LTRIM(ISNULL(g.LastName,'')+', '+ISNULL(g.FirstName,'')+' '+ ISNULL(g.MiddleName,'')+' '+ ISNULL(g.ExtensionName,'')) Fullname3,"
                        + "LTRIM(ISNULL(h.LastName,'')+', '+ISNULL(h.FirstName,'')+' '+ ISNULL(h.MiddleName,'')+' '+ ISNULL(h.ExtensionName,'')) Fullname4,"
                        + "LTRIM(ISNULL(i.LastName,'')+', '+ISNULL(i.FirstName,'')+' '+ ISNULL(i.MiddleName,'')+' '+ ISNULL(i.ExtensionName,'')) Fullname5,"
                        + "LTRIM(ISNULL(j.LastName,'')+', '+ISNULL(j.FirstName,'')+' '+ ISNULL(j.MiddleName,'')+' '+ ISNULL(j.ExtensionName,'')) Fullname6,"

                        + "f.Division2,a.* from CLI_Recruitment.dbo.ManPower a "
                        + "left join CebuLandMasters7.dbo.MBranch b on a.locationId=b.Id "
                        + "left join CebuLandMasters7.dbo.MEmployee c on a.acc_id=c.Id "
                        + "left join CebuLandMasters7.dbo.MEmployee e on a.reporttoId=e.Id "
                        + "left join CebuLandMasters7.dbo.MEmployee g on a.approvedby=g.Id "
                        + "left join CebuLandMasters7.dbo.MDepartment d on a.departmentId=d.Id "
                        + "left join CebuLandMasters7.dbo.MDivision2 f on a.levelId=f.Id "
                        + "left join CebuLandMasters7.dbo.MEmployee h on a.itReview=h.Id "
                        + "left join CebuLandMasters7.dbo.MEmployee i on a.hrReview=i.Id "
                        + "left join CebuLandMasters7.dbo.MEmployee j on a.execReview=j.Id where a.id=" + id + "";
    }
    protected void save_status(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        if (btn.Text == "APPROVE")
        {
            DataTable dt = dbhelper.getdata("update ManPower set hrStatus='hr Approved '+CONVERT(varchar(50),GETDATE()),accNotif=1,execNotif=1,execReview=" + drop_it2.SelectedValue + ", description='" + TextBox1.Text + "',eligibility='" + radiolist1.SelectedValue + "' where id=" + id + "");

            DataTable dttt = dbhelper.getdata2(getdatas(id));

            dt = dbhelper.getdata2("Select * from mpfile_details where AppId=" + id + "");

            DataTable dtt = dbhelper.getdata("Select * from MEmployee where Id=" + drop_it2.SelectedValue + "");

            if (dtt.Rows.Count > 0)
            {
                emailsender.MailSenderAttachment(msag(dttt), dtt.Rows[0]["EmailAddress"].ToString(), "Manpower Request", dt);
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='viewmp'", true);
        }
        else if (btn.Text == "DECLINED")
        {
            DataTable dt = dbhelper.getdata("update ManPower set hrStatus='hr Declined '+CONVERT(varchar(50),GETDATE()),accNotif=1,appNotif=1,description='" + TextBox1.Text + "',eligibility='" + radiolist1.SelectedValue + "' where id=" + id + "");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='viewmp'", true);
        }
        else if (btn.Text == "DONE")
        {
            DataTable dt = dbhelper.getdata("update ManPower set status='Done',appNotif=1,accNotif=1 where id=" + id + "");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='viewmp'", true);
        }
        else if (btn.Text == "ON-GOING")
        {
            DataTable dt = dbhelper.getdata("update ManPower set status='On-going'  where id=" + id + "");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='viewmp'", true);
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
            ViewState["applicant"] = dt.Rows[0]["name"].ToString();
            ViewState["position"] = dt.Rows[0]["pos_desire"].ToString();
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

            //Applicants Activity
            div_referral.Visible = false;
            ViewState["act_log"] = dt = dbhelper.getdata("select * from applicant_log where app_id=" + row.Cells[0].Text + " order by id desc");

            //UI Control
            modalinfo.Style.Add("display", "block");
     
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


    protected void grid_app_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox chk = (CheckBox)e.Row.FindControl("chkEmp");
            if (e.Row.Cells[1].Text == "1")
            {
                chk.Checked = true;
            }


            if (e.Row.Cells[4].Text == "Done")
            {
                chk.Enabled = false;

            }

            
        }
    }

    [WebMethod]
    public static void saveapps(string id, string appid)
    {
        string[] d = appid.Split(',');

        string query = " Delete from ManpowerLine where mpformId="+id+"";
        foreach (string i in d)
        {
            if (i != "")
            {
                query += " Insert into ManpowerLine values(" + i + "," + id + ")";
            }
        }

        dbhelper.getdata(query);
    }
    //[WebMethod]
    //public static string savetools(string Id, string ittools)
    //{
    //    string result = "ok";

    //    DataTable dt = dbhelper.getdata("update ManPower set toolIT='" + ittools + "' where id=" + Id + "");

    //    return result;
    //}

    protected string msag(DataTable dt)
    {
        string[] split1 = dt.Rows[0]["tooldept"].ToString().Split('~')[0].Split(',');
        string[] split2 = dt.Rows[0]["tooldept"].ToString().Split('~')[1].Split(',');

        string tools = "";

        foreach (string str in split1)
        {
            tools += str + "<br/>";
        }
        foreach (string str in split2)
        {
            tools += str + "<br/>";
        }

        string[] split3 = dt.Rows[0]["toolIT"].ToString().Split('~')[0].Split(',');
        string[] split4 = dt.Rows[0]["toolIT"].ToString().Split('~')[1].Split(',');

        string ittools = "";

        foreach (string str in split3)
        {
            ittools += str + "<br/>";
        }
        foreach (string str in split4)
        {
            ittools += str + "<br/>";
        }

        string msg = "<b>REQUESTING DEPARTMENT INFORMATION</b>" +
        "<table> " +
        "    <tr> " +
        "        <td>Date</td> " +
        "        <td>: </td> " +
        "        <td>" + dt.Rows[0]["date"].ToString() + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Form No</td> " +
        "        <td>: </td> " +
        "        <td>" + dt.Rows[0]["Id"].ToString() + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Requested By</td> " +
        "        <td>: </td> " +
        "        <td>" + dt.Rows[0]["requester"].ToString() + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Department</td> " +
        "        <td>: </td> " +
        "        <td>" + dt.Rows[0]["department"].ToString() + "</td> " +
        "    </tr> " +
        "        <tr> " +
        "        <td>Branch</td> " +
        "        <td>: </td>  " +
        "        <td>" + dt.Rows[0]["branch"].ToString() + "</td>  " +
        "    </tr> " +
        "    <tr> " +
        "        <td></td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td colspan='3'><b>Requested Job Information</b></td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Position Title</td> " +
        "       <td>: </td> " +
        "        <td>" + dt.Rows[0]["position"].ToString() + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Position reports to</td> " +
        "        <td>:</td> " +
        "        <td>" + dt.Rows[0]["Fullname2"].ToString() + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Position Type</td> " +
        "        <td>: </td> " +
        "        <td>" + dt.Rows[0]["manpower_needed"].ToString() + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Contractual</td> " +
        "        <td>: </td> " +
        "        <td>" + getNull(dt.Rows[0]["positiontype"].ToString()) + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Duration</td> " +
        "        <td>: </td> " +
        "        <td>" + getNull(dt.Rows[0]["duration"].ToString()) + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Job Level</td> " +
        "        <td>: </td> " +
        "        <td>" + dt.Rows[0]["Division2"].ToString() + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Reason for vacancy</td> " +
        "        <td>: </td> " +
        "        <td>" + dt.Rows[0]["nature_request"].ToString() + "</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td>Budget allocation</td> " +
        "        <td>: </td> " +
        "        <td>" + dt.Rows[0]["allocation"].ToString() + "</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td colspan='3'>Summary of function:</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td></td> " +
        "        <td colspan='2'>" + dt.Rows[0]["summaryfunc"].ToString() + "</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td colspan='3'>Qualification requirement or equivalent:</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td> </td> " +
        "        <td colspan='2'>" + dt.Rows[0]["qualifications"].ToString() + "</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td colspan='3'>Specific experience required:</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td> </td> " +
        "        <td colspan='2'>" + dt.Rows[0]["exreq"].ToString() + "</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td colspan='3'>Expected system knowledge:</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td> </td> " +
        "        <td colspan='2'>" + dt.Rows[0]["exknowledge"].ToString() + "</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td colspan='3'>Justification for new position/additional manpower request:</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td> </td> " +
        "        <td colspan='2'>" + dt.Rows[0]["justify"].ToString() + "</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td colspan='3'>Tools requisition:</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td> </td> " +
        "        <td colspan='2'>" + getNull(tools) + "</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td>HR and IT (Tools requisition):</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td> </td> " +
        "        <td colspan='2'>" + getNull(ittools) + "</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td></td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td><b>Department</b></td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Approver</td> " +
        "        <td>: </td> " +
        "        <td>" + getNull(dt.Rows[0]["Fullname3"].ToString()) + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Review</td> " +
        "        <td>: </td> " +
        "        <td>" + getNull(dt.Rows[0]["formstatus"].ToString()) + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Remarks</td> " +
        "        <td>: </td> " +
        "        <td>" + getNull(dt.Rows[0]["appRemark"].ToString()) + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td></td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td><b>HR</b></td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Eligibility</td> " +
        "        <td>: </td> " +
        "        <td>" + getNull(dt.Rows[0]["eligibility"].ToString()) + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Remarks</td> " +
        "        <td>: </td> " +
        "        <td>" + getNull(dt.Rows[0]["description"].ToString()) + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Review</td> " +
        "        <td>: </td> " +
        "        <td>" + getNull(dt.Rows[0]["hrStatus"].ToString()) + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td></td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td><b>Executive</b></td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Approver</td> " +
        "        <td>: </td> " +
        "        <td>" + getNull(dt.Rows[0]["Fullname6"].ToString()) + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Review</td> " +
        "        <td>: </td> " +
        "        <td>" + getNull(dt.Rows[0]["execStatus"].ToString()) + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Remarks</td> " +
        "        <td>: </td> " +
        "        <td>" + getNull(dt.Rows[0]["requester"].ToString()) + "</td> " +
        "    </tr> " +
        "</table>";

        return msg;
    }


    protected string getNull(string a)
    {
        string result = "";

        if (a == "" || a == ", " || a == ",")
        {
            result = "N/A";
        }
        else
        {
            result = a;
        }

        return result;
    }
}