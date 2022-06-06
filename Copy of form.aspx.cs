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

public partial class form : System.Web.UI.Page
{
    public static string extension,profile="0";
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {

            countrylist();
            Session["profile_id"] = "profile_id";
            ImageButton1.Attributes.Add("src", "style/img/icon-1.png");
            FillCapctha();
            gridviewrow_governmentlicenses();
            gridviewrow();
            year();
         
        }
       
    }
    [WebMethod]
    public static List<string> getprovince(string field, string province, string country,string city)
    {
       
            List<string> result = new List<string>();

            using (SqlConnection con = new SqlConnection("Data Source=BWM-SVRHR01;Password=M@ribago;User ID=sa;Initial Catalog=b_hr"))
            //       using (SqlConnection con = new SqlConnection("Data Source=WIN-0SCBIBV0LAY\SQLEXPRESS;Password=G@teway;User ID=sa;Initial Catalog=msh"))
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
        using (SqlConnection con = new SqlConnection("Data Source=BWM-SVRHR01;Password=M@ribago;User ID=sa;Initial Catalog=b_hr"))
        //using (SqlConnection con = new SqlConnection("Data Source=WIN-0SCBIBV0LAY\SQLEXPRESS;Password=G@teway;User ID=sa;Initial Catalog=msh"))
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



 
    
    //present side
    protected void clear_pre_country(object sender, EventArgs e)
    {
        if (ddl_country.Text == "Philippines")
        {
            ddl_region.Visible = false;
            ddl_province.Visible = false;
            ddl_city.Visible = false;

            drop_region.Visible = true;
            drop_province.Visible = true;
            drop_city.Visible = true;

            drop_region.Items.Clear();
            DataTable dt = dbhelper.getdata("select distinct region from philippines");
            drop_region.Items.Add("Region");
            drop_province.Items.Clear();
            drop_city.Items.Clear();
            foreach (DataRow dr in dt.Rows)
            {
                if (dr["region"].ToString() != "SPECIAL PROVINCES")
                    drop_region.Items.Add(dr["region"].ToString());
            }
        }
        else
        {
            drop_region.Items.Clear();
            drop_province.Items.Clear();
            drop_city.Items.Clear();

            ddl_region.Visible = true;
            ddl_province.Visible = true;
            ddl_city.Visible = true;


            drop_region.Visible = false;
            drop_province.Visible = false;
            drop_city.Visible = false;
        }
    
    }
    protected void select_pre_region(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("select distinct province  from philippines where region='" + drop_region.Text + "'");
        drop_province.Items.Clear();
        drop_province.Items.Add("Province");
        foreach (DataRow dr in dt.Rows)
        {
            drop_province.Items.Add(dr["province"].ToString());
        }
    }
    protected void select_pre_province(object sender, EventArgs e)
    {
        DataTable dt = dbhelper.getdata("select distinct city  from philippines where province='" + drop_province.Text + "'");
        drop_city.Items.Clear();
        drop_city.Items.Add("City");
        foreach (DataRow dr in dt.Rows)
        {
            drop_city.Items.Add(dr["city"].ToString());
        }
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
   
    protected void countrylist()
    {
        string[] country_arr = { "Afghanistan", "Albania", "Algeria", "American Samoa", "Angola", "Anguilla", "Antartica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Ashmore and Cartier Island", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burma", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Clipperton Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo, Democratic Republic of the", "Congo, Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czeck Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Europa Island", "Falkland Islands (Islas Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern and Antarctic Lands", "Gabon", "Gambia, The", "Gaza Strip", "Georgia", "Germany", "Ghana", "Gibraltar", "Glorioso Islands", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard Island and McDonald Islands", "Holy See (Vatican City)", "Honduras", "Hong Kong", "Howland Island", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Ireland, Northern", "Israel", "Italy", "Jamaica", "Jan Mayen", "Japan", "Jarvis Island", "Jersey", "Johnston Atoll", "Jordan", "Juan de Nova Island", "Kazakhstan", "Kenya", "Kiribati", "Korea, North", "Korea, South", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Man, Isle of", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Midway Islands", "Moldova", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcaim Islands", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romainia", "Russia", "Rwanda", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Scotland", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and South Sandwich Islands", "Spain", "Spratly Islands", "Sri Lanka", "Sudan", "Suriname", "Svalbard", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Tobago", "Toga", "Tokelau", "Tonga", "Trinidad", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "Uruguay", "USA", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands", "Wales", "Wallis and Futuna", "West Bank", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe" };
        ddl_country.Items.Add("Country");
  
        foreach (string val in country_arr)
        {
            ddl_country.Items.Add(val);
         
        }
    }

   
    protected void year()
    {
        int i = 1955;
        for (; i < int.Parse(DateTime.Now.Year.ToString()); i++)
        {
            ddl_year.Items.Add((i + 1).ToString());
            ddl_collegeyear.Items.Add((i + 1).ToString());
            ddl_elemyear.Items.Add((i + 1).ToString());
            ddl_secondyear.Items.Add((i + 1).ToString());
            ddl_vocationalyear.Items.Add((i + 1).ToString());
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
                TextBox txt_from = (TextBox)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("txt_from");
                TextBox txt_to = (TextBox)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("txt_to");

                Label lbl_2ndemploymenthistory_c_name_address = (Label)grid_employmenthistory.Rows[rowIndex].Cells[1].FindControl("lbl_2ndemploymenthistory_c_name_address");
                Label lbl_2ndemploymenthistory_position = (Label)grid_employmenthistory.Rows[rowIndex].Cells[2].FindControl("lbl_2ndemploymenthistory_position");
                Label lbl_2ndemploymenthistory_fromto = (Label)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("lbl_2ndemploymenthistory_fromto");


                Label lbl_employmenthistory_c_name_address = (Label)grid_employmenthistory.Rows[rowIndex].Cells[1].FindControl("lbl_employmenthistory_c_name_address");
                Label lbl_employmenthistory_position = (Label)grid_employmenthistory.Rows[rowIndex].Cells[2].FindControl("lbl_employmenthistory_position");
                Label lbl_employmenthistory_fromto = (Label)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("lbl_employmenthistory_fromto");


                //string datesss ="test" ;
                    //(txt_from.Text+"-" + txt_to.Text)


                if (i == dtCurrentTable.Rows.Count)
                {
                    lbl_employmenthistory_fromto.Text = (txt_from.Text + "" + txt_to.Text).Length == 0 ? "empty" : (txt_from.Text + "-" + txt_to.Text).ToString();
                    lbl_employmenthistory_position.Text = txt_employmenthistory_position.Text.Length == 0 ? "empty" : txt_employmenthistory_position.Text;
                    lbl_employmenthistory_c_name_address.Text = txt_employmenthistory_c_name_address.Text.Length == 0 ? "empty" : lbl_employmenthistory_c_name_address.Text;
                }
                if ((lbl_employmenthistory_fromto.Text + "" + lbl_employmenthistory_position.Text + "" + lbl_employmenthistory_c_name_address.Text).Contains("empty"))
                    goto exit;


                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumber"] = i + 1;
                dtCurrentTable.Rows[i - 1]["col_1"] = txt_employmenthistory_c_name_address.Text.Length == 0 ? lbl_2ndemploymenthistory_c_name_address.Text : txt_employmenthistory_c_name_address.Text;
                dtCurrentTable.Rows[i - 1]["col_2"] = txt_employmenthistory_position.Text.Length == 0 ? lbl_2ndemploymenthistory_position.Text : txt_employmenthistory_position.Text;
                dtCurrentTable.Rows[i - 1]["col_3"] = (txt_from.Text + "" + txt_to.Text).ToString().Length == 0 ? lbl_2ndemploymenthistory_fromto.Text : (txt_from.Text + "-" + txt_to.Text).ToString();
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
                    ImageButton btnnnn = (ImageButton)grid_employmenthistory.Rows[rowIndex].Cells[2].FindControl("ImageButton2");
                    TextBox txt_from = (TextBox)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("txt_from");
                    TextBox txt_to = (TextBox)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("txt_to");
                    ImageButton can = (ImageButton)grid_employmenthistory.Rows[rowIndex].Cells[4].FindControl("can");




                    Label lbl_2ndemploymenthistory_c_name_address = (Label)grid_employmenthistory.Rows[rowIndex].Cells[1].FindControl("lbl_2ndemploymenthistory_c_name_address");
                    Label lbl_2ndemploymenthistory_position = (Label)grid_employmenthistory.Rows[rowIndex].Cells[2].FindControl("lbl_2ndemploymenthistory_position");
                    Label lbl_2ndemploymenthistory_fromto = (Label)grid_employmenthistory.Rows[rowIndex].Cells[3].FindControl("lbl_2ndemploymenthistory_fromto");
                   
                    if (i != dt.Rows.Count - 1)
                    {

                        txt_from.Visible = false;
                        txt_to.Visible = false;
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
   
    protected bool checkfeilds()
    {
        bool d = true;
        if (txt_fname.Text.Trim().Length == 0)
        {
            d = false;
        
            lbl_error.Text = "Invalid Input First Name!";
        }
        else if (txt_mname.Text.Trim().Length == 0)
        {
            d = false;
            lbl_error.Text = "Invalid Input Middle Name!";
        }
        else if (txt_lname.Text.Trim().Length == 0)
        {
            d = false;
            lbl_error.Text = "Invalid Input Last Name!";
        }
        else if (txt_cel.Text.Trim().Length == 0)
        {
            d = false;
            lbl_error.Text = "Invalid Input Cellphone Number!";

        }
        else if (!Regex.IsMatch(txt_email.Text, "^([0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$"))
        {
            d = false;
            lbl_error.Text = "Invalid Input E-mail!";
        }
        else if (ddl_month.SelectedValue == "")
        {
            d = false;
            lbl_error.Text = "Invalid Input Date of Birth!";

        }
        else if (ddl_day.SelectedValue == "")
        {
            d = false;
            lbl_error.Text = "Invalid Input Date of Birth!";

        }
        else if (ddl_year.SelectedValue == "")
        {
            d = false;
            lbl_error.Text = "Invalid Input Date of Birth!";

        }
        else if (txtCaptcha.Text.Trim().Length == 0)
        {
            lbl_error.Text = "Invalid Input Capcha!";
        }
        else if (profile != "1")
        {
            d = false;
            lbl_error.Text = "Invalid Input Profile Picture!";

        }
        else if (!FileUpload1.HasFile)
        {
            d = false;
            lbl_error.Text = "Invalid Input Resume!";
        }
       
       
        return d;
    }
    protected bool addresscheck()
    {
        bool d = true;
        if (ddl_country.Text == "Country")
        {
            d = false;
            lbl_error.Text = "Invalid Input Country!";
        }
        else if (ddl_country.Text == "Philippines")
            {
                if (drop_region.Text == "Region")
                {
                    d = false;
                    lbl_error.Text = "Invalid Input Region!";
                }
                if (drop_province.Text == "Province")
                {
                    d = false;
                    lbl_error.Text = "Invalid Input Province!";
                }
                if (drop_city.Text == "City")
                {
                    d = false;
                    lbl_error.Text = "Invalid Input City!";
                }
                if (txt_baranggay.Text.Length == 0)
                {
                    d = false;
                    lbl_error.Text = "Invalid Input Barangay/Street!";
                }
            }
            else if (ddl_country.Text != "Philippines")
            {

                if (txt_baranggay.Text.Length == 0)
                {
                    d = false;
                    lbl_error.Text = "Invalid Input Barangay/Street!";
                }
                if (ddl_city.Text.Trim().Length == 0)
                {
                    d = false;
                    lbl_error.Text = "Invalid Input City!";
                }
                if (ddl_province.Text.Trim().Length == 0)
                {
                    d = false;
                    lbl_error.Text = "Invalid Input Province!";
                }
                if (ddl_region.Text.Trim().Length == 0)
                {
                    d = false;
                    lbl_error.Text = "Invalid Input Region!";
                }
            }
     
        return d;
    }
    protected void click_save(object sender, EventArgs e)
    {
        if (addresscheck())
        {
            if (checkfeilds())
            {
                
                               if (Path.GetExtension(FileUpload1.PostedFile.FileName) == ".doc" || Path.GetExtension(FileUpload1.PostedFile.FileName) == ".docx" || Path.GetExtension(FileUpload1.PostedFile.FileName) == ".pdf")
                                {
                                    Button1.Enabled = false;
                                    Button1.Visible = false;
                                    string country = ddl_country.Text == "Country" ? "None" : ddl_country.Text;
                                    string city = ddl_country.Text == "Philippines" ? drop_city.Text : ddl_city.Text;
                                    string region = ddl_country.Text == "Philippines" ? drop_region.Text : ddl_region.Text;
                                    string province = ddl_country.Text == "Philippines" ? drop_province.Text : ddl_province.Text;
                                    string baranggay = txt_baranggay.Text.Length == 0 ? "None" : txt_baranggay.Text;


                                    string present = country + "|" + city + "|" + region + "|" + province + "|" + baranggay;
                                    string prov =""+ "|" + "" + "|" + "" + "|" + "" + "|" + "";

                                    DataTable dt = dbhelper.getdata("insert into applicant(date_app,name,pos_desire,present_add,provencial_add,tel_no,cell_no,email,dateofbirth,job_id,resume_file,status,captcha)values(getdate(),'" + txt_fname.Text + ',' + txt_mname.Text + ',' + txt_lname.Text + "','" + prov + "','" + present + "','" + prov + "','" + txt_tel.Text + "','" + txt_cel.Text + "','" + txt_email.Text + "','" + ddl_month.Text + '/' + ddl_day.Text + '/' + ddl_year.Text + "'," + Request.QueryString["app_id"].ToString() + ",'" + txt_fname.Text.Replace(" ", "") + "_" + txt_lname.Text.Replace(" ", "") + Path.GetExtension(FileUpload1.PostedFile.FileName) + "','For appointment','" + txtCaptcha.Text + "') select scope_identity() id ");
                                    DataTable updateprofile = dbhelper.getdata("update app_profile set app_id=" + dt.Rows[0]["id"].ToString() + " where id=" + Session["profile_id"].ToString() + "");
                                    DirectoryInfo nw = Directory.CreateDirectory(Server.MapPath("~/document/app_id_" + dt.Rows[0]["id"].ToString() + "/"));
                                    FileUpload1.SaveAs(Server.MapPath("~/document/app_id_" + dt.Rows[0]["id"].ToString() + "/" + txt_fname.Text.Replace(" ", "") + "_" + txt_lname.Text.Replace(" ", "") + Path.GetExtension(FileUpload1.PostedFile.FileName)));
                                    for (int i = 0; i <= 5; i++)
                                    {
                                        DataTable educhistory = new DataTable();
                                        switch (i)
                                        {
                                            case 1:
                                                educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'Elementary','" + txt_elemschool.Text + "','" + ddl_elemmonth.Text + "-" + ddl_elemyear.Text + "','" + txt_elemaddress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
                                                break;
                                            case 2:
                                                educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'Secondary','" + txt_secondschool.Text + "','" + ddl_secondmonth.Text + "-" + ddl_secondyear.Text + "','" + txt_secondaddress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
                                                break;
                                            case 3:
                                                educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'College','" + txt_collegeschool.Text + "','" + ddl_collegemonth.Text + "-" + ddl_collegeyear.Text + "','" + txt_collegeaddress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
                                                break;
                                            case 4:
                                                educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'Vocational','" + txt_vocationalschool.Text + "','" + ddl_vocationalmonth.Text + "-" + ddl_vocationalyear.Text + "','" + txt_vocationaladdress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
                                                break;
                                     
                                        }
                                    }
                                    DataTable grid = (DataTable)ViewState["governmentlicenses"];
                                    DataTable table = ViewState["Item_List"] as DataTable;
                                    double rowcount = 0;
                                    stateclass a = new stateclass();
                                    for (int ii = 0; ii <= grid_employmenthistory.Rows.Count-1; ii++)
                                    {
                                        TextBox txt1 = (TextBox)grid_employmenthistory.Rows[ii].Cells[1].FindControl("txt_employmenthistory_position");
                                        Label lbl1 = (Label)grid_employmenthistory.Rows[ii].Cells[1].FindControl("lbl_2ndemploymenthistory_position");

                                        TextBox txt2 = (TextBox)grid_employmenthistory.Rows[ii].Cells[2].FindControl("txt_employmenthistory_c_name_address");
                                        Label lbl2 = (Label)grid_employmenthistory.Rows[ii].Cells[2].FindControl("lbl_2ndemploymenthistory_c_name_address");

                                        TextBox txtf3 = (TextBox)grid_employmenthistory.Rows[ii].Cells[3].FindControl("txt_from");
                                        TextBox txtt3 = (TextBox)grid_employmenthistory.Rows[ii].Cells[3].FindControl("txt_to");
                                        Label lbl3 = (Label)grid_employmenthistory.Rows[ii].Cells[3].FindControl("lbl_2ndemploymenthistory_fromto");
                                        string sss1 = "";
                                        string sss2 = "";
                                        string sss3 = "";
                                        if (ii == grid_employmenthistory.Rows.Count-1)
                                        {
                                            sss1 = txt1.Text;
                                            sss2 = txt2.Text;
                                            sss3 = txtf3.Text + "-" + txtt3.Text;
                                        }
                                        else
                                        {
                                            sss1 = lbl1.Text;
                                            sss2 = lbl2.Text;
                                            sss3 = lbl3.Text;
                                        }
                                        if (sss1.Trim().Length > 0)
                                        {
                                            DataTable emp_history = dbhelper.getdata("insert into EmploymentHistory(app_id,company,position,fromto,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'" + sss1 + "','" + sss2 + "','" + sss3 + "'," + Request.QueryString["app_id"].ToString() + ")");
                                        }

                                    }
                                    for (int i = 0; i <= grid_item.Rows.Count-1; i++)
                                    {
                                        TextBox txt = (TextBox)grid_item.Rows[i].Cells[1].FindControl("txt_description");
                                        Label lbl = (Label)grid_item.Rows[i].Cells[1].FindControl("lbl_descripton_desp");
                                        string ss = "";
                                        if (i == grid_item.Rows.Count-1)
                                        {
                                            ss = txt.Text;
                                        }
                                        else
                                        {
                                            ss = lbl.Text;
                                        }
                                        if (ss.Trim().Length > 0)
                                        {
                                            a.a = dt.Rows[0]["id"].ToString();
                                            a.b = ss;
                                            bol.skills(a);
                                        }

                                    }
                                   
                                    Session.RemoveAll();
                                    Response.Redirect("evalform?app_id=" + butyok.Encrypt(dt.Rows[0]["id"].ToString(), true) + "");
                                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully'); window.location='recruitment'", true);

                                }
                                else
                                {
                                    Response.Write("<script>alert('Resume File is incorrect!')</script>");
                                }
            }
        }
        ////if (Regex.IsMatch(txt_email.Text, "^([0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$"))
        ////{
        ////    Response.Write("<script>alert('test')</script>");
        ////}
        ////else
        ////{
        ////   Response.Write("<script>alert('error')</script>");
        ////}
       //if (profile == "1")
       // {
       //     if (checkfeilds())
       //     {
       //         if (Session["profile_id"].ToString() != "profile_id")
       //         {
       //             string type = string.Empty;
       //             if (FileUpload1.HasFile)
       //             {
       //                 if (Path.GetExtension(FileUpload1.PostedFile.FileName) == ".doc" || Path.GetExtension(FileUpload1.PostedFile.FileName) == ".docx" || Path.GetExtension(FileUpload1.PostedFile.FileName) == ".pdf")
       //                 {
       //                     Button1.Enabled = false;


       //                     string country = ddl_country.Text == "Country" ? "None" : ddl_country.Text;
       //                     string city = ddl_country.Text == "Philippines" ? drop_city.Text : ddl_city.Text;
       //                     string region = ddl_country.Text == "Philippines" ? drop_region.Text : ddl_region.Text;
       //                     string province = ddl_country.Text == "Philippines" ? drop_province.Text : ddl_province.Text;
       //                     string baranggay = txt_baranggay.Text.Length == 0 ? "None" : txt_baranggay.Text;


       //                     string countrypro = ddl_pro_country.Text == "Country" ? "None" : ddl_pro_country.Text;
       //                     string citypro = ddl_pro_country.Text == "Philippines" ? drop_pro_city.Text : ddl_pro_city.Text;
       //                     string regionpro = ddl_pro_country.Text == "Philippines" ? drop_pro_region.Text : ddl_pro_region.Text;
       //                     string provincepro = ddl_pro_country.Text == "Philippines" ? drop_pro_province.Text : ddl_pro_province.Text;
       //                     string baranggaypro = txt_pro_baranggay.Text.Length == 0 ? "None" : txt_pro_baranggay.Text;

       //                     string present = country + "|" + city + "|" + region + "|" + province + "|" + baranggay;
       //                     string prov = countrypro + "|" + citypro + "|" + regionpro + "|" + provincepro + "|" + baranggaypro;

       //                     DataTable dt = dbhelper.getdata("insert into applicant(date_app,name,pos_desire,present_add,provencial_add,tel_no,cell_no,email,dateofbirth,job_id,resume_file,status,captcha)values(getdate(),'" + txt_fname.Text + ',' + txt_mname.Text + ',' + txt_lname.Text + "','" + drop_type.Text + "','" + present + "','" + prov + "','" + txt_tel.Text + "','" + txt_cel.Text + "','" + txt_email.Text + "','" + ddl_month.Text + '/' + ddl_day.Text + '/' + ddl_year.Text + "'," + Request.QueryString["app_id"].ToString() + ",'" + txt_fname.Text.Replace(" ", "") + "_" + txt_lname.Text.Replace(" ", "") + Path.GetExtension(FileUpload1.PostedFile.FileName) + "','For appointment','" + txtCaptcha.Text + "') select scope_identity() id ");
       //                     DataTable updateprofile = dbhelper.getdata("update app_profile set app_id=" + dt.Rows[0]["id"].ToString() + " where id=" + Session["profile_id"].ToString() + "");
       //                     DirectoryInfo nw = Directory.CreateDirectory(Server.MapPath("~/document/app_id_" + dt.Rows[0]["id"].ToString() + "/"));
       //                     FileUpload1.SaveAs(Server.MapPath("~/document/app_id_" + dt.Rows[0]["id"].ToString() + "/" + txt_fname.Text.Replace(" ", "") + "_" + txt_lname.Text.Replace(" ", "") + Path.GetExtension(FileUpload1.PostedFile.FileName)));
       //                     for (int i = 0; i <= 5; i++)
       //                     {
       //                         DataTable educhistory = new DataTable();
       //                         switch (i)
       //                         {
       //                             case 1:
       //                                 educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'Elementary','" + txt_elemschool.Text + "','" + ddl_elemmonth.Text + "-" + ddl_elemyear.Text + "','" + txt_elemaddress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
       //                                 break;
       //                             case 2:
       //                                 educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'Secondary','" + txt_secondschool.Text + "','" + ddl_secondmonth.Text + "-" + ddl_secondyear.Text + "','" + txt_secondaddress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
       //                                 break;
       //                             case 3:
       //                                 educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'College','" + txt_collegeschool.Text + "','" + ddl_collegemonth.Text + "-" + ddl_collegeyear.Text + "','" + txt_collegeaddress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
       //                                 break;
       //                             case 4:
       //                                 educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'Vocational','" + txt_vocationalschool.Text + "','" + ddl_vocationalmonth.Text + "-" + ddl_vocationalyear.Text + "','" + txt_vocationaladdress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
       //                                 break;
       //                             case 5:
       //                                 educhistory = dbhelper.getdata("insert into Education(app_id,level,school,year,address,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'Specials Skills','" + txt_specialschool.Text + "','" + txt_specialyear.Text + "','" + txt_specialaddress.Text + "'," + Request.QueryString["app_id"].ToString() + ")");
       //                                 break;
       //                         }
       //                     }
       //                     DataTable grid = (DataTable)ViewState["governmentlicenses"];
       //                     DataTable table = ViewState["Item_List"] as DataTable;
       //                     double rowcount = 0;
       //                     stateclass a = new stateclass();
       //                     for (int ii = 0; ii <= grid_employmenthistory.Rows.Count - 1; ii++)
       //                     {
       //                         TextBox txt1 = (TextBox)grid_item.Rows[ii].Cells[1].FindControl("txt_employmenthistory_position");
       //                         Label lbl1 = (Label)grid_item.Rows[ii].Cells[1].FindControl("lbl_2ndemploymenthistory_position");

       //                         TextBox txt2 = (TextBox)grid_item.Rows[ii].Cells[2].FindControl("txt_employmenthistory_c_name_address");
       //                         Label lbl2 = (Label)grid_item.Rows[ii].Cells[2].FindControl("lbl_2ndemploymenthistory_c_name_address");

       //                         TextBox txtf3 = (TextBox)grid_item.Rows[ii].Cells[3].FindControl("txt_from");
       //                         TextBox txtt3 = (TextBox)grid_item.Rows[ii].Cells[3].FindControl("txt_to");
       //                         Label lbl3 = (Label)grid_item.Rows[ii].Cells[3].FindControl("lbl_2ndemploymenthistory_fromto");
       //                         string sss1 = "";
       //                         string sss2 = "";
       //                         string sss3 = "";
       //                         if (ii == grid_employmenthistory.Rows.Count - 1)
       //                         {
       //                             sss1 = txt1.Text;
       //                             sss2 = txt2.Text;
       //                             sss3 = txtf3.Text + "-" + txtt3.Text;
       //                         }
       //                         else
       //                         {
       //                             sss1 = lbl1.Text;
       //                             sss2 = lbl2.Text;
       //                             sss3 = lbl3.Text;
       //                         }
       //                         if (sss1.Trim().Length > 0)
       //                         {
       //                             DataTable emp_history = dbhelper.getdata("insert into EmploymentHistory(app_id,company,position,fromto,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'" + sss1 + "','" + sss2 + "','" + sss3 + "'," + Request.QueryString["app_id"].ToString() + ")");
       //                         }

       //                     }
       //                     //foreach (DataRow dr in grid.Rows)
       //                     //{
       //                     //    if (dr[1].ToString() != "")
       //                     //    {
       //                     //        DataTable emp_history = dbhelper.getdata("insert into EmploymentHistory(app_id,company,position,fromto,job_id)values(" + dt.Rows[0]["id"].ToString() + ",'" + dr[1] + "','" + dr[2] + "','" + dr[3] + "'," + Request.QueryString["app_id"].ToString() + ")");
       //                     //    }
       //                     //}
       //                     for (int i = 0; i <= grid_item.Rows.Count - 1; i++)
       //                     {
       //                         TextBox txt = (TextBox)grid_item.Rows[i].Cells[1].FindControl("txt_description");
       //                         Label lbl = (Label)grid_item.Rows[i].Cells[1].FindControl("lbl_descripton_desp");
       //                         string ss = "";
       //                         if (i == grid_item.Rows.Count - 1)
       //                         {
       //                             ss = txt.Text;
       //                         }
       //                         else
       //                         {
       //                             ss = lbl.Text;
       //                         }
       //                         if (ss.Trim().Length > 0)
       //                         {
       //                             a.a = dt.Rows[0]["id"].ToString();
       //                             a.b = ss;
       //                             bol.skills(a);
       //                         }

       //                     }
       //                     //foreach (DataRow row in table.Rows)
       //                     //{
       //                     //    if (table.Rows.Count - 1 != rowcount)
       //                     //    {
       //                     //        a.a = dt.Rows[0]["id"].ToString();
       //                     //        a.b = row.ItemArray[1] as string;
       //                     //        bol.skills(a);
       //                     //    }
       //                     //    rowcount++;
       //                     //}
       //                     Session.RemoveAll();
       //                     Response.Redirect("evalform?app_id=" + butyok.Encrypt(dt.Rows[0]["id"].ToString(), true) + "");
       //                     //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully'); window.location='recruitment'", true);

       //                 }
       //                 else
       //                 {
       //                     Response.Write("<script>alert('Resume File is incorrect!')</script>");
       //                 }
       //             }
       //         }
       //     }
       // }
       // else
       // {
       //     Response.Write("<script>alert('Pls. Select Profile First!')</script>");
       // }
        
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
    protected void FillCapctha()
    {
        try
        {
            Random random = new Random();
            string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            StringBuilder captcha = new StringBuilder();
            for (int i = 0; i < 6; i++)
                captcha.Append(combination[random.Next(combination.Length)]);
            Session["captcha"] = captcha.ToString();
            imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
        }
        catch
        {
            throw;
        }

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
        panelPopUpPanel.Style.Add("top", "20%");
        //panelPopUpPanel.Style.Add("width", "auto");
        //panelPopUpPanel.Style.Add("left", "30%");
        ppop(true);
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
        ImageButton1.Attributes.Add("src", "UploadImages/prof_id_" + Session["profile_id"].ToString() + "/" + Session["profile_id"].ToString() +".png");
        profile = "1";
        ppop(false);
    }

    protected void add_close(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("formapp?app_id=" + Request.QueryString["app_id"].ToString() + "", false);
    }
    protected void ppop(bool oi)
    {
        panelOverlay.Visible = oi;
        panelPopUpPanel.Visible = oi;
    }
}