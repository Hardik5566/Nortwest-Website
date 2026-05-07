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
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using System.Threading.Tasks;
using System.Web.Services;
using System.Drawing.Drawing2D;

public partial class new_elicos_orientation_form : System.Web.UI.Page
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
            string selected_valuea = selected_value1();
            string selected_valueb = selected_value2();
            string selected_valuec = selected_value3();
            string selected_valued = selected_value4();
            string selected_valuee = selected_value5();
            string selected_valuef = selected_value6();

            string selected_valueh = select_1();
            string selected_valuei = select_2();
            string save_signature = SaveSignature();
            string contactNoCode = hd_contact_no_code.Value;  // Hidden field value for contact code
            string contactNo = hd_contact_no.Value;
            string file_name = "";
            if (upd_id_card.HasFile)
            {
                file_name = upd_id_card.FileName.ToString();
                string save_path = Server.MapPath("~/assets/img/document/");
                upd_id_card.SaveAs(save_path + file_name);
            }

            DataSet ds = BAL_Forms.ins_tbl_new_elicos_orientation_form(txt_f_name.Text, ddl_campus.SelectedValue.ToString(), file_name, txt_email.Text, contactNoCode, contactNo, txt_student_id.Text, txt_aus_address.Text,
                txt_over_address.Text, selected_valuea, selected_valueb, selected_valuec, selected_valued,
                selected_valuee, selected_valuef, txt_name.Text, save_signature, "1");
            if (ds.Tables[0].Rows.Count > 0)
            {
                send_mail(ds);
                Response.Redirect("Success.aspx");
            }

        }
        catch (Exception)
        {
            throw;
        }
    }
    public string selected_value1()
    {
        string selectedValue = string.Empty;
        if (RadioButton1.Checked)
        {
            selectedValue = RadioButton1.Text;
        }
        else if (RadioButton2.Checked)
        {
            selectedValue = RadioButton2.Text;
        }
        else if (RadioButton3.Checked)
        {
            selectedValue = RadioButton3.Text;
        }
        else if (RadioButton4.Checked)
        {
            selectedValue = RadioButton4.Text;
        }
        if (string.IsNullOrEmpty(selectedValue))
        {
            selectedValue = "";
        }
        return selectedValue;
    }


    public string selected_value2()
    {
        string selectedValue = string.Empty;
        if (RadioButton5.Checked)
        {
            selectedValue = RadioButton5.Text;
        }
        else if (RadioButton6.Checked)
        {
            selectedValue = RadioButton6.Text;
        }
        else if (RadioButton7.Checked)
        {
            selectedValue = RadioButton7.Text;
        }
        else if (RadioButton8.Checked)
        {
            selectedValue = RadioButton8.Text;
        }
        if (string.IsNullOrEmpty(selectedValue))
        {
            selectedValue = "";
        }
        return selectedValue;
    }

    public string selected_value3()
    {
        string selectedValue = string.Empty;
        if (RadioButton9.Checked)
        {
            selectedValue = RadioButton9.Text;
        }

        else if (RadioButton10.Checked)
        {
            selectedValue = RadioButton10.Text;
        }
        else if (RadioButton11.Checked)
        {
            selectedValue = RadioButton11.Text;
        }
        else if (RadioButton12.Checked)
        {
            selectedValue = RadioButton12.Text;
        }
        if (string.IsNullOrEmpty(selectedValue))
        {
            selectedValue = "";
        }
        return selectedValue;
    }
    public string selected_value4()
    {
        string selectedValue = string.Empty;
        if (RadioButton13.Checked)
        {
            selectedValue = RadioButton13.Text;
        }


        if (string.IsNullOrEmpty(selectedValue))
        {
            selectedValue = "";
        }
        return selectedValue;
    }
    public string selected_value5()
    {
        string selectedValue = string.Empty;
        if (RadioButton14.Checked)
        {
            selectedValue = RadioButton14.Text;
        }

        else if (RadioButton15.Checked)
        {
            selectedValue = RadioButton15.Text;
        }
        else if (RadioButton16.Checked)
        {
            selectedValue = RadioButton16.Text;
        }

        if (string.IsNullOrEmpty(selectedValue))
        {
            selectedValue = "";
        }
        return selectedValue;
    }
    public string selected_value6()
    {
        string selectedValue = string.Empty;
        if (RadioButton17.Checked)
        {
            selectedValue = RadioButton17.Text;
        }

        else if (RadioButton18.Checked)
        {
            selectedValue = RadioButton18.Text;
        }
        else if (RadioButton19.Checked)
        {
            selectedValue = RadioButton19.Text;
        }

        if (string.IsNullOrEmpty(selectedValue))
        {
            selectedValue = "";
        }
        return selectedValue;
    }




    public string select_1()
    {
        // Create a variable to store the selected checkbox texts
        string selectedOptions = "";

        // Check if CheckBox1 is checked and append the Text to the variable
        if (CheckBox1.Checked)
        {
            selectedOptions += CheckBox1.Text + ", ";
        }

        // Check if CheckBox2 is checked and append the Text to the variable
        if (CheckBox2.Checked)
        {
            selectedOptions += CheckBox2.Text + ", ";
        }

        // If there are selected options, remove the trailing comma and space
        if (!string.IsNullOrEmpty(selectedOptions))
        {
            selectedOptions = selectedOptions.TrimEnd(',', ' ');
        }

        // At this point, 'selectedOptions' holds the concatenated texts of the checked options.
        // You can store or display this variable as needed
        return selectedOptions;
    }
    public string select_2()
    {
        // Create a variable to store the selected checkbox texts
        string selectedOptions = "";

        // Check each checkbox and append the Text if checked
        if (CheckBox3.Checked)
        {
            selectedOptions += CheckBox3.Text + ", ";
        }

        if (CheckBox4.Checked)
        {
            selectedOptions += CheckBox4.Text + ", ";
        }

        if (CheckBox5.Checked)
        {
            selectedOptions += CheckBox5.Text + ", ";
        }

        if (CheckBox6.Checked)
        {
            selectedOptions += CheckBox6.Text + ", ";
        }

        if (CheckBox7.Checked)
        {
            selectedOptions += CheckBox7.Text + ", ";
        }

        if (CheckBox8.Checked)
        {
            selectedOptions += CheckBox8.Text + ", ";
        }

        if (CheckBox9.Checked)
        {
            selectedOptions += CheckBox9.Text + ", ";
        }

        if (CheckBox10.Checked)
        {
            selectedOptions += CheckBox10.Text + ", ";
        }

        if (CheckBox13.Checked)
        {
            selectedOptions += CheckBox13.Text + ", ";
        }

        if (CheckBox12.Checked)
        {
            selectedOptions += CheckBox12.Text + ", ";
        }

        if (CheckBox11.Checked)
        {
            selectedOptions += CheckBox11.Text + ", ";
        }

        // If there are selected options, remove the trailing comma and space
        if (!string.IsNullOrEmpty(selectedOptions))
        {
            selectedOptions = selectedOptions.TrimEnd(',', ' ');
        }

        // At this point, 'selectedOptions' holds the concatenated texts of the checked options.
        // You can store or display this variable as needed
        return selectedOptions;
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

        //string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();

        ReportDocument rpt = new ReportDocument();
        try
        {

            if (ds.Tables.Count > 0)
            {

                string stu_photo = Server.MapPath("assets/img/document/") + ds.Tables[0].Rows[0]["student_id_card"];

                ds.Tables[0].Rows[0]["student_signature"] = Server.MapPath("assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"];
                ds.Tables[0].Rows[0]["student_id_card"] = Server.MapPath("assets/img/document/") + ds.Tables[0].Rows[0]["student_id_card"];

                rpt.Load(Server.MapPath("RPT/RPT_elicos_orientation_form.rpt"));
                rpt.Database.Tables["dt_elicos_orientation"].SetDataSource(ds.Tables[0]);

                string name = "New Elicos Enrolment form";

                Stream ach_stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                Attachment ach_attachment = new Attachment(ach_stream, name + ".pdf", "application/pdf");




                //using (Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat))
                //{
                //    // Set the response headers
                //    Response.Clear();
                //    Response.Buffer = true;
                //    Response.ContentType = "application/pdf";
                //    Response.AddHeader("Content-Disposition", "attachment; filename=" + subject + ".pdf");
                //    Response.AddHeader("Content-Length", pdfStream.Length.ToString());

                //    // Write the stream to the response
                //    pdfStream.CopyTo(Response.OutputStream);
                //    Response.Flush();
                //    Response.End();
                //}

                // Dispose of the report
                rpt.Close();
                rpt.Dispose();

                string subject = "Orientation Form For New Elicos Student (" + ds.Tables[0].Rows[0]["student_full_name"].ToString() + "-" + ds.Tables[0].Rows[0]["student_id_no"].ToString() + ")";
                string mail_body = get_email_body(ds.Tables[0].Rows[0]["student_full_name"].ToString());
                string result = Send_Mail.SendMail("englishsso@nortwest.edu.au", subject, mail_body, ach_attachment, "", stu_photo);

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

    public string get_email_body(string name)
    {
        try
        {
            string emailBody = @"
<!DOCTYPE html>
<html>
<head>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Elicos Oreintation Form
</title>
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
           
            <div class='title'>Elicos Oreintation Form</div>
            <div class='content'>
                <p>Dear Team,</p>
                <p>Please find attached the Elicos Oreintation Form acknowledgement for Nortwest.</p>
                <p><b>Form Details:</b></p>
                <ul>
    <li>Submitted By: " + name + @"</li>
                    <li>Submission Date: " + DateTime.Now.ToString("dd MMM yyyy") + @"</li>
                
                </ul>
                <p>Kindly verify the details and keep this acknowledgement for your records. 
                If you require any additional information,Please find attached the Elicos Oreintation Form.</p>
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