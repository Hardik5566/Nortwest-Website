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
using System.Drawing.Imaging;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Web.Services;

public partial class special_leave_request_form : System.Web.UI.Page
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
                ddl_country.Items.Insert(0, new ListItem("Select Country", "0"));

            }
        }
        catch (Exception)
        {

            throw;
        }

    }
    [WebMethod(EnableSession = true)]
    public static string GetNewCaptcha()
    {
        Random rand = new Random();
        int num1 = rand.Next(1, 20);
        int num2 = rand.Next(1, 10);
        bool isAddition = rand.Next(2) == 0;
        string operatorStr = isAddition ? "+" : "-";

        // Prevent negative numbers
        if (!isAddition && num1 < num2)
        {
            int temp = num1;
            num1 = num2;
            num2 = temp;
        }

        // Calculate result and save to Session for backend validation
        int result = isAddition ? (num1 + num2) : (num1 - num2);
        System.Web.HttpContext.Current.Session["CaptchaAnswer"] = result.ToString();

        // No "$" string interpolation used as requested
        string captchaText = num1.ToString() + " " + operatorStr + " " + num2.ToString() + " = ?";

        // Generate the Image in memory
        using (Bitmap bitmap = new Bitmap(150, 50))
        {
            using (Graphics g = Graphics.FromImage(bitmap))
            {
                g.Clear(Color.FromArgb(249, 249, 249)); // Background color #f9f9f9
                g.SmoothingMode = SmoothingMode.AntiAlias;

                // Draw Noise lines to make it hard for bots to read
                Pen noisePen = new Pen(Color.FromArgb(204, 204, 204)); // #ccc
                for (int i = 0; i < 5; i++)
                {
                    g.DrawLine(noisePen, rand.Next(0, 150), rand.Next(0, 50), rand.Next(0, 150), rand.Next(0, 50));
                }

                // Draw Math Text
                using (Font font = new Font("Arial", 16, FontStyle.Bold))
                {
                    using (SolidBrush brush = new SolidBrush(Color.FromArgb(51, 51, 51))) // #333
                    {
                        g.DrawString(captchaText, font, brush, 20, 12);
                    }
                }

                // Convert Image to Base64 to return to the AJAX call
                using (MemoryStream ms = new MemoryStream())
                {
                    bitmap.Save(ms, ImageFormat.Png);
                    byte[] imageBytes = ms.ToArray();
                    string base64String = Convert.ToBase64String(imageBytes);
                    return "data:image/png;base64," + base64String;
                }
            }
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
        string sessionCaptcha = Session["CaptchaResult"] != null ? Session["CaptchaResult"].ToString() : "";
        string userCaptcha = txt_captcha_input.Text.Trim();
        if (string.IsNullOrEmpty(userCaptcha) || userCaptcha != sessionCaptcha)
        {
            txt_captcha_input.Text = "";
            ScriptManager.RegisterStartupScript(this, GetType(), "CaptchaError", "alert('Invalid Captcha Code. Please try again.'); generateCaptcha();", true);
            return;
        }
        Session.Remove("CaptchaResult");
        string contactNoCode = hd_contact_no_code.Value;  // Hidden field value for contact code
        string contactNo = hd_contact_no.Value;
        DataSet ds = BAL_Forms.ins_special_leave_request_form(txt_s_number.Text, txt_s_last_name.Text, txt_s_given_name.Text, txt_s_full_name.Text, txt_email.Text, contactNoCode, contactNo, txt_add.Text, txt_add_line_2.Text, txt_city.Text, txt_state.Text, txt_zip.Text, ddl_country.SelectedValue.ToString(), "1");
        if (ds.Tables[0].Rows.Count > 0)
        {
            Send_Mail.MailWithouAttachment("sso@nortwest.edu.au", "New Special Leave Request Form (" + txt_s_full_name.Text + ")", mailbody(txt_s_number.Text, txt_s_last_name.Text, txt_s_given_name.Text, txt_s_full_name.Text, txt_email.Text, hd_contact_no_code.Value.ToString() + hd_contact_no.Value.ToString(), txt_add.Text, txt_add_line_2.Text, ddl_country.SelectedValue.ToString(), txt_state.Text, txt_city.Text, txt_zip.Text), "", "");
            Response.Redirect("Success.aspx");
        }
    }

    public string mailbody(string stu_number, string l_name, string given_name, string full_name, string email, string contact_no, string street_address, string addressline2, string country, string state, string city, string zipcode)
    {
        string html = @"
<div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px'>
    <div style='width: 100%; text-align: center; margin-bottom: 15px'>
        <img src='https://nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160px' />
        <h2 style='text-align: center'>Special Leave Request Form</h2>
    </div>
    <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>

        <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
            <tr></tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <th colspan='2' style='padding: 10px'>
                    <label style='font-size: 20px; padding-bottom: 10px; color: black'>Student details</label>
                </th>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black; width: 50%'>Student Number :</td>
                <td>
                    <label>" + stu_number + @"</lable>
                </td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Student Last Name :</td>
                <td>
                    <label>" + l_name + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Student Given Names :</td>
                <td>
                    <label>" + given_name + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Student Full Name :</td>
                <td>
                    <label>" + full_name + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Email ID :</td>
                <td>
                    <label>" + email + @"</lable>
                </td>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Contact No :</td>
                <td>
                    <label>" + contact_no + @"</lable>
                </td>
            </tr>
        </table>
    </div>

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
                    <label>" + street_address + @"</lable>

                    </td>
                </tr>

                 <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Address Line 2</div>
                    <label>" + addressline2 + @"</lable>

                    </td>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>Country</div>
                    <label>" + country + @"</lable>

                    </td>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>State / Province / Region</div>
                    <label>" + state + @"</lable>

                    </td>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>City</div>
                    <label>" + city + @"</lable>
                    </td>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px;'>
                        <div style='font-weight:bold;margin-bottom: 5px'>ZIP / Postal Code</div>
                    <label>" + zipcode + @"</lable>
                    </td>
                </tr>

            </table>
        </div>
    </div>
</div>";


        return html;

    }

}