using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;
using System.Net.Mail;
using CrystalDecisions.Shared;
using System.Threading.Tasks;

public partial class refund_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            
            string save_signature = SaveSignature();
             string contactNoCode = hd_contact_no_code.Value;  // Hidden field value for contact code
            string contactNo = hd_contact_no.Value;

            List<string> selectedReasons = new List<string>();

            // Loop through all items in the CheckBoxList
            foreach (ListItem item in ch_reason.Items)
            {
                if (item.Selected)
                {
                    // Add the text of the selected item to the list
                    selectedReasons.Add(item.Text);
                }
            }

            // Join the selected items into a comma-separated string
            string reason_list = string.Join("| ", selectedReasons);
            DataSet ds = BAL_Forms.ins_refund_form(txt_first_name.Text, txt_last_name.Text, txt_birth_date.Text, ddl_nationality.SelectedValue.ToString(), contactNoCode, contactNo, 
                txt_email.Text, txt_passport_no.Text, txt_address.Text, txt_course_name.Text,reason_list,txt_acc_hold_name.Text,txt_bank_code.Text,txt_card_no.Text,txt_bank_name.Text,
                txt_address_account.Text,txt_swift_code.Text,txt_student_name.Text,save_signature,txt_sign_date.Text,"1");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Task.Run(() =>
                {
                    send_mail(ds);
                });
                Response.Redirect("Success.aspx");
            }

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

    public void send_mail(DataSet ds)
    {

        string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();

        ReportDocument rpt = new ReportDocument();
        try
        {

            if (ds.Tables.Count > 0)
            {

                ds.Tables[0].Rows[0]["student_signature"] = Server.MapPath("/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"].ToString();
                rpt.Load(Server.MapPath("RPT/RPT_Refund_Form.rpt"));

                rpt.Database.Tables["dt_refund_form"].SetDataSource(ds.Tables[0]);

                string name = "New Refund Form";

                Stream ach_stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                Attachment ach_attachment = new Attachment(ach_stream, name + ".pdf", "application/pdf");

                // Dispose of the report
                rpt.Close();
                rpt.Dispose();

                string subject = "New Refund Form (" + ds.Tables[0].Rows[0]["first_name"].ToString() + ")";
                string mail_body = get_email_body();
                string result = Send_Mail.SendMail("himanshumakwana8281@gmail.com", subject, mail_body, ach_attachment, "", "");

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
            <div class='title'>English Test</div>
            <div class='content'>
                <p>Dear team,</p>
                <p>Please find the attached Student Refund Form acknowledgement for Nortwest.</p>
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