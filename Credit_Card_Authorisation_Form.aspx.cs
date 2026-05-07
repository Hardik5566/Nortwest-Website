using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Threading.Tasks;
using System.Web.Services;
using System.Drawing;
using System.IO;

public partial class Credit_Card_Authorisation_Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                bind_data();
                ddl_country.Items.Insert(0, new ListItem("Select Country", "0"));
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
        string sessionCaptcha = Session["CaptchaResult"] != null ? Session["CaptchaResult"].ToString() : "";
        string userCaptcha = txt_captcha_input.Text.Trim();
        if (string.IsNullOrEmpty(userCaptcha) || userCaptcha != sessionCaptcha)
        {
            txt_captcha_input.Text = "";
            ScriptManager.RegisterStartupScript(this, GetType(), "CaptchaError", "alert('Invalid Captcha Code. Please try again.'); generateCaptcha();", true);
            return;
        }
        Session.Remove("CaptchaResult");
        DataSet ds = BAL_Forms.ins_credit_card_auth_form(txt_stu_num.Text, txt_stu_l_name.Text, txt_stu_given_name.Text, txt_stu_full_name.Text, txt_email.Text, hd_contact_no_code.Value, hd_contact_no.Value, txt_street_address.Text, txt_address_line2.Text, ddl_country.SelectedValue.ToString(), txt_city.Text, txt_state.Text, txt_zip_code.Text, "0");
        if (ds.Tables[0].Rows.Count > 0)
        {
            string contact_no = ds.Tables[0].Rows[0]["contact_code"].ToString() + ds.Tables[0].Rows[0]["contact"].ToString();

            Send_Mail.MailWithouAttachment("sso@nortwest.edu.au", "New Credit Card Authorisation Form (" + ds.Tables[0].Rows[0]["stu_full_name"].ToString() + ")", mailbody(ds.Tables[0].Rows[0]["stu_number"].ToString(), ds.Tables[0].Rows[0]["stu_l_name"].ToString(), ds.Tables[0].Rows[0]["stu_given_name"].ToString(), ds.Tables[0].Rows[0]["stu_full_name"].ToString(), ds.Tables[0].Rows[0]["email"].ToString(), contact_no, ds.Tables[0].Rows[0]["street_address"].ToString(), ds.Tables[0].Rows[0]["address_line2"].ToString(), ds.Tables[0].Rows[0]["country"].ToString(), ds.Tables[0].Rows[0]["state"].ToString(), ds.Tables[0].Rows[0]["city"].ToString(), ds.Tables[0].Rows[0]["zip_code"].ToString()), "", "");
            clear();
            Response.Redirect("Success.aspx");

        }
    }


    public void clear()
    {
        txt_stu_num.Text = "";
        txt_stu_full_name.Text = "";
        txt_stu_given_name.Text = "";
        txt_stu_full_name.Text = "";
        txt_email.Text = "";
        hd_contact_no.Value = "";
        txt_street_address.Text = "";
        txt_address_line2.Text = "";
        ddl_country.ClearSelection();
        txt_state.Text = "";
        txt_city.Text = "";
        txt_zip_code.Text = "";
    }


    public string mailbody(string stu_number, string l_name, string given_name, string full_name, string email, string contact_no, string street_address, string addressline2, string country, string state, string city, string zipcode)
    {
        string html = @"
<div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px'>
    <div style='width: 100%; text-align: center; margin-bottom: 15px'>
        <img src='https://nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160px' />
        <h2 style='text-align: center'>Credit Card Authorisation Form</h2>
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