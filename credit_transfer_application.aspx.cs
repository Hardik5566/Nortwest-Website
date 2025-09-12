using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.IO;
using System.Drawing;
using CrystalDecisions.Shared;
using System.Net.Mail;
using CrystalDecisions.CrystalReports.Engine;

public partial class credit_transfer_application : System.Web.UI.Page
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
                //ddl_country.DataSource = ds_country.Tables[0];
                //ddl_country.DataBind();

            }
        }
        catch (Exception)
        {

            throw;
        }
    }


    protected void btn_submit_Click(object sender, EventArgs e)
    {


        // Collect student details
        string lastName = txtLastName.Text.Trim();
        string title = ddlTitle.SelectedValue;
        string givenName = txtGivenName.Text.Trim();
        string dob = txtDOB.Text.Trim();
        string address = txtAddress.Text.Trim();
        string postcode = txtPostcode.Text.Trim();
        string state = txtState.Text.Trim();
        string email = txtEmail.Text.Trim();
        string countryCode = hd_contact_no_code.Value.Trim();
        string contactNo = hd_contact_no.Value.Trim();
        string studentId = txtStudentID.Text.Trim();
        string courseCode = txtCourseCode.Text.Trim();
        string courseTitle = txtCourseTitle.Text.Trim();
        string applicationDate = txtApplicationDate.Text.Trim();

        // Collect credit transfer details from hidden fields
        string unitCodes = hdnUnitCode.Value + "|";
        string unitTitles = hdnUnitTitle.Value + "|";
        string evidenceSupplied = hdnEvidence.Value + "|";
        string ctGranted = hdnCT.Value + "|";

        // Signature details
        string studentSignature = hdnSignature.Value.Trim();
        string signDate = txt_sign_date.Text.Trim();
        string studentFullName = txt_s_name.Text.Trim();

        // Create_by (your current user id or default "1")
        string createBy = "1";


        DataSet ds = BAL_Forms.ins_credit_transfer_application(
            lastName, title, givenName, dob, address, postcode, state, email,
            countryCode, contactNo, studentId, courseCode, courseTitle, applicationDate,
            unitCodes, unitTitles, evidenceSupplied, ctGranted, SaveSignature(),
            signDate, studentFullName, createBy
        );

        if (ds.Tables[0].Rows.Count > 0)
        {
            string signaturePath = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"].ToString();
            Task.Run(() =>
            {
                send_mail(ds.Tables[0].Rows[0]["id"].ToString());
                //Send_Mail.MailWithouAttachment("himanshumakwana8281@gmail.com", "New Credit Transfer Application (" + txt_s_full_name.Text + ")", mailbody(txt_s_number.Text, txt_s_last_name.Text, txt_s_given_name.Text, txt_s_full_name.Text, txt_email.Text, hd_contact_no_code.Value.ToString() + hd_contact_no.Value.ToString(), txt_add.Text, txt_add_line_2.Text, ddl_country.SelectedValue.ToString(), txt_state.Text, txt_city.Text, txt_zip.Text), "", "");
            });
            Response.Redirect("Success.aspx");
        }
    }public void send_mail(string id)
    {
        ReportDocument rpt = new ReportDocument();
        try
        {
            DataSet ds = BAL_Forms.sel_credit_transfer_Report(id);

            if (ds.Tables.Count == 0)
                throw new Exception("No tables returned from stored procedure.");

            if (ds.Tables[0].Rows.Count == 0)
                throw new Exception("No rows returned in main dataset.");

            // Fix signature path only if column exists
            if (ds.Tables[0].Columns.Contains("student_signature"))
            {
                ds.Tables[0].Rows[0]["student_signature"] =
                    Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"];
            }

            // Load main report
            rpt.Load(Server.MapPath("RPT/RPT_creadit_transfer_app.rpt"));
            rpt.Database.Tables["dt_credit_transfer"].SetDataSource(ds.Tables[0]);


            rpt.Database.Tables["dt_ct_credit_transfer"].SetDataSource(ds.Tables[1]);
            
            // Export to PDF
            string name = "RPT Creadit Transfer Application Form";
            Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
            pdfStream.Seek(0, SeekOrigin.Begin);

            Attachment pdfAttachment = new Attachment(pdfStream, name + ".pdf", "application/pdf");

            // Prepare email
            string subject = "Creadit Transfer Application Form (" + ds.Tables[0].Rows[0]["student_full_name"] + ")";
            string mail_body = get_email_body(ds.Tables[0].Rows[0]["student_full_name"].ToString());

            string result = Send_Mail.SendMail("sso@nortwest.edu.au", subject, mail_body, pdfAttachment, "", "");
        }
        catch (Exception )
        {
           
            throw; // don't use throw ex (it resets stack trace)
        }
        finally
        {
            rpt.Close();
            rpt.Dispose();
        }
    }
    public string get_email_body(string name)
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
           
            <div class='title'>Credit Transfer Application</div>
            <div class='content'>
                <p>Dear Team,</p>
                <p>Please find attached the Credit Transfer Application acknowledgement for Nortwest.</p>
                <p><b>Form Details:</b></p>
                <ul>
    <li>Submitted By: " + name + @"</li>
                    <li>Submission Date: " + DateTime.Now.ToString("dd MMM yyyy") + @"</li>
                
                </ul>
                <p>Kindly verify the details and keep this acknowledgement for your records. 
                If you require any additional information, Please find attached the Credit Transfer Application.</p>
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