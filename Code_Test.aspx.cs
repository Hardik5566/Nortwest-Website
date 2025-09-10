using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        send_mail_gst("22");
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


                // Bind subreports
             
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
                string result = Send_Mail.SendMail("vaghasiyaprit799@gmail.com", subject, mail_body, pdfAttachment, "", "");


                lbl_error.Text = result;
            }
        }
        catch (Exception ex)
        {
            lbl_error.Text = ex.ToString();
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

}