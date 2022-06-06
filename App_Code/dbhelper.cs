using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for dbhelper
/// </summary>
public class dbhelper
{
	public dbhelper()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string conn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
    public static string conn2= ConfigurationManager.ConnectionStrings["dbconnection2"].ConnectionString;


    public static string exec_proc(string proc, SqlParameter[] p)
    {
        SqlConnection con = new SqlConnection(conn);
        SqlCommand cmd = new SqlCommand(proc, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddRange(p);
        con.Open();
        cmd.ExecuteNonQuery();
        string ret = cmd.Parameters["@out"].Value.ToString();
        return ret;
    }

    public static int exec_proc_int(string proc, SqlParameter[] p)
    {
        SqlConnection con = new SqlConnection(conn);
        SqlCommand cmd = new SqlCommand(proc, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddRange(p);
        con.Open();
        cmd.ExecuteNonQuery();
        int ret = (int)cmd.Parameters["@out"].Value;
        con.Close();
        return ret;
    }

     public static DataTable getdata(string sql)
    {
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(conn);
        SqlCommand cmd = new SqlCommand(sql, con);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        con.Open();
        sda.SelectCommand = cmd;
        sda.Fill(dt);
        con.Close();
        return dt;
    }
     public static DataTable getdata2(string sql)
     {
         DataTable dt = new DataTable();
         SqlConnection con = new SqlConnection(conn2);
         SqlCommand cmd = new SqlCommand(sql, con);
         SqlDataAdapter sda = new SqlDataAdapter();
         cmd.CommandType = CommandType.Text;
         con.Open();
         sda.SelectCommand = cmd;
         sda.Fill(dt);
         con.Close();
         return dt;
     }
    public static int GetData(string sql, SqlParameter[] p, string retval)
    {
        SqlConnection con = new SqlConnection(conn);
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddRange(p);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        int frd = (int)cmd.Parameters[retval].Value;
        return frd;
    }

    public static DataSet despData(string query, string tb_name)
    {
        SqlConnection con = new SqlConnection(conn);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        con.Open();
        da = new SqlDataAdapter(query, con);
        da.Fill(ds, tb_name);
        con.Close();
        return ds;
    }
    public static DataTable getsp(string sp)
    {
        SqlConnection connection = new SqlConnection(conn);
        SqlCommand command = new SqlCommand(sp, connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        connection.Open();
        DataTable dt = new DataTable();
        dt.Load(command.ExecuteReader());
        //grid_edit.DataSource = dt;
        //grid_edit.DataBind();
        connection.Close();
        return dt;
    }
}