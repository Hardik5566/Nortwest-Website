using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.Shared;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;
using System.Net.Mail;
using System.Threading.Tasks;

public partial class GST_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // For chkFunding CheckBoxList
            foreach (ListItem item in chkFunding.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }

            // For chkEvidence CheckBoxList
            foreach (ListItem item in chkEvidence.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }
            foreach (ListItem item in rbl_highschool.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }
            foreach (ListItem item in rbl_university.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }
            foreach (ListItem item in rblEmployed.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }
            foreach (ListItem item in rblExperience.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }
            foreach (ListItem item in rblGap.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }

        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string visa_type = hdnVisaType.Value;
        string visa_from_date = hdnVisaFrom.Value;
        string visa_expiry_date = hdnVisaExpiry.Value;

        // Collect job values (filled by your JS)
        string job_titles = hdnJobTitle.Value;
        string job_salaries = hdnJobSalary.Value;
        string job_start_date = hdnJobStart.Value;
        string job_end_date = hdnJobEnd.Value;
        string job_current = hdnJobCurrent.Value;

        // Employment
        string has_employee = rblEmployed.SelectedValue;             // "Yes"/"No"
        string currently_employed = txt_employed_reason.Text;

        // Highschool / University
        string complete_highschool = rbl_highschool.SelectedValue;   // "complete"/"incomplete"
        string highschool = txt_highschool_year.Text;
        string complete_university = rbl_university.SelectedValue;
        string university = txt_university_year.Text;

        // Education (hidden fields set by JS)
        string education_qualificaton = hdnQualification.Value;
        string level_of_study = hdnStudy.Value;
        string study_year = hdnCompletion.Value;

        // Plan to fund (join selected chkFunding)
        var sbPlan = new System.Text.StringBuilder();
        foreach (System.Web.UI.WebControls.ListItem li in chkFunding.Items)
        {
            if (li.Selected)
            {
                if (sbPlan.Length > 0) sbPlan.Append("|");
                sbPlan.Append(li.Value);
            }
        }
        string plan_to_fund = sbPlan.ToString();

        // Financial evidence (join selected chkEvidence)
        var sbFin = new System.Text.StringBuilder();
        foreach (System.Web.UI.WebControls.ListItem li in chkEvidence.Items)
        {
            if (li.Selected)
            {
                if (sbFin.Length > 0) sbFin.Append("|");
                sbFin.Append(li.Value);
            }
        }
        string financial_evidance = sbFin.ToString();

        // Course experience / gaps
        string has_course_exp = rblExperience.SelectedValue;
        string course_experience = txtExperience.Text;
        string has_study_gap = rblGap.SelectedValue;
        string study_gap = txtGap.Text;

        // Career plan & ties
        string reason_for_australia = txtReasonAustralia.Text;
        string career_goals_australia = txtCareerGoals.Text;
        string home_country_ties = txtHomeCountryTies.Text;
        string australia_family_ties = txtAustraliaFamilyTies.Text;
        string post_study_plan = txtFuturePlans.Text;
        string other_relevant_info = txtOtherInfo.Text;

        // Student & signature
        string student_name = txt_s_name.Text;
        string sign_date = txt_sign_date.Text; // keep as string per your method signature
        string signature_img = SaveSignature();


        // Call the DAL method (no checks)
        DataSet ds = BAL_Forms.ins_GST_Form(
            visa_type,
            visa_from_date,
            visa_expiry_date,
            job_titles,
            job_salaries,
            job_start_date,
            job_end_date,
            job_current,
            currently_employed,
            highschool,
            university,
            education_qualificaton,
            level_of_study,
            study_year,
            plan_to_fund,
            txtFunds.Text,
            financial_evidance,
            has_course_exp,
            course_experience,
            has_study_gap,
            study_gap,
            reason_for_australia,
            career_goals_australia,
            home_country_ties,
            australia_family_ties,
            post_study_plan,
            other_relevant_info,
            student_name,
            sign_date,
            signature_img,
            "1",
            has_employee,
            complete_highschool,
            complete_university
        );
        if (ds.Tables.Count > 0)
        {
            Task.Run(() =>
            {
                send_mail_gst(ds.Tables[0].Rows[0]["FormID"].ToString());
            });
            Response.Redirect("Success.aspx");
        }

        // Immediately redirect (no validation or result checking)
        //Response.Redirect("Success.aspx");
    }

    public void send_mail_gst(string id)
    {
        ReportDocument rpt = new ReportDocument();
        try
        {
            DataSet ds = BAL_Forms.sel_gst_form(id);
            if (ds.Tables.Count > 0)
            {
                // Fix signature path
                ds.Tables[0].Rows[0]["signature_img"] = Server.MapPath("~/assets/img/sign/")
                    + ds.Tables[0].Rows[0]["signature_img"];

                // Load main report
                rpt.Load(Server.MapPath("~/RPT/RPT_GST_Form.rpt"));

                // Set datasource for main report
                rpt.Database.Tables["dt_gst_form"].SetDataSource(ds.Tables[0]);
                rpt.Database.Tables["dt_job_gst"].SetDataSource(ds.Tables[1]);
                rpt.Database.Tables["dt_visa_gst"].SetDataSource(ds.Tables[2]);
                rpt.Database.Tables["dt_education_gst"].SetDataSource(ds.Tables[3]);
                // Export to stream
                string name = "GST Form";
                Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                pdfStream.Seek(0, SeekOrigin.Begin);

                // Create attachment
                Attachment pdfAttachment = new Attachment(pdfStream, name + ".pdf", "application/pdf");

                // Dispose report
                rpt.Close();
                rpt.Dispose();

                // Prepare mail subject & body
                string subject = "GST Form (" + ds.Tables[0].Rows[0]["student_name"].ToString() + ")";
                string mail_body = get_email_body_gst(ds.Tables[0].Rows[0]["student_name"].ToString()); // <-- reuse your email body builder

                // Send email (adjust Send_Mail method as per your project)
                string result = Send_Mail.SendMail("vandanahl2602@gmail.com", subject, mail_body, pdfAttachment, "", "");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            rpt.Close();
            rpt.Dispose();
        }
    }
    public string get_email_body_gst(string name)
    {
        try
        {
            string emailBody = @"<!DOCTYPE html>
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
            margin: 0 auto; /* center the logo */
        }
        .title {
            font-size: 20px;
            font-weight: bold;
            text-align: center; /* center the title */
            margin-top:20px;
        }
        .content {
            margin: 20px 0;
            font-size: 14px;
            line-height: 1.6;
        }
        .footer {
            color: #B0BEC5;
            font-size: 12px;
            margin-top: 20px;
            text-align: center;
            border-top: 1px solid lightgray;
            padding-top: 10px;
        }
        .note {
            color: #FFFFFF;
            font-size: 12px;
            margin-top: 10px;
            text-align: center;
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
      <div class='logo' style='padding-bottom:20px;'>
       <img  src='https://nortwest.edu.au/assets/uploads/2017/05/logo_nwc_transp@1x.png' alt='Nortwest Logo' style='background-color:white;border-radius:9px;padding:5px' width='200'>
       </div>
        <div class='container'>
           
            <div class='title'>GST Form</div>
            <div class='content'>
                <p>Dear Team,</p>
                <p>Please find attached the GST Form acknowledgement for Nortwest.</p>
                <p><b>Form Details:</b></p>
                <ul>
    <li>Submitted By: " + name + @"</li>
                    <li>Submission Date: " + DateTime.Now.ToString("dd MMM yyyy") + @"</li>
                
                </ul>
                <p>Kindly verify the details and keep this acknowledgement for your records. 
                If you require any additional information, Please find attached the GST Form.</p>
                <p>Thank you for your prompt attention.</p>
            </div>
            <div class='footer'>Nortwest Pty Ltd, All rights reserved</div>
        </div>

        <!-- Note outside the container -->
        <p class='note'><b>Note:</b> This is an automated email. Please do not reply to this email.</p>

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

}