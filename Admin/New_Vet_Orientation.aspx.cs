using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;
using CrystalDecisions.Shared;
using System.Net.Mail;

public partial class New_Vet_Orientation : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                txt_from_date.Text = DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd");
                txt_to_date.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
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
            DataSet ds = BAL_Forms.dis_new_vet_orientation_form(txt_from_date.Text, txt_to_date.Text);
            if (ds.Tables.Count > 0)
            {
                grid_form.DataSource = ds.Tables[0];
                grid_form.DataBind();
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void grid_sales_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        ReportDocument rpt = new ReportDocument();

        try
        {
            string id = e.CommandArgument.ToString();

            if (e.CommandName == "btn_pdf")
            {


                DataSet ds = BAL_Forms.sel_new_vet_orientation_form(id);
                if (ds.Tables.Count > 0)
                {

                    ds.Tables[0].Rows[0]["signature"] = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["signature"];
                    ds.Tables[0].Rows[0]["student_photo"] = Server.MapPath("~/assets/img/document/") + ds.Tables[0].Rows[0]["student_photo"];

                    rpt.Load(Server.MapPath("~/RPT/RPT_vet_orientation_form.rpt"));
                    rpt.Database.Tables["dt_ver_orientation"].SetDataSource(ds.Tables[0]);

                    string name = "New enrolment form";

                    Stream ach_stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);

                    string subject = "Orientation Form For New VET Student (" + ds.Tables[0].Rows[0]["student_full_name"].ToString() + "-" + ds.Tables[0].Rows[0]["student_id_no"].ToString() + ")";
                    using (Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat))
                    {
                        // Set the response headers
                        Response.Clear();
                        Response.Buffer = true;
                        Response.ContentType = "application/pdf";
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + subject + ".pdf");
                        Response.AddHeader("Content-Length", pdfStream.Length.ToString());

                        // Write the stream to the response
                        pdfStream.CopyTo(Response.OutputStream);
                        Response.Flush();
                        Response.End();
                    }

                    // Dispose of the report
                    rpt.Close();
                    rpt.Dispose();

                }
            }
            else if (e.CommandName == "btn_mail")
            {
                DataSet ds = BAL_Forms.sel_new_vet_orientation_form(id);
                if (ds.Tables.Count>0)
                {
                    send_mail(ds);
                }
            }

        }
        catch (Exception)
        {

            throw;
        }
        finally
        {
            rpt.Close();
            rpt.Dispose();
        }     


    }


    protected void ddl_audit_type_filter_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bind_data();
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        bind_data();
    }

    public static string set_audit_tag(string tag_name, string audit_status)
    {
        string css = "hide";
        if (tag_name == audit_status)
        {
            css = "";
        }

        return css;
    }

    public void send_mail(DataSet ds)
    {

        //string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();

        ReportDocument rpt = new ReportDocument();
        try
        {

            if (ds.Tables.Count > 0)
            {
                string stu_photo = Server.MapPath("~/assets/img/document/") + ds.Tables[0].Rows[0]["student_photo"];

                ds.Tables[0].Rows[0]["signature"] = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["signature"];
                ds.Tables[0].Rows[0]["student_photo"] = Server.MapPath("~/assets/img/document/") + ds.Tables[0].Rows[0]["student_photo"];

                rpt.Load(Server.MapPath("~/RPT/RPT_vet_orientation_form.rpt"));
                rpt.Database.Tables["dt_ver_orientation"].SetDataSource(ds.Tables[0]);

                string name = "New enrolment form";

                Stream ach_stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                Attachment ach_attachment = new Attachment(ach_stream, name + ".pdf", "application/pdf");


                // Dispose of the report
                rpt.Close();
                rpt.Dispose();

                string subject = "Orientation Form For New VET Student (" + ds.Tables[0].Rows[0]["student_full_name"].ToString() + "-" + ds.Tables[0].Rows[0]["student_id_no"].ToString() + ")";
                string mail_body = get_email_body(ds.Tables[0].Rows[0]["student_full_name"].ToString(), ds.Tables[0].Rows[0]["student_id_no"].ToString());

                if (ds.Tables[0].Rows[0]["campus"].ToString() == "Adelaide")
                {
                    string result = Send_Mail.SendMail_new_vet("sso@nortwest.edu.au", "orientation@nortwest.edu.au,adminadelaide@nortwest.edu.au,", subject, mail_body, ach_attachment, "", stu_photo);

                }
                else
                {
                    string result = Send_Mail.SendMail_new_vet("himanshumakwana8281@gmail.com", "", subject, mail_body, ach_attachment, "", stu_photo);
                }


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

    public string get_email_body(string name, string std_id)
    {
        try
        {
            string emailBody = @"
<!DOCTYPE html>
<html>
<head>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>New Vet Orientation Form
</title>
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
            margin: 0 auto; /* center the logo */
        }
        .title {
            font-size: 20px;
            font-weight: bold;
            text-align: center; /* center the title */
            margin-top:20px;
        }
        .content {
            margin: 20px 0;
            font-size: 14px;
            line-height: 1.6;
        }
        .footer {
            color: #B0BEC5;
            font-size: 12px;
            margin-top: 20px;
            text-align: center;
            border-top: 1px solid lightgray;
            padding-top: 10px;
        }
        .note {
            color: #FFFFFF;
            font-size: 12px;
            margin-top: 10px;
            text-align: center;
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
      <div class='logo' style='padding-bottom:20px;'>
       <img  src='https://nortwest.edu.au/assets/uploads/2017/05/logo_nwc_transp@1x.png' alt='Nortwest Logo' style='background-color:white;border-radius:9px;padding:5px' width='200'>
       </div>
        <div class='container'>
           
            <div class='title'>New Vet Orientation Form</div>
            <div class='content'>
                <p>Dear Team,</p>
                <p>Please find attached the New Vet Orientation Form Form acknowledgement for Nortwest.</p>
                <p><b>Form Details:</b></p>
                <ul>
                     <li>Submitted By: " + name + @"</li>
                     <li>Student ID: " + std_id + @"</li>
                     <li>Submission Date: " + DateTime.Now.ToString("dd MMM yyyy") + @"</li>
                
                </ul>
                <p>Kindly verify the details and keep this acknowledgement for your records. 
                If you require any additional information,Please find attached the New Vet Orientation Form.</p>
                <p>Thank you for your prompt attention.</p>
            </div>
            <div class='footer'>Nortwest Pty Ltd, All rights reserved</div>
        </div>

        <!-- Note outside the container -->
        <p class='note'><b>Note:</b> This is an automated email. Please do not reply to this email.</p>

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
}