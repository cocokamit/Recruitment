using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for bol
/// </summary>
public class bol
{
	public bol()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static int blog(stateclass a)
    {
        return dal.blog(a);
    }

    public static int email(stateclass a)
    {
        return dal.email(a);
    }

    public static string authentication(stateclass sc)
    {
        return dal.authentication(sc);
    }

    public static DataSet displayData(string a)
    {
        return dbhelper.despData(a, "table");
    }

    public static int JobType(stateclass a)
    {
        return dal.JobType(a);
    }

    public static string jobs(stateclass a)
    {
        return dal.Jobs(a);
    }

    public static int Examinition(stateclass a)
    {
        return dal.Examinition(a);
    }

    public static int Question(stateclass a)
    {
        return dal.Question(a);
    }

    public static string Choices(stateclass a)
    {
        return dal.Choices(a);
    }

    public static int skills(stateclass a)
    {
        return dal.skills(a);
    }
    public static int location(stateclass a)
    {
        return dal.location(a);
    }

    public static int location2(stateclass a)
    {
        return dal.location2(a);
    }
    public static int account(stateclass a)
    {
        return dal.account(a);
    }

    public static int source(stateclass a)
    {
        return dal.source(a);
    }

    public static int evaluation(stateclass a)
    {
        return dal.evaluation(a);
    }
}