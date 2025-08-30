using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class public_holidays_master : System.Web.UI.Page
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
            if (btnSaveCourse.Text == "Save")
            {
                DataSet ds = Bal_course.ins_public_holiday(txt_holiday_name.Text, txt_holiday_date.Text, "1");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ShowMessage("Course Add Successfully", MessageType.Success);
                    bind_data();
                    clear();
                }
            }
            else if (btnSaveCourse.Text == "Update")
            {
                DataSet ds = Bal_course.upd_public_holiday(ViewState["holiday_id"].ToString(), txt_holiday_name.Text, txt_holiday_date.Text, "1");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ShowMessage("Course Updated Successfully", MessageType.Success);
                    bind_data();
                    clear();
                }
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
        txt_holiday_name.Text = "";
        txt_holiday_date.Text = "";
        btnSaveCourse.Text = "Save";
    }
    public void bind_data()
    {
        try
        {
            DataSet ds = Bal_course.dis_public_holidays();
            if (ds.Tables[0].Rows.Count > 0)
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
            DataSet ds = Bal_course.del_public_holidays(id, "1");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ShowMessage("Holiday Deleted Successfully", MessageType.Success);
                bind_data();
            }
            else
            {
                ShowMessage("Holiday Deleted Something Wrong!", MessageType.Success);
            }
        }
        if (e.CommandName.ToString() == "btn_edit")
        {
            DataSet ds = Bal_course.sel_public_holidays(id);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txt_holiday_name.Text = ds.Tables[0].Rows[0]["holiday_name"].ToString();
                DateTime holidayDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["holiday_date"]);
                txt_holiday_date.Text = holidayDate.ToString("yyyy-MM-dd");
                ViewState["holiday_id"] = id;
                btnSaveCourse.Text = "Update";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "var myModal = new bootstrap.Modal(document.getElementById('courseModal')); myModal.show();", true);
            }
            else
            {
                ShowMessage("Something Wrong!", MessageType.Success);
            }
        }

    }
}