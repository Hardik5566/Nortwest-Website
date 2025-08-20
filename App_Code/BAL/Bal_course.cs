using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Bal_course
/// </summary>
public class Bal_course
{
    public Bal_course()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static DataSet dis_course(string programme)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_course_sp";
        parameter param = new parameter();

        cmd.Parameters.Add(param.stringparam("@programme", programme));

        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_course_admin()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_course_admin_sp";
        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_course(string programme, string course_name, string course_code, string cricos_code, string description, string flyer, string total_week, string study_week, string weeks_holiday, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_course_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@programme", programme));
        cmd.Parameters.Add(param.stringparam("@course_name", course_name));
        cmd.Parameters.Add(param.stringparam("@course_code", course_code));
        cmd.Parameters.Add(param.stringparam("@cricos_code", cricos_code));
        cmd.Parameters.Add(param.stringparam("@description", description));
        cmd.Parameters.Add(param.stringparam("@flyer", flyer));
        cmd.Parameters.Add(param.intparam("@total_week", total_week));
        cmd.Parameters.Add(param.intparam("@study_week", study_week));
        cmd.Parameters.Add(param.intparam("@weeks_holiday", weeks_holiday));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet del_course(string course_id, string delete_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "del_course_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", course_id));
        cmd.Parameters.Add(param.intparam("@delete_by", delete_by));
        return command.ExtQueryDS(cmd);
    }

}