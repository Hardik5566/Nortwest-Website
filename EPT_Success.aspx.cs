using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EPT_Success : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_data();
        }
    }


    public void bind_data()
    {
        DataSet ds = BAL_Forms.sel_ept_form(Request.QueryString["id"].ToString());
        lbl_success_msg.InnerText = "EPT successfully submitted by " + ds.Tables[0].Rows[0]["f_name"].ToString() + " " + ds.Tables[0].Rows[0]["l_name"].ToString() + " " + "on " + Convert.ToDateTime(ds.Tables[0].Rows[0]["create_date"]).ToString("dd MMM, yyyy");
        lbl_score.Text = ds.Tables[1].Rows[0]["score"].ToString() + "/25.0";
    }
}