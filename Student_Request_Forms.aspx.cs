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

public partial class Student_Request_Forms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            string save_signature = SaveSignature();
            string file_name = "";
            if (upd_doc.HasFile)
            {
                file_name = upd_doc.FileName.ToString();
                string save_path = Server.MapPath("~/assets/img/document/");
                upd_doc.SaveAs(save_path + file_name);
            }

            DataSet ds = BAL_Forms.ins_student_request(ddl_title.SelectedValue.ToString(), txt_f_name.Text, txt_l_name.Text, ddl_gender.SelectedValue.ToString(), txt_student_id.Text, txt_date.Text, txt_address.Text, txt_suburb.Text, txt_postcode.Text, txt_m_address.Text, txt_m_suburb.Text, txt_m_postcode.Text, txt_email.Text, hd_contact_no_code.Value.ToString(), hd_contact_no.Value.ToString(), selected_value(), txt_detail.Text, file_name, save_signature,txt_sign_date.Text,"1");
            if (ds.Tables[0].Rows.Count > 0)
            {

                string signaturePath = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"].ToString();
                string documents = Server.MapPath("~/assets/img/document/") + ds.Tables[0].Rows[0]["documents"].ToString();
                string full_name = ds.Tables[0].Rows[0]["first_name"].ToString() + ds.Tables[0].Rows[0]["last_name"].ToString();

                Send_Mail.MailWithouAttachment("himanshumakwana8281@gmail.com", "New Student Request Form (" + full_name + ")", mailbody(ds.Tables[0].Rows[0]["title"].ToString(), ds.Tables[0].Rows[0]["first_name"].ToString(), ds.Tables[0].Rows[0]["last_name"].ToString(), ds.Tables[0].Rows[0]["gender"].ToString(), ds.Tables[0].Rows[0]["student_id"].ToString(), ds.Tables[0].Rows[0]["register_date"].ToString(), ds.Tables[0].Rows[0]["residential_adress"].ToString(), ds.Tables[0].Rows[0]["residential_suburb"].ToString(), ds.Tables[0].Rows[0]["residential_postcode"].ToString(), ds.Tables[0].Rows[0]["mailing_adress"].ToString(), ds.Tables[0].Rows[0]["mailing_suburb"].ToString(), ds.Tables[0].Rows[0]["mailing_postcode"].ToString(), ds.Tables[0].Rows[0]["email"].ToString(), ds.Tables[0].Rows[0]["country_code"].ToString() + ds.Tables[0].Rows[0]["contact_no"].ToString(), ds.Tables[0].Rows[0]["request"].ToString(), ds.Tables[0].Rows[0]["detail"].ToString(), ds.Tables[0].Rows[0]["sign_date"].ToString()), documents, signaturePath);
                Response.Redirect("Success.aspx");
            }

        }
        catch (Exception)
        {
            throw;
        }


    }
    public string selected_value()
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
        else if (RadioButton5.Checked)
        {
            selectedValue = RadioButton5.Text;
        }
        else if (RadioButton6.Checked)
        {
            selectedValue = RadioButton6.Text;
        }
        else if (RadioButton7.Checked)
        {
            selectedValue = RadioButton7.Text; // "Change of campus"
        }
        else if (RadioButton8.Checked)
        {
            selectedValue = RadioButton8.Text; // "Change in Timetable"
        }
        else if (RadioButton9.Checked)
        {
            selectedValue = RadioButton9.Text; // "Other (Please specify)"
        }

        // If nothing is selected, you can handle it (optional)
        if (string.IsNullOrEmpty(selectedValue))
        {
            selectedValue = "";
        }
        return selectedValue;
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

    public string mailbody(string Title, string first_name, string last_name, string gender, string std_id, string date, string address, string suburb, string postcode, string mail_address, string mail_suburb, string mail_postcode, string email, string contact_no, string request, string request_detail, string sign_date)
    {
        string html = @"
<div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px'>
    <div style='width: 100%; text-align: center; margin-bottom: 15px'>
        <img src='https://website.nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160px' />
        <h2 style='text-align: center'>Student Request Forms</h2>
    </div>
    <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>

        <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
            <tr></tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <th colspan='2' style='padding: 10px'>
                    <label style='font-size: 20px; padding-bottom: 10px; color: black'>PERSONAL DETAILS</label>
                </th>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black; width: 50%'>Title</td>
                <td>
                    <label>" + Title + @"</lable>
                </td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>First Name</td>
                <td>
                    <label>" + first_name + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Last Name</td>
                <td>
                    <label>" + last_name + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Gender</td>
                <td>
                    <label>" + gender + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Student ID</td>
                <td>
                    <label>" + std_id + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Date</td>
                <td>
                    <label>" + date + @"</lable>
                </td>
            </tr>

        </table>
    </div>

    <div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px 0px 0px'>
        <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>

            <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <th colspan='2' style='padding: 10px'>
                        <label style='font-size: 20px; padding-bottom: 10px; color: black'>CONTACT DETAILS</label>
                    <p>What is your current Residential Address?</p>
                    </th>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Address</div>
                    <label>" + address + @"</lable>

                    </td>
                </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Suburb</div>
                    <label>" + suburb + @"</lable>

                    </td>
                </tr>

                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Postcode</div>
                    <label>" + postcode + @"</lable>

                    </td>
                </tr>

              <tr></tr>
                        <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                            <th colspan='2' style='padding: 10px'>
                                <label style='font-size: 13px; padding-bottom: 10px; color: black'>What is your Mailing Address?</label>
                            </th>
                        </tr>

                   <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Address</div>
                    <label>" + mail_address + @"</lable>

                    </td>
                </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Suburb</div>
                    <label>" + mail_suburb + @"</lable>

                    </td>
                </tr>

                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Postcode</div>
                    <label>" + mail_postcode + @"</lable>

                    </td>
                </tr>
                    <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Email</div>
                    <label>" + email + @"</lable>

                    </td>
                </tr>
                    <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Contact Number</div>
                    <label>" + contact_no + @"</lable>

                    </td>
                </tr>

            </table>
        </div>

    </div>

<div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px 0px 0px'>
        <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>

            <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <th colspan='2' style='padding: 10px'>
                        <label style='font-size: 20px; padding-bottom: 10px; color: black'>REQUEST</label>
                   
                    </th>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        
                    <label>" + request + @"</lable>

                    </td>
                </tr>
           

              
            </table>
        </div>

    </div>

<div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px 50px 0px'>
        <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>

            <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <th colspan='2' style='padding: 10px'>
                        <label style='font-size: 20px; padding-bottom: 10px; color: black'>DETAILS OF REQUESTS</label>
                   
                    </th>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                    <div style='font-weight:bold;margin-bottom: 5px'>Detail</div>

                    <label>" + request_detail + @"</lable>

                    </td>
                </tr>
           

              
            </table>
        </div>

    </div>
</div>";


        return html;

    }

}