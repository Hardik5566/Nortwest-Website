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
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;
using System.Net.Mail;
using CrystalDecisions.Shared;
using System.Text;
using System.Threading.Tasks;

public partial class new_vet_orientation_form : System.Web.UI.Page
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
                ddl_country.DataSource = ds_country.Tables[0];
                ddl_country.DataBind();

            }
        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            // Retrieving values from the controls on the page
            string selected_valuea = selected_value1(); // Assuming this gets the selected value from a radio button
            string selected_valueb = selected_value2();
            string selected_valuec = selected_value3();
            string selected_valued = selected_value4();
            string selected_valuee = selected_value5();
            string selected_valuef = selected_value6();
            string selected_valueg = selected_value7();
            string selected_valueh = selected_value8();
            
            string selected_valuei = select_1();  // Assuming this method fetches the selected value from control
            string selected_valuej = select_2();  // Same for this method
            string save_signature = SaveSignature();  // Assuming this method returns the student's signature or achievements

            // Contact number details from hidden fields
            string contactNoCode = hd_contact_no_code.Value;  // Hidden field value for contact code
            string contactNo = hd_contact_no.Value;

            // File handling for photo upload
            string file_name = "";
            if (upd_photo.HasFile)
            {
                file_name = upd_photo.FileName.ToString();
                string save_path = Server.MapPath("~/assets/img/document/");
                upd_photo.SaveAs(save_path + file_name);
            }

            // Now calling the stored procedure with the parameters
            DataSet ds = BAL_Forms.ins_new_vet_orientation_form_sp(
                txt_f_name.Text,                           // studentfullname
                ddl_campus.SelectedValue.ToString(),       // campus
                txt_email.Text,                            // email
                ddl_qulification.SelectedValue.ToString(), // qualification
                contactNoCode,                             // countrycode
                contactNo,                                 // contactno
                txt_id_no.Text,                            // studentidno
                file_name,                                 // photo
                txt_aus_line_1.Text,                       // ausline1
                txt_aus_line_2.Text,                       // ausline2
                txt_aus_city.Text,                         // auscit
                ddl_state.SelectedValue.ToString(),       // ausstate
                txt_aus_post_code.Text,                   // auspostcode
                txt_over_line1.Text,                       // overaddline1
                txt_over_line2.Text,                       // overaddline2
                txt_over_city.Text,                        // overcit
                ddl_country.SelectedValue.ToString(),     // overcountry
                txt_over_post.Text,                       // postcode
                txt_usi_no.Text,                           // usino
                selected_valuea,                           // lateassignment
                selected_valueb,                           // studentissue
                selected_valuec,                           // seriousinjury
                selected_valued,                           // studentvisa
                selected_valuee,                           // changecontacttime
                selected_valuef,                           // specialleave
                selected_valueg,                           // academicmisconduct
                selected_valueh,                           // emergencyno
                selected_valuei,                           // studentdeclaration
                selected_valuej,
                "True",// achievements
                save_signature,                            // studentsignature
                "1"                                        // createby (assuming 1 is the current user id)
            );
            ClearControls(this);


            if (ds.Tables.Count > 0)
            {
                Task.Run(() => send_mail(ds));
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

        else if (RadioButton14.Checked)
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

    public string selected_value5()
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
        else if (RadioButton20.Checked)
        {
            selectedValue = RadioButton20.Text;
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
        if (RadioButton21.Checked)
        {
            selectedValue = RadioButton21.Text;
        }

        else if (RadioButton22.Checked)
        {
            selectedValue = RadioButton22.Text;
        }
        else if (RadioButton23.Checked)
        {
            selectedValue = RadioButton23.Text;
        }
        else if (RadioButton24.Checked)
        {
            selectedValue = RadioButton24.Text;
        }
        if (string.IsNullOrEmpty(selectedValue))
        {
            selectedValue = "";
        }
        return selectedValue;
    }
    public string selected_value7()
    {
        string selectedValue = string.Empty;
        if (RadioButton25.Checked)
        {
            selectedValue = RadioButton25.Text;
        }

        else if (RadioButton26.Checked)
        {
            selectedValue = RadioButton26.Text;
        }
        else if (RadioButton27.Checked)
        {
            selectedValue = RadioButton27.Text;
        }
        else if (RadioButton28.Checked)
        {
            selectedValue = RadioButton28.Text;
        }
        if (string.IsNullOrEmpty(selectedValue))
        {
            selectedValue = "";
        }
        return selectedValue;
    }
    public string selected_value8()
    {
        string selectedValue = string.Empty;
        if (RadioButton29.Checked)
        {
            selectedValue = RadioButton29.Text;
        }

        else if (RadioButton30.Checked)
        {
            selectedValue = RadioButton30.Text;
        }
        else if (RadioButton31.Checked)
        {
            selectedValue = RadioButton31.Text;
        }
        else if (RadioButton32.Checked)
        {
            selectedValue = RadioButton32.Text;
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
                string stu_photo = Server.MapPath("assets/img/document/") + ds.Tables[0].Rows[0]["student_photo"];

                ds.Tables[0].Rows[0]["signature"] = Server.MapPath("assets/img/sign/") + ds.Tables[0].Rows[0]["signature"];
                ds.Tables[0].Rows[0]["student_photo"] = Server.MapPath("assets/img/document/") + ds.Tables[0].Rows[0]["student_photo"];

                rpt.Load(Server.MapPath("RPT/RPT_vet_orientation_form.rpt"));
                rpt.Database.Tables["dt_ver_orientation"].SetDataSource(ds.Tables[0]);

                string name = "New enrolment form";

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

                string subject = "Orientation Form For New VET Student (" + ds.Tables[0].Rows[0]["student_full_name"].ToString() + "-" + ds.Tables[0].Rows[0]["student_id_no"].ToString() + ")";
                string mail_body = get_email_body();
                string result = Send_Mail.SendMail("himanshumakwana8281@gmail.com", subject, mail_body, ach_attachment, "", stu_photo);

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

    public string get_email_body()
    {
        try
        {
            string emailBody = @"
<!DOCTYPE html>
<html>
<head>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Student Request Form</title>
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

        }
        .title {
            font-size: 20px;
            font-weight: bold;
            text-align: left;
            margin-top:20px;
        }
        .content {
            margin: 20px 0;
            font-size: 14px;
        }
        .footer {
            color: #B0BEC5;
            font-size: 12px;
            margin-top: 20px;
            text-align: center;
            border-top: 1px solid lightgray;
            padding-top: 10px;
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
        <div class='container'>
            <img class='logo' src='https://nortwest.edu.au/assets/uploads/2017/05/logo_nwc_transp@1x.png' alt='Nortwest Logo' width='150'>
            <div class='title'>New Vet Orientation Form</div>
            <div class='content'>
                <p>Dear team,</p>
                <p>Please find the attached New Vet Orientation Form acknowledgement for Nortwest.</p>
            </div>
            <div class='footer'>Nortwest Pty Ltd, All rights reserved</div>
        </div>
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
    public void ClearControls(Control parent)
    {
        foreach (Control c in parent.Controls)
        {
            if (c is TextBox)
            {
                (c as TextBox).Text = string.Empty;
            }
            else if (c is DropDownList)
            {
                (c as DropDownList).ClearSelection();
            }
            else if (c is CheckBox)
            {
                (c as CheckBox).Checked = false;
            }
            else if (c is RadioButton)
            {
                (c as RadioButton).Checked = false;
            }
            else if (c is HiddenField)
            {
                (c as HiddenField).Value = string.Empty;
            }
            else if (c is FileUpload)
            {
                // FileUpload cannot be cleared directly due to security, 
                // it resets automatically on postback
            }
            else if (c.HasControls())
            {
                // Recursively check child controls
                ClearControls(c);
            }
        }
    }

}