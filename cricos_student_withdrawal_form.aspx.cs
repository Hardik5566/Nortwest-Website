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
using System.Net.Mail;
using System.Threading.Tasks;

public partial class cricos_student_withdrawal_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            string save_signature = SaveSignature();
            DataSet ds = BAL_Forms.ins_cricos_student_withdrawal_form(txt_f_name.Text, txt_l_name.Text, txt_date.Text, txt_student_id.Text, txt_course.Text, txt_subsequent.Text, txt_reason.Text, save_signature, txt_sign_date.Text, "1");
            if (ds.Tables.Count > 0)
            {
                string full_name = ds.Tables[0].Rows[0]["first_name"].ToString() + " " + ds.Tables[0].Rows[0]["last_name"].ToString();
                string signaturePath = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"].ToString();
                Task.Run(() =>
           {

               Send_Mail.MailWithouAttachment("himanshumakwana8281@gmail.com", "New Cricos Student Withdraw Form (" + full_name + ")", mailbody(ds.Tables[0].Rows[0]["first_name"].ToString(), ds.Tables[0].Rows[0]["last_name"].ToString(), ds.Tables[0].Rows[0]["withdraw_date"].ToString(), ds.Tables[0].Rows[0]["student_id"].ToString(), ds.Tables[0].Rows[0]["current_course"].ToString(), ds.Tables[0].Rows[0]["subsequent_course"].ToString(), ds.Tables[0].Rows[0]["reason_for_withdrawal"].ToString(), ds.Tables[0].Rows[0]["student_signature"].ToString(), ds.Tables[0].Rows[0]["sign_date"].ToString()), "", signaturePath);
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

    public string mailbody(string f_name, string l_name, string date, string std_id, string current_course, string sub_course, string withdraw_reason, string signature, string sign_date)
    {
        string html = @"
<div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px'>
    <div style='width: 100%; text-align: center; margin-bottom: 15px'>
        <img src='https://website.nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160px' />
        <h2 style='text-align: center'>CRICOS Student Withdrawal Form</h2>
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
                <td style='padding: 10px; color: black; width: 50%'>First Name:</td>
                <td>
                    <label>" + f_name + @"</lable>
                </td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Last Name:</td>
                <td>
                    <label>" + l_name + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Date:</td>
                <td>
                    <label>" + date + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Student ID:</td>
                <td>
                    <label>" + std_id + @"</lable>
                </td>
            </tr>

        </table>
    </div>

    <div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px 50px 0px'>
        <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>

            <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <th colspan='2' style='padding: 10px'>
                        <label style='font-size: 20px; padding-bottom: 10px; color: black'>Course withdrawal details</label>
                           <p style='color: #000000;font-weight: 500;'>Course(s) currently enrolled and want to withdraw:(If the student wants to withdraw from all the subsequent courses enrolled with the Institute, he/she should list the courses below.)</p>
                    </th>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Current Course:</div>
                    <label>" + current_course + @"</lable>

                    </td>
                </tr>

                 <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Subsequent Course(s):</div>
                    <label>" + sub_course + @"</lable>

                    </td>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Reason for withdrawal</div>
                    <label>" + withdraw_reason + @"</lable>
                    </td>
                </tr>
<tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Signature Date</div>
                    <label>" + sign_date + @"</lable>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>";


        return html;

    }

}