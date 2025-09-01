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

public partial class change_of_campus_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (!IsPostBack)
            {
                //DataSet ds = BAL_Forms.sel_new_vet_orientation_form("1");
                //send_mail(ds);

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
        string save_signature = SaveSignature();
        string contactNoCode = hd_contact_no_code.Value;  // Hidden field value for contact code
        string contactNo = hd_contact_no.Value;
        DataSet ds = BAL_Forms.ins_change_of_campus_form(txt_s_id.Text, txt_s_passport_no.Text, txt_s_full_name.Text, txt_birth_date.Text, txt_add.Text, contactNoCode, contactNo, txt_email.Text, txt_course_enrolled.Text, txt_intake.Text, rb_change.SelectedValue, rb_current.SelectedValue, txt_cource_name.Text, txt_reason_campus.Text, save_signature, txt_sign_date.Text, "1");
        if (ds.Tables[0].Rows.Count > 0)
        {
            string signaturePath = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"].ToString();
            Task.Run(() =>
           {
               Send_Mail.MailWithouAttachment(
     "himanshumakwana8281@gmail.com",
     "New Application for Change of Campus Form (" + ds.Tables[0].Rows[0]["student_name"].ToString() + ")",
     mailbody(
         ds.Tables[0].Rows[0]["std_id"].ToString(),
         ds.Tables[0].Rows[0]["passport_no"].ToString(),
         ds.Tables[0].Rows[0]["student_name"].ToString(),
         ds.Tables[0].Rows[0]["date_of_birth"].ToString(),
         ds.Tables[0].Rows[0]["street_address"].ToString(),
         ds.Tables[0].Rows[0]["country_code"].ToString(),
         ds.Tables[0].Rows[0]["contact_no"].ToString(),
         ds.Tables[0].Rows[0]["email"].ToString(),
         ds.Tables[0].Rows[0]["course_enrolled"].ToString(),
         ds.Tables[0].Rows[0]["intake_date"].ToString(),
         ds.Tables[0].Rows[0]["change_campus"].ToString(),
         ds.Tables[0].Rows[0]["current_campus"].ToString(),
         ds.Tables[0].Rows[0]["course_name"].ToString(),
         ds.Tables[0].Rows[0]["reason_change_course"].ToString(),
         ds.Tables[0].Rows[0]["sign_date"].ToString()
     ),
     "",
     signaturePath
 );

               //Send_Mail.MailWithouAttachment("himanshumakwana8281@gmail.com", "New Change Of Campus Form (" + txt_s_full_name.Text + ")", mailbody(txt_s_number.Text, txt_s_last_name.Text, txt_s_given_name.Text, txt_s_full_name.Text, txt_email.Text, hd_contact_no_code.Value.ToString() + hd_contact_no.Value.ToString(), txt_add.Text, txt_add_line_2.Text, ddl_country.SelectedValue.ToString(), txt_state.Text, txt_city.Text, txt_zip.Text), "", "");
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

    public static string mailbody(
      string student_id,
      string passport_no,
      string full_name,
      string birth_date,
      string address,
      string contact_code,
      string contact_no,
      string email,
      string course_enrolled,
      string intake_date,
      string change_to_campus,
      string current_campus,
      string course_name,
      string reason,
      string sign_date
  )
    {
        return @"<div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px'>
                <div style='width: 100%; text-align: center; margin-bottom: 15px'>
                    <img src='https://website.nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160px' />
                    <h2 style='text-align: center'>Change Of Campus Form</h2>
                </div>
                <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>

                    <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
                        <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                            <th colspan='2' style='padding: 10px'>
                                <label style='font-size: 20px; padding-bottom: 10px; color: black'>Student details</label>
                            </th>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black; width: 50%'>Student ID</td>
                            <td><label>" + student_id + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Passport No</td>
                            <td><label>" + passport_no + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Full Name</td>
                            <td><label>" + full_name + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Date of Birth</td>
                            <td><label>" + birth_date + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Address</td>
                            <td><label>" + address + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Contact No</td>
                            <td><label>" + contact_code + contact_no + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Email</td>
                            <td><label>" + email + @"</label></td>
                        </tr>
                    </table>
                </div>

                <div style='margin-left: auto; margin-right: auto; width: 85%; margin-top: 30px; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>
                    <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <th colspan='2' style='padding: 10px'>
                                <label style='font-size: 20px; color: black'>Course Details</label>
                            </th>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Course Enrolled</td>
                            <td><label>" + course_enrolled + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Intake Date</td>
                            <td><label>" + intake_date + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Current Campus</td>
                            <td><label>" + current_campus + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Change To Campus</td>
                            <td><label>" + change_to_campus + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Course Name</td>
                            <td><label>" + course_name + @"</label></td>
                        </tr>
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Reason For Changing Campus</td>
                            <td><label>" + reason + @"</label></td>
                        </tr>
                       
                        <tr style='border-bottom: 1px solid #d7d7d7;'>
                            <td style='padding: 10px; color: black;'>Sign Date</td>
                            <td><label>" + sign_date + @"</label></td>
                        </tr>
                    </table>
                </div>
            </div>";
    }


}