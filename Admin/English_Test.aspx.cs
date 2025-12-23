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
using System.Configuration;

public partial class English_Test : System.Web.UI.Page
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
                txt_to_date.Text = DateTime.Now.ToString("yyyy-MM-dd");
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
            DataSet ds = BAL_Forms.dis_ept_form(txt_from_date.Text, txt_to_date.Text);
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
            string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();

            string id = e.CommandArgument.ToString();

            if (e.CommandName == "btn_pdf")
            {


                DataSet ds = BAL_Forms.sel_ept_form(id);
                if (ds.Tables.Count > 0)
                {

                    ds.Tables[0].Rows[0]["stu_signature"] = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["stu_signature"];
                    ds.Tables[0].Rows[0]["true_ans"] = Server.MapPath("~/assets/img/") + ds.Tables[0].Rows[0]["true_ans"].ToString();
                    ds.Tables[0].Rows[0]["false_ans"] = Server.MapPath("~/assets/img/") + ds.Tables[0].Rows[0]["false_ans"].ToString();


                    if (ds.Tables[0].Rows[0]["recorded_audio"] == DBNull.Value ||
                                          string.IsNullOrWhiteSpace(ds.Tables[0].Rows[0]["recorded_audio"].ToString()))
                    {
                        ds.Tables[0].Rows[0]["recorded_audio"] = ""; // keep it blank, so Crystal shows "No Audio"
                    }
                    else
                    {
                        ds.Tables[0].Rows[0]["recorded_audio"] = server_url + "Audio/" + ds.Tables[0].Rows[0]["recorded_audio"].ToString();
                    }

                    rpt.Load(Server.MapPath("~/RPT/RPT_EPT_form_main.rpt"));
                    rpt.Database.Tables["dt_ept_form"].SetDataSource(ds.Tables[0]);

                    string name = "New English Test";

                    Stream ach_stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                    Attachment ach_attachment = new Attachment(ach_stream, name + ".pdf", "application/pdf");

                    string subject = "English Test (" + ds.Tables[0].Rows[0]["f_name"].ToString() + " " + ds.Tables[0].Rows[0]["l_name"].ToString() + ")";
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

            else if (e.CommandName == "btn_send_mail")
            {
                DataSet ds = BAL_Forms.sel_ept_form(id);
                if (ds.Tables.Count > 0)
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

    protected void btn_search_Click(object sender, EventArgs e)
    {
        bind_data();
    }

    public void send_mail(DataSet ds)
    {

        string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();

        ReportDocument rpt = new ReportDocument();
        try
        {

            if (ds.Tables.Count > 0)
            {

                ds.Tables[0].Rows[0]["stu_signature"] = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["stu_signature"];
                ds.Tables[0].Rows[0]["true_ans"] = Server.MapPath("~/assets/img/") + ds.Tables[0].Rows[0]["true_ans"].ToString();
                ds.Tables[0].Rows[0]["false_ans"] = Server.MapPath("~/assets/img/") + ds.Tables[0].Rows[0]["false_ans"].ToString();

                //ds.Tables[0].Rows[0]["recorded_audio"] = server_url + "Audio/" + ds.Tables[0].Rows[0]["recorded_audio"].ToString();
                if (ds.Tables[0].Rows[0]["recorded_audio"] == DBNull.Value ||
                        string.IsNullOrWhiteSpace(ds.Tables[0].Rows[0]["recorded_audio"].ToString()))
                {
                    ds.Tables[0].Rows[0]["recorded_audio"] = ""; // keep it blank, so Crystal shows "No Audio"
                }
                else
                {
                    ds.Tables[0].Rows[0]["recorded_audio"] = server_url + "Audio/" + ds.Tables[0].Rows[0]["recorded_audio"].ToString();
                }

                rpt.Load(Server.MapPath("~/RPT/RPT_EPT_form_Main.rpt"));
                if (!ds.Tables[0].Columns.Contains("score"))
                {
                    ds.Tables[0].Columns.Add("score", typeof(string));  // Add column if missing
                }

                // Assign the score value from ds.Tables[1] to ds.Tables[0]
                ds.Tables[0].Rows[0]["score"] = ds.Tables[1].Rows[0]["score"].ToString();
                rpt.Database.Tables["dt_ept_form"].SetDataSource(ds.Tables[0]);

                string name = "New English Test (" + ds.Tables[0].Rows[0]["f_name"].ToString() + " - " + ds.Tables[0].Rows[0]["std_id_number"].ToString() + ")"; ;

                Stream ach_stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                Attachment ach_attachment = new Attachment(ach_stream, name + ".pdf", "application/pdf");

                // Dispose of the report
                rpt.Close();
                rpt.Dispose();

                string subject = "English Test (" + ds.Tables[0].Rows[0]["f_name"].ToString() + "-" + ds.Tables[0].Rows[0]["std_id_number"].ToString() + ")";
                string mail_body = get_email_body(ds.Tables[1].Rows[0]["score"].ToString());
                string result = Send_Mail.SendMail("english@nortwest.edu.au", subject, mail_body, ach_attachment, "", "");
                if (result == "Email sent successfully!")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Email sent successfully!');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Email not sent successfully!');", true);
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
    public string get_email_body(string grammar_score)
    {
        try
        {
            string emailBody = @"
<html lang='en'><head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>English Test Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .table-container {
            width: 50%;
        }
        .header-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .logo {
            width: 120px;
        }
        .header {
            flex-grow: 1;
            text-align: center;
            background-color: #00736A;
            color: white;
            font-size: 22px;
            font-weight: bold;
            padding: 14px;
            margin-left: -120px; /* Align title correctly */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border: 2px solid #00736A;
        }
        th, td {
            border: 2px solid #00736A;
            padding: 8px;
            text-align: center;
            font-size:13px;
        }
        th {
            background-color: #00736A;
            color: white;
            font-weight: bold;
        }
        .section-title {
            background-color: #00736A;
            color: white;
            font-weight: bold;
            text-align: left;
            padding-left: 10px;
        }
        .left-align {
            text-align: left;
            padding-left: 10px;
        }
    </style>
</head>
<body contenteditable='false'>
    <div class='table-container'>
        
        <table>
            <tbody><tr style='
    border-bottom: 1px solid white;'>
    <th colspan='1' style='text-align: left;'><img class='logo' src='https://nortwest.edu.au/assets/img/logo_nwc_transp@1x.png' alt='Nortwest Logo' style='text-align:left;width:170px;background: white;border-radius: 4px;padding: 3px;'></th>
        <th colspan='3' style='font-size:25px;'>English Test Result</th>
</tr>
</tbody>
</table>
<br>
     
        <table>
            <tbody>
<tr>
                <th>TOTAL SCORE</th>
                <th>LEVEL</th>
                <th>MINIMUM ENTRY</th>
                <th>ACSF LEVEL</th>
            </tr>
            <tr><td>0 – 07</td><td>Beginner</td><td></td><td>0 – 1</td></tr>
            <tr><td>8 – 15</td><td>Elementary</td><td>8</td><td>1</td></tr>
            <tr><td>16 – 25</td><td>Pre-Intermediate</td><td>16</td><td>2</td></tr>
            <tr><td>26 – 35</td><td>Intermediate</td><td>26</td><td>3</td></tr>
            <tr><td>36 – 45</td><td>Upper Intermediate</td><td>36</td><td>4</td></tr>
            <tr><td>46 – 60</td><td>Advanced</td><td>46</td><td>5</td></tr>
            <tr>    <td class='section-title'>For Assessor Only</td><td></td><td></td></tr>
            <tr>
                    <th>Sections</th><td></td>
                <th>SCORES</th>
<td></td>
            </tr>
            <tr>
                <td class='left-align'>PART I</td>
                <td class='left-align'>GRAMMAR, READING AND VOCABULARY</td>
                <td colspan='2'>" + grammar_score + @" / 25</td>
            </tr>
            <tr>
                <td class='left-align'>PART II</td>
                <td class='left-align'>WRITING</td>
                <td colspan='2'>____ / 10</td>
            </tr>
            <tr>
                <td class='left-align'>PART III</td>
                <td class='left-align'>ORAL SKILLS</td>
                <td colspan='2'>____ / 25</td>
            </tr>
            <tr class='section-title'>
                <td colspan='4'>TOTAL SCORE ____ / 60</td>
            </tr>
            <tr><td class='left-align'>Assessor Comments</td><td colspan=3'></td></tr>
            <tr><td class='left-align'>Appropriate Level</td><td colspan='3'></td></tr>
            <tr><td class='left-align'>Assessor Name</td><td colspan='3'></td></tr>
            <tr><td class='left-align'>Signature / Date</td><td colspan='3'></td></tr>
        </tbody></table>
    </div>


</body></html>
";
            return emailBody;

        }
        catch (Exception)
        {

            throw;
        }
    }
}