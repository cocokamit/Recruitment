using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text;
using System.Web.Services;
using System.Data.SqlClient;

using System.Drawing;
using System.Text.RegularExpressions;
using System.Configuration;

public partial class form : System.Web.UI.Page
{
    public static string extension,profile="0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
            Response.Redirect("error?key=1");

        Session.Timeout = 120;
        if (!IsPostBack)
        {
            checkjob();
            countrylist();
            Session["profile_id"] = "profile_id";
          //  ImageButton1.Attributes.Add("src", "style/img/icon-1.png");
            FillCapctha();
            gridviewrow_governmentlicenses();
            gridviewrow();
            year();
        }

        string base64 = dataURLInto.Text;
        if (base64.Length > 0)
        {
            setAspectRatio.Src = dataURLInto.Text;
            setAspectRatio.Height = 100;
            setAspectRatio.Attributes.Add("style", " border:1px solid #3c94b4; padding:5px");
        }

        if (txt_resume.Text.Length > 0)
        {
            fdoc.InnerText = filename.Text;
            if (txt_resume.Text == ".pdf")
                educ_span.Attributes.Add("style", "background:url(style/img/icon/i-pdf.png) center no-repeat; border:1px solid #3c94b4; border-radius:3px");
            else
                educ_span.Attributes.Add("style", "background:url(style/img/icon/i-word.png) center no-repeat; border:1px solid #3c94b4; border-radius:3px");
        }

