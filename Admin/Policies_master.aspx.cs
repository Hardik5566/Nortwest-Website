using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Policies_master : System.Web.UI.Page
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
                string file_name = "";
                if (upd_policies.HasFile)
                {
                    file_name = General.rename_file_name(upd_policies.FileName);
                    upd_policies.SaveAs(Server.MapPath("assets/Policies/") + file_name);
                }

                DataSet ds = Bal_course.ins_policies(txt_policies.Text, file_name, "1");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ShowMessage("Policy added successfully", MessageType.Success);
                    bind_data();
                    clear();
                }

            }
            else if (btnSaveCourse.Text == "Update")
            {
                string file_name = "";
                if (upd_policies.HasFile)
                {
                    file_name = General.rename_file_name(upd_policies.FileName);
                    upd_policies.SaveAs(Server.MapPath("assets/Policies/") + file_name);
                }
                else if (!string.IsNullOrWhiteSpace(Convert.ToString(ViewState["File_name"])))
                {
                    file_name = ViewState["File_name"].ToString();
                }
                DataSet ds = Bal_course.upd_policies(ViewState["policies_id"].ToString(), txt_policies.Text, file_name, "1");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ShowMessage("Policy Updated successfully", MessageType.Success);
                    bind_data();
                    clear();
                }
            }
            else
            {
                ShowMessage("Policy Not Added Something Wrong!", MessageType.Warning);
            }

        }
        catch (Exception)
        {
            throw;
        }

    }
    public void clear()
    {

        txt_policies.Text = "";
        upd_policies.Attributes.Clear(); // Clears uploaded file

        btnSaveCourse.Text = "Save";
    }
    public void bind_data()
    {
        try
        {
            DataSet ds = Bal_course.dis_policies();
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
            DataSet ds = Bal_course.del_policies(id, "1");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ShowMessage("Policy Deleted successfully", MessageType.Success);
                bind_data();
            }
            else
            {
                ShowMessage("Policy Not Deleted Something Wrong!", MessageType.Success);
            }
        }
        if (e.CommandName.ToString() == "btn_edit")
        {
            DataSet ds = Bal_course.sel_policies(id);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txt_policies.Text = ds.Tables[0].Rows[0]["policies_name"].ToString();
                ViewState["File_name"] = ds.Tables[0].Rows[0]["policies_file"].ToString();
                ViewState["policies_id"] = id;
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