using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Agent_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }
    public void bind()
    {
        DataSet ds = Bal_agents.dis_tbl_agents();
        if (ds.Tables[0].Rows.Count > 0)
        {
            list_agent.DataSource = ds.Tables[0];
            list_agent.DataBind();
        }
        else
        {
            list_agent.DataSource = null;
            list_agent.DataBind();
        }
    }
}