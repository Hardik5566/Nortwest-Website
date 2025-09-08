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

public partial class Change_course_form : System.Web.UI.Page
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
            DataSet ds = BAL_Forms.ins_change_course_form(txt_student_name.Text, txt_s_id.Text, ddl_country.SelectedValue.ToString(), txt_passport_no.Text, txt_dob.Text, txt_course_enroll.Text, txt_intake.Text, txt_address.Text, txt_email.Text, hd_contact_no_code.ToString(), hd_contact_no.ToString(), txt_course_change.Text, txt_reason_campus.Text, save_signature, txt_sign_date.Text, "1");
            if (ds.Tables[0].Rows.Count > 0)
            {
                string signaturePath = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"].ToString();
                Task.Run(() =>
           {
               Send_Mail.MailWithouAttachment(
                     "himanshumakwana8281@gmail.com",
                     "New Application for Change of Course Form (" + ds.Tables[0].Rows[0]["student_name"].ToString() + ")",
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
                         ds.Tables[0].Rows[0]["change_course"].ToString(),
                         ds.Tables[0].Rows[0]["reason_change_course"].ToString(),
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
    public string mailbody(string student_name, string student_id, string country, string passport_no, string dob, string course_enrolled, string intake, string address, string email, string country_code, string contact_no, string change_course, string reason_change_course, string student_signature, string sign_date)
    {
        string html = @"
<div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px'>
                <div style='width: 100%; text-align: center; margin-bottom: 15px'>
                    <img src='https://website.nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160px' />
                    <h2 style='text-align: center'>Change Of Course Form</h2>
                </div>
                <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>

                    <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
                        <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                            <th colspan='2' style='padding: 10px'>
                                <label style='font-size: 20px; padding-bottom: 10px; color: black'>Student details</label>
                            </th>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black; width: 50%'>Student Name</td>
                            <td><label>" + student_name + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Student ID</td>
                            <td><label>" + student_id + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Country</td>
                            <td><label>" + country + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Passport No</td>
                            <td><label>" + passport_no + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Date of Birth</td>
                            <td><label>" + dob + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Course Enrolled</td>
                            <td><label>" + course_enrolled + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Intake Date</td>
                            <td><label>" + intake + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Address</td>
                            <td><label>" + address + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Email</td>
                            <td><label>" + email + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Contact No</td>
                            <td><label>" + country_code + " " + contact_no + @"</label></td>
                        </tr>
                    </table>
                </div>

                <div style='margin-left: auto; margin-right: auto; width: 85%; margin-top: 30px; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>
                    <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <th colspan='2' style='padding: 10px'>
                                <label style='font-size: 20px; color: black'>Change of Course Details</label>
                            </th>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Change To Course</td>
                            <td><label>" + change_course + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Reason For Change</td>
                            <td><label>" + reason_change_course + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Student Signature</td>
                            <td><label>" + student_signature + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Sign Date</td>
                            <td><label>" + sign_date + @"</label></td>
                        </tr>
                    </table>
                </div>
            </div>";
        return html;
    }
}