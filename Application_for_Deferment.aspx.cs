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
using System.Threading.Tasks;


public partial class Application_for_Deferment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {

        try
        {

            List<string> selectedCourses = new List<string>();

            if (CheckBox1.Checked)
            {
                selectedCourses.Add("BSB50120 - Diploma of Business");
            }

            if (CheckBox2.Checked)
            {
                selectedCourses.Add("BSB60120 - Advanced Diploma of Business");
            }

            string courses = string.Join(", ", selectedCourses);

            string save_signature = SaveSignature();
            DataSet ds = BAL_Forms.ins_application_for_deferment_form(txt_f_name.Text, txt_id.Text, txt_date.Text, courses, txt_reason.Text, txt_enrolment.Text, txt_addrsess_leave.Text, txt_email.Text, hd_contact_no_code.Value.ToString(), hd_contact_no.Value.ToString(), hd_mobile_no_code.Value.ToString(), hd_mobile_no.Value.ToString(), save_signature, txt_sign_date.Text, "1");



            if (ds.Tables.Count > 0)
            {
                string signaturePath = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"].ToString();
                Task.Run(() =>
                {

                    Send_Mail.MailWithouAttachment("himanshumakwana8281@gmail.com", "New Application for Deferment / Suspension Form (" + ds.Tables[0].Rows[0]["student_name"].ToString() + ")", mailbody(ds.Tables[0].Rows[0]["student_name"].ToString(), ds.Tables[0].Rows[0]["student_id"].ToString(), ds.Tables[0].Rows[0]["deferment_date"].ToString(), ds.Tables[0].Rows[0]["course"].ToString(), ds.Tables[0].Rows[0]["reason"].ToString(), ds.Tables[0].Rows[0]["enrolment_until"].ToString(), ds.Tables[0].Rows[0]["address_while_on_leave"].ToString(), ds.Tables[0].Rows[0]["email"].ToString(), ds.Tables[0].Rows[0]["phone_code"].ToString() + ds.Tables[0].Rows[0]["phone_no"].ToString(), ds.Tables[0].Rows[0]["contact_code"].ToString() + ds.Tables[0].Rows[0]["contact_no"].ToString(), ds.Tables[0].Rows[0]["sign_date"].ToString()), "", signaturePath);
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

    public string mailbody(string student_name, string student_id, string deferment_date, string course, string reason, string enrolment_until, string address_while_on_leave, string email, string contact_no, string mobile_no, string sign_date)
    {
        string html = @"
<div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px'>
    <div style='width: 100%; text-align: center; margin-bottom: 15px'>
        <img src='https://website.nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160px' />
        <h2 style='text-align: center'>Application for Deferment / Suspension Form</h2>
    </div>
    <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>

        <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
            <tr></tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <th colspan='2' style='padding: 10px'>
                    <label style='font-size: 20px; padding-bottom: 10px; color: black'>Student details</label>
                </th>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black; width: 50%'>Student Name</td>
                <td>
                    <label>" + student_name + @"</lable>
                </td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Student ID</td>
                <td>
                    <label>" + student_id + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Date</td>
                <td>
                    <label>" + deferment_date + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Course</td>
                <td>
                    <label>" + course + @"</lable>
                </td>
            </tr>
               <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>I wish to defer / suspend my studies for the following reason/s:</td>
                <td>
                    <label>" + reason + @"</lable>
                </td>
            </tr>
             <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>I wish to defer / suspend my enrolment until (insert date):</td>
                <td>
                    <label>" + enrolment_until + @"</lable>
                </td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Address while on leave:</td>
                <td>
                    <label>" + address_while_on_leave + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Email ID :</td>
                <td>
                    <label>" + email + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Student Contact Number</td>
                <td>
                    <label>" + contact_no + @"</lable>
                </td>
            </tr>
              <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Mobile</td>
                <td>
                    <label>" + mobile_no + @"</lable>
                </td>
            </tr>
 <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Sign Date</td>
                <td>
                    <label>" + sign_date + @"</lable>
                </td>
            </tr>
        </table>
    </div>

   
</div>";


        return html;

    }

}