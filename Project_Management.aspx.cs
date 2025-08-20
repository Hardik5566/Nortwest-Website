using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Project_Management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                bind_data();
            }
        }
        catch (Exception)
        {
            throw;
        }
    }
    public void bind_data()
    {
        try
        {
            string pageName = Request.QueryString["page_name"];

            if (!string.IsNullOrEmpty(pageName)) 
            {
                lbl_programme.Text = pageName;
                DataSet ds = Bal_course.dis_course(pageName);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    list_course.DataSource = ds.Tables[0];
                    list_course.DataBind();
                }
                else
                {
                    list_course.DataSource = null;
                    list_course.DataBind();
                }
            }
            else
            {
                Response.Redirect("courses.aspx");
            }
        }
        catch (Exception)
        {
            throw;
        }
    }
}