using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Form_list : System.Web.UI.Page
{
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

        lbl_student_request.Text = ds.Tables[0].Rows[0]["total_student_request"].ToString();
        lbl_total_deferemetn.Text = ds.Tables[0].Rows[0]["total_deferment"].ToString();
        lbl_total_change_course.Text = ds.Tables[0].Rows[0]["total_change_course"].ToString();
        lbl_total_cancel.Text = ds.Tables[0].Rows[0]["total_cancellation"].ToString();
        lbl_total_special_leave.Text = ds.Tables[0].Rows[0]["total_special_leave_request"].ToString();
        lbl_total_credit_card_auth.Text = ds.Tables[0].Rows[0]["total_credit_card_authorization"].ToString();
        lbl_total_student_detail.Text = ds.Tables[0].Rows[0]["total_student_detail"].ToString();
        lbl_total_credit.Text = ds.Tables[0].Rows[0]["total_credit_transfer"].ToString();
        lbl_total_reassesment_application.Text = ds.Tables[0].Rows[0]["total_app_for_reassessment"].ToString();

        lbl_total_appeal.Text = ds.Tables[0].Rows[0]["total_appeal_form"].ToString();
        lbl_total_complaint.Text = ds.Tables[0].Rows[0]["total_complaint"].ToString();
        lbl_total_campus_change.Text = ds.Tables[0].Rows[0]["total_campus_change"].ToString();
        lbl_total_cricos_withdraw.Text = ds.Tables[0].Rows[0]["total_student_withdraw"].ToString();
        lbl_total_refund.Text = ds.Tables[0].Rows[0]["total_refund"].ToString();
        lbl_total_GTE.Text = ds.Tables[0].Rows[0]["total_GTE"].ToString();
        lbl_total_ept.Text = ds.Tables[0].Rows[0]["total_ept"].ToString();
        lbl_total_elicos.Text = ds.Tables[0].Rows[0]["total_elicos"].ToString();
        lbl_total_vet.Text = ds.Tables[0].Rows[0]["total_vet"].ToString();
        lbl_gst.Text = ds.Tables[0].Rows[0]["total_gst"].ToString();
        lbl_relese.Text = ds.Tables[0].Rows[0]["total_relese_req"].ToString();
        lbl_qualification.Text = ds.Tables[0].Rows[0]["total_qualification_issuance"].ToString();
        //lln_test.Text = ds.Tables[0].Rows[0]["total_qualification_issuance"].ToString();
        lbl_course_entry.Text = ds.Tables[0].Rows[0]["total_course_entry"].ToString();
        //lbl_new_elicos.Text = ds.Tables[0].Rows[0]["total_elicos"].ToString();
        //lbl_gte.Text = ds.Tables[0].Rows[0]["total_GTE"].ToString();
        //lbl_english_test.Text = ds.Tables[0].Rows[0]["total_ept"].ToString();
        lbl_agent_app.Text = ds.Tables[0].Rows[0]["total_agent_form"].ToString();
        lbl_contact.Text = ds.Tables[0].Rows[0]["total_contact_form"].ToString();





    }
}