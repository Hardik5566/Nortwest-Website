using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
public partial class Agent_app_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod(EnableSession = true)]
    public static string GetCaptchaText()
    {
        Random rand = new Random();
        int num1 = rand.Next(10, 20);
        int num2 = rand.Next(1, 9);
        int operation = rand.Next(0, 2);

        int result = 0;
        string operatorStr = "";

        if (operation == 0)
        {
            result = num1 + num2;
            operatorStr = "+";
        }
        else
        {
            result = num1 - num2;
            operatorStr = "-";
        }

        HttpContext.Current.Session["CaptchaResult"] = result.ToString();

        return num1.ToString() + " " + operatorStr + " " + num2.ToString() + " = ?";
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        if (Session["CaptchaResult"] == null || txt_captcha_input.Text.Trim() != Session["CaptchaResult"].ToString())
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid CAPTCHA! Please enter correct answer.');", true);
            return;
        }

        DataSet ds = BAL_Forms.ins_new_agent_form(txt_agency_name.Text, txt_agency_location.Text, txt_website.Text, txt_contact_name.Text, txt_contact_email.Text, hd_contact_no_code.Value.ToString(), hd_contact_no.Value.ToString(), "0");
        if (ds.Tables.Count > 0)
        {
            Send_Mail.MailWithouAttachment("sso@nortwest.edu.au", "New Agent Application Form(" + ds.Tables[0].Rows[0]["agency_name"].ToString() + ")", mailbody(ds.Tables[0].Rows[0]["agency_name"].ToString(), ds.Tables[0].Rows[0]["agency_location"].ToString(), ds.Tables[0].Rows[0]["website"].ToString(), ds.Tables[0].Rows[0]["contact_name"].ToString(), ds.Tables[0].Rows[0]["contact_email"].ToString(), ds.Tables[0].Rows[0]["contact_no_code"].ToString(), ds.Tables[0].Rows[0]["contact_no"].ToString()), null, null);
            Response.Redirect("Success.aspx");
        }

    }
    public string mailbody(string agency_name, string agency_location, string website, string contact_name, string contact_email, string contact_no_code, string contact_no)
    {
        string html = @"
<div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px'>
    <div style='width: 100%; text-align: center; margin-bottom: 15px'>
        <img src='https://nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' width='160px' />
        <h2 style='text-align: center'>New Agent Application Form</h2>
    </div>
    <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>

        <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
            <tr></tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <th colspan='2' style='padding: 10px'>
                    <label style='font-size: 20px; padding-bottom: 10px; color: black'>Agency Details</label>
                </th>
            </tr>

            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black; width: 50%'>Agency Name:</td>
                <td>
                    <label>" + agency_name + @"</label>
                </td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Agency Location:</td>
                <td>
                    <label>" + agency_location + @"</label>
                </td>
            </tr>
            <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                <td style='padding: 10px; color: black;'>Website:</td>
                <td>
                    <label>" + website + @"</label>
                </td>
            </tr>
        </table>
    </div>

    <div style='width: 100%; background-color: #f0f0f0; padding: 50px 0px 50px 0px'>
        <div style='margin-left: auto; margin-right: auto; width: 85%; background-color: white; border-top: 3px solid #008a7f; border-bottom: 3px solid #008a7f;'>

            <table style='border-collapse: collapse; margin-left: auto; margin-right: auto; width: 100%;'>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <th colspan='2' style='padding: 10px'>
                        <label style='font-size: 20px; padding-bottom: 10px; color: black'>Contact Details</label>
                    </th>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px; color: black; width: 50%;'>Contact Name:</td>
                    <td>
                        <label>" + contact_name + @"</label>
                    </td>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px; color: black;'>Contact Email:</td>
                    <td>
                        <label>" + contact_email + @"</label>
                    </td>
                </tr>
                <tr style='border-bottom: 1px solid #d7d7d7; text-align: left'>
                    <td style='padding: 10px; color: black;'>Contact Number:</td>
                    <td>
                        <label>" + contact_no_code + " " + contact_no + @"</label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>";

        return html;
    }
}