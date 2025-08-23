using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Intake_master : System.Web.UI.Page
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
                display();
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

                DataSet ds = Bal_course.ins_course_intake(txt_intake_date.Text, "1");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ShowMessage("Course Intake Add Successfully", MessageType.Success);
                   

                }
                else
                {
                    ShowMessage("Course Intake Not Added Something Wrong!", MessageType.Warning);
                }

            }
            else if (btnSaveCourse.Text == "Update")
            {

                DataSet ds = Bal_course.upd_course_intake(ViewState["intake_id"].ToString(), txt_intake_date.Text, "1");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ShowMessage("Course Intake Updated Successfully", MessageType.Success);


                }
                else
                {
                    ShowMessage("Course Intake Not Updated Something Wrong!", MessageType.Warning);
                }
            }
            display();

        }
        catch (Exception)
        {
            throw;
        }

    }


    public void display()
    {
        DataSet ds = Bal_course.dis_intake();

        if (ds.Tables[0].Rows.Count > 0)
        {
            // Group by year
            var grouped = ds.Tables[0].AsEnumerable()
                 .GroupBy(r => r.Field<string>("year"))  // group by 'year' from SP
                 .Select(g => new
                 {
                     year = g.Key,   // <-- make property name 'year'
                     Intakes = g.Select(r => new
                     {
                         intake_id = Convert.ToInt32(r["intake_id"]),
                         intake_date = Convert.ToDateTime(r["intake_date"]).ToString("dd, MMM yyyy"),
                     }).ToList()
                 }).ToList();

            lvCourses.DataSource = grouped;
            lvCourses.DataBind();
        }


    }

    //public void bind_data()
    //{
    //    try
    //    {
    //        DataSet ds = Bal_course.dis_course_source(); // call your SP

    //        if (ds.Tables[0].Rows.Count > 0)
    //        {
    //            ddl_course.DataSource = ds.Tables[0];
    //            ddl_course.DataTextField = "course_name";    // shows name
    //            ddl_course.DataValueField = "course_value";  // stores "code-id"
    //            ddl_course.DataBind();

    //            ddl_course.Items.Insert(0, new ListItem("Select Course", "0"));
    //            ddl_course.Items[0].Attributes.Add("style", "color:#B0B0B0;");
    //        }


    //        else
    //        {
    //            ddl_course.DataSource = null;
    //            ddl_course.DataBind();
    //        }
    //        display();
    //    }
    //    catch (Exception)
    //    {
    //        throw;
    //    }
    //}

    protected void grid_data_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        if (e.CommandName.ToString() == "btn_delete")
        {
            DataSet ds = Bal_course.del_intake(id, "1");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ShowMessage("Course Intake Deleted Successfully", MessageType.Success);
                display();
            }
            else
            {
                ShowMessage("Course Intake Not Deleted Something Wrong!", MessageType.Success);
            }
        }
        if (e.CommandName.ToString() == "btn_edit")
        {
            DataSet ds = Bal_course.sel_intake(id);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txt_intake_date.Text = ds.Tables[0].Rows[0]["intake_date"].ToString();
                ViewState["intake_id"] = id;
                btnSaveCourse.Text = "Update";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop",
                  "var myModal = new bootstrap.Modal(document.getElementById('courseModal')); myModal.show();", true);
            }
            else
            {
                ShowMessage("Something Wrong!", MessageType.Success);
            }
            display();
        }


    }

    protected void lvCourses_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                dynamic dataItem = (dynamic)e.Item.DataItem;
                GridView gv = (GridView)e.Item.FindControl("grid_intake");

                gv.DataSource = dataItem.Intakes;
                gv.DataBind();
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
}