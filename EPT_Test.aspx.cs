using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EPT_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.HttpMethod == "POST" && Request.Files.Count > 0)
        {

            HttpPostedFile file = Request.Files["audio"];
            if (file != null && file.ContentLength > 0)
            {
                string folderPath = Server.MapPath("~/Audio/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                // Retrieve the filename from the hidden field
                string uniqueFileName = Request.Form["hdn_audio_file"];
                string filePath = Path.Combine(folderPath, uniqueFileName);
                file.SaveAs(filePath);
                Response.Write("File uploaded successfully.");
            }
            else
            {
                //Response.Write("No file uploaded.");
            }
        }

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string save_signature = SaveSignature();
        DataSet ds = BAL_Forms.ins_ept_test_form(txt_f_name.Text, txt_l_name.Text, txt_email.Text, txt_sd_id.Text, ddl_nationality.SelectedValue, txt_dob.Text,
            txt_passport.Text, save_signature, rb_1_france.SelectedValue.ToString(), rb_2_old.SelectedValue.ToString(), rb_3_where.SelectedValue.ToString(),
            rb_4_windows.SelectedValue.ToString(), rb_5_man_over.SelectedValue.ToString(), rb_6_how_many_student.SelectedValue.ToString(), rb_7_name_peter.SelectedValue.ToString(),
            rb_8_artist.SelectedValue.ToString(), rb_9_20_desks.SelectedValue.ToString(), rb_10_romantic_films.SelectedValue.ToString(), rb_11_right_now.SelectedValue.ToString(),
            rb_12_at_school.SelectedValue.ToString(), rb_13_piece_of_cake.SelectedValue.ToString(), rb_14_living_room.SelectedValue.ToString(), rb_15_meat.SelectedValue.ToString(),
            rb_16_buses_late.SelectedValue.ToString(), rb_17_to_restaurant.SelectedValue.ToString(), rb_18_shopping.SelectedValue.ToString(), rb_19_in_the_park.SelectedValue.ToString(),
            rb_20_seen_fireworks.SelectedValue.ToString(), rb_21_many_years.SelectedValue.ToString(), rb_22_as_soon_as.SelectedValue.ToString(), rb_23_lots_of_tourists.SelectedValue.ToString(),
            rb_24_to_speak.SelectedValue.ToString(), rb_25_to_cinema.SelectedValue.ToString(), rb_26_wasnt_interested.SelectedValue.ToString(), rb_27_iam_afraid.SelectedValue.ToString(),
            rb_28_got_driver_licence.SelectedValue.ToString(), rb_29_a_little.SelectedValue.ToString(), rb_30_on_the_baby.SelectedValue.ToString(), rb_31_these_little_things.SelectedValue.ToString(),
            rb_32_ran_into_cofee.SelectedValue.ToString(), rb_33_he_won.SelectedValue.ToString(), rb_34_to_jane.SelectedValue.ToString(), rb_35_is_dinner.SelectedValue.ToString(), rb_36_the_flight.SelectedValue.ToString(),
            rb_37_on_the_A2.SelectedValue.ToString(), rb_38_takes_place.SelectedValue.ToString(), rb_39_in_the_fight.SelectedValue.ToString(), rb_40_part_of_city.SelectedValue.ToString(),
            rb_about_article.SelectedValue.ToString(), rb_advantage_eng_learning.SelectedValue.ToString(), rb_advantage_stay_country.SelectedValue.ToString(), rb_time_money_resourse.SelectedValue.ToString(),
            rb_max_opportunity_for_english.SelectedValue.ToString(), txt_advantage.Text, txt_learn_english.Text, txt_choose_to_study.Text, txt_write_summary.Text, txt_gabi.Text, rb_fiona_actress.SelectedValue.ToString(),
            txt_gabi_boss.Text, txt_fiona.Text, txt_fiona_second.Text, rb_fiona_mobile.SelectedValue.ToString(), txt_happened_to_fiona.Text, hdn_audio_file.Value, "1");
        if (ds.Tables[0].Rows.Count > 0)
        {
            Task.Run(() => send_mail(ds));
            //send_mail(ds);
            Response.Redirect("EPT_Success.aspx?id=" + ds.Tables[0].Rows[0]["ept_form_id"].ToString());
        }
    }


    public void send_mail(DataSet ds)
    {

        string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();

        ReportDocument rpt = new ReportDocument();
        try
        {

            if (ds.Tables.Count > 0)
            {

                ds.Tables[0].Rows[0]["stu_signature"] = Server.MapPath("assets/img/sign/") + ds.Tables[0].Rows[0]["stu_signature"];
                ds.Tables[0].Rows[0]["true_ans"] = Server.MapPath("/assets/img/") + ds.Tables[0].Rows[0]["true_ans"].ToString();
                ds.Tables[0].Rows[0]["false_ans"] = Server.MapPath("/assets/img/") + ds.Tables[0].Rows[0]["false_ans"].ToString();

                ds.Tables[0].Rows[0]["recorded_audio"] = server_url + "Audio/" + ds.Tables[0].Rows[0]["recorded_audio"].ToString();

                rpt.Load(Server.MapPath("RPT/RPT_EPT_form_Main.rpt"));
                if (!ds.Tables[0].Columns.Contains("score"))
                {
                    ds.Tables[0].Columns.Add("score", typeof(string));  // Add column if missing
                }

                // Assign the score value from ds.Tables[1] to ds.Tables[0]
                ds.Tables[0].Rows[0]["score"] = ds.Tables[1].Rows[0]["score"].ToString();
                rpt.Database.Tables["dt_ept_form"].SetDataSource(ds.Tables[0]);

                string name = "New English Test";

                Stream ach_stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                Attachment ach_attachment = new Attachment(ach_stream, name + ".pdf", "application/pdf");

                // Dispose of the report
                rpt.Close();
                rpt.Dispose();

                string subject = "English Test (" + ds.Tables[0].Rows[0]["f_name"].ToString() + "-" + ds.Tables[0].Rows[0]["std_id_number"].ToString() + ")";
                string mail_body = get_email_body(ds.Tables[1].Rows[0]["score"].ToString());
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
    <th colspan='1' style='text-align: left;'><img class='logo' src='https://website.nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' alt='Northwest Logo' style='text-align:left;width:170px;'></th>
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
                <td colspan='2'>" + grammar_score+ @" / 25</td>
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

}