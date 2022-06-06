using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for message
/// </summary>
public class message
{
	public message()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string applicant(DataTable dt, DataTable attainment, DataTable history, string special, string address,string weblocation)
    {
        string eh = null;
        if (dt.Rows.Count > 0)
            eh = history.Rows[0]["company"].ToString().Length == 0 ? "-" : history.Rows[0]["position"].ToString();
        else
            eh = "-";

        string msg = "<b>Personal Background</b> " +
        "<table> " +
        "    <tr> " +
        "        <td>Applicant Code</td> " +
        "        <td>: </td> " +
        "        <td>" + butyok.Encrypt(dt.Rows[0]["id"].ToString(), true) + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Name</td> " +
        "        <td>: </td> " +
        "        <td>" + dt.Rows[0]["Name"].ToString() + "</td> " +
        "    </tr> " +
        "        <tr> " +
        "        <td>Gender</td> " +
        "        <td>: </td>  " +
        "        <td>" + dt.Rows[0]["gender"].ToString() + "</td>  " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Birthday</td> " +
        "        <td>:</td>  " +
        "        <td>" + dt.Rows[0]["dateofbirth"].ToString() + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Address</td> " +
        "       <td>: </td> " +
        "        <td>" + address + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Cellular Number</td> " +
        "        <td>: </td> " +
        "        <td>" + dt.Rows[0]["cell_no"].ToString() + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>E-mail</td> " +
        "        <td>:</td> " +
        "        <td>" + dt.Rows[0]["email"].ToString() + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Educational Attainment</td> " +
        "        <td>: </td> " +
        "        <td>" + (attainment.Rows.Count == 0 ? "-" : attainment.Rows[0]["level"].ToString()) + "</td> " +
        "    </tr> " +
        "    <tr> " +
        "        <td>Degree</td> " +
        "        <td>: </td> " +
        "        <td>" + (attainment.Rows.Count == 0 ? "-" : attainment.Rows[0]["school"].ToString()) + "</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td>Latest Employment</td> " +
        "        <td>: </td> " +
        "        <td>" + eh + "</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td>Special Skills</td> " +
        "        <td>: </td> " +
        "        <td>" + special + "</td> " +
        "    </tr>  " +
        "    <tr> " +
        "        <td>Link</td> " +
        "        <td>: </td> " +
        "        <td>" + weblocation + "</td> " +
        "    </tr>  " +
        "</table>";
        //msg += "\nName:" + dt.Rows[0]["Name"].ToString() + "\n";
        //msg += "\nEmail:" + dt.Rows[0]["email"].ToString() + "\n";
        //msg += "\nContact:" + dt.Rows[0]["contact"].ToString() + "\n";
        //msg += "\nBirthday:" + dt.Rows[0]["birthday"].ToString() + "\n";
        //msg += "\nCountry:" + dt.Rows[0]["country"].ToString() + "\n";
        //msg += "\nDate CheckOut:" + dt.Rows[0]["date_checkOut"].ToString() + " " + dt.Rows[0]["Hour_checkOut"].ToString() + " " + dt.Rows[0]["AmPM"].ToString() + "\n\n";

        return msg;
    }

    public static string newso(DataTable dt, string app_id)
    {
        //string date = dt.Rows[0]["date_checkOut"].ToString();
        //date = date.Substring(0, date.IndexOf(" "));
        string msg = "Good Day!\n\n";
        msg += "\n\n";
        msg += "This is from Cebu LandMasters HRD. \n\n";
        msg += "You are schedule for " + dt.Rows[0]["status"].ToString() + "\n\n";
        msg += "Date:" + String.Format("{0:MM/dd/yyyy}", dt.Rows[0]["spe_date"].ToString()) + "\n\n";
        msg += "Time:" + dt.Rows[0]["spe_time"].ToString() + " " + dt.Rows[0]["spe_period"].ToString() + "\n\n";
        msg += dt.Rows[0]["msg"].ToString() + "\n\n";
        //msg += "\nName:" + dt.Rows[0]["Name"].ToString() + "\n";
        //msg += "\nEmail:" + dt.Rows[0]["email"].ToString() + "\n";
        //msg += "\nContact:" + dt.Rows[0]["contact"].ToString() + "\n";
        //msg += "\nBirthday:" + dt.Rows[0]["birthday"].ToString() + "\n";
        //msg += "\nCountry:" + dt.Rows[0]["country"].ToString() + "\n";
        //msg += "\nDate CheckOut:" + dt.Rows[0]["date_checkOut"].ToString() + " " + dt.Rows[0]["Hour_checkOut"].ToString() + " " + dt.Rows[0]["AmPM"].ToString() + "\n\n";

        return msg;
    }


    public static string forapprove(DataTable dt, string x)
    {

        string msg = "Company Intro\n\n";

        msg += "Subject: " + dt.Rows[0]["job_subject"].ToString() + "\n\n";
        msg += "Job Details: " + dt.Rows[0]["job_details"].ToString() + "\n\n";


        msg += "\n\n http://IPAdress/Approval?app_id=" + x;

        return msg;
    }
}