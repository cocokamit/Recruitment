using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for dal
/// </summary>
public class dal
{
	public dal()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static int blog(stateclass sc)
    {
        string proc = "_blog";
        SqlParameter[] p = new SqlParameter[5];

        p[0] = new SqlParameter("@subject", SqlDbType.VarChar, 1000);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.sa;

        p[1] = new SqlParameter("@description", SqlDbType.VarChar, 50000000);
        p[1].Direction = ParameterDirection.Input;
        p[1].Value = sc.sb;

        p[2] = new SqlParameter("@featured", SqlDbType.VarChar, 50000000);
        p[2].Direction = ParameterDirection.Input;
        p[2].Value = sc.a;

        p[3] = new SqlParameter("@category", SqlDbType.VarChar, 50);
        p[3].Direction = ParameterDirection.Input;
        p[3].Value = sc.b;

        p[4] = new SqlParameter("@out", SqlDbType.Int);
        p[4].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc_int(proc, p);
    }

    public static int email(stateclass sc)
    {
        string proc = "_email";
        SqlParameter[] p = new SqlParameter[6];

        p[0] = new SqlParameter("@id", SqlDbType.Int);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.a;

        p[1] = new SqlParameter("@action", SqlDbType.VarChar, 100);
        p[1].Direction = ParameterDirection.Input;
        p[1].Value = sc.b;

        p[2] = new SqlParameter("@title", SqlDbType.VarChar, 1000);
        p[2].Direction = ParameterDirection.Input;
        p[2].Value = sc.c;

        p[3] = new SqlParameter("@content", SqlDbType.VarChar, 10000);
        p[3].Direction = ParameterDirection.Input;
        p[3].Value = sc.d;

        p[4] = new SqlParameter("@attach", SqlDbType.Int);
        p[4].Direction = ParameterDirection.Input;
        p[4].Value = sc.e;

        p[5] = new SqlParameter("@out", SqlDbType.Int);
        p[5].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc_int(proc, p);
    }


    public static string authentication(stateclass sc)
    {
        string proc = "authentication";
        SqlParameter[] p = new SqlParameter[3];

        p[0] = new SqlParameter("@user", SqlDbType.VarChar, 50);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.sa;

        p[1] = new SqlParameter("@pass", SqlDbType.VarChar, 50);
        p[1].Direction = ParameterDirection.Input;
        p[1].Value = sc.sb;

        p[2] = new SqlParameter("@out", SqlDbType.VarChar, 100);
        p[2].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc(proc, p);
    }


    public static int JobType(stateclass sc)
    {
        string proc = "_jobtype";
        SqlParameter[] p = new SqlParameter[2];

        p[0] = new SqlParameter("@jobtype", SqlDbType.VarChar, 100);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.sa;

        p[1] = new SqlParameter("@out", SqlDbType.Int);
        p[1].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc_int(proc, p);
    }

    public static string Jobs(stateclass sc)
    {
        string proc = "_jobs";
        SqlParameter[] p = new SqlParameter[7];

        p[0] = new SqlParameter("@jobtype_id", SqlDbType.Int);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.a;

        p[1] = new SqlParameter("@job_subject", SqlDbType.Text);
        p[1].Direction = ParameterDirection.Input;
        p[1].Value = sc.b;

        p[2] = new SqlParameter("@job_details", SqlDbType.Text);
        p[2].Direction = ParameterDirection.Input;
        p[2].Value = sc.c;

        p[3] = new SqlParameter("@loc_id", SqlDbType.Int);
        p[3].Direction = ParameterDirection.Input;
        p[3].Value = sc.aa;

        p[4] = new SqlParameter("@section", SqlDbType.VarChar, 50);
        p[4].Direction = ParameterDirection.Input;
        p[4].Value = sc.d;

        p[5] = new SqlParameter("@qualification", SqlDbType.VarChar, 5000);
        p[5].Direction = ParameterDirection.Input;
        p[5].Value = sc.e;

        p[6] = new SqlParameter("@out", SqlDbType.VarChar, 20);
        p[6].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc(proc, p);
    }


    public static int Examinition(stateclass sc)
    {
        string proc = "_examinitation";
        SqlParameter[] p = new SqlParameter[5];

        p[0] = new SqlParameter("@description", SqlDbType.Text);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.a;

        p[1] = new SqlParameter("@time_limit", SqlDbType.VarChar, 20);
        p[1].Direction = ParameterDirection.Input;
        p[1].Value = sc.b;

        p[2] = new SqlParameter("@status", SqlDbType.VarChar, 20);
        p[2].Direction = ParameterDirection.Input;
        p[2].Value = sc.c;

        p[3] = new SqlParameter("@passing", SqlDbType.Float);
        p[3].Direction = ParameterDirection.Input;
        p[3].Value = sc.d;

        p[4] = new SqlParameter("@out", SqlDbType.Int);
        p[4].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc_int(proc, p);
    }

