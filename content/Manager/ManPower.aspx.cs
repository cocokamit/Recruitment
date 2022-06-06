using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.IO;

public partial class content_Manager_ManPower : System.Web.UI.Page
{
    public static string id;
    public static string[] spl={""};
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            disp();
        }
        loadapp();
    }


    //protected void saveapp2(object sender, EventArgs e)
    //{
    //    string sqlquery = "";
    //    List<string> ctns = hf_cbvalues2.Value.Split(',').ToList();
    //    List<string> ps = hf_posvalues2.Value.Split('~').ToList();
    //    for (int i = 0; i < chkMemberList2.Items.Count; i++)
    //    {
    //        int d = Convert.ToInt32(chkMemberList2.Items[i].Value);

    //        if (chkMemberList2.Items[i].Selected)
    //        {
    //            if (!ctns.Contains(chkMemberList2.Items[i].Value))
    //            {
    //                sqlquery += "Insert into FromApprovers(empid,approvertype) values(" + d + ",'uafe') ";
    //            }
    //        }
    //        else
    //        {
    //            if (ctns.Contains(chkMemberList2.Items[i].Value))
    //            {
    //                sqlquery += "Delete from FromApprovers where approvertype='uafe' and empid=" + d + " ";
    //            }

    //        }
    //    }


    //    if (sqlquery != "")
    //    {
    //        dbhelper.getdata2(sqlquery);
    //    }
    //}

    //protected void saveapp(object sender, EventArgs e)
    //{
    //    string sqlquery = "";
    //    List<string> ctns = hf_cbvalues1.Value.Split(',').ToList();
    //    List<string> ps = hf_posvalues1.Value.Split('~').ToList();
    //    for (int i = 0; i < chkMemberList1.Items.Count; i++)
    //    {
    //        int d = Convert.ToInt32(chkMemberList1.Items[i].Value);

    //        if (chkMemberList1.Items[i].Selected)
    //        {
    //            if (!ctns.Contains(chkMemberList1.Items[i].Value))
    //            {
    //                sqlquery += "Insert into FromApprovers(empid,approvertype) values(" + d + ",'uafp') ";
    //            }
    //        }
    //        else
    //        {
    //            if (ctns.Contains(chkMemberList1.Items[i].Value))
    //            {
    //                sqlquery += "Delete from FromApprovers where approvertype='uafp' and empid=" + d + " ";
    //            }

    //        }
    //    }


    //    if (sqlquery != "")
    //    {
    //        dbhelper.getdata2(sqlquery);
    //    }
    //}

    protected void saveattach(FileUpload FileUpload1, FileUpload FileUpload2, FileUpload FileUpload3, string id)
    {
        string filename = "";
        bool cont = false;
        try
        {
            if (FileUpload1.HasFile || FileUpload2.HasFile || FileUpload3.HasFile)
            {
                string filepath = Server.MapPath("manpowerdocu/mp_id_" + id + "/");
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

                        string query = "insert into mpfile_details values(" + id + ",'manpowerdocu/mp_id_" + id + "/','" + fileName + "','" + contenttype + "','" + fileExtension + "',GETDATE())";
                        DataTable dt = dbhelper.getdata(query);

                        filename = filepath + fileName.Replace(" ", "") + "_" + id + fileExtension;
                        userPostedFile.SaveAs(filename);
                    }
                }
            }

        }
        catch (Exception x)
        {
            cont = false;
        }
    }

    protected void disp()
    {
        try
        {
            string query = "select * from ManPower where status <> 'deleted' and acc_id = " + Session["user_id"].ToString() + "";
            DataSet ds = bol.displayData(query);
            grid_data.DataSource = ds.Tables["table"];
            grid_data.DataBind();

            alert.Visible = grid_data.Rows.Count > 0 ? false : true;
            lb_reqby.Text = Session["account_name"].ToString();

            DataTable dt = dbhelper.getdata("Select * from Company where status is null order by id asc");
            drop_company.Items.Clear();
            drop_company.Items.Add(new ListItem(" ", "0"));
            drop_c.Items.Clear();
            foreach (DataRow dr in dt.Rows)
            {
                drop_company.Items.Add(new ListItem(dr["description"].ToString(), dr["id"].ToString()));
                drop_c.Items.Add(new ListItem(dr["description"].ToString(), dr["id"].ToString()));
            }

            dt = dbhelper.getdata("Select * from location where status is null order by id asc");
            drop_branch.Items.Clear();
            drop_branch.Items.Add(new ListItem(" ", "0"));
            dorp_b.Items.Clear();
            foreach (DataRow dr in dt.Rows)
            {
                drop_branch.Items.Add(new ListItem(dr["description"].ToString(), dr["id"].ToString()));
                dorp_b.Items.Add(new ListItem(dr["description"].ToString(), dr["id"].ToString()));
            }

            dt = dbhelper.getdata2("Select * from MDepartment");
            drop_department.Items.Clear();
            drop_department.Items.Add(new ListItem(" ", "0"));
            drop_d.Items.Clear();
            foreach (DataRow dr in dt.Rows)
            {
                drop_department.Items.Add(new ListItem(dr["department"].ToString(), dr["id"].ToString()));
                drop_d.Items.Add(new ListItem(dr["department"].ToString(), dr["id"].ToString()));
            }

            dt = dbhelper.getdata2("Select * from MDivision2");
            drop_level.Items.Clear();
            drop_level.Items.Add(new ListItem(" ", "0"));
            drop_l.Items.Clear();
            foreach (DataRow dr in dt.Rows)
            {
                drop_level.Items.Add(new ListItem(dr["Division2"].ToString(), dr["id"].ToString()));
                drop_l.Items.Add(new ListItem(dr["Division2"].ToString(), dr["id"].ToString()));
            }

            dt = dbhelper.getdata2("Select a.Lastname+', '+a.Firstname+' '+Middlename [name],a.id,a.PositionId from MEmployee a where DivisionId<>3 order by lastname asc");
            drop_reportsto.Items.Clear();
            drop_reportsto.Items.Add(new ListItem(" ", "0"));
            drop_rep.Items.Clear();
            foreach (DataRow dr in dt.Rows)
            {
                drop_reportsto.Items.Add(new ListItem(dr["name"].ToString(), dr["id"].ToString()));
                drop_rep.Items.Add(new ListItem(dr["name"].ToString(), dr["id"].ToString()));
            }
        }
        catch
        {
 
        }
    }

    [WebMethod]
    public static void delfile(string Id)
    {
        dbhelper.getdata("delete from mpfile_details where id="+Id+"");
    }

    protected void loadapp()
    {

        //DataTable dt = dbhelper.getdata2("select id,empid,(Select Lastname+', '+Firstname+' '+Middlename from MEmployee where Id=a.empid) fullname,(Select (Select Position from MPosition where id=b.PositionId) from MEmployee b where b.Id=a.empid) position from FromApprovers a where approvertype='uafp'");
        //ddl_reviewed.Items.Clear();
        //ddl_reviewed.Items.Add(new ListItem(" ", "0"));
        //foreach (DataRow dr in dt.Rows)
        //{
        //    ddl_reviewed.Items.Add(new ListItem(dr["fullname"].ToString(), dr["empid"].ToString()));
        //}
        DataTable dt = dbhelper.getdata2("Select a.Lastname+', '+a.Firstname+' '+Middlename [fullname],a.id,a.PositionId from MEmployee a where DivisionId<>3 order by lastname asc");
        ddl_approved.Items.Clear();
        ddl_approved.Items.Add(new ListItem(" ", "0"));
        drop_appr.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            ddl_approved.Items.Add(new ListItem(dr["fullname"].ToString(), dr["Id"].ToString()));
            drop_appr.Items.Add(new ListItem(dr["fullname"].ToString(), dr["Id"].ToString()));
        }

        dt = dbhelper.getdata("Select Count(*) counter from ManPower");
        if (dt.Rows.Count > 0)
        {
            lb_formnum.Text =(Convert.ToInt32(dt.Rows[0]["counter"].ToString())+1).ToString();
        }
        else
        {
            lb_formnum.Text = "0";
        }


        //BindDataM("");
        //BindDataM2("");
    }

  

    protected void view_ko(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            id = row.Cells[0].Text;
            string query = "select a.* from ManPower a where a.id=" + id + "";
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(query);


            drop_n.Text = dt.Rows[0]["manpower_needed"].ToString();
            drop_r.Text = dt.Rows[0]["nature_request"].ToString();
            txt_p.Text = dt.Rows[0]["position"].ToString();
            txt_np.Text = dt.Rows[0]["no_pax"].ToString();
            txt_dn.Text = dt.Rows[0]["date_needed"].ToString();
            txt_q.Text = dt.Rows[0]["qualifications"].ToString();
            txt_r.Text = dt.Rows[0]["description"].ToString();

            drop_c.Text = dt.Rows[0]["companyId"].ToString();
            dorp_b.Text=dt.Rows[0]["locationId"].ToString();
            drop_d.Text=dt.Rows[0]["departmentId"].ToString();
            drop_rep.Text=dt.Rows[0]["reporttoId"].ToString();
            drop_l.Text = dt.Rows[0]["levelId"].ToString();
            drop_con.Text=dt.Rows[0]["positiontype"].ToString();
            txt_du.Text=dt.Rows[0]["duration"].ToString();
            drop_all.Text=dt.Rows[0]["allocation"].ToString();
            txt_s.Text=dt.Rows[0]["summaryfunc"].ToString();
            txt_sp.Text=dt.Rows[0]["exreq"].ToString();
            txt_ex.Text=dt.Rows[0]["exknowledge"].ToString();
            txt_req.Text = dt.Rows[0]["requester"].ToString();

            txtdate.Text = dt.Rows[0]["date"].ToString();
            txtfnum.Text = id;
            hftoolreq2.Value = dt.Rows[0]["tooldept"].ToString();
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


            dt = dbhelper.getdata("Select * from mpfile_details where AppId=" + id);

            grid_req.DataSource = dt;
            grid_req.DataBind();
            div_msg.Visible = dt.Rows.Count == 0 ? true : false;

            modal_manpower_request.Style.Add("display", "block");
        }
    }

    protected void download(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            LinkButton lnk_viewreq = (LinkButton)grid_req.Rows[row.RowIndex].Cells[1].FindControl("lnk_download");
            DataTable dt = dbhelper.getdata("select * from mpfile_details where id=" + lnk_viewreq.CommandName + " ");
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
    protected void update(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("update ManPower set description='" + txt_r.Text + "',manpower_needed='" + drop_n.Text + "',nature_request='" + drop_r.Text + "',position='" + txt_p.Text + "',no_pax='" + txt_np.Text + "',date_needed='" + txt_dn.Text + "',qualifications='" + txt_q.Text + "',companyId=" + drop_c.SelectedValue + ",locationId=" + dorp_b.SelectedValue + ",departmentId=" + drop_d.SelectedValue + ",levelId=" + drop_l.SelectedValue + ",reporttoId=" + drop_rep.SelectedValue + ",positiontype='" + drop_con.Text + "',duration='" + txt_du.Text + "',allocation='" + drop_all.Text + "',summaryfunc='" + txt_s.Text + "',exknowledge='" + txt_ex.Text + "',approvedby=" + drop_appr.SelectedValue + ",exreq='" + txt_sp.Text + "',tooldept='" + hftoolreq2.Value + "' where id='" + id + "' ");
    
        saveattach(editfile1, editfile2, editfile3, id);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated Successfully'); window.location='MP'", true);
    }

    protected void continue_delete(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            if (TextBox1.Text == "Yes")
            {
                dbhelper.getdata("update ManPower set status = 'deleted' where id = " + row.Cells[0].Text + "");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted Successfully'); window.location='MP'", true);
            }
            else
            { }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("insert into Manpower(description,date,acc_id,status,manpower_needed,nature_request,position,no_pax,date_needed,qualifications,companyId,locationId,departmentId,levelId,reporttoId,positiontype,duration,allocation,summaryfunc,exknowledge,reviewedby,approvedby,exreq,requester,tooldept) OUTPUT Inserted.ID values('" + txt_mp.Text + "',getdate(),'" + Session["user_id"].ToString() + "','Pending','" + drop_status.Text + "','" + drop_nature.Text + "','" + txt_position.Text + "','" + txt_pax.Text + "','" + txt_date.Text + "','" + txt_qualification.Text + "'," + drop_company.SelectedValue + "," + drop_branch.SelectedValue + "," + drop_department.SelectedValue + "," + drop_level.SelectedValue + "," + drop_reportsto.SelectedValue + ",'" + drop_positiontype.SelectedItem + "','" + txt_duration.Text + "','" + drop_allocation.SelectedItem + "','" + txt_sumfunction.Text + "','" + txt_exknowledge.Text + "',0," + ddl_approved.SelectedValue + ",'" + txt_exreq.Text + "','" + lb_reqby.Text + "','" + hftoolreq.Value + "') ");
        saveattach(jobdesc, orgstruct, justifypos, dt.Rows[0]["ID"].ToString());
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully'); window.location='MP'", true);
  
    }
    protected void close(object sender, EventArgs e)
    {
        modal_manpower_request.Style.Add("display", "none");
    }


    //protected void BindDataM(string condition)
    //{
    //    chkMemberList1.Items.Clear();
    //    hf_cbvalues1.Value = "";
    //    hf_posvalues1.Value = "";
    //    condition = condition == "0" ? "" : condition;
    //    string query = "Select a.Lastname+', '+a.Firstname [name],a.id,a.PositionId from MEmployee a where DivisionId<>3 " + condition + " order by lastname asc";
    //    DataTable dt = dbhelper.getdata2(query);

    //    string queryy = "Select * from FromApprovers where approvertype='uafp'";
    //    DataTable dtt = dbhelper.getdata2(queryy);


    //    foreach (DataRow row in dt.Rows)
    //    {
    //        if (dtt.Select("empid=" + row["id"]).Count() == 0)
    //        {
    //            chkMemberList1.Items.Add(new ListItem(row["name"].ToString(), row["id"].ToString()));
    //        }
    //        else
    //        {
    //            ListItem li = new ListItem(row["name"].ToString(), row["id"].ToString());
    //            li.Selected = true;
    //            chkMemberList1.Items.Add(li);
    //            hf_cbvalues1.Value += row["id"].ToString() + ",";
    //        }
    //    }
    //}

    //protected void BindDataM2(string condition)
    //{
    //    chkMemberList2.Items.Clear();
    //    hf_cbvalues2.Value = "";
    //    hf_posvalues2.Value = "";
    //    condition = condition == "0" ? "" : condition;
    //    string query = "Select a.Lastname+', '+a.Firstname [name],a.id,a.PositionId from MEmployee a where DivisionId<>3 " + condition + " order by lastname asc";
    //    DataTable dt = dbhelper.getdata2(query);

    //    string queryy = "Select * from FromApprovers where approvertype='uafe'";
    //    DataTable dtt = dbhelper.getdata2(queryy);


    //    foreach (DataRow row in dt.Rows)
    //    {
    //        if (dtt.Select("empid=" + row["id"]).Count() == 0)
    //        {
    //            chkMemberList2.Items.Add(new ListItem(row["name"].ToString(), row["id"].ToString()));
    //        }
    //        else
    //        {
    //            ListItem li = new ListItem(row["name"].ToString(), row["id"].ToString());
    //            li.Selected = true;
    //            chkMemberList2.Items.Add(li);
    //            hf_cbvalues2.Value += row["id"].ToString() + ",";
    //        }
    //    }
    //}

}