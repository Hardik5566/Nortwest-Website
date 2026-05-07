using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Web.Services;
using System.Drawing;
using System.IO;

public partial class qualification_issuance__form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod(EnableSession = true)]
    public static string GetCaptchaImage()
    {
        Random rand = new Random();
        int num1 = rand.Next(1, 20);
        int num2 = rand.Next(1, 10);
        bool isAddition = rand.Next(0, 2) == 0;
        string operatorStr = isAddition ? "+" : "-";

        // Prevent negative results
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

                // Add random noise lines to defeat OCR bots
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
            string studentName = txtStudentName.Text.Trim();
            string studentId = txtStudentID.Text.Trim();
            string course = txtCourse.Text.Trim();
            string dateRequested = txtDateRequested.Text.Trim();

            // Collect documents selected
            string documents = "";
            if (ch_attainment.Checked)
                documents += "Statement of Attainment, ";
            if (ch_completion.Checked)
                documents += "Completion Letter, ";
            if (ch_relese.Checked)
                documents += "Release Letter, ";
            if (ch_term.Checked)
                documents += "Term Break Letter, ";
            if (ch_certificate.Checked)
                documents += "Certificate, ";
            if (ch_letter_enrol.Checked)
                documents += "Letter of Enrolment, ";
            if (ch_record.Checked)
                documents += "Academic Record, ";
            if (!string.IsNullOrEmpty(txt_other_document.Text.Trim()))
                documents += "Other: " + txt_other_document.Text.Trim() + ", ";

            // Insert form data
            DataSet ds = BAL_Forms.ins_qualification_issuance_form(
                   studentName,
                   studentId,
                   course,
                   dateRequested,
                   documents,
                   "1" // default status
               );

            if (ds.Tables[0].Rows.Count > 0)
            {

                Send_Mail.MailWithouAttachment(
                      "sso@nortwest.edu.au",
                      "Qualification Issuance Form (" + ds.Tables[0].Rows[0]["student_name"].ToString() + ")",
                      mailbody_qualification(
                          ds.Tables[0].Rows[0]["student_name"].ToString(),
                          ds.Tables[0].Rows[0]["std_id"].ToString(),
                          ds.Tables[0].Rows[0]["course"].ToString(),
                          ds.Tables[0].Rows[0]["date_request"].ToString(),
                          ds.Tables[0].Rows[0]["documents"].ToString()
                      ),
                      "",
                      ""
                  );
                Response.Redirect("Success.aspx");
            }
        }
        catch (Exception ex)
        {
            // Better error handling
            Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
        }
    }

    public string mailbody_qualification(
        string student_name,
        string std_id,
        string course,
        string date_request,
        string documents)
    {
        string html = @"
<div style='width:100%; background-color:#f0f0f0; padding:40px 0; font-family: Arial, Helvetica, sans-serif;'>
    <!-- Header -->
    <div style='text-align:center; margin-bottom:25px;'>
        <img src='https://nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160' style='margin-bottom:10px; display:block; margin-left:auto; margin-right:auto;' />
        <h2 style='margin:0; font-size:20px; font-weight:bold; color:#222;'>Qualification Issuance Form</h2>
    </div>

    <!-- Student Details -->
    <div style='width:85%; margin:0 auto 25px auto; background:#ffffff; border:1px solid #ddd; border-top:4px solid #008a7f;'>
        <table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse;'>
            <tr>
                <th colspan='2' align='left' style='background:#f9f9f9; font-size:16px; font-weight:bold; padding:14px 16px; border-bottom:2px solid #ddd; color:#222;'>Student Details</th>
            </tr>
            <tr>
                <td style='width:32%; font-weight:bold; padding:12px 16px; border-bottom:1px solid #e5e5e5;'>Student Name :</td>
                <td style='padding:12px 16px; border-bottom:1px solid #e5e5e5;'>" + student_name + @"</td>
            </tr>
            <tr>
                <td style='width:32%; font-weight:bold; padding:12px 16px; border-bottom:1px solid #e5e5e5;'>Student ID :</td>
                <td style='padding:12px 16px; border-bottom:1px solid #e5e5e5;'>" + std_id + @"</td>
            </tr>
            <tr>
                <td style='width:32%; font-weight:bold; padding:12px 16px;'>Course :</td>
                <td style='padding:12px 16px;'>" + course + @"</td>
            </tr>
        </table>
    </div>

    <!-- Request Details -->
    <div style='width:85%; margin:0 auto 25px auto; background:#ffffff; border:1px solid #ddd; border-top:4px solid #008a7f;'>
        <table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse;'>
            <tr>
                <th colspan='2' align='left' style='background:#f9f9f9; font-size:16px; font-weight:bold; padding:14px 16px; border-bottom:2px solid #ddd; color:#222;'>Request Details</th>
            </tr>
            <tr>
                <td style='width:32%; font-weight:bold; padding:12px 16px;'>Date of Request :</td>
                <td style='padding:12px 16px;'>" + date_request + @"</td>
            </tr>
        </table>
    </div>

    <!-- Documents Requested -->
    <div style='width:85%; margin:0 auto; background:#ffffff; border:1px solid #ddd; border-top:4px solid #008a7f;'>
        <table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse;'>
            <tr>
                <th colspan='2' align='left' style='background:#f9f9f9; font-size:16px; font-weight:bold; padding:14px 16px; border-bottom:2px solid #ddd; color:#222;'>Documents Requested</th>
            </tr>
            <tr>
                <td style='width:32%; font-weight:bold; padding:12px 16px;'>Documents :</td>
                <td style='padding:12px 16px;'>" + documents + @"</td>
            </tr>
        </table>
    </div>
</div>";
        return html;
    }


}
