using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class course_entry_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                txt_sign_date.Text = System.DateTime.UtcNow.ToString("yyyy-MM-dd");
            }

        }
        catch (Exception)
        {

            throw;
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

        // Securely store the correct answer
        HttpContext.Current.Session["CaptchaResult"] = result.ToString();

        // Using String.Format instead of $ interpolation
        string captchaText = String.Format("{0} {1} {2} = ?", num1, operatorStr, num2);

        using (Bitmap bitmap = new Bitmap(150, 50))
        {
            using (Graphics g = Graphics.FromImage(bitmap))
            {
                g.Clear(Color.FromArgb(249, 249, 249));

                // Add random noise lines to defeat simple bots
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
    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            string sessionCaptcha = Session["CaptchaResult"] != null ? Session["CaptchaResult"].ToString() : "";
            string userCaptcha = txt_captcha_input.Text.Trim();

            if (string.IsNullOrEmpty(userCaptcha) || userCaptcha != sessionCaptcha)
            {
                // Clear input and alert the user via Javascript
                txt_captcha_input.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "CaptchaError", "alert('Invalid Captcha Result. Please try again.'); generateCaptcha();", true);
                return;
            }

            // Clean out the session to prevent double submission exploits
            Session.Remove("CaptchaResult");
            string selectedCourse = "";

            foreach (ListItem item in ch_check_course.Items)
            {
                if (item.Selected)
                {
                    selectedCourse += item.Value + ", ";
                }
            }
            selectedCourse = selectedCourse.TrimEnd(',', ' ');


            string Select_learning_style = "";

            if (ch_check_visual_learning.Checked)
            {
                Select_learning_style += "Visual – Learn best through pictures, diagrams, watching etc.,";
            }

            if (ch_check_hands_on.Checked)
            {
                Select_learning_style += "Hands on – Learn best through practicing, role plays, simulations etc.,";
            }

            if (ch_check_handsreading.Checked)
            {
                Select_learning_style += "HandsReading – Learn best through research, reviewing textbooks, reading notes etc.,";
            }

            if (!string.IsNullOrEmpty(Select_learning_style))
            {
                Select_learning_style = Select_learning_style.TrimEnd(',');
            }


            // Answer 7
            string select_learning_material = "";

            foreach (ListItem item in ch_check_learning_material.Items)
            {
                if (item.Selected)
                {
                    select_learning_material += item.Value + ", ";
                }
            }

            if (ch_check_learning_other.Checked)
            {
                select_learning_material += "Other";
            }
            if (!string.IsNullOrEmpty(select_learning_material))
            {
                select_learning_material = select_learning_material.TrimEnd(',', ' ');
            }


            string select_support_values = "";

            foreach (ListItem item in ch_check_support.Items)
            {
                if (item.Selected)
                {
                    select_support_values += item.Value + ", ";
                }
            }

            if (ch_check_other_support.Checked)
            {
                select_support_values += "Other";
            }
            if (!string.IsNullOrEmpty(select_support_values))
            {
                select_support_values = select_support_values.TrimEnd(',', ' ');
            }


            //Answer 11


            //Answer 13


            // Answer 14
            string selecteditem = "";

            foreach (ListItem item in rb_approx_computer_use.Items)
            {
                if (item.Selected)
                {
                    selecteditem += item.Value + ", ";
                }
            }
            selecteditem = selecteditem.TrimEnd(',', ' ');

            //Answer 15

            string sel_login_pc = "";

            foreach (ListItem item in rb_login_pc.Items)
            {
                if (item.Selected)
                {
                    sel_login_pc += item.Value + ", ";
                }
            }

            sel_login_pc = sel_login_pc.TrimEnd(',', ' ');


            string sel_send_email = "";

            foreach (ListItem item in rb_send_email.Items)
            {
                if (item.Selected)
                {
                    sel_send_email += item.Value + ", ";
                }
            }

            sel_send_email = sel_send_email.TrimEnd(',', ' ');

            string sel_navigate_website = "";

            foreach (ListItem item in rb_navigate_website.Items)
            {
                if (item.Selected)
                {
                    sel_navigate_website += item.Value + ", ";
                }
            }
            sel_navigate_website = sel_navigate_website.TrimEnd(',', ' ');



            string sel_create_folder = "";

            foreach (ListItem item in rb_create_folder.Items)
            {
                if (item.Selected)
                {
                    sel_create_folder += item.Value + ", ";
                }
            }
            sel_create_folder = sel_create_folder.TrimEnd(',', ' ');



            string sel_find_information = "";

            foreach (ListItem item in rb_find_information.Items)
            {
                if (item.Selected)
                {
                    sel_find_information += item.Value;
                }
            }

            //
            string sel_attach_document = "";

            foreach (ListItem item in rb_attach_document.Items)
            {
                if (item.Selected)
                {
                    sel_attach_document += item.Value;
                }
            }

            string sel_save_email = "";

            foreach (ListItem item in rb_save_email.Items)
            {
                if (item.Selected)
                {
                    sel_save_email += item.Value;
                }
            }



            string sel_login_online_system = "";

            foreach (ListItem item in rb_login_online_system.Items)
            {
                if (item.Selected)
                {
                    sel_login_online_system += item.Value;
                }
            }


            //

            string sel_use_social_media = "";

            foreach (ListItem item in rb_use_social_media.Items)
            {
                if (item.Selected)
                {
                    sel_use_social_media += item.Value;
                }
            }






            //
            string sel_suitable_enroll = "";

            if (ch_check_course_outline.Checked)
            {
                sel_suitable_enroll += "Course outline including detailed information about the course and arrangements for delivery. ,";
            }

            if (ch_check_process_for_rpl.Checked)
            {
                sel_suitable_enroll += "Process for applying for RPL and Credit Transfers (where applicable). ,";
            }

            if (ch_check_hand_book.Checked)
            {
                sel_suitable_enroll += "Student Handbook. ,";
            }

            if (!string.IsNullOrEmpty(sel_suitable_enroll))
            {
                sel_suitable_enroll = sel_suitable_enroll.TrimEnd(',');
            }



            string doc_updated_cv = "";
            if (flu_updated_cv.HasFile)
            {
                // Get file extension
                string ext = System.IO.Path.GetExtension(flu_updated_cv.FileName);
                // Generate new unique filename
                doc_updated_cv = "CV_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ext;
                string save_path = Server.MapPath("image/student_doc/");
                flu_updated_cv.SaveAs(save_path + doc_updated_cv);
            }

            string doc_transcript = "";
            if (flu_applicant_transcripts.HasFile)
            {
                // Get file extension
                string ext = System.IO.Path.GetExtension(flu_applicant_transcripts.FileName);
                // Generate new unique filename
                doc_transcript = "Transcript_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ext;
                string save_path = Server.MapPath("image/student_doc/");
                flu_applicant_transcripts.SaveAs(save_path + doc_transcript);
            }


            string sign = SaveSignature();

            DataSet ds = BAL_Forms.ins_interview_form(txt_name.Text, txt_dob.Text, hd_contact_no_code.Value.ToString() + hd_contact_no.Value.ToString(), txt_email.Text, txt_std_id.Text, selectedCourse, txt_hope.Text,
                txt_career_goal.Text, txt_participated_course.Text, txt_course_related_exep.Text, txt_learning_style.Text, Select_learning_style, select_learning_material, txt_explain.Text,
                select_support_values, txt_explain_support.Text, rb_working_yes.Checked.ToString(), txt_workplace.Text, doc_updated_cv, rb_worked_industry_yes.Checked.ToString(), txt_outline_role.Text, rb_applied_rpl_yes.Checked.ToString(),
                txt_other_information.Text, rb_complete_any_course_yes.Checked.ToString(), doc_transcript, rb_regular_access_yes.Checked.ToString(), txt_discuss_solution.Text, selecteditem,
                rb_digital_literacy_yes.Checked.ToString(), txt_solution_strtegy.Text, txt_digital_test_score.Text, sel_login_pc, sel_send_email, sel_navigate_website,
                sel_create_folder, sel_find_information, sel_attach_document, sel_save_email,
                sel_login_online_system, sel_use_social_media, rb_candidate_suitale_yes.Checked.ToString(), rb_additonal_info.Checked.ToString(), txt_candidate_details.Text, txt_additional_support.Text, rb_appropriate_participate_yes.Checked.ToString(), txt_other_comments.Text, sel_suitable_enroll, txt_staff_member.Text, txt_position.Text, SaveSignature(), txt_sign_date.Text);

            if (ds.Tables.Count > 0)
            {
                send_mail(ds);
                RedirectAfterSubmit("courseentry");
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    public void send_mail(DataSet ds)
    {

        //string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();

        ReportDocument rpt = new ReportDocument();
        try
        {

            if (ds.Tables.Count > 0)
            {

                ds.Tables[0].Rows[0]["signature"] = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["signature"];


                string ack_cv = Server.MapPath("image/student_doc/") + ds.Tables[0].Rows[0]["updated_cv"];

                string ack_transcript = Server.MapPath("image/student_doc/") + ds.Tables[0].Rows[0]["transcripts"];

                string signatureData = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["signature"];

                rpt.Load(Server.MapPath("RPT/interview_form1.rpt"));
                rpt.Database.Tables["ds_interview_form"].SetDataSource(ds.Tables[0]);

                string name = ds.Tables[0].Rows[0]["name"].ToString();

                Stream ach_stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                Attachment ach_attachment = new Attachment(ach_stream, name + ".pdf", "application/pdf");

                string subject = "New Course Entry Form - " + txt_name.Text;

                //StringBuilder sb = new StringBuilder();
                //div_body.Visible = true;
                //div_body.RenderControl(new HtmlTextWriter(new StringWriter(sb)));
                //string body = sb.ToString();
                //div_body.Visible = false;

                string result = Send_Mail.send_course_entry("sso@nortwest.edu.au", subject, get_email_body(name), ach_attachment, signatureData, ack_cv, ack_transcript, "");

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



    protected void ch_check_learning_other_CheckedChanged(object sender, EventArgs e)
    {
        div_learning_other.Visible = ch_check_learning_other.Checked;
    }
    protected void ch_check_other_support_CheckedChanged(object sender, EventArgs e)
    {
        div_support_other.Visible = ch_check_other_support.Checked;
    }

    protected void rb_worked_industry_yes_CheckedChanged(object sender, EventArgs e)
    {
        div_worked_industry.Visible = false;
        div_worked_industry.Visible = rb_worked_industry_yes.Checked;
    }

    protected void rb_regular_access_no_CheckedChanged(object sender, EventArgs e)
    {
        //div_regular_access.Visible = false;
        //div_regular_access.Visible = rb_regular_access_no.Checked;
    }
    protected void rb_digital_literacy_no_CheckedChanged(object sender, EventArgs e)
    {
        //div_digital_literacy.Visible = false;
        //div_digital_literacy.Visible = rb_digital_literacy_no.Checked;
    }
    protected void rb_additonal_info_CheckedChanged(object sender, EventArgs e)
    {
        //div_candidate_suitable.Visible = false;
        //div_candidate_suitable.Visible = rb_additonal_info.Checked;
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
    public string get_email_body(string name)
    {
        try
        {
            string emailBody = @"<!DOCTYPE html>
<html>
<head>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Course Entry Interview Form</title>
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
           
            <div class='title'>Course Entry Interview Form</div>
            <div class='content'>
                <p>Dear Team,</p>
                <p>Please find attached the Course Entry Interview Form acknowledgement for Nortwest.</p>
                <p><b>Form Details:</b></p>
                <ul>
    <li>Submitted By: " + name + @"</li>
                    <li>Submission Date: " + DateTime.Now.ToString("dd MMM yyyy") + @"</li>
                
                </ul>
                <p>Kindly verify the details and keep this acknowledgement for your records. 
                If you require any additional information, Please find attached the Course Entry Interview Form.</p>
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

    private void RedirectAfterSubmit(string expectedStatus)
    {
        string status = Request.QueryString["status"];
        string key = BAL_OrientationAccess.GetAccessKeyFromRequest(
            Request.QueryString["k"],
            Request.QueryString["key"]);

        string returnUrl = BAL_OrientationAccess.TryGetReturnUrl(status, key, expectedStatus);
        if (!string.IsNullOrEmpty(returnUrl))
        {
            Response.Redirect(returnUrl);
            return;
        }

        Response.Redirect("Success.aspx");
    }

}
