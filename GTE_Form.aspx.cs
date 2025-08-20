using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GTE_Form : System.Web.UI.Page
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
            DataSet ds_country = BAL_Forms.dis_country();
            if (ds_country.Tables.Count > 0)
            {
                ddl_country.DataSource = ds_country.Tables[0];
                ddl_country.DataBind();

            }
        }
        catch (Exception)
        {
            throw;
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string courseData = hdnCourse.Value + "|";
        string institutionData = hdnInstitution.Value + "|";
        string yearData = hdnYear.Value + "|";
        string position = hdnposition.Value + "|";
        string company = hdncompany.Value + "|";
        string job_year = hdnjob_year.Value + "|";
        string save_signature = SaveSignature();
        string refused_visa_aus = "";
        if (upd_refused_visa_aus.HasFile)
        {
            refused_visa_aus = upd_refused_visa_aus.FileName.ToString();
            string save_path = Server.MapPath("~/assets/img/document/");
            upd_refused_visa_aus.SaveAs(save_path + refused_visa_aus);
        }
        string evidence_visited = "";
        if (upd_evidence_visited_aus_breached.HasFile)
        {
            evidence_visited = upd_evidence_visited_aus_breached.FileName.ToString();
            string save_path2 = Server.MapPath("~/assets/img/document/");
            upd_evidence_visited_aus_breached.SaveAs(save_path2 + evidence_visited);
        }
        string file_undertaken_IELTS = "";
        if (upd_evidence_visited_aus_breached.HasFile)
        {
            file_undertaken_IELTS = upd_undertaken_IELTS.FileName.ToString();
            string save_path2 = Server.MapPath("~/assets/img/document/");
            upd_undertaken_IELTS.SaveAs(save_path2 + file_undertaken_IELTS);
        }

        string bringing_family = rb_bringing_family_y.Checked ? "Yes" : (rb_bringing_family_n.Checked ? "No" : "No");
        string health_condition = rb_health_condition_y.Checked ? "Yes" : (rb_health_condition_n.Checked ? "No" : "No");
        string refused_visa = rb_refused_visa_aus_y.Checked ? "Yes" : (rb_refused_visa_aus_n.Checked ? "No" : "No");
        string student_visa_other = rb_student_visa_other_y.Checked ? "Yes" : (rb_student_visa_other_n.Checked ? "No" : "No");
        string visited_aus_breached = rb_visited_aus_breached_y.Checked ? "Yes" : (rb_visited_aus_breached_n.Checked ? "No" : "No");
        string apply_admision = rb_apply_admision_y.Checked ? "Yes" : (rb_apply_admision_n.Checked ? "No" : "No");
        string previous_studied = rb_previous_studied_y.Checked ? "Yes" : (rb_previous_studied_n.Checked ? "No" : "No");
        string relatives_aus = rb_relatives_aus_y.Checked ? "Yes" : (rb_relatives_aus_n.Checked ? "No" : "No");
        string accommodation_plan = rb_accommodation_plan_y.Checked ? "Yes" : (rb_accommodation_plan__n.Checked ? "No" : "No");
        string criminal_record = rb_criminal_record_y.Checked ? "Yes" : (rb_criminal_record_n.Checked ? "No" : "No");
        string gaps_education = rb_gaps_education_y.Checked ? "Yes" : (rb_gaps_education_n.Checked ? "No" : "No");
        string undertaken_IELTS = rb_undertaken_IELTS_y.Checked ? "Yes" : (rb_undertaken_IELTS_n.Checked ? "No" : "No");
        string livine_expence = rb_livine_expence_y.Checked ? "Yes" : (rb_livine_expence_n.Checked ? "No" : "No");
        string lerning_exp = rb_lerning_exp_y.Checked ? "Yes" : (rb_lerning_exp_n.Checked ? "No" : "No");
        string work_desc = rb_work_desc_y.Checked ? "Yes" : (rb_work_desc_n.Checked ? "No" : "No");
        string term_condition = rb_term_condition_y.Checked ? "Yes" : (rb_term_condition_n.Checked ? "No" : "No");

        DataSet ds = BAL_Forms.ins_gte_form(txt_family_name.Text, txt_given_name.Text, txt_stu_id.Text, txt_dob.Text, ddl_country.SelectedValue.ToString(), txt_citizenship.Text, txt_agent_name.Text, txt_agent_code.Text, txt_agent_email.Text, txt_course.Text, txt_current_address.Text, rad_marital_status.SelectedValue.ToString(), bringing_family, txt_bringing_family_details.Text, health_condition, txt_health_condition.Text, refused_visa, refused_visa_aus, txt_refused_visa_aus_details.Text, student_visa_other, txt_student_visa_other_details.Text, visited_aus_breached, evidence_visited, txt_visited_aus_breached_detail.Text, apply_admision, txt_apply_admision_detail.Text, previous_studied, txt_previous_studied_detail.Text, relatives_aus, txt_relatives_aus_detai.Text, accommodation_plan, txt_accommodation_plan_detail.Text, criminal_record, txt_criminal_record_detail.Text, gaps_education, txt_gaps_education_detail.Text, undertaken_IELTS, file_undertaken_IELTS, txt_undertaken_IELTS_detail.Text, txt_plans_intention_study_aus.Text, txt_type_of_job.Text, txt_sort_long_term.Text, txt_expect_learn.Text, txt_decide_study_aus.Text, txt_other_course.Text, txt_nortwest_institute.Text, livine_expence, txt_livine_expence_detail.Text, lerning_exp, txt_lerning_exp_detail.Text, txt_course_relavant.Text, txt_change_area_study.Text, work_desc, txt_work_explain_explain.Text, txt_planing_while_study.Text, term_condition, save_signature, txt_sign_date.Text, "1", courseData, institutionData, yearData, position, company, job_year);
        if (ds.Tables.Count > 0)
        {
            Task.Run(() =>
            {
                send_mail(ds);
            }); 
            Response.Redirect("Success.aspx");
        }
    }
    public string SaveSignature()
    {
        // Retrieve the base64 signature from the hidden field
        string base64Signature = hdnSignature.Value;
        string signName = "";

        if (!string.IsNullOrEmpty(base64Signature))
        {
            try
            {
                // Define the folder path to save the signature
                string folderPath = Server.MapPath("~/assets/img/sign/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath); // Create folder if it doesn't exist
                }

                // Generate a unique file name
                string fileName = "Signature_" + DateTime.Now.Ticks + ".jpg"; // Save as JPG
                string filePath = Path.Combine(folderPath, fileName);

                // Remove the base64 prefix and convert to byte array
                byte[] signatureBytes = Convert.FromBase64String(base64Signature.Replace("data:image/png;base64,", ""));

                // Create and save the image
                using (MemoryStream ms = new MemoryStream(signatureBytes))
                {
                    using (System.Drawing.Image signatureImage = System.Drawing.Image.FromStream(ms))
                    {
                        // Create a bitmap with white background
                        using (Bitmap bitmap = new Bitmap(signatureImage.Width, signatureImage.Height))
                        {
                            using (Graphics g = Graphics.FromImage(bitmap))
                            {
                                g.Clear(Color.White); // Set background to white
                                g.DrawImage(signatureImage, 0, 0); // Draw signature image

                                // Save the bitmap as a JPG file
                                bitmap.Save(filePath, System.Drawing.Imaging.ImageFormat.Jpeg);
                            }
                        }
                    }
                }

                signName = fileName; // Set the file name to return
            }
            catch (Exception ex)
            {
                // Log the error (replace with a proper logging mechanism)
                Response.Write("Error: " + ex.Message);
            }
        }
        else
        {
            // Handle the case where the signature is empty
            Response.Write("Signature data is missing.");
        }

        return signName; // Return the saved file name or an empty string
    }

    public void send_mail(DataSet ds)
    {

        string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();

        ReportDocument rpt = new ReportDocument();
        try
        {

            if (ds.Tables.Count > 0)
            {
                string doc_refused_visa_aus_upd = Server.MapPath("assets/img/document/") + ds.Tables[0].Rows[0]["refused_visa_aus_upd"];

                string doc_evidence_upd = Server.MapPath("assets/img/document/") + ds.Tables[0].Rows[0]["doc_evidence_upd"];

                string doc_file_undertaken_IELTS = Server.MapPath("assets/img/document/") + ds.Tables[0].Rows[0]["undertaken_IELTS_upd"];
                ds.Tables[0].Rows[0]["student_signature"] = Server.MapPath("assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"];

                ds.Tables[0].Rows[0]["doc_evidence_upd"] = server_url + "assets/img/document/" + ds.Tables[0].Rows[0]["doc_evidence_upd"];
                ds.Tables[0].Rows[0]["refused_visa_aus_upd"] = server_url + "assets/img/document/" + ds.Tables[0].Rows[0]["refused_visa_aus_upd"];
                ds.Tables[0].Rows[0]["undertaken_IELTS_upd"] = server_url + "assets/img/document/" + ds.Tables[0].Rows[0]["undertaken_IELTS_upd"];


                rpt.Load(Server.MapPath("RPT/RPT_GTE_Form.rpt"));

                rpt.Database.Tables["dt_gte_form"].SetDataSource(ds.Tables[0]);
                rpt.Database.Tables["dt_academic_history"].SetDataSource(ds.Tables[1]);
                rpt.Database.Tables["dt_job_description"].SetDataSource(ds.Tables[2]);

                string name = "New GTE Form";

                Stream ach_stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                Attachment ach_attachment = new Attachment(ach_stream, name + ".pdf", "application/pdf");

                // Dispose of the report
                rpt.Close();
                rpt.Dispose();

                string subject = "GTE Form (" + ds.Tables[0].Rows[0]["family_name"].ToString() + "-" + ds.Tables[0].Rows[0]["student_id"].ToString() + ")";
                string mail_body = get_email_body();
                string result = Send_Mail.SendGTEMail("himanshumakwana8281@gmail.com", subject, mail_body, ach_attachment, "", doc_refused_visa_aus_upd, doc_evidence_upd, doc_file_undertaken_IELTS);

                rpt.Close();
                rpt.Dispose();
            }

        }
        catch (Exception)
        {
            rpt.Close();
            rpt.Dispose();
        }
        finally
        {
            rpt.Close();
            rpt.Dispose();
        }
    }

    public string get_email_body()
    {
        try
        {
            string emailBody = @"
<!DOCTYPE html>
<html>
<head>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Student Request Form</title>
    <style>
        body {
            background: #108a7c;
            margin: 0;
            padding: 0;
            width: 100%;
        }
        .wrapper {
            width: 100%;
           
            display: block;
            text-align: center;
            padding-top: 10%;
            padding-bottom: 10%;

            background: #108a7c;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: left;
            max-width: 550px;
            width: 90%;
            margin: 0 auto;
            display: inline-block;
        }
        .logo {
            display: block;

        }
        .title {
            font-size: 20px;
            font-weight: bold;
            text-align: left;
            margin-top:20px;
        }
        .content {
            margin: 20px 0;
            font-size: 14px;
        }
        .footer {
            color: #B0BEC5;
            font-size: 12px;
            margin-top: 20px;
            text-align: center;
            border-top: 1px solid lightgray;
            padding-top: 10px;
        }
        @media screen and (max-width: 480px) {
            .wrapper {
                width: 90%;
                padding: 15px; 
            }
        }

    </style>
</head>
<body>
    <div class='wrapper'>
        <div class='container'>
            <img class='logo' src='https://nortwest.edu.au/assets/uploads/2017/05/logo_nwc_transp@1x.png' alt='Nortwest Logo' width='150'>
            <div class='title'>GTE Form</div>
            <div class='content'>
                <p>Dear team,</p>
                <p>Please find the attached GTE Form acknowledgement for Nortwest.</p>
            </div>
            <div class='footer'>Nortwest Pty Ltd, All rights reserved</div>
        </div>
    </div>
</body>
</html>
";


            return emailBody;

        }
        catch (Exception)
        {

            throw;
        }
    }



}