        load();
    }

    protected void load()
    {
        if (ddl_country.SelectedItem.ToString() == "Philippines")
        {
 
        }
    }

    protected void checkjob()
    {
        DataTable dt = dbhelper.getdata("select * from Jobs where id = " + Session["job_id"].ToString());
        if (dt.Rows.Count == 0)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "window.location='recruitment'", true);
        else
        {
            hf_property.Value = dt.Rows[0]["loc_id"].ToString();
            hf_app_id.Value = Session["job_id"].ToString(); //Request.QueryString["app_id"].ToString();
        }
    }

    protected void click_upload(object sender, EventArgs e)
    {
        string path = "temp/" +  hf_app_id.Value  + "_" + Session["captcha"].ToString();
        string fname = Path.GetFileName(FileUpload1.FileName);
        string FileExtension =System.IO.Path.GetExtension(FileUpload1.FileName);
        FileUpload1.SaveAs(Server.MapPath("~/" + path) + FileExtension);
        
        txt_resume.Text = FileExtension;
        filename.Text = fname;
        paraupload.Text =  hf_app_id.Value  + "_" + Session["captcha"].ToString();

        fdoc.InnerText = fname.Substring(0,7)+"..." + FileExtension;
        if (txt_resume.Text == ".pdf")
            educ_span.Attributes.Add("style", "background:url(style/img/icon/i-pdf.png) center no-repeat; border:1px solid #3c94b4; border-radius:3px");
        else
            educ_span.Attributes.Add("style", "background:url(style/img/icon/i-word.png) center no-repeat; border:1px solid #3c94b4; border-radius:3px");
    }

    [WebMethod]
    public static List<string> city(string val)
    {
        List<string> result = new List<string>();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select city from philippines where province='" + val + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    result.Add(dr["city"].ToString());
                }
            }
        }
        return result;
    }

    [WebMethod]
    public static List<string> prov(string val)
    { 
        List<string> result = new List<string>();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select distinct province from philippines where region='" + val + "'", con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    result.Add(dr["province"].ToString());
                }
            }
        }
        return result;
    }

    protected void countrylist()
    {
        string[] country_arr = { "Afghanistan", "Albania", "Algeria", "American Samoa", "Angola", "Anguilla", "Antartica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Ashmore and Cartier Island", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burma", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Clipperton Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo, Democratic Republic of the", "Congo, Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czeck Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Europa Island", "Falkland Islands (Islas Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern and Antarctic Lands", "Gabon", "Gambia, The", "Gaza Strip", "Georgia", "Germany", "Ghana", "Gibraltar", "Glorioso Islands", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard Island and McDonald Islands", "Holy See (Vatican City)", "Honduras", "Hong Kong", "Howland Island", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Ireland, Northern", "Israel", "Italy", "Jamaica", "Jan Mayen", "Japan", "Jarvis Island", "Jersey", "Johnston Atoll", "Jordan", "Juan de Nova Island", "Kazakhstan", "Kenya", "Kiribati", "Korea, North", "Korea, South", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Man, Isle of", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Midway Islands", "Moldova", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcaim Islands", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romainia", "Russia", "Rwanda", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Scotland", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and South Sandwich Islands", "Spain", "Spratly Islands", "Sri Lanka", "Sudan", "Suriname", "Svalbard", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Tobago", "Toga", "Tokelau", "Tonga", "Trinidad", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "Uruguay", "USA", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands", "Wales", "Wallis and Futuna", "West Bank", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe" };
        ddl_country.Items.Add("Country");
        foreach (string val in country_arr)
        {
            ddl_country.Items.Add(val);
        }

        //DataTable dt = dbhelper.getdata("select distinct region from philippines ");
        //drop_region.Items.Clear();
        //drop_region.Items.Add("Region");
        //foreach (DataRow dr in dt.Rows)
        //{
        //    drop_region.Items.Add(dr["region"].ToString());
        //}

    }

    public void click_convert(object sender,EventArgs e)
    {
        string base64 = base64textarea.InnerText;
        byte[] bytes = Convert.FromBase64String(base64);
        using (System.IO.FileStream stream = new System.IO.FileStream(Server.MapPath("~/crop image/test.pdf"), System.IO.FileMode.Create))
        {
            stream.Write(bytes, 0, bytes.Length);
            stream.Flush();
        }
    }

    [WebMethod]
    public static List<string> getprovince(string field, string province, string country,string city)
    {
        List<string> result = new List<string>();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
        {
            if (country == "Philippines")
            {
                if (field == "city")
                {
                    using (SqlCommand cmd = new SqlCommand("select " + field + " from philippines where province='"+province+"' and city LIKE '%'+@city+'%'  ", con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@city", city);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (province.Length > 0)
                        {
                            while (dr.Read())
                            {
                                result.Add(dr["city"].ToString());
                            }
                        }
                    }
                }
                else
                {
                    using (SqlCommand cmd = new SqlCommand("select " + field + " from philippines where province LIKE '%'+@province+'%'", con))
                    {

                        con.Open();
                        cmd.Parameters.AddWithValue("@province", province);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (province.Length > 0)
                        {
                            while (dr.Read())
                            {
                                result.Add(dr["province"].ToString());
                            }
                        }
                    }
                }
            }
            return result;
        }
    }

    [WebMethod]
    public static List<string> getprovincepro(string field, string province, string country, string city)
    {
        List<string> result = new List<string>();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
        {
            if (country == "Philippines")
            {
                if (field == "city")
                {
                    using (SqlCommand cmd = new SqlCommand("select " + field + " from philippines where province='" + province + "' and city LIKE '%'+@city+'%'  ", con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@city", city);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (province.Length > 0)
                        {
                            while (dr.Read())
                            {
                                result.Add(dr["city"].ToString());
                            }
                        }
                    }
                }
                else
                {
                    using (SqlCommand cmd = new SqlCommand("select " + field + " from philippines where province LIKE '%'+@province+'%'", con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@province", province);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (province.Length > 0)
                        {
                            while (dr.Read())
                            {
                                result.Add(dr["province"].ToString());
                            }
                        }
                    }
                }
            }
            return result;
        }

    }
 
    protected void selectcity(object sender, EventArgs e)
    {
        //if (drop_city.SelectedIndex > 0)
        //    drop_city.ForeColor = ColorTranslator.FromHtml("#383434");
        //else
        //    drop_city.ForeColor = ColorTranslator.FromHtml("#2188ae");
    }

    protected void clear_pre_country(object sender, EventArgs e)
    {
        //if(ddl_country.SelectedIndex > 0)
        //    ddl_country.ForeColor = ColorTranslator.FromHtml("#383434");
        //else
        //    ddl_country.ForeColor = ColorTranslator.FromHtml("#2188ae");

      
        
        //if (ddl_country.Text == "Philippines")
        //{
            
        //    ddl_region.Visible = false;
        //    ddl_province.Visible = false;
        //    ddl_city.Visible = false;

        //    drop_region.Visible = true;
        //    drop_province.Visible = true;
        //    drop_city.Visible = true;

        //    drop_region.Items.Clear();
        //    DataTable dt = dbhelper.getdata("select distinct region from philippines");
        //    drop_region.Items.Add("Region");
        //    drop_province.Items.Clear();
        //    drop_city.Items.Clear();
        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        if (dr["region"].ToString() != "SPECIAL PROVINCES")
        //            drop_region.Items.Add(dr["region"].ToString());
        //    }
        //}
        //else
        //{
        //    drop_region.Items.Clear();
        //    drop_province.Items.Clear();
        //    drop_city.Items.Clear();

        //    ddl_region.Visible = true;
        //    ddl_province.Visible = true;
        //    ddl_city.Visible = true;


        //    drop_region.Visible = false;
        //    drop_province.Visible = false;
        //    drop_city.Visible = false;
        //}
    
    }

    protected void select_pre_region(object sender, EventArgs e)
    {
        //if (drop_region.SelectedIndex > 0)
        //    drop_region.ForeColor = ColorTranslator.FromHtml("#383434");
        //else
        //    drop_region.ForeColor = ColorTranslator.FromHtml("#2188ae");

        //DataTable dt = dbhelper.getdata("select distinct province  from philippines where region='" + drop_region.Text + "'");
        //drop_province.Items.Clear();
        //drop_province.Items.Add("Province");
        //foreach (DataRow dr in dt.Rows)
        //{
        //    drop_province.Items.Add(dr["province"].ToString());
        //}
    }

    protected void select_pre_province(object sender, EventArgs e)
    {
        //if (drop_province.SelectedIndex > 0)
        //    drop_province.ForeColor = ColorTranslator.FromHtml("#383434");
        //else
        //    drop_province.ForeColor = ColorTranslator.FromHtml("#2188ae");

       

        //DataTable dt = dbhelper.getdata("select distinct city  from philippines where province='" + drop_province.Text + "'");
        //drop_city.Items.Clear();
        //drop_city.Items.Add("City");
        //foreach (DataRow dr in dt.Rows)
        //{
        //    drop_city.Items.Add(dr["city"].ToString());
        //}
    }

    protected void getregpro(object sender, EventArgs e)
    {
        ddl_region.Text = "";
        if (ddl_province.Text.Length > 0)
        {
            DataTable regpro = dbhelper.getdata("select * from philippines where province='" + ddl_province.Text + "'");
            if (regpro.Rows.Count > 0)
            {
                ddl_region.Text = regpro.Rows[0]["region"].ToString();
                ddl_city.Focus();
            }
        }
    }

    protected void year()
    {
        int i = DateTime.Now.Year + 1;
         for (; i > 1980; i--)
         {
             ddl_year.Items.Add((i - 1).ToString());
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

    protected void Databound_employmenthistory(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //TextBox tbOne = e.Row.FindControl("txt_from") as TextBox;
            //string js = "dss(" + tbOne.ClientID + ");";
            //ClientScript.RegisterStartupScript(this.GetType(), "DatePickJS_" + Guid.NewGuid().ToString("N"), js, true);
             

            //DropDownList ddl_employmenthistory_year = (DropDownList)e.Row.FindControl("ddl_employmenthistory_year");
            //DropDownList ddl_employmenthistory_day = (DropDownList)e.Row.FindControl("ddl_employmenthistory_day");
            //int i = 1955;
            //for (; i < int.Parse(DateTime.Now.Year.ToString()); i++)
            //{
            //    ddl_employmenthistory_year.Items.Add((i + 1).ToString());
            //    ddl_employmenthistory_day.Items.Add((i + 1).ToString()
            //}
        }
    }

    protected Color fromhtml(bool val)
    {
        return val ? ColorTranslator.FromHtml("#2188ae") : ColorTranslator.FromHtml("#c94e4e");
    }
   
    protected bool checkfeilds()
    {
        bool ret = true;

        l_addpic.ForeColor =fromhtml( dataURLInto.Text.Length > 0);
        l_educ.ForeColor = fromhtml(txt_resume.Text.Length > 0);
        l_fname.ForeColor = fromhtml(txt_fname.Text.Length > 0);
        l_lname.ForeColor = fromhtml(txt_lname.Text.Length > 0);

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
        catch (Exception ex)
        {
           
        }

        if ( txtCaptcha.Style.Value.Contains("red") || (l_educ.ForeColor.ToString() + l_addpic.ForeColor.ToString() + l_fname.ForeColor.ToString() + l_mname.ForeColor.ToString() + l_lname.ForeColor.ToString() + l_coun.ForeColor.ToString() + l_mn.ForeColor.ToString() + l_ea.ForeColor.ToString()).Contains("[A=255, R=201, G=78, B=78]"))
            ret = false;

        return ret;
    }

    protected void click_save(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = dbhelper.getdata("select * from applicant where job_id=" + hf_app_id.Value + " and email='" + txt_email.Text.Replace(" ", "").Replace("'", "''") + "' and status<>'Hired' and status<>'reject' and status<>'cancel'");

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
                    string region = ddl_region.Text.Length > 2 ? ddl_region.Text.Substring(0, ddl_region.Text.IndexOf("|")) :  ddl_region.Text;
                    string province = ddl_province.Text;
                    string baranggay = txt_baranggay.Text.Length == 0 ? "None" : txt_baranggay.Text.Trim();
                    string present = country + "|" + region + "|" + province + "|" + city + "|" + baranggay;

                    query += "insert into applicant(date_app,name,present_add,tel_no,cell_no,email,dateofbirth,job_id,resume_file,status,captcha,gender,property) values " +
                    "(getdate(),'" + txt_fname.Text.Trim().Replace("'", "''") + ' ' + txt_mname.Text.Trim().Replace("'", "''") + ' ' + txt_lname.Text.Trim().Replace("'", "''") + "','" + present + "','" +
                    txt_tel.Text.Replace("'", "''") + "','" + txt_cel.Text.Replace("'", "''") + "','" + txt_email.Text.Replace("'", "''") + "','" + txt_from.Text.Replace(" ", "") + "'," + hf_app_id.Value + ",'" +
                    txt_fname.Text.Replace(" ", "").Replace("'", "''") + "_" + txt_lname.Text.Replace(" ", "").Replace("'", "''") + txt_resume.Text.Replace("'", "''") + "','new applicant','" + txtCaptcha.Text + "','" + ddl_gender.Text + "'," + hf_property.Value + ") set @appid = scope_identity(); " +

                   "insert into Education(app_id,level,school,year,address,job_id)values(@appid,'Elementary','" + txt_elemschool.Text.Trim().Replace("'", "''") + "','" + ddl_elemmonth.Text + "-" + ddl_elemyear.Text + "','" + txt_elemaddress.Text.Trim().Replace("'", "''") + "'," + hf_app_id.Value + ") " +
                   "insert into Education(app_id,level,school,year,address,job_id)values(@appid,'Secondary','" + txt_secondschool.Text.Trim().Replace("'", "''") + "','" + ddl_secondmonth.Text + "-" + ddl_secondyear.Text + "','" + txt_secondaddress.Text.Trim().Replace("'", "''") + "'," + hf_app_id.Value + ") " +
                   "insert into Education(app_id,level,school,year,address,job_id)values(@appid,'College','" + txt_collegeschool.Text.Trim().Replace("'", "''") + "','" + ddl_collegemonth.Text + "-" + ddl_collegeyear.Text + "','" + txt_collegeaddress.Text.Trim().Replace("'", "''") + "'," + hf_app_id.Value + ") " +
                   "insert into Education(app_id,level,school,year,address,job_id)values(@appid,'Vocational','" + txt_vocationalschool.Text.Trim().Replace("'", "''") + "','" + ddl_vocationalmonth.Text + "-" + ddl_vocationalyear.Text + "','" + txt_vocationaladdress.Text.Trim().Replace("'", "''") + "'," + hf_app_id.Value + ") ";

                    DataTable employment = (DataTable)ViewState["governmentlicenses"];
                    foreach (DataRow row in employment.Rows)
                        query += "insert into EmploymentHistory(app_id,company,position,fromto,job_id)values(@appid,'" + row["col_1"].ToString().Trim().Replace("'", "''") + "','" + row["col_2"].ToString().Trim().Replace("'", "''") + "','" + row["col_3"].ToString().Trim().Replace("'", "''") + "'," + hf_app_id.Value + ") ";

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
                dtCurrentTable.Rows[i-1]["col_1"] = txt_description.Text;

                if (i == dtCurrentTable.Rows.Count)
                    lbl_descripton.Text = txt_description.Text.Replace(" ", "").Length == 0 ? "* empty" : "";

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

    protected void FillCapctha()
    {
        Random random = new Random();
        string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        StringBuilder captcha = new StringBuilder();
        
        for (int i = 0; i < 6; i++)
            captcha.Append(combination[random.Next(combination.Length)]);
        Session["captcha"] = captcha.ToString();
        imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        FillCapctha();
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Session["captcha"].ToString() != txtCaptcha.Text)

            Response.Write("Invalid Captcha Code");
        else
            Response.Write("Valid Captcha Code");
        FillCapctha();
    }

    protected void click_profile(object sender, EventArgs e)
    {
     
    
    }
   
    protected void Upload(object sender, EventArgs e)
    {
        DataTable ins = dbhelper.getdata("insert into app_profile(date_input,img_file)values(getdate(),'" + extension + "') select scope_identity() id");
        Session["profile_id"] = ins.Rows[0]["id"].ToString();
        DirectoryInfo nw = Directory.CreateDirectory(Server.MapPath("~/UploadImages/prof_id_" + ins.Rows[0]["id"].ToString() + "/"));
        string base64 = Request.Form["imgCropped"];
        byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);
        using (System.IO.FileStream stream = new System.IO.FileStream(Server.MapPath("~/UploadImages/prof_id_" + ins.Rows[0]["id"].ToString() + "/" + ins.Rows[0]["id"].ToString()+".png"), System.IO.FileMode.Create))
        {
            stream.Write(bytes, 0, bytes.Length);
            stream.Flush();
        }
       // ImageButton1.Attributes.Add("src", "UploadImages/prof_id_" + Session["profile_id"].ToString() + "/" + Session["profile_id"].ToString() +".png");
        profile = "1";
       
    }

    protected void add_close(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("formapp?app_id=" +  hf_app_id.Value  + "", false);
    }

    
}