using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class content_HR_report_Default : System.Web.UI.Page
{

    public static string gender, property, month, position, Flotposition,source, region,fregion;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load();
            access();
        }
    }
    protected void load()
    {
        //Select Date Today.
        DataTable dtdate = dbhelper.getdata("SELECT YEAR(GETDATE())todate");
        ddl_year.Text = dtdate.Rows[0]["todate"].ToString();

        //Insert Current Year
        DataTable dtyearnow = dbhelper.getdata("select * from MYear where [Year] like " + dtdate.Rows[0]["todate"] + "");
        if (dtyearnow.Rows.Count == 0)
        {
            dbhelper.getdata("insert into MYear values ('" + dtdate.Rows[0]["todate"] + "')");
        }

        //Select Display Year
        DataTable dt = dbhelper.getdata("select * from MYear order by [Year] desc");
        ddl_year.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            ddl_year.Items.Add(new ListItem(dr["Year"].ToString(), dr["id"].ToString()));
        }
    }

    protected void peryear(object sender, EventArgs e)
    {
        access();
    }

    protected void access()
    {
        DataTable dt, sortedDT;
        DataView dv;
        DataSet ds;
        string y = ddl_year.Text == "0" ? "" : " and YEAR(date_app)=" + ddl_year.SelectedItem.ToString();
        dt = dbhelper.getdata("WITH R(N) AS (SELECT 0 UNION ALL SELECT N+1 FROM R WHERE N < 11) " +
        "SELECT DATENAME(MONTH,DATEADD(MONTH,-N,GETDATE())) AS [month] ,month(DATEADD(MONTH,-N,GETDATE()))," +
        "(select COUNT(*) from Applicant where status <> 'cancel' and MONTH(date_app) = month(DATEADD(MONTH,-N,GETDATE())) " + y + ") cnt " +
        "FROM R order by month(DATEADD(MONTH,-N,GETDATE()))");

        gv_respondent.DataSource = dt;
        gv_respondent.DataBind();

        month = "";
        foreach (DataRow row in dt.Rows)
        {
            month += " { y: '" + row["month"] + "', a: " + row["cnt"] + " }, ";
        }

        dt = dbhelper.getdata("select " +
        "convert(varchar,a.job_subject) position, COUNT(*) cnt " +
        "from Jobs a " +
        "left join Applicant b on a.id=b.job_id " +
        "where a.status <> 'deleted' " +
        "and b.id is not null " +
        "and b.status <> 'cancel' " + y + " " +
        "group by convert(varchar,a.job_subject)" +
        "order by convert(varchar,a.job_subject)");
        gv_position.DataSource = dt;
        gv_position.DataBind();

        int i = 0;
        position = Flotposition = "";
        dv = dt.DefaultView;
        dv.Sort = "cnt desc";
        sortedDT = dv.ToTable();
        string[] pcolor = ColorCode.collection();

        foreach (DataRow row in sortedDT.Rows)
        {
            if (i > 4)
                break;

            //Morris
            position += " { label: '" + row["position"] + "', value: " + row["cnt"] + " }, ";

            //Flot
            Flotposition += " { label: '" + row["position"] + "', data: " + row["cnt"] + ", color: '" + pcolor[i] + "'}, ";
            i++;
        }

        dt = dbhelper.getdata("select source , COUNT(*) cnt " +
        "from eval_source a " +
        "left join applicant b on a.app_id=b.id " +
        "where status <> 'cancel' " + y + "" +
        "group by source");
        Response.Write(dt);
        source = "";
        foreach (DataRow row in dt.Rows)
        {
            source += " { label: '" + row["source"] + "', value: " + row["cnt"] + " }, ";
        }

        dt = dbhelper.getdata("select c.description, COUNT(*) cnt " +
        "from Jobs a " +
        "left join Applicant b on a.id=b.job_id " +
        "left join location c on a.loc_id=c.id " +
        "where a.status <> 'deleted' " +
        "and b.id is not null " +
        "and b.status <> 'cancel' " + y + " " +
        "group by description " +
        "order by description");
        gv_property.DataSource = dt;
        gv_property.DataBind();

        property = "";
        foreach (DataRow row in dt.Rows)
        {
            property += "{label: '" + row["description"] + "', value: " + row["cnt"] + " },";
        }

        //ds = bol.displayData("select SUBSTRING(REPLACE(CAST( present_add as varchar(8000)),'Philippines|',''),0,CHARINDEX('|',REPLACE(CAST( present_add as varchar(8000)),'Philippines|',''))) description,COUNT(*) cnt " +
        //"from Applicant where status <> 'cancel' " + y + " " +
        //"and len(SUBSTRING(REPLACE(CAST( present_add as varchar(8000)),'Philippines|',''),0,CHARINDEX('|',REPLACE(CAST( present_add as varchar(8000)),'Philippines|','')))) > 3 " +
        //"group  by SUBSTRING(REPLACE(CAST( present_add as varchar(8000)),'Philippines|',''),0,CHARINDEX('|',REPLACE(CAST( present_add as varchar(8000)),'Philippines|','')))");

        ds = bol.displayData("select case when id < 653 then " +
        "left(SUBSTRING(CAST(present_add as varchar(MAX)),CHARINDEX('|', CAST(present_add as varchar(MAX)), CHARINDEX('|', CAST(present_add as varchar(MAX))) + 1 ) + 1,100),  " +
        "CHARINDEX('|',SUBSTRING(CAST(present_add as varchar(MAX)),CHARINDEX('|', CAST(present_add as varchar(MAX)), CHARINDEX('|', CAST(present_add as varchar(MAX))) + 1 ) + 1,100)) -1) " +
        "else SUBSTRING(replace(CAST(present_add as varchar(MAX)),'Philippines|', ''),0,CHARINDEX('|',replace(CAST(present_add as varchar(MAX)),'Philippines|', ''))) " +
        "end description,COUNT(*) cnt  " +
        "from Applicant " +
        "where CAST(present_add as varchar(MAX)) like '%Philippines%' " + y + " " +
        "group by  " +
        "case when id < 653 then " +
        "left(SUBSTRING(CAST(present_add as varchar(MAX)),CHARINDEX('|', CAST(present_add as varchar(MAX)), CHARINDEX('|', CAST(present_add as varchar(MAX))) + 1 ) + 1,100),  " +
        "CHARINDEX('|',SUBSTRING(CAST(present_add as varchar(MAX)),CHARINDEX('|', CAST(present_add as varchar(MAX)), CHARINDEX('|', CAST(present_add as varchar(MAX))) + 1 ) + 1,100)) -1) " +
        "else SUBSTRING(replace(CAST(present_add as varchar(MAX)),'Philippines|', ''),0,CHARINDEX('|',replace(CAST(present_add as varchar(MAX)),'Philippines|', ''))) end");

        dt = ds.Tables["table"];


        gv_location.DataSource = dt;
        gv_location.DataBind();

        i = 0;
        region = fregion = "";
        dv = dt.DefaultView;
        dv.Sort = "cnt desc";
        sortedDT = dv.ToTable();
        string[] rcolor = ColorCode.collection();
        foreach (DataRow row in sortedDT.Rows)
        {
            if (i > 4)
                break;

            region += "{label: '" + row["description"] + "', value: " + row["cnt"] + " },";

            //Flot
            fregion += " { label: '" + row["description"] + "', data: " + row["cnt"] + ", color: '" + rcolor[i] + "'}, ";
            i++;
        }

        ds = bol.displayData("select gender description, COUNT(*) cnt from Applicant where status <> 'cancel' and gender is not null " + y + "  group by gender");
        gv_gender.DataSource = ds.Tables["table"];
        gv_gender.DataBind();

        gender = "";
        dt = dbhelper.getdata("select gender description, COUNT(*) cnt from Applicant where status <> 'cancel' and gender is not null " + y + "  group by gender");
        foreach (DataRow row in dt.Rows)
        {
            gender += "{label: '" + row["description"] + "', value: " + row["cnt"] + " },";
        }

        string query = "select case when a.status is null then 'pending' else case when a.status='1' then 'approved' else a.status end end [status],count(*) cnt " +
        "from Jobs a left join JobType b on a.jobtype_id=b.jobtype_id " +
        "left join location c on a.loc_id=c.id " +
        "where (a.[status] is null or a.[status] <> 'deleted') and b.status is null " +
        "group by case when a.status is null then 'pending' else case when a.status='1' then 'approved' else a.status end end";
        dt = dbhelper.getdata(query);

        dt = dbhelper.getdata("select COUNT(*) cnt from Jobs where date_cancelled is NULL");
        l_open.Text = dt.Rows[0]["cnt"].ToString().Length > 0 ? dt.Rows[0]["cnt"].ToString() : "0";

        dt = dbhelper.getdata("select count(*) cnt from Jobs where date_cancelled is NULL and status like '%closed%'");
        //l_close.Text = dt.Rows.Count == 1 ? "0" : dt.Rows[1]["cnt"].ToString();
        l_close.Text = dt.Rows[0]["cnt"].ToString();

        dt = dbhelper.getdata("select count(*) cnt from applicant where [status]<>'Hired' and [status]<>'Transferred' and [status]<>'reject' and [status]<>'cancel'");
        l_total.Text = dt.Rows[0]["cnt"].ToString();

        dt = dbhelper.getdata("select COUNT(*) cnt from applicant where [status]<>'Hired' and [status]<>'Transferred' and [status]<>'reject' and [status]<>'cancel' and left(CONVERT(varchar,date_app,101),10) = left(CONVERT(varchar,GETDATE(),101),10)");
        l_today.Text = dt.Rows[0]["cnt"].ToString();
    }
}