using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for nobel
/// </summary>
public class nobel
{
	public nobel()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static DataTable designation()
    {
        DataTable dt = dbhelper.getdata("select job_type,jobtype_id from JobType where status is null");
        return dt;
    }
}