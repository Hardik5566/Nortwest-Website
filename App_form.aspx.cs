using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class App_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bind();
        }
    }
    public void bind()
    {
        //DataSet ds = Bal_course.dis_policies();
        //if (ds.Tables[0].Rows.Count > 0)
        //{
        //    list_policies.DataSource = ds.Tables[0];
        //    list_policies.DataBind();
        //}
        //else
        //{
        //    list_policies.DataSource =null;
        //    list_policies.DataBind();
        //}
    }
}