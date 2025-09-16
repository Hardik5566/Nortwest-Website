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

public partial class Agent_Application : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        //string name = hd_agent_name.Value + "|";
        //string staff_list = hd_staff_list.Value + "|";
        //string service = hd_service_list.Value + "|";
        //string fee = hd_fee_list.Value + "|";
        //string member = hd_number_list.Value + "|";
        //string intend_list = hd_intend_list.Value + "|";
        //string institution_list = hd_institution_list.Value + "|";
        //string name_no_list = hd_number_list.Value + "|";
        //string email_list = hd_email_list.Value + "|";
        //string services_international_student = string.Join("|",
        //    intend_provide.Items.Cast<ListItem>()
        //                        .Where(li => li.Selected)
        //                        .Select(li => li.Text)
        //);

        //string no_of_student = string.Join("|",
        //    number_of_staff.Items.Cast<ListItem>()
        //                         .Where(li => li.Selected)
        //                         .Select(li => li.Text)
        //);

        //string orgCountry = string.Join("|",
        //    org_country.Items.Cast<ListItem>()
        //                     .Where(li => li.Selected)
        //                     .Select(li => li.Text)
        //);
        //if (!string.IsNullOrWhiteSpace(txt_other.Text))
        //{
        //    orgCountry += (string.IsNullOrEmpty(orgCountry) ? "" : "|") + txt_other.Text.Trim();
        //}

        // ✅ Remove any trailing "|" from hidden fields
        string name = (hd_agent_name.Value ?? "").TrimEnd('|');
        string staff_list = (hd_staff_list.Value ?? "").TrimEnd('|');
        string service = (hd_service_list.Value ?? "").TrimEnd('|');
        string fee = (hd_fee_list.Value ?? "").TrimEnd('|');
        string member = (hd_number_list.Value ?? "").TrimEnd('|');
        string intend_list = (hd_intend_list.Value ?? "").TrimEnd('|');
        string institution_list = (hd_institution_list.Value ?? "").TrimEnd('|');
        string name_no_list = (hd_number_list.Value ?? "").TrimEnd('|');
        string email_list = (hd_email_list.Value ?? "").TrimEnd('|');

        // ✅ Combine selected items into one string (no trailing "|")
        string services_international_student = string.Join("|",
            intend_provide.Items.Cast<ListItem>()
                                .Where(li => li.Selected)
                                .Select(li => li.Text)
        );

        // ✅ Combine selected staff count options into one string (no trailing "|")
        string no_of_student = string.Join("|",
            number_of_staff.Items.Cast<ListItem>()
                                 .Where(li => li.Selected)
                                 .Select(li => li.Text)
        );

        // ✅ Combine org_country with other text (no trailing "|")
        string orgCountry = string.Join("|",
            org_country.Items.Cast<ListItem>()
                             .Where(li => li.Selected)
                             .Select(li => li.Text)
        );

        if (!string.IsNullOrWhiteSpace(txt_other.Text))
        {
            orgCountry = string.IsNullOrEmpty(orgCountry)
                ? txt_other.Text.Trim()
                : orgCountry + "|" + txt_other.Text.Trim();
        }

        string country_code = hd_contact_no_code.Value.ToString();
        string contact = hd_contact_no.Value.ToString();

        DataSet ds = BAL_Forms.ins_agent_app_form(txt_reg_name.Text, txt_reg_name.Text, txt_abn.Text, txt_director_name.Text, txt_est_year.Text, txt_website.Text, txt_email.Text, txt_phone.Text, country_code, contact, txt_address.Text, txt_post_address.Text, name, services_international_student, no_of_student, staff_list, service, fee, member, orgCountry, intend_list, institution_list, name_no_list, email_list, txt_full_name.Text, txt_position.Text, SaveSignature(), txt_sign_date.Text, "1");

        if (ds.Tables[0].Rows.Count > 0)
        {
            string signature ="~/assets/img/sign/" +ds.Tables[0].Rows[0]["signature"].ToString();
            string agentName = ds.Tables[0].Rows[0]["register_buissness_name"].ToString();
            Send_Mail.SendMail("sso@nortwest.edu.au", "New Agent Application Form " + agentName, get_email_body(ds.Tables[0].Rows[0]["full_name"].ToString()), Get_agent_Report_Attachment(ds), signature, txt_sign_date.Text);
            
            Response.Redirect("Success.aspx");
        }
    }

    public Attachment Get_agent_Report_Attachment(DataSet ds2)
    {
        ReportDocument rpt = new ReportDocument();

        try
        {
            if (ds2.Tables.Count > 0)
            {
                // ✅ Fix signature path
                ds2.Tables[0].Rows[0]["signature"] = Server.MapPath("~/assets/img/sign/")
                    + ds2.Tables[0].Rows[0]["signature"];

                // ✅ Load Crystal Report
                rpt.Load(Server.MapPath("~/RPT/RPT_Application_Form_Nort.rpt"));

                // ✅ Bind data tables
                rpt.Database.Tables["dt_app_form"].SetDataSource(ds2.Tables[0]);
                rpt.Database.Tables["dt_employed_agents_names"].SetDataSource(ds2.Tables[1]);
                rpt.Database.Tables["dt_staff"].SetDataSource(ds2.Tables[2]);
                rpt.Database.Tables["dt_service_fee"].SetDataSource(ds2.Tables[3]);
                rpt.Database.Tables["dt_staff_update_plan"].SetDataSource(ds2.Tables[4]);
                rpt.Database.Tables["dt_agent_association_details"].SetDataSource(ds2.Tables[5]);
                rpt.Database.Tables["dt_institution_detail"].SetDataSource(ds2.Tables[6]);

                // ✅ Export to memory stream and return as attachment
                Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                MemoryStream ms = new MemoryStream();
                pdfStream.CopyTo(ms);
                ms.Position = 0; // reset position before using as attachment

                // ✅ Return the attachment (caller will dispose later)
                return new Attachment(ms, "Agent_application_form.pdf", "application/pdf");
            }

            return null; // if no data, return null
        }
        catch (Exception ex)
        {
            throw new Exception("Error generating GST report attachment: " + ex.Message, ex);
        }
        finally
        {
            rpt.Close();
            rpt.Dispose();
        }
    }
    public string get_email_body(string studentName)
    {
        try
        {
            string emailBody = @"
<!DOCTYPE html>
<html>
<head>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Agent Application</title>
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
           
             <div class='title'>Agent Application Form</div>
            <div class='content'>
                <p>Dear Team,</p>
                <p>Please find attached the Agent Application Form acknowledgement for Nortwest.</p>

                <p><b>Form Details:</b></p>
                <ul>
                   
                    <li>Submitted By: " + studentName + @"</li>
                     <li>Submission Date: " + DateTime.Now.ToString("dd MMM yyyy") + @"</li>
                </ul>

                <p>Kindly verify the details and keep this acknowledgement for your records. If you require any additional information, Please find attached the Agent Application Form.</p>

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

    //public void download_gst_report(DataSet ds2)
    //{
    //    ReportDocument rpt = new ReportDocument();
    //    try
    //    {
    //        if (ds2.Tables.Count > 0)
    //        {
    //            // ✅ Fix signature path
    //            ds2.Tables[0].Rows[0]["signature"] = Server.MapPath("~/assets/img/sign/")
    //                + ds2.Tables[0].Rows[0]["signature"];

    //            // ✅ Load Crystal Report
    //            rpt.Load(Server.MapPath("~/RPT/RPT_Application_Form_Nort.rpt"));

    //            // ✅ Bind data tables
    //            rpt.Database.Tables["dt_app_form"].SetDataSource(ds2.Tables[0]);
    //            rpt.Database.Tables["dt_employed_agents_names"].SetDataSource(ds2.Tables[1]);
    //            rpt.Database.Tables["dt_staff"].SetDataSource(ds2.Tables[2]);
    //            rpt.Database.Tables["dt_service_fee"].SetDataSource(ds2.Tables[3]);
    //            rpt.Database.Tables["dt_staff_update_plan"].SetDataSource(ds2.Tables[4]);
    //            rpt.Database.Tables["dt_agent_association_details"].SetDataSource(ds2.Tables[5]);
    //            rpt.Database.Tables["dt_institution_detail"].SetDataSource(ds2.Tables[6]);

    //            using (Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat))
    //            {
    //                byte[] pdfBytes = new byte[pdfStream.Length];
    //                pdfStream.Read(pdfBytes, 0, pdfBytes.Length);

    //                // ✅ Send file to browser for download
    //                HttpContext.Current.Response.Clear();
    //                HttpContext.Current.Response.ContentType = "application/pdf";
    //                HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=GST_Form.pdf");
    //                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
    //                HttpContext.Current.Response.BinaryWrite(pdfBytes);
    //                HttpContext.Current.Response.End();
    //            }
    //        }
    //    }
    //    catch (Exception)
    //    {
    //        throw;
    //    }
    //    finally
    //    {
    //        rpt.Close();
    //        rpt.Dispose();
    //    }
    //}

   


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