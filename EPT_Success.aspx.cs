using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EPT_Success : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {





        if (!IsPostBack)
        {
            bind_data();
        }
    }


    public void bind_data()
    {
        DataSet ds = BAL_Forms.sel_ept_form(Request.QueryString["id"].ToString());
        lbl_success_msg.InnerText = "EPT successfully submitted by " + ds.Tables[0].Rows[0]["f_name"].ToString() + " " + ds.Tables[0].Rows[0]["l_name"].ToString() + " " + "on " + Convert.ToDateTime(ds.Tables[0].Rows[0]["create_date"]).ToString("dd MMM, yyyy");
        lbl_score.Text = ds.Tables[1].Rows[0]["score"].ToString() + "/25.0";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string mailBody = @"
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
</head>
<body style='margin:0;padding:0;background-color:#f6f7f9;'>

<table width='100%' cellpadding='0' cellspacing='0' style='background-color:#f6f7f9;padding:20px;'>
<tr>
<td align='center'>

    <table width='600' cellpadding='0' cellspacing='0'
           style='background:#ffffff;border-radius:6px;overflow:hidden;
                  box-shadow:0 3px 10px rgba(0,0,0,0.08);
                  font-family:Segoe UI,Arial,sans-serif;'>
        
        <tr>
            <td style='background:#c62828;padding:15px 20px;'>
                <table width='100%'>
                    <tr>
                        <td>
                            <img src='https://nortwest.edu.au/assets/img/logo_nwc_transp@1x.png'
                                 style='height:40px;
            display:block;
            background:#ffffff;
            padding:6px 10px;
            border-radius:4px;'>
                        </td>
                        <td align='right'
                            style='color:#ffecec;font-size:13px;font-weight:600;'>
                            RAISE REQUEST
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td style='padding:20px;color:#333;font-size:14px;'>
                <p>Hello Team,</p>

                <p>
                    A new <b style='color:#c62828;'>support request</b> has been raised.
                </p>

                <table width='100%' cellpadding='0' cellspacing='0'
                       style='border-collapse:collapse;margin-top:15px;'>
 <tr style='background:#fdecea;'>
                        <td style='padding:10px;border:1px solid #f5c6c6;font-weight:600;'>Exam Type</td>
                        <td style='padding:10px;border:1px solid #f5c6c6;'>English Placement Test</td>
                    </tr>
 <tr>
                        <td style='padding:10px;border:1px solid #f5c6c6;font-weight:600;'>Student Id</td>
                        <td style='padding:10px;border:1px solid #f5c6c6;'>" + txt_student_id.Text + @"</td>
                    </tr>
                    <tr style='background:#fdecea;'>
                        <td style='padding:10px;border:1px solid #f5c6c6;font-weight:600;'>Student Name</td>
                        <td style='padding:10px;border:1px solid #f5c6c6;'>" + txtStudentName.Text + @"</td>
                    </tr>
                    <tr>
                        <td style='padding:10px;border:1px solid #f5c6c6;font-weight:600;'>Contact Number</td>
                        <td style='padding:10px;border:1px solid #f5c6c6;'>" + txtContactNo.Text + @"</td>
                    </tr>
                    <tr style='background:#fdecea;'>
                        <td style='padding:10px;border:1px solid #f5c6c6;font-weight:600;'>Email Address</td>
                        <td style='padding:10px;border:1px solid #f5c6c6;'>" + txtStudentEmail.Text + @"</td>
                    </tr>
                    <tr>
                        <td style='padding:10px;border:1px solid #f5c6c6;font-weight:600;'>Test Part</td>
                        <td style='padding:10px;border:1px solid #f5c6c6;'>" + ddlTestPart.SelectedItem.Text + @"</td>
                    </tr>
                    <tr style='background:#fdecea;'>
                        <td style='padding:10px;border:1px solid #f5c6c6;font-weight:600;'>Issue Description</td>
                        <td style='padding:10px;border:1px solid #f5c6c6;'>" + txtIssue.Text + @"</td>
                    </tr>
                </table>

                <div style='margin-top:20px;padding:12px;background:#fff4f4;border-left:4px solid #c62828;'>
                    <b>Action Required:</b> Please review and resolve this request at the earliest.
                </div>

            </td>
        </tr>

        <tr>
            <td style='background:#fafafa;padding:15px;text-align:center;
                       font-size:12px;color:#777;'>
                This is a system-generated email. Please do not reply.
            </td>
        </tr>

    </table>

</td>
</tr>
</table>

</body>
</html>";


        Attachment attachment = null;

        if (fuAttachment.HasFile)
        {
            string fileName = Path.GetFileName(fuAttachment.FileName);
            Stream fileStream = fuAttachment.PostedFile.InputStream;
            attachment = new Attachment(fileStream, fileName);
        }

        //"applynow@nortwest.edu.au",
        // ✅ CALL YOUR EXISTING FUNCTION ONLY
        Send_Mail.SendMail(
            "applynow@nortwest.edu.au",
            "EPT Exam – Raise Request - " + txtStudentName.Text,
            mailBody,
            attachment,   // attachment
            null,   // signature
            null,    // student photo
            "hardikvaghasiya5566@gmail.com"
        );

        txt_student_id.Text = "";
        txtContactNo.Text = "";
        txtIssue.Text = "";
        txtStudentEmail.Text = "";
        txtStudentName.Text = "";

        ScriptManager.RegisterStartupScript(
    this,
    GetType(),
    "successAlert",
    "$('#raiseRequestModal').modal('hide'); alert('Your request has been submitted successfully.');",
    true
);

    }


}