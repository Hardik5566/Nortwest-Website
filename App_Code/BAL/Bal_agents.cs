using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for Bal_agents
/// </summary>
public class Bal_agents
{
    public Bal_agents()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static DataSet ins_tbl_agents(DataTable AgentTable, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_tbl_agents_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.TableParam("@AgentTable", AgentTable, "agenttabletype"));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));
        return command.ExtQueryDS(cmd);
    }

    public static DataSet dis_tbl_agents()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_tbl_agents_sp";
        return command.ExtQueryDS(cmd);
    }



}