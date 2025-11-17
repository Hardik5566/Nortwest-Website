using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;
using System.Net.Mail;
using CrystalDecisions.Shared;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = BAL_Forms.sel_ept_form("451");
            send_mail(ds);
        }

        //if (Request.HttpMethod == "POST" && Request.Files.Count > 0)
        //{
        //    try
        //    {
        //        string savePath = Server.MapPath("Recoding/");
        //        if (!Directory.Exists(savePath))
        //            Directory.CreateDirectory(savePath);

        //        for (int i = 0; i < Request.Files.Count; i++)
        //        {
        //            HttpPostedFile file = Request.Files[i];
        //            if (file.ContentLength > 0)
        //            {
        //                string filename = Path.GetFileName(file.FileName);
        //                string fullPath = Path.Combine(savePath, filename);
        //                file.SaveAs(fullPath);
        //            }
        //        }


        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }

        //}




    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    string file_name = "";
        //    if (upd_pass.HasFile)
        //    {
        //        string ext = Path.GetExtension(upd_pass.FileName);

        //        file_name = "Passport_" + DateTime.Now.ToString("yyyyMMdd_HHmmss") + ext;

        //        string savePath = Server.MapPath("/Uploads/") + file_name;

        //        upd_pass.SaveAs(savePath);
        //    }
        //    string check = "False";
        //    if (ch_consent.Checked)
        //    {
        //        check = "True";
        //    }
        //    string country_code = hd_contact_no_code.Value.ToString();
        //    string contact_number = hd_contact_no.Value.ToString();
        //    string save_sign_1 = SaveSignature1();
        //    string save_sign = SaveSignature();
        //    string quelification = ddl_course.SelectedValue.ToString();
        //    DataSet ds = BAL_Forms.ins_lln_test(txt_name.Text, txt_std_id.Text, country_code + contact_number, txt_email.Text, quelification, ddl_test_place.SelectedValue.ToString(), txt_dob.Text, ddl_nationality.SelectedValue.ToString(), txt_pass_no.Text, file_name, txt_date_of_test.Text, save_sign_1, hdn_audio1.Value, txt_ans_1.Text, hdn_audio2.Value, hdn_audio3.Value, hdn_audio4.Value, txt_ex_lern_test.Text, txt_most_like_lern.Text, txt_least_like_lern.Text, txt_learning_new_skill.Text, txt_current_skill.Text, txt_product_strategy.Text, txt_read_past.Text, txt_article_purpose.Text, txt_type_of_network.Text, txt_facebook_content.Text, txt_writer_article.Text, txt_start_up_cost.Text, txt_monthly_expense.Text, txt_anual_expense.Text, txt_catering_venue.Text, txt_total.Text, txt_multiply.Text, txt_devide.Text, txt_perimeter.Text, txt_area.Text, check, save_sign, txt_sign_date.Text);
        //    if (ds.Tables.Count > 0)
        //    {
        //        download_rpt(ds.Tables[0].Rows[0]["test_id"].ToString());
        //        Response.Redirect("Success.aspx");

        //    }
        //}
        //catch (Exception)
        //{
        //    throw;
        //}
    }

    public void send_mail(DataSet ds)
    {

        string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();

        ReportDocument rpt = new ReportDocument();
        try
        {

            if (ds.Tables.Count > 0)
            {

                ds.Tables[0].Rows[0]["stu_signature"] = Server.MapPath("/assets/img/sign/") + ds.Tables[0].Rows[0]["stu_signature"];
                ds.Tables[0].Rows[0]["true_ans"] = Server.MapPath("/assets/img/") + ds.Tables[0].Rows[0]["true_ans"].ToString();
                ds.Tables[0].Rows[0]["false_ans"] = Server.MapPath("/assets/img/") + ds.Tables[0].Rows[0]["false_ans"].ToString();

                //ds.Tables[0].Rows[0]["recorded_audio"] = server_url + "Audio/" + ds.Tables[0].Rows[0]["recorded_audio"].ToString();
                if (ds.Tables[0].Rows[0]["recorded_audio"] == DBNull.Value ||
                        string.IsNullOrWhiteSpace(ds.Tables[0].Rows[0]["recorded_audio"].ToString()))
                {
                    ds.Tables[0].Rows[0]["recorded_audio"] = ""; // keep it blank, so Crystal shows "No Audio"
                }
                else
                {
                    ds.Tables[0].Rows[0]["recorded_audio"] = server_url + "Audio/" + ds.Tables[0].Rows[0]["recorded_audio"].ToString();
                }

                rpt.Load(Server.MapPath("~/RPT/RPT_EPT_form_Main.rpt"));
                if (!ds.Tables[0].Columns.Contains("score"))
                {
                    ds.Tables[0].Columns.Add("score", typeof(string));  // Add column if missing
                }

                // Assign the score value from ds.Tables[1] to ds.Tables[0]
                ds.Tables[0].Rows[0]["score"] = ds.Tables[1].Rows[0]["score"].ToString();
                rpt.Database.Tables["dt_ept_form"].SetDataSource(ds.Tables[0]);

                string name = "New English Test (" + ds.Tables[0].Rows[0]["f_name"].ToString() + " - " + ds.Tables[0].Rows[0]["std_id_number"].ToString() + ")"; ;

                Stream ach_stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                Attachment ach_attachment = new Attachment(ach_stream, name + ".pdf", "application/pdf");

                // Dispose of the report
                rpt.Close();
                rpt.Dispose();

                string subject = "English Test (" + ds.Tables[0].Rows[0]["f_name"].ToString() + "-" + ds.Tables[0].Rows[0]["std_id_number"].ToString() + ")";
                string mail_body = get_email_body(ds.Tables[1].Rows[0]["score"].ToString());
                string result = Send_Mail.SendMail("english@nortwest.edu.au", subject, mail_body, ach_attachment, "", "");
                if (result == "Email sent successfully!")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Email sent successfully!');", true);
                }

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

    public string get_email_body(string grammar_score)
    {
        try
        {
            string emailBody = @"
<html lang='en'><head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>English Test Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .table-container {
            width: 50%;
        }
        .header-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .logo {
            width: 120px;
        }
        .header {
            flex-grow: 1;
            text-align: center;
            background-color: #00736A;
            color: white;
            font-size: 22px;
            font-weight: bold;
            padding: 14px;
            margin-left: -120px; /* Align title correctly */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border: 2px solid #00736A;
        }
        th, td {
            border: 2px solid #00736A;
            padding: 8px;
            text-align: center;
            font-size:13px;
        }
        th {
            background-color: #00736A;
            color: white;
            font-weight: bold;
        }
        .section-title {
            background-color: #00736A;
            color: white;
            font-weight: bold;
            text-align: left;
            padding-left: 10px;
        }
        .left-align {
            text-align: left;
            padding-left: 10px;
        }
    </style>
</head>
<body contenteditable='false'>
    <div class='table-container'>
        
        <table>
            <tbody><tr style='
    border-bottom: 1px solid white;'>
    <th colspan='1' style='text-align: left;'><img class='logo' src='https://nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' alt='Nortwest Logo' style='text-align:left;width:170px;background: white;border-radius: 4px;padding: 3px;'></th>
        <th colspan='3' style='font-size:25px;'>English Test Result</th>
</tr>
</tbody>
</table>
<br>
     
        <table>
            <tbody>
<tr>
                <th>TOTAL SCORE</th>
                <th>LEVEL</th>
                <th>MINIMUM ENTRY</th>
                <th>ACSF LEVEL</th>
            </tr>
            <tr><td>0 – 07</td><td>Beginner</td><td></td><td>0 – 1</td></tr>
            <tr><td>8 – 15</td><td>Elementary</td><td>8</td><td>1</td></tr>
            <tr><td>16 – 25</td><td>Pre-Intermediate</td><td>16</td><td>2</td></tr>
            <tr><td>26 – 35</td><td>Intermediate</td><td>26</td><td>3</td></tr>
            <tr><td>36 – 45</td><td>Upper Intermediate</td><td>36</td><td>4</td></tr>
            <tr><td>46 – 60</td><td>Advanced</td><td>46</td><td>5</td></tr>
            <tr>    <td class='section-title'>For Assessor Only</td><td></td><td></td></tr>
            <tr>
                    <th>Sections</th><td></td>
                <th>SCORES</th>
<td></td>
            </tr>
            <tr>
                <td class='left-align'>PART I</td>
                <td class='left-align'>GRAMMAR, READING AND VOCABULARY</td>
                <td colspan='2'>" + grammar_score + @" / 25</td>
            </tr>
            <tr>
                <td class='left-align'>PART II</td>
                <td class='left-align'>WRITING</td>
                <td colspan='2'>____ / 10</td>
            </tr>
            <tr>
                <td class='left-align'>PART III</td>
                <td class='left-align'>ORAL SKILLS</td>
                <td colspan='2'>____ / 25</td>
            </tr>
            <tr class='section-title'>
                <td colspan='4'>TOTAL SCORE ____ / 60</td>
            </tr>
            <tr><td class='left-align'>Assessor Comments</td><td colspan=3'></td></tr>
            <tr><td class='left-align'>Appropriate Level</td><td colspan='3'></td></tr>
            <tr><td class='left-align'>Assessor Name</td><td colspan='3'></td></tr>
            <tr><td class='left-align'>Signature / Date</td><td colspan='3'></td></tr>
        </tbody></table>
    </div>


</body></html>
";
            return emailBody;

        }
        catch (Exception)
        {

            throw;
        }
    }


    public string SaveSignature()
    {
        string base64Signature = hdnSignature.Value; // hidden field
        string signName = "";

        if (string.IsNullOrEmpty(base64Signature))
        {
            // No signature data
            return signName;
        }

        try
        {
            // strip data:* prefix if present
            string base64Data = base64Signature;
            int commaIndex = base64Data.IndexOf(',');
            if (commaIndex >= 0) base64Data = base64Data.Substring(commaIndex + 1);

            byte[] signatureBytes = Convert.FromBase64String(base64Data);

            using (var ms = new MemoryStream(signatureBytes))
            using (var srcImg = System.Drawing.Image.FromStream(ms))
            {
                // Optional: limit max width for very large exports (keeps files reasonable)
                int maxWidth = 1200; // tweak as needed
                int targetWidth = srcImg.Width;
                int targetHeight = srcImg.Height;
                if (targetWidth > maxWidth)
                {
                    double ratio = (double)maxWidth / targetWidth;
                    targetWidth = maxWidth;
                    targetHeight = (int)(srcImg.Height * ratio);
                }

                // Create bitmap with white background (no transparency)
                using (var bmp = new Bitmap(targetWidth, targetHeight, PixelFormat.Format24bppRgb))
                {
                    using (var g = Graphics.FromImage(bmp))
                    {
                        g.Clear(Color.White);
                        g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        g.SmoothingMode = SmoothingMode.AntiAlias;
                        g.CompositingQuality = CompositingQuality.HighQuality;
                        g.DrawImage(srcImg, 0, 0, targetWidth, targetHeight);
                    }

                    string folderPath = Server.MapPath("~/assets/img/sign/");
                    if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                    // unique filename
                    string fileName = "Signature_" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + ".png";
                    string filePath = Path.Combine(folderPath, fileName);

                    // Save as PNG (lossless)
                    bmp.Save(filePath, System.Drawing.Imaging.ImageFormat.Png);

                    signName = fileName;
                }
            }
        }
        catch (Exception ex)
        {
            // Log error properly in production (EventLog / file / db). For debug:
            // Response.Write("Error saving signature: " + ex.Message);
            signName = "";
        }

        return signName;
    }
}