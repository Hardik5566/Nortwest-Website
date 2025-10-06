using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Contact_Us : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            generate_captcha();
        }
    }
    public string generate_captcha()
    {
        Random random = new Random();
        int num1 = random.Next(1, 10);
        int num2 = random.Next(1, 10);
        lbl_num1.Text = num1.ToString();
        lbl_num2.Text = num2.ToString();

        string captchaAnswer = (num1 + num2).ToString();
        Session["CaptchaAnswer"] = captchaAnswer;

        return captchaAnswer;
    }
    public void clear()
    {
        txt_name.Text = "";
        txt_email.Text = "";
        txt_msg.Text = "";
        txt_captcha.Text = "";
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string captchaAnswer = Session["CaptchaAnswer"].ToString();

        if (txt_captcha.Text == captchaAnswer)
        {
            {
                DataSet ds = BAL_Forms.ins_contact_us_form_sp(txt_name.Text, txt_email.Text, txt_msg.Text, "1");
                if (ds.Tables.Count > 0)
                {
                    Task.Run(() =>
                    {
                        Send_Mail.MailWithouAttachment(
                              "sso@nortwest.edu.au",
                              "New Enquiry Received By (" + txt_name.Text + ")",
                              ContactFormMailBody(
                                  txt_name.Text, txt_email.Text, txt_msg.Text
                              ),
                              "",
                              ""
                          );
                    });
                    clear();

                }

            }
        }
        else
        {
            string script = "alert('Invalid CAPTCHA. Please try again.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "CaptchaAlert", script, true);
        }
    }
    public string ContactFormMailBody(string name, string email, string message)
    {
        string html = @"
<div style='width:100%; background-color:#f0f0f0; padding:50px 0;'>
    <div style='width:100%; text-align:center; margin-bottom:15px;'>
        <img src='https://website.nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160' />
        <h2 style='text-align:center; margin:10px 0; font-size:22px; color:#000;'>Contact Form Submission</h2>
    </div>

    <!-- User Details Section -->
    <div style='margin:0 auto; width:85%; background-color:#fff; border-top:3px solid #008a7f; border-bottom:3px solid #008a7f;'>
        <table style='border-collapse:collapse; width:100%; font-family:Arial, sans-serif; font-size:14px;'>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <th colspan='2' style='padding:12px; text-align:left; font-size:18px; color:#000;'>Details</th>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; width:40%; color:#000;'>Name</td>
                <td style='padding:10px;'>" + name + @"</td>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; color:#000;'>Email</td>
                <td style='padding:10px;'>" + email + @"</td>
            </tr>
            <tr style='border-bottom:1px solid #d7d7d7;'>
                <td style='padding:10px; color:#000;'>Message</td>
                <td style='padding:10px;'>" + message + @"</td>
            </tr>
        </table>
    </div>

   
</div>";

        return html;
    }

}