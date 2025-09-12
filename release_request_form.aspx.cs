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

public partial class release_request_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_data();
            ddl_country.Items.Insert(0, new ListItem("Select Country", "0"));
        }

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            string save_signature = SaveSignature();
            DataSet ds = BAL_Forms.ins_release_request_form(txt_student_name.Text, txt_s_id.Text, ddl_country.SelectedValue.ToString(), txt_passport_no.Text, txt_dob.Text, txt_course_enroll.Text, txt_intake.Text, txt_address.Text, txt_email.Text, hd_contact_no_code.Value, hd_contact_no.Value, txt_reason_release.Text, save_signature, txt_sign_date.Text, "1");
            if (ds.Tables[0].Rows.Count > 0)
            {
                string signaturePath = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"].ToString();
                Task.Run(() =>
           {
               Send_Mail.MailWithouAttachment(
                     "sso@nortwest.edu.au",
                     "Release Request Form (" + ds.Tables[0].Rows[0]["student_name"].ToString() + ")",
                     mailbody(
                         ds.Tables[0].Rows[0]["student_name"].ToString(),
                         ds.Tables[0].Rows[0]["std_id"].ToString(),
                         ds.Tables[0].Rows[0]["country"].ToString(),
                         ds.Tables[0].Rows[0]["passport_no"].ToString(),
                         ds.Tables[0].Rows[0]["dob"].ToString(),
                         ds.Tables[0].Rows[0]["course_enrolled"].ToString(),
                         ds.Tables[0].Rows[0]["intake"].ToString(),
                         ds.Tables[0].Rows[0]["address"].ToString(),
                         ds.Tables[0].Rows[0]["email"].ToString(),
                         ds.Tables[0].Rows[0]["country_code"].ToString(),
                         ds.Tables[0].Rows[0]["contact_no"].ToString(),
                         ds.Tables[0].Rows[0]["reason_for_release"].ToString(),
                         ds.Tables[0].Rows[0]["student_signature"].ToString(),
                         ds.Tables[0].Rows[0]["sign_date"].ToString()
                     ),
                     "",
                     signaturePath
                 );
           });
                Response.Redirect("Success.aspx");
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
    public string mailbody(
    string student_name, string student_id, string country, string passport_no, string dob,
    string course_enrolled, string intake, string address, string email, string country_code,
    string contact_no, string reason_for_release, string student_signature, string sign_date)
    {
        string html = @"
<div style='width:100%; background-color:#f0f0f0; padding:40px 0; font-family: Arial, Helvetica, sans-serif;'>
    <!-- Header -->
    <div style='text-align:center; margin-bottom:25px;'>
        <img src='https://website.nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160' style='margin-bottom:10px; display:block; margin-left:auto; margin-right:auto;' />
        <h2 style='margin:0; font-size:20px; font-weight:bold; color:#222;'>Release Request Form</h2>
    </div>

    <!-- Student Details -->
    <div style='width:85%; margin:0 auto 25px auto; background:#ffffff; border:1px solid #ddd; border-top:4px solid #008a7f;'>
        <table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse;'>
            <tr>
                <th colspan='2' align='left' style='background:#f9f9f9; font-size:16px; font-weight:bold; padding:14px 16px; border-bottom:2px solid #ddd; color:#222;'>Student Details</th>
            </tr>
            <tr><td style='width:32%; font-weight:bold; padding:12px 16px; border-bottom:1px solid #e5e5e5;'>Student Name :</td><td style='padding:12px 16px; border-bottom:1px solid #e5e5e5;'>" + student_name + @"</td></tr>
            <tr><td style='width:32%; font-weight:bold; padding:12px 16px; border-bottom:1px solid #e5e5e5;'>Student ID :</td><td style='padding:12px 16px; border-bottom:1px solid #e5e5e5;'>" + student_id + @"</td></tr>
            <tr><td style='width:32%; font-weight:bold; padding:12px 16px; border-bottom:1px solid #e5e5e5;'>Country :</td><td style='padding:12px 16px; border-bottom:1px solid #e5e5e5;'>" + country + @"</td></tr>
            <tr><td style='width:32%; font-weight:bold; padding:12px 16px; border-bottom:1px solid #e5e5e5;'>Passport No :</td><td style='padding:12px 16px; border-bottom:1px solid #e5e5e5;'>" + passport_no + @"</td></tr>
            <tr><td style='width:32%; font-weight:bold; padding:12px 16px; border-bottom:1px solid #e5e5e5;'>Date of Birth :</td><td style='padding:12px 16px; border-bottom:1px solid #e5e5e5;'>" + dob + @"</td></tr>
            <tr><td style='width:32%; font-weight:bold; padding:12px 16px; border-bottom:1px solid #e5e5e5;'>Course Enrolled :</td><td style='padding:12px 16px; border-bottom:1px solid #e5e5e5;'>" + course_enrolled + @"</td></tr>
            <tr><td style='width:32%; font-weight:bold; padding:12px 16px;'>Intake Date :</td><td style='padding:12px 16px;'>" + intake + @"</td></tr>
        </table>
    </div>

    <!-- Contact Details -->
    <div style='width:85%; margin:0 auto 25px auto; background:#ffffff; border:1px solid #ddd; border-top:4px solid #008a7f;'>
        <table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse;'>
            <tr>
                <th colspan='2' align='left' style='background:#f9f9f9; font-size:16px; font-weight:bold; padding:14px 16px; border-bottom:2px solid #ddd; color:#222;'>Contact Details in Australia</th>
            </tr>
            <tr><td style='width:32%; font-weight:bold; padding:12px 16px; border-bottom:1px solid #e5e5e5;'>Address :</td><td style='padding:12px 16px; border-bottom:1px solid #e5e5e5;'>" + address + @"</td></tr>
            <tr><td style='width:32%; font-weight:bold; padding:12px 16px; border-bottom:1px solid #e5e5e5;'>Email :</td><td style='padding:12px 16px; border-bottom:1px solid #e5e5e5;'>" + email + @"</td></tr>
            <tr><td style='width:32%; font-weight:bold; padding:12px 16px;'>Contact No :</td><td style='padding:12px 16px;'>" + country_code + " " + contact_no + @"</td></tr>
        </table>
    </div>

    <!-- Reason for Release -->
    <div style='width:85%; margin:0 auto; background:#ffffff; border:1px solid #ddd; border-top:4px solid #008a7f;'>
        <table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse;'>
            <tr>
                <th colspan='2' align='left' style='background:#f9f9f9; font-size:16px; font-weight:bold; padding:14px 16px; border-bottom:2px solid #ddd; color:#222;'>Reason for Release</th>
            </tr>
            <tr><td style='width:32%; font-weight:bold; padding:12px 16px; border-bottom:1px solid #e5e5e5;'>Reason :</td><td style='padding:12px 16px; border-bottom:1px solid #e5e5e5;'>" + reason_for_release + @"</td></tr>
            <tr><td style='width:32%; font-weight:bold; padding:12px 16px;'>Date :</td><td style='padding:12px 16px;'>" + sign_date + @"</td></tr>
        </table>
    </div>
</div>";
        return html;
    }

}