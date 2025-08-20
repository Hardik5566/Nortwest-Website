using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Home : System.Web.UI.Page
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
                bind_count();
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("Message.aspx?ex=" + ex.Message);
        }
    }

    
    public void bind_count()
    {
        DataSet ds = BAL_Forms.dis_all_form_count();

        lbl_student_request.InnerText = ds.Tables[0].Rows[0]["total_student_request"].ToString();
        lbl_total_deferemetn.InnerText = ds.Tables[0].Rows[0]["total_deferment"].ToString();
        lbl_total_change_course.InnerText = ds.Tables[0].Rows[0]["total_change_course"].ToString();
        lbl_total_cancel.InnerText = ds.Tables[0].Rows[0]["total_cancellation"].ToString();
        lbl_total_special_leave.InnerText = ds.Tables[0].Rows[0]["total_special_leave_request"].ToString();
        lbl_total_credit_card_auth.InnerText = ds.Tables[0].Rows[0]["total_credit_card_authorization"].ToString();
        lbl_total_student_detail.InnerText = ds.Tables[0].Rows[0]["total_student_detail"].ToString();
        lbl_total_credit.InnerText = ds.Tables[0].Rows[0]["total_credit_transfer"].ToString();
        lbl_total_reassesment_application.InnerText = ds.Tables[0].Rows[0]["total_app_for_reassessment"].ToString();

        lbl_total_appeal.InnerText = ds.Tables[0].Rows[0]["total_appeal_form"].ToString();
        lbl_total_complaint.InnerText = ds.Tables[0].Rows[0]["total_complaint"].ToString();
        lbl_total_campus_change.InnerText = ds.Tables[0].Rows[0]["total_campus_change"].ToString();
        lbl_total_cricos_withdraw.InnerText = ds.Tables[0].Rows[0]["total_student_withdraw"].ToString();
        lbl_total_refund.InnerText = ds.Tables[0].Rows[0]["total_refund"].ToString();
        lbl_total_GTE.InnerText = ds.Tables[0].Rows[0]["total_GTE"].ToString();
        lbl_total_ept.InnerText = ds.Tables[0].Rows[0]["total_ept"].ToString();
        lbl_total_elicos.InnerText = ds.Tables[0].Rows[0]["total_elicos"].ToString();
        lbl_total_vet.InnerText = ds.Tables[0].Rows[0]["total_vet"].ToString();
        lbl_new_vet.Text = ds.Tables[0].Rows[0]["total_vet"].ToString();
        lbl_new_elicos.Text = ds.Tables[0].Rows[0]["total_elicos"].ToString();
        lbl_gte.Text = ds.Tables[0].Rows[0]["total_GTE"].ToString();
        lbl_english_test.Text = ds.Tables[0].Rows[0]["total_ept"].ToString();
            





    }
}