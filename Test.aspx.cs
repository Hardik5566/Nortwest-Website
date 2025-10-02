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

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.HttpMethod == "POST" && Request.Files.Count > 0)
        {
            try
            {
                string savePath = Server.MapPath("Recoding/");
                if (!Directory.Exists(savePath))
                    Directory.CreateDirectory(savePath);

                for (int i = 0; i < Request.Files.Count; i++)
                {
                    HttpPostedFile file = Request.Files[i];
                    if (file.ContentLength > 0)
                    {
                        string filename = Path.GetFileName(file.FileName);
                        string fullPath = Path.Combine(savePath, filename);
                        file.SaveAs(fullPath);
                    }
                }


            }
            catch (Exception)
            {
                throw;
            }

        }




    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            string file_name = "";
            if (upd_pass.HasFile)
            {
                string ext = Path.GetExtension(upd_pass.FileName);

                file_name = "Passport_" + DateTime.Now.ToString("yyyyMMdd_HHmmss") + ext;

                string savePath = Server.MapPath("/Uploads/") + file_name;

                upd_pass.SaveAs(savePath);
            }
            string check = "False";
            if (ch_consent.Checked)
            {
                check = "True";
            }
            string country_code = hd_contact_no_code.Value.ToString();
            string contact_number = hd_contact_no.Value.ToString();
            string save_sign_1 = SaveSignature1();
            string save_sign = SaveSignature();
            string quelification = ddl_course.SelectedValue.ToString();
            DataSet ds = BAL_Forms.ins_lln_test(txt_name.Text, txt_std_id.Text, country_code + contact_number, txt_email.Text, quelification, ddl_test_place.SelectedValue.ToString(), txt_dob.Text, ddl_nationality.SelectedValue.ToString(), txt_pass_no.Text, file_name, txt_date_of_test.Text, save_sign_1, hdn_audio1.Value, txt_ans_1.Text, hdn_audio2.Value, hdn_audio3.Value, hdn_audio4.Value, txt_ex_lern_test.Text, txt_most_like_lern.Text, txt_least_like_lern.Text, txt_learning_new_skill.Text, txt_current_skill.Text, txt_product_strategy.Text, txt_read_past.Text, txt_article_purpose.Text, txt_type_of_network.Text, txt_facebook_content.Text, txt_writer_article.Text, txt_start_up_cost.Text, txt_monthly_expense.Text, txt_anual_expense.Text, txt_catering_venue.Text, txt_total.Text, txt_multiply.Text, txt_devide.Text, txt_perimeter.Text, txt_area.Text, check, save_sign, txt_sign_date.Text);
            if (ds.Tables.Count > 0)
            {
                download_rpt(ds.Tables[0].Rows[0]["test_id"].ToString());
                Response.Redirect("Success.aspx");

            }
        }
        catch (Exception)
        {
            throw;
        }
    }
    public void download_rpt(string id)
    {
        DataSet ds = BAL_Forms.print_ack(id);
        string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();
        ReportDocument rpt = new ReportDocument();
        try
        {
            if (ds.Tables.Count > 0)
            {
                // ✅ Adjust file paths inside dataset
                ds.Tables[0].Rows[0]["std_sign"] = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["std_sign"].ToString();
                ds.Tables[0].Rows[0]["std_cnf_sign"] = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["std_cnf_sign"].ToString();
                ds.Tables[0].Rows[0]["que_1"] = server_url + "Recoding/" + ds.Tables[0].Rows[0]["que_1"].ToString();
                ds.Tables[0].Rows[0]["que_2"] = server_url + "Recoding/" + ds.Tables[0].Rows[0]["que_2"].ToString();
                ds.Tables[0].Rows[0]["que_3"] = server_url + "Recoding/" + ds.Tables[0].Rows[0]["que_3"].ToString();
                ds.Tables[0].Rows[0]["que_4"] = server_url + "Recoding/" + ds.Tables[0].Rows[0]["que_4"].ToString();

                // ✅ Load Crystal Report
                rpt.Load(Server.MapPath("RPT/RPT_Ach.rpt"));
                rpt.Database.Tables["dt_lln_test"].SetDataSource(ds.Tables[0]);

                string name = ds.Tables[0].Rows[0]["stu_full_name"].ToString();

                // ✅ Export to PDF and send to browser
                Stream stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                byte[] buffer = new byte[stream.Length];
                stream.Read(buffer, 0, buffer.Length);

                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=" + name + ".pdf");
                Response.BinaryWrite(buffer);
                Response.End();
            }
        }
        catch (Exception ex)
        {
            // handle error (log it if needed)
        }
        finally
        {
            rpt.Close();
            rpt.Dispose();
        }

    }
    public string SaveSignature1()
    {
        string base64Signature = hdnSignature1.Value;
        string signName1 = "";

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
                string fileName = "Signature_1" + DateTime.Now.Ticks + ".jpg"; // Save as JPG
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

                signName1 = fileName; // Set the file name to return
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

        return signName1; // Return the saved file name or an empty string
    }

    public string SaveSignature()
    {
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