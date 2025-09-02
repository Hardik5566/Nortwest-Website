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

public partial class credit_transfer_application : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (!IsPostBack)
            {
                bind_data();
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
                //ddl_country.DataSource = ds_country.Tables[0];
                //ddl_country.DataBind();

            }
        }
        catch (Exception)
        {

            throw;
        }
    }


    protected void btn_submit_Click(object sender, EventArgs e)
    {


        // Collect student details
        string lastName = txtLastName.Text.Trim();
        string title = ddlTitle.SelectedValue;
        string givenName = txtGivenName.Text.Trim();
        string dob = txtDOB.Text.Trim();
        string address = txtAddress.Text.Trim();
        string postcode = txtPostcode.Text.Trim();
        string state = txtState.Text.Trim();
        string email = txtEmail.Text.Trim();
        string countryCode = hd_contact_no_code.Value.Trim();
        string contactNo = hd_contact_no.Value.Trim();
        string studentId = txtStudentID.Text.Trim();
        string courseCode = txtCourseCode.Text.Trim();
        string courseTitle = txtCourseTitle.Text.Trim();
        string applicationDate = txtApplicationDate.Text.Trim();

        // Collect credit transfer details from hidden fields
        string unitCodes = hdnUnitCode.Value + "|";
        string unitTitles = hdnUnitTitle.Value + "|";
        string evidenceSupplied = hdnEvidence.Value + "|";
        string ctGranted = hdnCT.Value + "|";

        // Signature details
        string studentSignature = hdnSignature.Value.Trim();
        string signDate = txt_sign_date.Text.Trim();
        string studentFullName = txt_s_name.Text.Trim();

        // Create_by (your current user id or default "1")
        string createBy = "1";

        string emailBody = mailbody(
    lastName, title, givenName, dob, address, postcode, state, email,
    countryCode, contactNo, studentId, courseCode, courseTitle, applicationDate,
    unitCodes, unitTitles, evidenceSupplied, ctGranted, studentSignature, signDate, studentFullName
);

        DataSet ds = BAL_Forms.ins_credit_transfer_application(
            lastName, title, givenName, dob, address, postcode, state, email,
            countryCode, contactNo, studentId, courseCode, courseTitle, applicationDate,
            unitCodes, unitTitles, evidenceSupplied, ctGranted, SaveSignature(),
            signDate, studentFullName, createBy
        );

        if (ds.Tables[0].Rows.Count > 0)
        {
            string signaturePath = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"].ToString();
            Task.Run(() =>
            {
                Send_Mail.MailWithouAttachment(
                    "himanshumakwana8281@gmail.com", // To email
                    "New Credit Transfer Application (" + studentFullName + ")", // Subject
                    emailBody, // HTML body
                   signaturePath, // Attachment path if any
                    ""  // CC or other optional parameters
                    );

                //Send_Mail.MailWithouAttachment("himanshumakwana8281@gmail.com", "New Credit Transfer Application (" + txt_s_full_name.Text + ")", mailbody(txt_s_number.Text, txt_s_last_name.Text, txt_s_given_name.Text, txt_s_full_name.Text, txt_email.Text, hd_contact_no_code.Value.ToString() + hd_contact_no.Value.ToString(), txt_add.Text, txt_add_line_2.Text, ddl_country.SelectedValue.ToString(), txt_state.Text, txt_city.Text, txt_zip.Text), "", "");
            });
            Response.Redirect("Success.aspx");
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

    public string mailbody(string lastName, string title, string givenName, string dob, string address, string postcode, string state, string email, string countryCode, string contactNo, string studentID, string courseCode, string courseTitle, string applicationDate, string unitCodes, string unitTitles, string evidenceSupplied, string ctGranted, string studentSignature, string signDate, string studentFullName)
    {
        string html = @"
<div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px'>
    <div style='width: 100%; text-align: center; margin-bottom: 15px'>
        <img src='https://website.nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160px' />
        <h2 style='text-align: center'>Credit Transfer Application Form</h2>
    </div>

    <!-- Student Details -->
    <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>
        <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <th colspan='2' style='padding: 10px'>
                    <label style='font-size: 20px; padding-bottom: 10px; color: black'>Student details</label>
                </th>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black; width: 50%'>Last Name :</td>
                <td><label>" + lastName + @"</label></td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Title :</td>
                <td><label>" + title + @"</label></td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Given Name :</td>
                <td><label>" + givenName + @"</label></td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Date of Birth :</td>
                <td><label>" + dob + @"</label></td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Email :</td>
                <td><label>" + email + @"</label></td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Contact No :</td>
                <td><label>+" + countryCode + " " + contactNo + @"</label></td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Student ID :</td>
                <td><label>" + studentID + @"</label></td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Course Code :</td>
                <td><label>" + courseCode + @"</label></td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Course Title :</td>
                <td><label>" + courseTitle + @"</label></td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Date of Application :</td>
                <td><label>" + applicationDate + @"</label></td>
            </tr>

            <!-- Credit Transfer -->
           <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
             <td style='padding: 10px; color: black; width: 50%'>Unit Code :</td>
             <td style='padding: 10px; color: black;'>" + unitCodes + @"</td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                 <td style='padding: 10px; color: black; width: 50%'>Unit Title :</td>
                 <td style='padding: 10px; color: black;'>" + unitTitles + @"</td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black; width: 50%'>Evidence Supplied :</td>
                <td style='padding: 10px; color: black;'>" + evidenceSupplied + @"</td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black; width: 50%'>CT Granted :</td>
                <td style='padding: 10px; color: black;'>" + ctGranted + @"</td>
            </tr>

        </table>
    </div>

    <!-- Address Details -->
    <div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px 50px 0px'>
        <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>
            <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <th colspan='2' style='padding: 10px'>
                        <label style='font-size: 20px; padding-bottom: 10px; color: black'>Current Address</label>
                    </th>
                </tr>

                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Street Address</div>
                        <label>" + address + @"</label>
                    </td>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Postcode</div>
                        <label>" + postcode + @"</label>
                    </td>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>State</div>
                        <label>" + state + @"</label>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <!-- Student Signature -->
    <div style='margin-left: auto; margin-right: auto; width: 85%;'>
        <table style='width: 100%;'>
          
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Signature Date :</td>
                <td><label>" + signDate + @"</label></td>
            </tr>
            <tr style='text-align: left'>
                <td style='padding: 10px; color: black;'>Student Name :</td>
                <td><label>" + studentFullName + @"</label></td>
            </tr>
        </table>
    </div>
</div>";

        return html;
    }

}