    public static int Question(stateclass sc)
    {
        string proc = "_question";
        SqlParameter[] p = new SqlParameter[6];

        p[0] = new SqlParameter("@e_id", SqlDbType.Int);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.a;

        p[1] = new SqlParameter("@quest", SqlDbType.Text);
        p[1].Direction = ParameterDirection.Input;
        p[1].Value = sc.b;

        p[2] = new SqlParameter("@answer", SqlDbType.Int);
        p[2].Direction = ParameterDirection.Input;
        p[2].Value = sc.c;

        p[3] = new SqlParameter("@herarchy", SqlDbType.Int);
        p[3].Direction = ParameterDirection.Input;
        p[3].Value = sc.aa;

        p[4] = new SqlParameter("@status", SqlDbType.VarChar, 20);
        p[4].Direction = ParameterDirection.Input;
        p[4].Value = sc.e;

        p[5] = new SqlParameter("@out", SqlDbType.Int);
        p[5].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc_int(proc, p);
    }

    public static string Choices(stateclass sc)
    {
        string proc = "_choices";
        SqlParameter[] p = new SqlParameter[6];

        p[0] = new SqlParameter("@q_id", SqlDbType.Int);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.aa;

        p[1] = new SqlParameter("@description", SqlDbType.Text);
        p[1].Direction = ParameterDirection.Input;
        p[1].Value = sc.b;

        p[2] = new SqlParameter("@herarchy", SqlDbType.Int);
        p[2].Direction = ParameterDirection.Input;
        p[2].Value = sc.bb;

        p[3] = new SqlParameter("@status", SqlDbType.VarChar,100);
        p[3].Direction = ParameterDirection.Input;
        p[3].Value = sc.d;

        p[4] = new SqlParameter("@answer", SqlDbType.VarChar, 20);
        p[4].Direction = ParameterDirection.Input;
        p[4].Value = sc.e;

        p[5] = new SqlParameter("@out", SqlDbType.VarChar, 20);
        p[5].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc(proc, p);
    }

    public static int skills(stateclass sc)
    {
        string proc = "_skills";
        SqlParameter[] p = new SqlParameter[3];

        p[0] = new SqlParameter("@app_id", SqlDbType.Int);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.a;

        p[1] = new SqlParameter("@skills", SqlDbType.Text);
        p[1].Direction = ParameterDirection.Input;
        p[1].Value = sc.b;

        p[2] = new SqlParameter("@out", SqlDbType.Int);
        p[2].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc_int(proc, p);
    }


    public static int location(stateclass sc)
    {
        string proc = "_location";
        SqlParameter[] p = new SqlParameter[2];

        p[0] = new SqlParameter("@description", SqlDbType.VarChar, 50);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.sa;

        p[1] = new SqlParameter("@out", SqlDbType.Int);
        p[1].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc_int(proc, p);


    }

    public static int location2(stateclass sc)
    {
        string proc = "_company";
        SqlParameter[] p = new SqlParameter[2];

        p[0] = new SqlParameter("@description", SqlDbType.VarChar, 50);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.sa;

        p[1] = new SqlParameter("@out", SqlDbType.Int);
        p[1].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc_int(proc, p);


    }


    public static int account(stateclass sc)
    {
        string proc = "_account";
        SqlParameter[] p = new SqlParameter[8];

        p[0] = new SqlParameter("@ngalan", SqlDbType.VarChar, 100);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.sa;

        p[1] = new SqlParameter("@username", SqlDbType.VarChar, 50);
        p[1].Direction = ParameterDirection.Input;
        p[1].Value = sc.sb;

        p[2] = new SqlParameter("@password", SqlDbType.VarChar, 50);
        p[2].Direction = ParameterDirection.Input;
        p[2].Value = sc.c;

        p[3] = new SqlParameter("@designation", SqlDbType.VarChar, 50);
        p[3].Direction = ParameterDirection.Input;
        p[3].Value = sc.d;

        p[4] = new SqlParameter("@loc_id", SqlDbType.Int);
        p[4].Direction = ParameterDirection.Input;
        p[4].Value = sc.e;

        p[5] = new SqlParameter("@deg_id", SqlDbType.VarChar, 5000);
        p[5].Direction = ParameterDirection.Input;
        p[5].Value = sc.f;

        p[6] = new SqlParameter("@deg_text", SqlDbType.VarChar, 5000);
        p[6].Direction = ParameterDirection.Input;
        p[6].Value = sc.g;

        p[7] = new SqlParameter("@out", SqlDbType.Int);
        p[7].Direction = ParameterDirection.Output;
        return dbhelper.exec_proc_int(proc, p);

    }

    public static int source(stateclass sc)
    {
        string proc = "_source";
        SqlParameter[] p = new SqlParameter[2];

        p[0] = new SqlParameter("@description", SqlDbType.VarChar, 50);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.sa;

        p[1] = new SqlParameter("@out", SqlDbType.Int);
        p[1].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc_int(proc, p);


    }

    public static int evaluation(stateclass sc)
    {
        string proc = "_evaluation";
        SqlParameter[] p = new SqlParameter[2];

        p[0] = new SqlParameter("@quest", SqlDbType.VarChar, 1000);
        p[0].Direction = ParameterDirection.Input;
        p[0].Value = sc.sa;

        p[1] = new SqlParameter("@out", SqlDbType.Int);
        p[1].Direction = ParameterDirection.Output;

        return dbhelper.exec_proc_int(proc, p);
    }

}