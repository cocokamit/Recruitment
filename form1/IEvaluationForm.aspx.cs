using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text.RegularExpressions;
using System.Web.Services;

public partial class form1_IEvaluationForm : System.Web.UI.Page
{
    public string appid = "";
    public string userid = "";
    public int fCount = 0;
    public static string access = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        appid = butyok.Decrypt(Request.QueryString["APOD"].ToString(), true);
        if (!IsPostBack)
        {
            loadable();
            if (System.Web.HttpContext.Current.Session["Username"] != null && System.Web.HttpContext.Current.Session["Password"] != null)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction('" + System.Web.HttpContext.Current.Session["Username"].ToString() + "','" + System.Web.HttpContext.Current.Session["Password"].ToString() + "')", true);
                if (System.Web.HttpContext.Current.Session["Access"] != null)
                {
                    access = System.Web.HttpContext.Current.Session["Access"].ToString();
                }
            }
        }
        userid = "0";
        disp(appid);
        alldisp(appid);
    }

    protected void logouter(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();


    }

    protected void disp(string id) {

        System.Data.DataTable dt = dbhelper.getdata("select a.id,a.PlaceOfBirth,a.PlaceOfBirthZipCodeId,a.CivilStatus,a.CitizenshipId,a.ReligionId,a.Height,a.Weight,a.bloodtype,a.health_card,a.SSSNumber,a.HDMFNumber,a.PHICNumber,a.TIN,a.GSISNumber,a.AddressZipcode,a.ResumeFile,a.FullName, a.DateApply, a.Address,a.ProvencialAddress,a.PhoneNumber, a.gender,a.dateofbirth, a.CellphoneNumber, a.EmailAddress, a.property pro_id,a.DateApply,a.LastName,a.FirstName,a.MiddleName,a.status,a.recommendation, case when (select top 1 loc from loc_per_app  where  app_id=a.id order by id desc) is null then (select description from location where id=b.loc_id) else (select top 1 loc from loc_per_app  where  app_id=a.id order by id desc) end property, case when (select COUNT(*) from examineer where app_id=a.id)=0 then 'Not Yet' else 'Done' end exam_stat, (select CAST(job_subject as varchar(1000)) from jobs where id=a.PositionDesire) pos_desire  from NewApplicant a left join Jobs b on a.PositionId=b.id left join JobType c on b.jobtype_id=c.jobtype_id where a.status<>'Transferred' and a.status<>'reject' and a.status<>'cancel' and a.id=" + id);

        if (dt.Rows.Count > 0)
        {

            ViewState["app_id"] = dt.Rows[0]["Id"].ToString();
            ViewState["app_no"] = butyok.Encrypt(dt.Rows[0]["Id"].ToString(), true);
            ViewState["applicant"] = dt.Rows[0]["Fullname"].ToString();
            ViewState["position"] = dt.Rows[0]["pos_desire"].ToString();
            ViewState["gender"] = dt.Rows[0]["gender"].ToString();
            ViewState["birth"] = parsebirthdate(dt.Rows[0]["dateofbirth"].ToString());
            ViewState["contact"] = dt.Rows[0]["CellphoneNumber"].ToString();
            ViewState["email"] = dt.Rows[0]["EmailAddress"].ToString();
            ViewState["address"] = parseaddress(dt.Rows[0]["Address"].ToString(), int.Parse(dt.Rows[0]["Id"].ToString()));
            ViewState["profile"] = "UploadImages/prof_id_" + dt.Rows[0]["Id"].ToString() + "/" + dt.Rows[0]["Id"].ToString() + ".png";
            ViewState["skills"] = parseskill(dt.Rows[0]["Id"].ToString());
            ViewState["lapp"] = DateTime.Parse(dt.Rows[0]["DateApply"].ToString()).ToString("MMMM dd, yyyy");

            txt_lname.Text = dt.Rows[0]["LastName"].ToString();
            txt_fname.Text = dt.Rows[0]["FirstName"].ToString();
            txt_mname.Text = dt.Rows[0]["MiddleName"].ToString();

            txt_permanentadress.Text = parseaddress(dt.Rows[0]["ProvencialAddress"].ToString(), int.Parse(dt.Rows[0]["Id"].ToString()));
            txt_presentaddres.Text = parseaddress(dt.Rows[0]["Address"].ToString(), int.Parse(dt.Rows[0]["Id"].ToString()));

            ddl_sex.Text = dt.Rows[0]["gender"].ToString();
            txt_pob.Text = dt.Rows[0]["PlaceOfBirth"].ToString();
            txt_dob.Text = Convert.ToDateTime(dt.Rows[0]["dateofbirth"].ToString()).ToString("yyyy-MM-dd");

            if (dt.Rows[0]["PlaceOfBirthZipCodeId"].ToString() != "")
            {
                ddl_bzc.Items.FindByValue(dt.Rows[0]["PlaceOfBirthZipCodeId"].ToString()).Selected = true;
            }
            if (dt.Rows[0]["AddressZipcode"].ToString() != "")
            {
                ddl_zipcode.Items.FindByValue(dt.Rows[0]["AddressZipcode"].ToString()).Selected = true;
            }
            if (dt.Rows[0]["ReligionId"].ToString() != "")
            {
                ddl_relegion.Items.FindByValue(dt.Rows[0]["ReligionId"].ToString()).Selected = true;
            }
            if (dt.Rows[0]["bloodtype"].ToString() != "")
            {
                ddl_bloodtype.Items.FindByValue(dt.Rows[0]["bloodtype"].ToString()).Selected = true;
            }
            if (dt.Rows[0]["CivilStatus"].ToString() != "")
            {
                ddl_cs.Items.FindByValue(dt.Rows[0]["CivilStatus"].ToString()).Selected = true;
            }
            if (dt.Rows[0]["CitizenshipId"].ToString() != "")
            {
                ddl_citizenship.Items.FindByValue(dt.Rows[0]["CitizenshipId"].ToString()).Selected = true;
            }

            txt_cnumber.Text = dt.Rows[0]["CellphoneNumber"].ToString();
            txt_pnumber.Text = dt.Rows[0]["PhoneNumber"].ToString();
            txt_email.Text = dt.Rows[0]["EmailAddress"].ToString();


            txt_sssno.Text = dt.Rows[0]["SSSNumber"].ToString();
            txt_hdmfno.Text = dt.Rows[0]["HDMFNumber"].ToString();
            txt_phicno.Text = dt.Rows[0]["PHICNumber"].ToString();
            txt_tin.Text = dt.Rows[0]["TIN"].ToString();
            txt_gsisno.Text = dt.Rows[0]["GSISNumber"].ToString();

            txt_height.Text = dt.Rows[0]["Height"].ToString();
            txt_weight.Text = dt.Rows[0]["Weight"].ToString();

            if (dt.Rows[0]["health_card"].ToString() != "")
            {
                txt_health.Text = Convert.ToDateTime(dt.Rows[0]["health_card"].ToString()).ToString("yyyy-MM-dd");
            }
            ViewState["attainment"] = dt = dbhelper.getdata("select * from Education where CONVERT(varchar,[address]) = '-' and app_id=" + dt.Rows[0]["Id"].ToString());
            ViewState["school"] = dt.Rows.Count == 0 ? "-" : dt.Rows[0]["level"].ToString();
            ViewState["degree"] = dt.Rows.Count == 0 ? "-" : dt.Rows[0]["school"].ToString();

            ViewState["employmenthistory"] = dt = dbhelper.getdata("select * from EmploymentHistory where app_id=" + dt.Rows[0]["Id"].ToString() + " order by datef desc");
            if (dt.Rows.Count > 0)
                ViewState["employeement"] = dt.Rows[0]["company"].ToString().Length == 0 ? "-" : dt.Rows[0]["position"].ToString();
            else
                ViewState["employeement"] = "-";

            dt = dbhelper.getdata("select * from applicant_log where app_id=" + dt.Rows[0]["Id"].ToString() + " order by id desc");

            if (dt.Rows.Count > 0)
            {
                ViewState["act_log"] = dt;
            }

            dt = dbhelper.getdata("Select * from file_details where AppId=" + id);

            grid_req.DataSource = dt;
            grid_req.DataBind();
            div_msg.Visible = dt.Rows.Count == 0 ? true : false;

            txt_year.Items.Clear();
            txt_datetoyear.Items.Clear();
            txt_yearf.Items.Clear();
            txt_yeart.Items.Clear();
            txt_year.Items.Add(new ListItem("Year", "0"));
            txt_datetoyear.Items.Add(new ListItem("Year", "0"));
            txt_yearf.Items.Add(new ListItem("Year", "0"));
            txt_yeart.Items.Add(new ListItem("Year", "0"));
            for (int i = 1900; i <= DateTime.Now.Year + 1; i++)
            {
                string hh = i.ToString().Length > 1 ? i.ToString() : "0" + i.ToString();
                txt_year.Items.Add(new ListItem(hh, hh));
                txt_datetoyear.Items.Add(new ListItem(hh, hh));
                txt_yearf.Items.Add(new ListItem(hh, hh));
                txt_yeart.Items.Add(new ListItem(hh, hh));
            }


            dt = dbhelper.getdata("Select * from file_details where AppId="+id+"");
            string itemers = "";
            foreach (ListItem row in ddl_attachclass.Items)
            {
                if (row.Value != "")
                {
                    if (dt.Select("filename='" + row.Value + "'").Length == 0)
                    {
                        itemers += row.Value + ",";
                    }
                }
            }
            if (itemers.Length > 0)
            {
                divreqs.Attributes.Add("style", "display:block;");
                itemers = itemers.Remove(itemers.Length - 1);
            }
            else
            {
                divreqs.Attributes.Add("style", "display:none;");
            }

            ViewState["missingreq"] = itemers;
        }
    }

    protected void loadable()
    {
        ViewState["approver"] = "0";
        ViewState["leave-credit"] = "0";

        string query = "";

        DataTable dt;

        query = "select ID,zipcode,zipcode+'-'+location+'/'+area as description from MZipCode order by location asc";
        dt = dbhelper.getdata2(query);
        ddl_zipcode.Items.Clear();
        ddl_zipcode.Items.Add(new ListItem(" ", "0"));
        ddl_bzc.Items.Clear();
        ddl_bzc.Items.Add(new ListItem("", "0"));
        foreach (DataRow dr in dt.Rows)
        {
            ddl_zipcode.Items.Add(new ListItem(dr["description"].ToString(), dr["id"].ToString()));
            ddl_bzc.Items.Add(new ListItem(dr["description"].ToString(), dr["id"].ToString()));
        }

        query = "select * from MReligion order by Religion";
        dt = dbhelper.getdata2(query);
        ddl_relegion.Items.Clear();
        ddl_relegion.Items.Add(new ListItem(" ", "0"));
        foreach (DataRow dr in dt.Rows)
        {
            ddl_relegion.Items.Add(new ListItem(dr["Religion"].ToString(), dr["id"].ToString()));
        }


        query = "select * from Mbloodtype order by bloodtype";
        dt = dbhelper.getdata2(query);
        ddl_bloodtype.Items.Clear();
        ddl_bloodtype.Items.Add(new ListItem(" ", "0"));
        foreach (DataRow dr in dt.Rows)
        {
            ddl_bloodtype.Items.Add(new ListItem(dr["bloodtype"].ToString(), dr["id"].ToString()));
        }

        query = "select * from MCitizenship order by Citizenship";
        dt = dbhelper.getdata2(query);
        ddl_citizenship.Items.Clear();
        ddl_citizenship.Items.Add(new ListItem(" ", "0"));
        foreach (DataRow dr in dt.Rows)
        {
            ddl_citizenship.Items.Add(new ListItem(dr["Citizenship"].ToString(), dr["id"].ToString()));
        }


        query = "select * from MCivilStatus";
        DataTable dtcvil = dbhelper.getdata2(query);
        ddl_cs.Items.Clear();
        foreach (DataRow drcvil in dtcvil.Rows)
        {
            ddl_cs.Items.Add(new ListItem(drcvil["CivilStatus"].ToString(), drcvil["Id"].ToString()));
        }

        query = "select * from MedHospital where HostStatus = 'Active'";
        DataTable dthost = dbhelper.getdata2(query);
        ddl_medical.Items.Clear();
        ddl_medical.Items.Add(new ListItem("Select", "0"));
        foreach (DataRow drhost in dthost.Rows)
        {
            ddl_medical.Items.Add(new ListItem(drhost["HostDesc"].ToString(), drhost["ID"].ToString()));
        }

        query = "select * from MedIllness where Status = 'ACTIVE'";
        DataTable dtillness = dbhelper.getdata2(query);
        ddl_illness.Items.Clear();
        ddl_illness.Items.Add(new ListItem("Select", "0"));
        foreach (DataRow drillness in dtillness.Rows)
        {
            ddl_illness.Items.Add(new ListItem(drillness["illness"].ToString(), drillness["Id"].ToString()));
        }
   
    }

    protected void alldisp(string id)
    {
      
        DataTable dt;

        dt = dbhelper.getdata("select *,class level from Meducattainment where app_id =" + id + " and status is null ");
        grid_educhistory1.DataSource = dt;
        grid_educhistory1.DataBind();

        dt = dbhelper.getdata("select *,convert(varchar,month(datef))+'/'+ convert(varchar,year(datef))froms, convert(varchar,month(datet))+'/'+ convert(varchar,year(datet))tos from EmploymentHistory where app_id =" + id + "");
        grid_jobhistory1.DataSource = dt;
        grid_jobhistory1.DataBind();

        dt = dbhelper.getdata("select * from special_skills where app_id =" +id+ "");
        grid_skill1.DataSource = dt;
        grid_skill1.DataBind();

        dt = dbhelper.getdata("select  a.id, b.id fileid, a.seminarsattended, a.seminarsheld,LEFT(convert(varchar, dateconducted,101),10) as dateconducted from Mseminarattended a left join MseminarattndFile b on a.id = b.said  where a.app_id =" + id + " and a.status is null");
        grid_seminarsattended1.DataSource = dt;
        grid_seminarsattended1.DataBind();

        dt = dbhelper.getdata("select * from EmergencyContact where Status is NULL and app_id = " + id + "");
        grid_emergencycontact.DataSource = dt;
        grid_emergencycontact.DataBind();

        dt = dbhelper.getdata("select a.Id,(select illness from MedIllness where Id = a.saidid)illness,(select HostDesc from MedHospital where Id = a.hospital)hospital,LEFT(convert(varchar, a.meddate,101),10)meddate, a.doctor, a.findings, a.condition from MedRecords a where a.app_id = '" + id + "' and a.status = 'Active' order by sysdate desc");
        gridmedrics.DataSource = dt;
        gridmedrics.DataBind();

        dt = dbhelper.getdata("select Id,LicenseNum,Left(convert(varchar,ValidUntil,101),10)ValidUntil,Location,Cost,Left(convert(varchar,DurationFrom,101),10)DF,Left(convert(varchar,DurationTo,101),10)DT,Provider,About,Resources,Left(convert(varchar,Sysdate,101),10)Sysdate from Preparatory a where app_id = '" + id + "' and Action is NULL");
        grid_preparatory.DataSource = dt;
        grid_preparatory.DataBind();
    }

    protected void calculatedate(object sender, EventArgs e)
    {
        if (txt_durationfrom.Text == "")
        {
            Response.Write("<script>alert('Select Duration From!')</script>");
            txt_durationto.Text = "";
        }
        else
        {
            DateTime BeginDate = Convert.ToDateTime(txt_durationfrom.Text);
            DateTime EndDate = Convert.ToDateTime(txt_durationto.Text).AddDays(1);
            TimeSpan diff = EndDate.Subtract(BeginDate);
            txt_days.Text = diff.Days.ToString();
        }
    }

    protected string parseaddress(string address, int id)
    {
        try
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
        catch {

            return address;
        }
    }

    protected string parseskill(string id)
    {
        string hold = "";
        System.Data.DataTable dt = dbhelper.getdata("select * from special_skills where app_id=" + id);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                if (row["skills"].ToString().Length > 0)
                    hold += row["skills"] + ",";
            }
        }
        else
            hold = "-";

        return hold.Length < 3 ? "-" : hold.Substring(0, hold.Trim().Length - 1).ToLower();
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

    protected void saveattach(object sender, EventArgs e)
    {
            dbhelper.getdata("Delete from file_details where AppId="+appid+" and Filename='"+ddl_attachclass.SelectedValue.ToString()+"'");
      
            string filename = "";
            bool cont = false;
            try
            {
                if (FileUpload1.HasFile)
                {
                    string filepath = Server.MapPath("document/app_id_" + appid + "/");
                    DirectoryInfo di = Directory.CreateDirectory(filepath);
                    HttpFileCollection uploadedFiles = Request.Files;

                    for (int i = 0; i < uploadedFiles.Count; i++)
                    {
                        HttpPostedFile userPostedFile = uploadedFiles[i];
                        if (userPostedFile.ContentLength > 0)
                        {
                            string fileName = Path.GetFileNameWithoutExtension(userPostedFile.FileName);
                            string fileExtension = Path.GetExtension(userPostedFile.FileName);
                            string contenttype = userPostedFile.ContentType;

                            string query = "insert into file_details values(" + appid + ",'document/app_id_" + appid + "/','" + ddl_attachclass.SelectedValue.ToString() + "','" + contenttype + "','" + fileExtension + "',GETDATE())";
                            DataTable dt = dbhelper.getdata(query);

                            filename = filepath + ddl_attachclass.SelectedValue.ToString().Replace(" ", "") + "_" + appid + fileExtension;
                            userPostedFile.SaveAs(filename);
                        }
                    }
                    disp(appid);
                }


            }
            catch (Exception x)
            {
                cont = false;
            }
       
    }
    protected void download(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            LinkButton lnk_viewreq = (LinkButton)grid_req.Rows[row.RowIndex].Cells[1].FindControl("lnk_download");
            DataTable dt = dbhelper.getdata("select * from file_details where id=" + lnk_viewreq.CommandName + " ");
            // string classs = row.Cells[2].Text == "FORMS" ? "forms" : "peremp";
            string input = Server.MapPath("" + dt.Rows[0]["Location"].ToString() + "/") + dt.Rows[0]["Filename"].ToString().Replace(" ", "") + "_" + dt.Rows[0]["AppId"].ToString() + dt.Rows[0]["Extension"].ToString();

            //Download the Decrypted File.
            Response.Clear();
            Response.ContentType = dt.Rows[0]["contenttype"].ToString();
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(input));
            Response.WriteFile(input);
            Response.Flush();
            Response.End();
        }
    }

    [WebMethod]
    public static string savers(string appid, string hireon, string quest, string positive, string negative, string forfurther, string userid, string userfname, string userposition, string clicon)
    {
        string result = "";
        if (access.Contains('1'))
        {
            DataTable dt = dbhelper.getdata("Insert into IEF values(" + appid + "," + userid + ",'" + hireon + "','" + positive + "','" + negative + "','" + quest + "',GETDATE(),NULL,'" + userfname + "','" + userposition + "','" + forfurther + "','" + clicon + "')");
        }
        else
        {
            result = "1";
        }
        return result;
    }

    [WebMethod]
    public static string saversref(string appid, string quest, string txtref, string txtcomp, string txtpos, string txtstartemp, string txtsepemp, string txtlastpos, string txtvol, string txtremark,string userid,string userfname,string userdate)
    { 
        string result = "";
        if (access.Contains('2'))
        {
         DataTable dt = dbhelper.getdata("Insert into RefCheck values(" + appid + "," + userid + ",'"+quest+"','" + txtref + "','" + txtcomp + "','" + txtpos + "','" + txtstartemp + "','" + txtsepemp + "','" + txtlastpos + "','" + txtvol + "','" + txtremark + "','" + userfname + "','" + userdate + "',GETDATE())");
        }
        else
        {
            result = "1";
        }
        return result;
    }

    [WebMethod]
    public static string saverscon(string appid, string quest, string conOthers, string conquest1, string conquest2, string conquest3, string conquest4, string userid, string conEmpname, string conDept)
    {  
        string result = "";
        if (access.Contains('3'))
        {
        DataTable dt = dbhelper.getdata("Insert into ConForm values(" + appid + "," + userid + ",'" + quest + "','" + conOthers + "','" + conquest1 + "','" + conquest2 + "','" + conquest3 + "','" + conquest4 + "','" + conDept + "','" + conEmpname + "',GETDATE())");
        }
        else
        {
            result = "1";
        }
        return result;
    }

    [WebMethod]
    public static string viewers(string Id) {
        string result = "";

        DataTable dt = dbhelper.getdata("Select * from IEF where Id="+Id);
        if (dt.Rows.Count > 0)
        {
            result += dt.Rows[0]["UserRemark"].ToString() + "~";
            result += dt.Rows[0]["Positive"].ToString() + "~";
            result += dt.Rows[0]["Negative"].ToString() + "~";
            result += dt.Rows[0]["Quests"].ToString() + "~";
            result += dt.Rows[0]["Date"].ToString() + "~";
            result += dt.Rows[0]["UserFname"].ToString() + "~";
            result += dt.Rows[0]["UserPosition"].ToString()+"~";
            result += dt.Rows[0]["UserForFurther"].ToString() + "~";
            result += dt.Rows[0]["UserCon"].ToString() + "~";
        }

        return result;
    }

    [WebMethod]
    public static string viewersref(string Id)
    {
        string result = "";

        DataTable dt = dbhelper.getdata("Select * from RefCheck where Id=" + Id);
        if (dt.Rows.Count > 0)
        {
            result += dt.Rows[0]["Quest"].ToString() + "~";
            result += dt.Rows[0]["ReferenceName"].ToString() + "~";
            result += dt.Rows[0]["Company"].ToString() + "~";
            result += dt.Rows[0]["CurrentPosition"].ToString() + "~";
            result += dt.Rows[0]["StartDate"].ToString() + "~";
            result += dt.Rows[0]["SeparateDate"].ToString() + "~";
            result += dt.Rows[0]["LastPosition"].ToString() + "~";
            result += dt.Rows[0]["NatureSeparate"].ToString() + "~";
            result += dt.Rows[0]["Remarks"].ToString() + "~";
            result += dt.Rows[0]["Userfname"].ToString() + "~";
            result += dt.Rows[0]["Date"].ToString();
        }

        return result;
    }

    [WebMethod]
    public static string viewerscon(string Id)
    {
        string result = "";

        DataTable dt = dbhelper.getdata("Select * from ConForm where Id=" + Id);
        if (dt.Rows.Count > 0)
        {
            result += dt.Rows[0]["Quest"].ToString() + "~";
            result += Convert.ToDateTime(dt.Rows[0]["sysdate"].ToString()).ToString("MM/dd/yyyy") + "~";
            result += dt.Rows[0]["UserName"].ToString() + "~";
            result += dt.Rows[0]["UserDept"].ToString() + "~";
            result += dt.Rows[0]["conquest1"].ToString() + "~";
            result += dt.Rows[0]["conquest2"].ToString() + "~";
            result += dt.Rows[0]["conquest3"].ToString() + "~";
            result += dt.Rows[0]["conquest4"].ToString();
        }

        return result;
    }


    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static string loginer(string username, string password,string appIDD)
    {
        string result = "~";
        DataTable dt = dbhelper.getdata2("Select b.username,b.password,a.Id,(a.FirstName+' '+a.MiddleName+' '+a.LastName)Fullname,(Select Position from MPosition where Id=a.PositionId)Position,(Select Department from MDepartment where Id=a.DepartmentId)Department from MEmployee a left join nobel_user b on a.Id=b.emp_id where b.username='" + username + "' and b.password='" + password + "'");

        if (dt.Rows.Count > 0)
        {
            result = "";
            result += dt.Rows[0]["Fullname"].ToString()+"~";
            result += dt.Rows[0]["Position"].ToString()+"~";
            result += dt.Rows[0]["Id"].ToString() + "~";
            result += dt.Rows[0]["Department"].ToString() + "~";

            HttpContext.Current.Session["Username"] = dt.Rows[0]["username"].ToString();
            HttpContext.Current.Session["Password"] = dt.Rows[0]["password"].ToString();
            HttpContext.Current.Session["Access"] = "";
            dt = dbhelper.getdata("Select * from IEFallower where empId=" + dt.Rows[0]["Id"].ToString() + " and appId=" + appIDD + "");
            result += "*";
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    result += row["allowIEF"].ToString();
                    HttpContext.Current.Session["Access"] += row["allowIEF"].ToString();  
                }
            }

        }

        return result;
    }

    //Personal Informationss-----------------------------------------------------------------------------------------------------
    protected void openattainement(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
        }
    }

    protected void delete_edhistory(object sender, EventArgs e)
    {
       
    }


    protected void openjobhist(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            
        }
    }

    protected void delete_jobhistory(object sender, EventArgs e)
    {
        if (TextBox1.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
            }
        }
    }

    protected void openseminar(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
           
        }
    }

    protected void downloadseminarsfile(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            
        }
    }

    protected void deleteseminarsattended(object sender, EventArgs e)
    {
        if (TextBox1.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
             
            }
        }
    }

    protected void saDatabound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton downloadni = (LinkButton)e.Row.FindControl("lbdownloadsem");
            DataTable dtt = dbhelper.getdata("select * from MseminarattndFile where said=" + downloadni.CommandName + "");
            if (dtt.Rows.Count > 0)
                downloadni.Visible = true;
            else
                downloadni.Visible = false;
        }
    }

    protected void opendownloadprep(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            
        }
    }

    protected void opentraining(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
         
        }
    }

    protected void cancelprep(object sender, EventArgs e)
    {
        if (TextBox1.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                
            }
        }
    }

    protected void openskills(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            
        }
    }

    protected void deleteskill(object sender, EventArgs e)
    {
        if (TextBox1.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
         
            }
        }
    }

    protected void openemcontact(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {

        }
    }

    protected void deleteContact(object sender, EventArgs e)
    {
        if (TextBox1.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
            }
        }
    }

    protected void openemmedrec(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
           
        }
    }

    protected void dwnmedrecs(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
          
        }
    }

    protected void rmvmedrecord(object sender, EventArgs e)
    {
        if (TextBox1.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
               
            }
        }
    }

    protected void medrecscell(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton draft = (LinkButton)e.Row.FindControl("lbdwnmedrecs");
            DataTable dt = dbhelper.getdata("select * from MedRecords where status = 'Active' and content = 'Has File' and Id = " + draft.CommandName + "");
            if (dt.Rows.Count > 0)
            {
                draft.Visible = true;
            }
            else
                draft.Visible = false;
        }
    }


    [WebMethod]
    public static string savepersonalinfo(string Id,string lname,string fname,string mname,string sex,string dob,string pob,string bzc,
                                    string peraddress,string preaddress,string zipcode,string cnumber,
                                    string pnumber,string email,string cs,string citizenship,string religion,
                                    string height,string weight,string btype,string health,string sssno,string hdmfno,
                                    string phicno,string tin,string gsisno)
    {
        string result = "";

        DataTable dt = dbhelper.getdata("Update NewApplicant set LastName='" + lname + "'," +
                                        "FirstName='" + fname + "'," +
                                        "MiddleName='" + mname + "'," +
                                        "FullName='" + lname + "," + fname + " " + mname +"',"+
                                        "Address='" + preaddress + "'," +
                                        "ProvencialAddress='" + peraddress + "'," +
                                        "CellphoneNumber='" + cnumber + "'," +
                                        "PhoneNumber='" + pnumber + "'," +
                                        "EmailAddress='" + email + "'," +
                                        "DateOfBirth='" + dob + "'," +
                                        "Gender='" + sex + "'," +
                                        "PlaceOfBirth='" + pob + "'," +
                                        "PlaceOfBirthZipCodeId=" + bzc + "," +
                                        "CivilStatus=" + cs + "," +
                                        "CitizenshipId=" + citizenship + "," +
                                        "ReligionId=" + religion + "," +
                                        "Height='" + height + "'," +
                                        "Weight='" + weight + "'," +
                                        "bloodtype=" + btype + "," +
                                        "health_card='" + health + "'," +
                                        "SSSNumber='" + sssno + "'," +
                                        "HDMFNumber='" + hdmfno + "'," +
                                        "PHICNumber='" + phicno + "'," +
                                        "TIN='" + tin + "'," +
                                        "GSISNumber='" + gsisno + "'," +
                                        "AddressZipcode="+zipcode+" where Id="+Id+"");



        return result;
    }

    [WebMethod]
    public static string addedhistory(string Id,string level,string school,string address,string yearf,string yeart)
    {
        string result = "";
        string ids = "";
        DataTable dteduchistory = new DataTable();
        if (school.Length == 0 || address.Length == 0 || yearf.Length == 0 || yeart.Length == 0)
            result = "Invalid Input!";
        else
        {
            if (Id.Length > 0)
            {
                dteduchistory = dbhelper.getdata("insert into Meducattainment(date,app_id,class,school,address,yearf,yeart)values(getdate()," + Id + ",'" + level + "','" + school.Replace("'", "").ToString() + "','" + address.Replace("'", "").ToString() + "','" + yearf + "','" + yeart + "') select scope_identity() id");
                ids = dteduchistory.Rows[0]["id"].ToString();
                //dteduchistory = dbhelper.getdata("select *,class level from Meducattainment where empid =" + Id + " and status is null ");
            }
        }

        if (result.Length > 0)
        {
            return result;
        }
        else
        {
            result = ids + "~" + level + "~" + school + "~" + address + "~" + yearf + "~" + yeart;

            return result;
        }
    }

    [WebMethod]
    public static void deleteedhistory(string Id)
    {
        dbhelper.getdata("delete from Meducattainment where id="+Id+" ");
    }

    [WebMethod]
    public static string addjobhistory(string Id,string company, string month, string year,string datetomonth, string datetoyear,string position)
    { 
     string result="";

     string ids = "";
     DataTable dteduchistory = new DataTable();
     if (company.Length == 0 || month.Length == 0 || year.Length == 0 || datetomonth.Length == 0 || datetoyear.Length==0 || position.Length==0)
         result = "Invalid Input!";
     else
     {
         if (Id.Length > 0)
         {
             dteduchistory=dbhelper.getdata("insert into EmploymentHistory (app_id,company,position,datef,datet)values(" + Id + ",'" + company + "','" + position + "','" + month + "/01/" + year + "','" + datetomonth + "/01/" + datetoyear + "') select scope_identity() id");
            
             ids = dteduchistory.Rows[0]["id"].ToString();
         }
     }

     if (result.Length > 0)
     {
         return result;
     }
     else
     {
         result = ids + "~" + company + "~" + position + "~" + month + "/01/" + year + "~" + datetomonth + "/01/" + datetoyear ;

         return result;
     }

    }

    [WebMethod]
    public static void deletejobhistory(string Id)
    {
        dbhelper.getdata("delete from EmploymentHistory where id=" + Id + " ");
    }


    [WebMethod]
    public static string addskills(string Id, string skill)
    {
        string result = "";

        string ids = "";
        DataTable dteduchistory = new DataTable();
        if (skill.Length == 0)
            result = "Invalid Input!";
        else
        {
            if (Id.Length > 0)
            {
                dteduchistory = dbhelper.getdata("insert into special_skills (app_id,skills,date)values(" + Id + ",'" + skill + "',GETDATE()) select scope_identity() id");

                ids = dteduchistory.Rows[0]["id"].ToString();
            }
        }

        if (result.Length > 0)
        {
            return result;
        }
        else
        {
            result = ids + "~" + skill ;

            return result;
        }

    }

    [WebMethod]
    public static void deleteskill(string Id)
    {
        dbhelper.getdata("delete from special_skills where id=" + Id + " ");
    }


    [WebMethod]
    public static string addcontacts(string Id, string name, string address, string contact)
    {
        string result = "";

        string ids = "";
        DataTable dteduchistory = new DataTable();
        if (name.Length == 0 || address.Length==0 || contact.Length==0)
            result = "Invalid Input!";
        else
        {
            if (Id.Length > 0)
            {
                dteduchistory = dbhelper.getdata("insert into EmergencyContact (UserId,app_id,Name,Address,Contact,Sysdate)values('"+Id+"'," + Id + ",'" + name + "','"+address+"','"+contact+"',GETDATE()) select scope_identity() id");

                ids = dteduchistory.Rows[0]["id"].ToString();
            }
        }

        if (result.Length > 0)
        {
            return result;
        }
        else
        {
            result = ids + "~" + name+"~"+address+"~"+contact;

            return result;
        }

    }

    [WebMethod]
    public static void deletecontacts(string Id)
    {
        dbhelper.getdata("delete from EmergencyContact where id=" + Id + " ");
    }

    [WebMethod]
    public static string addseminarattended(HttpContext context)
    {
        //string Id,string txt_seminar,string txt_heldat,string txt_dateseminars
          if (context.Request.Files.Count > 0)
            {
                try
                {
                    string result = "2";
                    //  Get all files from Request object  
                    HttpFileCollection files = context.Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {

                        HttpPostedFile userPostedFile = files[i];

                        string filename = Path.GetFileNameWithoutExtension(userPostedFile.FileName);
                        string fileExtension = Path.GetExtension(userPostedFile.FileName);
                        string contenttype = userPostedFile.ContentType;

                        DataTable dtaddseminar = new DataTable();

                        result = "" + filename + "," + fileExtension + "," + contenttype;
                        //if (txt_seminar.Length == 0 || txt_heldat.Length == 0 || txt_dateseminars.Length == 0)
                        //    result = "Attended Seminars must be supplied!";
                        //else
                        //{

                        //    //DataTable dtinsert = dbhelper.getdata("insert into Mseminarattended (date,empid,userid,seminarsattended,dateconducted,status,seminarsheld,fileattached)values ('" + DateTime.Now.ToString() + "','" + Id + "','0','" + txt_seminar.Replace(" ", " ") + "','" + txt_dateseminars + "',NULL,'" + txt_heldat.Trim() + "','Without Attachment') select scope_identity() id");
                        //    string ddd="insert into Mseminarattended (date,empid,userid,seminarsattended,dateconducted,status,seminarsheld,fileattached)values ('" + DateTime.Now.ToString() + "','" + Id + "','0','" + txt_seminar.Replace(" ", " ") + "','" + txt_dateseminars + "',NULL,'" + txt_heldat.Trim() + "','Without Attachment') select scope_identity() id";
                        //    if (userPostedFile.ContentLength>0)
                        //    {
                        //        string nameofiles = Id;
                        //        DirectoryInfo nw = Directory.CreateDirectory(context.Server.MapPath("~/files/seminarfiles/") + nameofiles);
                        //        string query = "insert into MseminarattndFile(dateupload, empid, userid, location, extension, status, contenttype, filename, action,said) values('" + DateTime.Now.ToString() + "','" + Id + "','0','c','" + fileExtension + "','Confirmed Uploaded','" + contenttype + "','" + filename + "','Active'," + dtinsert.Rows[0]["id"].ToString() + ") select scope_identity() id";
                        //        //DataTable dt = dbhelper.getdata(query);
                        //        //userPostedFile.SaveAs(context.Server.MapPath("~/files/seminarfiles/") + nameofiles + "/" + dt.Rows[0]["id"].ToString() + fileExtension);
                        //        string d=context.Server.MapPath("~/files/seminarfiles/") + nameofiles + "/" + dt.Rows[0]["id"].ToString() + fileExtension;
                        //    }

                        //}
                        //dtaddseminar = dbhelper.getdata("select  a.id, b.id fileid, a.seminarsattended, a.seminarsheld,LEFT(convert(varchar, dateconducted,101),10) as dateconducted from Mseminarattended a left join MseminarattndFile b on a.id = b.said  where a.empid =" + hdn_empid.Value + " and a.status is null");
                     
                    }
                    // Returns message that successfully uploaded  
                    return result;
                }
                catch (Exception ex)
                {
                    return "Error occurred. Error details: " + ex.Message;
                }
            }
          else
          {
              return "No files selected.";
          }
    }
}