using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for getdata
/// </summary>
public class getdata
{
    public static string jobCollection()
    {
        return "select a.id,a.job_subject,a.job_details,a.[date],a.qualification, " +
        "case when a.status is null then 'pending' else case when a.status='1' then 'approved' else a.status end end as status, " +
        "b.job_type, " +
        "c.id as loc_id,c.description " +
        "from Jobs a " +
        "left join JobType b on a.jobtype_id=b.jobtype_id " +
        "left join location c on a.loc_id=c.id ";
    }

    public static DataTable job(string id)
    {
        return dbhelper.getdata(jobCollection() + " where a.id=" + id); 
    }

    public static DataTable position(string property)
    {
      property = property == "0" ? "" : "and c.id=" + property;
      string query = jobCollection() + "where (a.[status] is null or a.[status] <> 'deleted') and b.status is null " + property + "  order by convert(varchar,a.job_subject)";
      return dbhelper.getdata(query);
    }

    public static DataTable positionSearch(string key)
    {
        string query = jobCollection() + "where (a.[status] is null or a.[status] <> 'deleted') and b.status is null and a.job_subject like '%" + key + "%' order by convert(varchar,a.job_subject)";
        return dbhelper.getdata(query);
    }

    public static DataTable positionCategories(string property, string id)
    {
        string category = id == "0" ? "" : "and a.jobtype_id=" + id ;
        string query = jobCollection() + "where a.status='1' and c.id=" + property + " " + category + "  order by convert(varchar,a.job_subject)";
        return dbhelper.getdata(query);
    }


    public string blog;
    public getdata()
    {
        blog = "select DATENAME(MM, date_created) + RIGHT(CONVERT(VARCHAR(12), date_created, 107), 9) entry_date, * from blog_details ";
    }

    public static string post()
    {
        return "select DATENAME(MM, date_created) + RIGHT(CONVERT(VARCHAR(12), date_created, 107), 9) entry_date, * from blog_details ";
    }

    public static DataTable post(int status)
    {
        getdata fetch = new getdata();
        return dbhelper.getdata(fetch.blog + "where [status]=" + status + " order by date_created desc");
    }

    public static DataTable post(string post)
    {
        getdata fetch = new getdata();
        return dbhelper.getdata(fetch.blog + "where [status]=1 and [subject]='" + post.Replace("-", " ") + "'");
    }

    public static DataTable post(string post, string category)
    {
        getdata fetch = new getdata();
        return dbhelper.getdata(fetch.blog + "where [status]=1 and [subject]='" + post.Replace("-", " ") + "' and category='" + category.Replace("-", "") + "'");
    }

    public static DataTable blog_category(string category)
    {
        getdata fetch = new getdata();
        string x = fetch.blog + "where [status]=1 and category='" + category.Replace("-", " ") + "'";

        return dbhelper.getdata(fetch.blog + "where [status]=1 and category='" + category.Replace("-", " ") + "'");
    }

    public static DataTable post_collection()
    {
        getdata fetch = new getdata();
        return dbhelper.getdata(fetch.blog + "where [status] <> 2 order by date_created desc");
    }


    public static DataTable fitchdata2(string x)
    {
        string query = "select a.id,a.jobtype_id,a.job_subject,a.job_details,a.[date], " +
                       "b.job_type,c.[description] " +
                       "from Jobs a " +
                       "left join JobType b on a.jobtype_id=b.jobtype_id " +
                       "left join location c on a.loc_id=c.id " +
                       "where a.id="+x+"";
        DataTable dt = new DataTable();
        dt = dbhelper.getdata(query);
        return dt;
    }

    //public static DataTable fitchdata2(string app_id)
    //{
    //    string query = "select a.id,a.Name,a.email, " +
    //                    "b.message,b.date_sent,b.customer_id " +
    //                    "from Customer_Info a " +
    //                    "left join reply b on a.id=b.customer_id " +
    //                    "where a.id=" + app_id;
    //    DataTable dt = new DataTable();
    //    dt = dbhelper.getdata(query);
    //    return dt;
    //}
}