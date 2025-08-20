using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_Course_master : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ddl_programme.Items.Insert(0, new ListItem("- - -Select Programme- - -", "0"));
                ddl_programme.Items[0].Attributes.Add("style", "color:#B0B0B0;");
                bind_data();
                clear();
            }
        }
        catch (Exception)
        {
            throw;
        }
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            string file_name = "";
            if (upd_flyer.HasFile)
            {
                file_name = General.rename_file_name(upd_flyer.FileName);
                upd_flyer.SaveAs(Server.MapPath("assets/Flyer/") + file_name);
            }

            DataSet ds = Bal_course.ins_course(ddl_programme.SelectedValue.ToString(), txt_course_name.Text, txt_cricos_code.Text, txt_cricos_code.Text, txt_description.Text, file_name.ToString(), txt_total_week.Text, txt_study_week.Text, txt_weeks_holiday.Text, "1");
            if (ds.Tables.Count > 0)
            {
                ShowMessage("Course Add Successfully", MessageType.Success);
                bind_data();
                clear();
            }
            else
            {
                ShowMessage("Course Not Added Something Wrong!", MessageType.Warning);
            }
        }
        catch (Exception)
        {
            throw;
        }

    }
    public void clear()
    {
        ddl_programme.SelectedIndex = 0;
        txt_course_name.Text = "";
        txt_course_code.Text = "";
        txt_cricos_code.Text = "";
        txt_description.Text = "";
        upd_flyer.Attributes.Clear(); // Clears uploaded file
        txt_total_week.Text = "";
        txt_weeks_holiday.Text = "";
        txt_study_week.Text = "";
    }
    public void bind_data()
    {
        try
        {
            DataSet ds = Bal_course.dis_course_admin();
            if (ds.Tables.Count > 0)
            {
                grid_data.DataSource = ds.Tables[0];
                grid_data.DataBind();
            }
            else
            {
                grid_data.DataSource = null;
                grid_data.DataBind();
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void grid_data_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        if (e.CommandName.ToString() == "btn_delete")
        {
            DataSet ds = Bal_course.del_course(id, "1");
            if(ds.Tables.Count>0)
            {
                ShowMessage("Course Deleted Successfully", MessageType.Success);
                bind_data();
            }
            else
            {
                ShowMessage("Course Not Deleted Something Wrong!", MessageType.Success);
            }
        }
    }
}