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

public partial class Agent_Application : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string name = hd_agent_name.Value;
        string list = hd_staff_list.Value;
    }


    public void send_mail(DataSet ds)
    {


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
    <th colspan='1' style='text-align: left;'><img class='logo' src='https://nortwest.edu.au/assets/uploads/2022/12/logo.png' alt='Northwest Logo style='text-align:left;width:170px;'></th>
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


    //public string SaveSignature()
    //{
    //    // Retrieve the base64 signature from the hidden field
    //    string base64Signature = hdnSignature.Value;
    //    string signName = "";

    //    if (!string.IsNullOrEmpty(base64Signature))
    //    {
    //        try
    //        {
    //            // Define the folder path to save the signature
    //            string folderPath = Server.MapPath("~/assets/img/sign/");
    //            if (!Directory.Exists(folderPath))
    //            {
    //                Directory.CreateDirectory(folderPath); // Create folder if it doesn't exist
    //            }

    //            // Generate a unique file name
    //            string fileName = "Signature_" + DateTime.Now.Ticks + ".jpg"; // Save as JPG
    //            string filePath = Path.Combine(folderPath, fileName);

    //            // Remove the base64 prefix and convert to byte array
    //            byte[] signatureBytes = Convert.FromBase64String(base64Signature.Replace("data:image/png;base64,", ""));

    //            // Create and save the image
    //            using (MemoryStream ms = new MemoryStream(signatureBytes))
    //            {
    //                using (System.Drawing.Image signatureImage = System.Drawing.Image.FromStream(ms))
    //                {
    //                    // Create a bitmap with white background
    //                    using (Bitmap bitmap = new Bitmap(signatureImage.Width, signatureImage.Height))
    //                    {
    //                        using (Graphics g = Graphics.FromImage(bitmap))
    //                        {
    //                            g.Clear(Color.White); // Set background to white
    //                            g.DrawImage(signatureImage, 0, 0); // Draw signature image

    //                            // Save the bitmap as a JPG file
    //                            bitmap.Save(filePath, System.Drawing.Imaging.ImageFormat.Jpeg);
    //                        }
    //                    }
    //                }
    //            }

    //            signName = fileName; // Set the file name to return
    //        }
    //        catch (Exception ex)
    //        {
    //            // Log the error (replace with a proper logging mechanism)
    //            Response.Write("Error: " + ex.Message);
    //        }
    //    }
    //    else
    //    {
    //        // Handle the case where the signature is empty
    //        Response.Write("Signature data is missing.");
    //    }

    //    return signName; // Return the saved file name or an empty string
    //}

}