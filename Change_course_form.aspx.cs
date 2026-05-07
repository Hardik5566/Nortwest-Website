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
using System.Web.Services;

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
    [WebMethod(EnableSession = true)]
    public static string GetCaptchaImage()
    {
        Random rand = new Random();
        int num1 = rand.Next(1, 20);
        int num2 = rand.Next(1, 10);
        bool isAddition = rand.Next(0, 2) == 0;
        string operatorStr = isAddition ? "+" : "-";

        if (!isAddition && num1 < num2)
        {
            int temp = num1;
            num1 = num2;
            num2 = temp;
        }

        int result = isAddition ? (num1 + num2) : (num1 - num2);

        // Securely store the correct answer in the active Session
        HttpContext.Current.Session["CaptchaResult"] = result.ToString();

        string captchaText = String.Format("{0} {1} {2} = ?", num1, operatorStr, num2);

        using (Bitmap bitmap = new Bitmap(150, 50))
        {
            using (Graphics g = Graphics.FromImage(bitmap))
            {
                g.Clear(Color.FromArgb(249, 249, 249));

                // Add random noise lines to defeat simple OCR bots
                Pen pen = new Pen(Color.FromArgb(204, 204, 204));
                for (int i = 0; i < 6; i++)
                {
                    g.DrawLine(pen, rand.Next(0, 150), rand.Next(0, 50), rand.Next(0, 150), rand.Next(0, 50));
                }

                using (Font font = new Font("Arial", 16, FontStyle.Bold))
                {
                    g.DrawString(captchaText, font, Brushes.Black, new PointF(10, 12));
                }
            }

            using (MemoryStream ms = new MemoryStream())
            {
                bitmap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                byte[] imageBytes = ms.ToArray();
                return "data:image/png;base64," + Convert.ToBase64String(imageBytes);
            }
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            string sessionCaptcha = Session["CaptchaResult"] != null ? Session["CaptchaResult"].ToString() : "";
            string userCaptcha = txt_captcha_input.Text.Trim();
            if (string.IsNullOrEmpty(userCaptcha) || userCaptcha != sessionCaptcha)
            {
                txt_captcha_input.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "CaptchaError", "alert('Invalid Captcha Code. Please try again.'); generateCaptcha();", true);
                return;
            }
            Session.Remove("CaptchaResult");
            string save_signature = SaveSignature();
            DataSet ds = BAL_Forms.ins_change_course_form(txt_student_name.Text, txt_s_id.Text, ddl_country.SelectedValue.ToString(), txt_passport_no.Text, txt_dob.Text, txt_course_enroll.Text, txt_intake.Text, txt_address.Text, txt_email.Text, hd_contact_no_code.Value.ToString(), hd_contact_no.Value.ToString(), txt_course_change.Text, txt_reason_campus.Text, save_signature, txt_sign_date.Text, "1");
            if (ds.Tables[0].Rows.Count > 0)
            {
                string signaturePath = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"].ToString();

                Send_Mail.MailWithouAttachment(
                      "sso@nortwest.edu.au",
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
    string student_name, string student_id, string country, string passport_no,
    string dob, string course_enrolled, string intake, string address,
    string email, string country_code, string contact_no,
    string change_course, string reason_change_course,
    string student_signature, string sign_date)
    {
        string html = @"
<div style='width:100%; background-color:#f0f0f0; padding:50px 0;'>
    <div style='width:100%; text-align:center; margin-bottom:15px;'>
        <img src='https://nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160' />
        <h2 style='text-align:center; margin:10px 0; font-size:22px; color:#000;'>Change Of Course Form</h2>
    </div>

    <!-- Student Details Section -->
    <div style='margin:0 auto; width:85%; background-color:#fff; border-top:3px solid #008a7f; border-bottom:3px solid #008a7f;'>
        <table style='border-collapse:collapse; width:100%; font-family:Arial, sans-serif; font-size:14px;'>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <th colspan='2' style='padding:12px; text-align:left; font-size:18px; color:#000;'>Student Details</th>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; width:40%; color:#000;'>Student Name</td>
                <td style='padding:10px;'>" + student_name + @"</td>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; color:#000;'>Student ID</td>
                <td style='padding:10px;'>" + student_id + @"</td>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; color:#000;'>Country</td>
                <td style='padding:10px;'>" + country + @"</td>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; color:#000;'>Passport No</td>
                <td style='padding:10px;'>" + passport_no + @"</td>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; color:#000;'>Date of Birth</td>
                <td style='padding:10px;'>" + dob + @"</td>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; color:#000;'>Course Enrolled</td>
                <td style='padding:10px;'>" + course_enrolled + @"</td>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; color:#000;'>Intake Date</td>
                <td style='padding:10px;'>" + intake + @"</td>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; color:#000;'>Address</td>
                <td style='padding:10px;'>" + address + @"</td>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; color:#000;'>Email</td>
                <td style='padding:10px;'>" + email + @"</td>
            </tr>
            <tr>
                <td style='padding:10px; color:#000;'>Contact No</td>
                <td style='padding:10px;'>" + country_code + " " + contact_no + @"</td>
            </tr>
        </table>
    </div>

    <!-- Change of Course Section -->
    <div style='margin:30px auto 0 auto; width:85%; background-color:#fff; border-top:3px solid #008a7f; border-bottom:3px solid #008a7f;'>
        <table style='border-collapse:collapse; width:100%; font-family:Arial, sans-serif; font-size:14px;'>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <th colspan='2' style='padding:12px; text-align:left; font-size:18px; color:#000;'>Change of Course Details</th>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; width:40%; color:#000;'>Change To Course</td>
                <td style='padding:10px;'>" + change_course + @"</td>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; color:#000;'>Reason For Change</td>
                <td style='padding:10px;'>" + reason_change_course + @"</td>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; color:#000;'>Student Signature</td>
                <td style='padding:10px;'>" + student_signature + @"</td>
            </tr>
            <tr>
                <td style='padding:10px; color:#000;'>Sign Date</td>
                <td style='padding:10px;'>" + sign_date + @"</td>
            </tr>
        </table>
    </div>
</div>";
        return html;
    }

}