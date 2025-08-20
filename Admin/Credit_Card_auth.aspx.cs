using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Credit_Card_auth : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                txt_from_date.Text = DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd");
                txt_to_date.Text = DateTime.Now.ToString("yyyy-MM-dd");
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
            DataSet ds = BAL_Forms.dis_credit_card_auth_form(txt_from_date.Text,txt_to_date.Text);
            if (ds.Tables.Count > 0)
            {
                grid_data.DataSource = ds.Tables[0];
                grid_data.DataBind();
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        bind_data();
    }
    protected void grid_data_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
}