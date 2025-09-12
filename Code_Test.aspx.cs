using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        download_gst_report("2");
    }

    public void download_gst_report(string id)
    {
        ReportDocument rpt = new ReportDocument();
        try
        {
            DataSet ds = BAL_Forms.sel_credit_transfer_Report(id);

            if (ds.Tables.Count == 0)
                throw new Exception("No tables returned from stored procedure.");

            if (ds.Tables[0].Rows.Count == 0)
                throw new Exception("No rows returned in main dataset.");

            // Fix signature path only if column exists
            if (ds.Tables[0].Columns.Contains("student_signature"))
            {
                ds.Tables[0].Rows[0]["student_signature"] =
                    Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"];
            }

            // Load main report
            rpt.Load(Server.MapPath("~/RPT/RPT_creadit_transfer_app.rpt"));
            rpt.Database.Tables["dt_credit_transfer"].SetDataSource(ds.Tables[0]);

            // If second table exists, bind it
            if (ds.Tables.Count > 1)
                rpt.Database.Tables["dt_ct_credit_transfer"].SetDataSource(ds.Tables[1]);

            // Export to PDF Stream
            using (System.IO.Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat))
            {
                byte[] bytes;
                using (MemoryStream ms = new MemoryStream())
                {
                    pdfStream.CopyTo(ms);
                    bytes = ms.ToArray();
                }

                // Send file to browser
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Credit_Transfer_Form.pdf");
                Response.Buffer = true;
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(bytes);
                Response.End();
            }
        }
        catch (Exception ex)
        {
            lbl_error.Text = ex.ToString();
        }
        finally
        {
            rpt.Close();
            rpt.Dispose();
        }
    }


    public string get_email_body_gst(string name)
    {
        try
        {
            string emailBody = @"<!DOCTYPE html>
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
       Credit Transfer Application
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

}