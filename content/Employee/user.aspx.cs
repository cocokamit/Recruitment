using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_Employee_user : System.Web.UI.Page
{
    public static string query,id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("quit");

        if(!IsPostBack)
            getdata();
    }

    protected void click_close(object sender, EventArgs e)
    {
        modaladd.Style.Add("display", "none");
        modaledit.Style.Add("display", "none");
    }

    protected void getdata()
    {
        string query = "Select * from account a left join location b on a.loc_id=b.id where a.status='0' order by a.ngalan";
        DataSet ds = new DataSet();
        ds = bol.displayData(query);

        grid_view.DataSource = ds.Tables["table"];
        grid_view.DataBind();
        alert.Visible = grid_view.Rows.Count == 0 ? true : false;
        designation();
        location();
    }
    protected void searchUser(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("select * from account a left join location b on a.loc_id=b.id where a.status='0' and ngalan like '%" + TextBox5.Text + "%' or username like '%" + TextBox5.Text + "%' or password like '%" + TextBox5.Text + "%' or designation like '%" + TextBox5.Text + "%'");
        grid_view.DataSource = dt;
        grid_view.DataBind();
    }
    protected void designation()
    {
        DataTable dt = nobel.designation();
        drop_deg.Items.Clear();
        for (int i = 0; i < dt.Rows.Count; i++)
            drop_deg.Items.Insert(0, new ListItem(dt.Rows[i]["job_type"].ToString(), dt.Rows[i]["jobtype_id"].ToString()));
        drop_deg.Items.Insert(0, "");
    }

    protected void location()
    {
        query = "select description,id from location where status is null";
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);
        drop_location.Items.Clear();
        for (int i = 0; i < dt.Rows.Count; i++)
            drop_location.Items.Insert(0, new ListItem(dt.Rows[i]["description"].ToString(), dt.Rows[i]["id"].ToString()));
        drop_location.Items.Insert(0, "");
    }

    protected void view(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            modaledit.Style.Add("display", "block");
            hf_id.Value = id = row.Cells[0].Text;
            string query = "select a.deg_id,a.deg_text, a.ngalan,a.username,a.password,a.designation,a.loc_id " +
            "from account a " +
            "where id=" + id;
            DataTable dt = dbhelper.getdata(query);
            TextBox4.Text = dt.Rows[0]["designation"].ToString();
            txt_namee.Text = dt.Rows[0]["ngalan"].ToString();
            txt_username.Text = dt.Rows[0]["username"].ToString();
            txt_password.Text = dt.Rows[0]["password"].ToString();
            hf_designation.Value = dt.Rows[0]["deg_id"].ToString();

            if (dt.Rows[0]["deg_id"].ToString() == "0")
            {
                panel_location.Visible = false;
                panel_designation.Visible = false;
                l_e_m.Text = "";
            }
            else
            {
                panel_location.Visible = true;
                panel_designation.Visible = true;

                if (dt.Rows[0]["deg_text"].ToString().Replace(" ", "").Length == 0)
                    l_e_m.Text = "Designation deleted!";
                else
                {
                    TextBox2.Text = dt.Rows[0]["deg_id"].ToString();
                    TextBox3.Text = dt.Rows[0]["deg_text"].ToString();
                    l_e_m.Text = "";
                }
                drop_location.SelectedValue = dt.Rows[0]["loc_id"].ToString();

                if (TextBox3.Text.Length > 0)
                {
                    int i = 0, deg = 0;
                    string[] c_id = dt.Rows[0]["deg_id"].ToString().Substring(0, dt.Rows[0]["deg_id"].ToString().Length - 1).Split(' ');
                    string[] cashed = dt.Rows[0]["deg_text"].ToString().Substring(0, dt.Rows[0]["deg_text"].ToString().Length - 1).Split('_');
                    string html = null, a = null, b = null;
                    foreach (string val in cashed)
                    {
                        dt = dbhelper.getdata("select * from Jobtype where jobtype_id=" + c_id[i]);
                        string tag = dt.Rows[0]["status"].ToString() == "deleted" ? "tagx" : "tag";
                        html += "<span id='" + c_id[i] + "'  title='" + val + "' class='" + tag + "' ><span>" + val + "</span><small> | </small><a href='javascript:void(0)'  onclick='click_ar(" + c_id[i] + ")'>x</a></span>";

                        if (tag == "tag")
                        {
                            a = c_id[i] + " ";
                            b = val + "_";
                        }
                        else
                            deg++;

                        i++;
                    }
                    l_e_m.Text = deg > 0 ? "Designation deleted!" : "";
                    div_con_b.InnerHtml = html;
                    TextBox2.Text = a;
                    TextBox3.Text = b;
                }
            }
        }
    }

    protected void click_add(object sender, EventArgs e)
    {
        modaladd.Style.Add("display", "block");
    }

    protected void add_close(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("users", false);
    }

    protected void delete(object sender, EventArgs e)
    {
        if (TextBox1.Text == "Yes")
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                id = row.Cells[0].Text;
                string query = "update account set status='1' where  id=" + id + " ";
                dbhelper.getdata(query);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted Successfully'); window.location='users'", true);
            }
        }
    }

    protected void edit(object sender, EventArgs e)
    {
        if (checker_edit())
        {
            string condition = hf_designation.Value == "0" ? "" : ",loc_id='" + drop_location.SelectedValue + "',deg_id='" + TextBox2.Text + "',deg_text='" + TextBox3.Text + "'";
            string query = "update account set ngalan='" + txt_namee.Text + "',username='" + txt_username.Text + "',password='" + txt_password.Text + "' " + condition + " where  id=" + hf_id.Value + " ";
            dbhelper.getdata(query);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record successfully save'); window.location='users'", true);
        }
    }

    protected bool checker_edit()
    {
        if (TextBox3.Text.Length > 0)
        {
            int i = 0;
            string[] c_id = TextBox2.Text.Substring(0, TextBox2.Text.Length - 1).Split(' ');
            string[] cashed = TextBox3.Text.Substring(0, TextBox3.Text.Length - 1).Split('_');
            string html = null;
            foreach (string val in cashed)
            {
                html += "<span id='" + c_id[i] + "'  title='" + val + "' class='tag'><span>" + val + "</span><small> | </small><a href='javascript:void(0)'  onclick='click_ar(" + c_id[i] + ")'>x</a></span>";
                i++;
            }
            div_con_b.InnerHtml = html;
        }

        bool oi = true;
        l_e_m.Text = "";
        l_name.Text = txt_namee.Text.Trim().Length == 0 ? "*" : "";
        l_user.Text = txt_username.Text.Trim().Length == 0 ? "*" : "";
        l_pass.Text = txt_password.Text.Trim().Length == 0 ? "*" : "";
        if (panel_designation.Visible)
            l_desig.Text = div_con_b.InnerHtml.Replace(" ", "").Length == 0 ? "*" : "";
        else
            l_desig.Text = "";

        if (panel_designation.Visible)
            l_loc.Text = drop_location.Text.Trim().Length == 0 ? "*" : "";
        else
            l_loc.Text = "";

        if ((l_name.Text + l_user.Text + l_pass.Text + l_desig.Text + l_loc.Text).Contains("*"))
            oi = false;
        return oi;
    }

    protected void save(object sender, EventArgs e)
    {
        if (checker())
        {
            stateclass a = new stateclass();
            a.sa = txt_name.Text;
            a.sb = txt_uname.Text;
            a.c = txt_pwd.Text;
            a.d = ddl_usertype.Text == "Hr" ? "HR" : ddl_usertype.Text;
            //a.d = ddl_usertype.Text = ddl_usertype.Text;
            a.e = drop_loc.SelectedValue;
            a.f = tb_desig.Text;
            a.g = tb_desig_text.Text;
            int x=bol.account(a);

            if (x == 1)
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully'); window.location='users'", true);
            if (x == 2)
                Response.Write("<script>alert('Data already exist.')</script>");
        }
    }

    protected bool checker()
    {
        if (tb_desig_text.Text.Length > 0)
        {
            int i = 0;
            string[] c_id = tb_desig.Text.Substring(0, tb_desig.Text.Length - 1).Split(' ');
            string[] cashed = tb_desig_text.Text.Substring(0, tb_desig_text.Text.Length - 1).Split('_');
            string html = null;
            foreach (string val in cashed)
            {
                html += "<span id='" + c_id[i] + "'  title='" + val + "' class='tag'><span>" + val + "</span><small> | </small><a href='javascript:void(0)'  onclick='click_remove(" + c_id[i] + ")'>x</a></span>";
                i++;
            }
            div_con.InnerHtml = html;
        }

        bool oi = true;
        if (txt_name.Text == "")
        {
            oi = false;
            lbl_name.Text = "*";
        }
        else
            lbl_name.Text = "";
        if (txt_uname.Text == "")
        {
            oi = false;
            lbl_user.Text = "*";
        }
        else
            lbl_user.Text = "";
        if (txt_pwd.Text == "")
        {
            oi = false;
            lbl_pass.Text = "*";
        }
        else
            lbl_pass.Text = "";

        if (div_con.InnerHtml.Replace(" ","").Length == 0)
        {
            oi = false;
            lbl_des.Text = "*";
        }
        else
            lbl_des.Text = "";

        if (ddl_usertype.Text == "SELECT")
        {
            oi = false;
            lbl_type.Text = "*";
        }
        else
            lbl_type.Text = "";
        if (drop_loc.Text.Length == 0)
        {
            oi = false;
            lbl_loc.Text = "*";
        }
        else
            lbl_loc.Text = "";

        return oi;
    }
}