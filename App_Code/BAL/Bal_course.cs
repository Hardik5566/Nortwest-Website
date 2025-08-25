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
    public static DataSet sel_course(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_course_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet upd_course(string id, string programme, string course_name, string course_code, string cricos_code, string description, string flyer, string total_week, string study_week, string weeks_holiday, string modify_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "upd_course_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        cmd.Parameters.Add(param.stringparam("@programme", programme));
        cmd.Parameters.Add(param.stringparam("@course_name", course_name));
        cmd.Parameters.Add(param.stringparam("@course_code", course_code));
        cmd.Parameters.Add(param.stringparam("@cricos_code", cricos_code));
        cmd.Parameters.Add(param.stringparam("@description", description));
        cmd.Parameters.Add(param.stringparam("@flyer", flyer));
        cmd.Parameters.Add(param.intparam("@total_week", total_week));
        cmd.Parameters.Add(param.intparam("@study_week", study_week));
        cmd.Parameters.Add(param.intparam("@weeks_holiday", weeks_holiday));
        cmd.Parameters.Add(param.intparam("@modify_by", modify_by));
        return command.ExtQueryDS(cmd);
    }

    public static DataSet ins_course_intake_termbreak(string intake_id, string term_break_start, string term_break_end, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_course_intake_termbreak_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@intake_id", intake_id));
        cmd.Parameters.Add(param.stringparam("@term_break_start", term_break_start));
        cmd.Parameters.Add(param.stringparam("@term_break_end", term_break_end));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_course_intake(string intake_date, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_course_intake_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@intake_date", intake_date));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }
    public static DataSet upd_course_intake(string id, string intake_date, string modify_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "upd_course_intake_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@intake_id", id));
        cmd.Parameters.Add(param.stringparam("@intake_date", intake_date));
        cmd.Parameters.Add(param.intparam("@modify_by", modify_by));

        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_course_source()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_course_source_sp";
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_intake()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_intake_sp";
        return command.ExtQueryDS(cmd);
    }
    public static DataSet del_intake(string id, string delete_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "del_intake_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        cmd.Parameters.Add(param.intparam("@delete_by", delete_by));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet sel_intake(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_intake_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet sel_intake_tearmbreak(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_intake_tearmbreak_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet upd_course_intake_termbreak(string id, string intake_id, string term_break_start, string term_break_end, string modify_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "upd_course_intake_termbreak_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        cmd.Parameters.Add(param.intparam("@intake_id", intake_id));
        cmd.Parameters.Add(param.stringparam("@term_break_start", term_break_start));
        cmd.Parameters.Add(param.stringparam("@term_break_end", term_break_end));
        cmd.Parameters.Add(param.intparam("@modify_by", modify_by));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet del_course_intake_termbreak(string id, string delete_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "del_course_intake_termbreak_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        cmd.Parameters.Add(param.intparam("@delete_by", delete_by));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_intake_tearmbreak(string intake_id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_intake_tearmbreak_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@intake_id", intake_id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_public_holiday(string holiday_name, string holiday_date, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_public_holiday_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@holiday_name", holiday_name));
        cmd.Parameters.Add(param.datetimeparam("@holiday_date", holiday_date));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_public_holidays()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_public_holidays_sp";
        return command.ExtQueryDS(cmd);
    }
    public static DataSet upd_public_holiday(string id, string holiday_name, string holiday_date, string modify_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "upd_public_holiday_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@holiday_id", id));
        cmd.Parameters.Add(param.stringparam("@holiday_name", holiday_name));
        cmd.Parameters.Add(param.datetimeparam("@holiday_date", holiday_date));
        cmd.Parameters.Add(param.intparam("@modify_by", modify_by));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet sel_public_holidays(string holiday_id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_public_holidays_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@holiday_id", holiday_id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet del_public_holidays(string holiday_id, string delete_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "del_public_holidays_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@holiday_id", holiday_id));
        cmd.Parameters.Add(param.intparam("@delete_by", delete_by));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet sel_admin(string emil, string pwd)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_admin_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@emil", emil));
        cmd.Parameters.Add(param.stringparam("@pwd", pwd));
        return command.ExtQueryDS(cmd);
    }
}