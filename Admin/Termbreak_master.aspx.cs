using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Termbreak_master : System.Web.UI.Page
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
                //ddl_programme.Items.Insert(0, new ListItem("- - -Select Programme- - -", "0"));
                //ddl_programme.Items[0].Attributes.Add("style", "color:#B0B0B0;");
                bind_data();
                //clear();

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
                if (ddl_course.SelectedIndex > 0)
                {
                    DataSet ds = Bal_course.ins_course_intake_termbreak(ddl_course.SelectedValue.ToString(), txt_break_startdate.Text, txt_break_enddate.Text, "1");
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        ShowMessage("Tearm Break Add Successfully", MessageType.Success);
                        bind_data();
                    }
                    else
                    {
                        ShowMessage("Term Break Not Added Something Wrong!", MessageType.Warning);
                    }
                }
            }
            else if (btnSaveCourse.Text == "Update")
            {
                if (ddl_course.SelectedIndex > 0)
                {

                    DataSet ds = Bal_course.upd_course_intake_termbreak(ViewState["intake_id"].ToString(), ddl_course.SelectedValue.ToString(), txt_break_startdate.Text, txt_break_enddate.Text, "1");
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        ShowMessage("Term Break Updated Successfully", MessageType.Success);
                        bind_data();

                    }
                    else
                    {
                        ShowMessage("Term Break Not Updated Something Wrong!", MessageType.Warning);
                    }
                }
            }
        }
        catch (Exception)
        {
            throw;
        }

    }


    public void display()
    {
        string intake = Request.QueryString["intake_id"];
        if (!string.IsNullOrEmpty(intake))
        {
            DataSet ds = Bal_course.dis_intake_tearmbreak(intake);
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
    }

    public void bind_data()
    {
        try
        {
            display();

            DataSet ds = Bal_course.dis_intake(); // your SP call

            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_course.DataSource = ds.Tables[0];
                ddl_course.DataBind();

                ddl_course.Items.Insert(0, new ListItem("- - - Select Intake - - -", "0"));
                ddl_course.Items[0].Attributes.Add("style", "color:#B0B0B0;");

                string intakeId = Request.QueryString["intake_id"];
                if (!string.IsNullOrEmpty(intakeId) && ddl_course.Items.FindByValue(intakeId) != null)
                {
                    ddl_course.SelectedValue = intakeId;
                }
                else
                {
                    Response.Redirect("intake_master.aspx");
                }
            }
            else
            {
                ddl_course.DataSource = null;
                ddl_course.DataBind();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    protected void grid_data_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        if (e.CommandName.ToString() == "btn_delete")
        {
            DataSet ds = Bal_course.del_course_intake_termbreak(id, "1");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ShowMessage("Term Break Deleted Successfully", MessageType.Success);
                display();
            }
            else
            {
                ShowMessage("Term Break Not Deleted Something Wrong!", MessageType.Success);
            }
        }
        if (e.CommandName.ToString() == "btn_edit")
        {
            DataSet ds = Bal_course.sel_intake_tearmbreak(id);
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_course.SelectedValue = ds.Tables[0].Rows[0]["intake_id"].ToString();
                txt_break_startdate.Text = ds.Tables[0].Rows[0]["term_break_start"].ToString();
                txt_break_enddate.Text = ds.Tables[0].Rows[0]["term_break_end"].ToString();
                ViewState["intake_id"] = id;
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