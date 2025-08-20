using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report_Elicos_Download : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ReportDocument rpt = new ReportDocument();
            try
            {
                // Retrieve data from database
                DataSet ds = BAL_Forms.sel_refund_form("3");

                if (ds.Tables.Count > 0)
                {

                    ds.Tables[0].Rows[0]["student_signature"] = Server.MapPath("/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"].ToString();
                    rpt.Load(Server.MapPath("RPT/RPT_Refund_Form.rpt"));

                    rpt.Database.Tables["dt_refund_form"].SetDataSource(ds.Tables[0]);
                   
                    // Export the report to a PDF stream
                    Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);

                    // Set the response headers for displaying the PDF in the browser
                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-Disposition", "inline; filename=New_enrolment_form.pdf");
                    Response.AddHeader("Content-Length", pdfStream.Length.ToString());

                    // Write the PDF stream to the response output stream
                    pdfStream.CopyTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions, if any
                rpt.Close();
                rpt.Dispose();
                // Log the exception or show a user-friendly message
            }
            finally
            {
                // Ensure resources are released
                rpt.Close();
                rpt.Dispose();
            }

        }

    }
    //protected void Unnamed_Click(object sender, EventArgs e)
    //{
    //    ReportDocument rpt = new ReportDocument();
    //    try
    //    {
    //        DataSet ds = BAL_Forms.sel_new_elicos_orientation_form("2");
    //        if (ds.Tables.Count > 0)
    //        {

    //            ds.Tables[0].Rows[0]["signature"] = Server.MapPath("assets/img/sign/") + ds.Tables[0].Rows[0]["signature"];
    //            ds.Tables[0].Rows[0]["student_photo"] = Server.MapPath("assets/img/document/") + ds.Tables[0].Rows[0]["student_photo"];

    //            rpt.Load(Server.MapPath("RPT/RPT_vet_orientation_form.rpt"));
    //            rpt.Database.Tables["dt_elicos_orientation"].SetDataSource(ds.Tables[0]);

    //            string name = "New enrolment form";

    //            Stream ach_stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
    //            Attachment ach_attachment = new Attachment(ach_stream, name + ".pdf", "application/pdf");


    //            //using (Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat))
    //            //{
    //            //    // Set the response headers
    //            //    Response.Clear();
    //            //    Response.Buffer = true;
    //            //    Response.ContentType = "application/pdf";
    //            //    Response.AddHeader("Content-Disposition", "attachment; filename=" + subject + ".pdf");
    //            //    Response.AddHeader("Content-Length", pdfStream.Length.ToString());

    //            //    // Write the stream to the response
    //            //    pdfStream.CopyTo(Response.OutputStream);
    //            //    Response.Flush();
    //            //    Response.End();
    //            //}

    //            // Dispose of the report
    //            rpt.Close();
    //            rpt.Dispose();

    //            //string subject = "Orientation Form For New VET Student (" + ds.Tables[0].Rows[0]["student_full_name"].ToString() + "-" + ds.Tables[0].Rows[0]["student_id_no"].ToString() + ")";
    //            //string mail_body = get_email_body();
    //            //string result = Send_Mail.SendMail("hardikvaghasiya5566@gmail.com", subject, mail_body, ach_attachment, "", "");

    //            rpt.Close();
    //            rpt.Dispose();
    //        }

    //    }
    //    catch (Exception)
    //    {
    //        rpt.Close();
    //        rpt.Dispose();
    //    }
    //    finally
    //    {
    //        rpt.Close();
    //        rpt.Dispose();
    //    }
    //}
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        ReportDocument rpt = new ReportDocument();
        try
        {
            // Retrieve data from database
            DataSet ds = BAL_Forms.sel_ept_form("2");

            if (ds.Tables.Count > 0)
            {


                string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();


                //string stu_photo = Server.MapPath("assets/img/document/") + ds.Tables[0].Rows[0]["student_id_card"];

                // Set file paths for signature and photo
                ds.Tables[0].Rows[0]["stu_signature"] = Server.MapPath("assets/img/sign/") + ds.Tables[0].Rows[0]["stu_signature"];
                //ds.Tables[0].Rows[0]["student_id_card"] = Server.MapPath("assets/img/document/") + ds.Tables[0].Rows[0]["student_id_card"];

                //ds.Tables[0].Rows[0]["student_id_card"] = server_url + "image/student_photo/" + ds.Tables[0].Rows[0]["student_id_card"].ToString();

                // Load the report
                rpt.Load(Server.MapPath("RPT/RPT_EPT_form.rpt"));

                // Set the data source for the report
                rpt.Database.Tables["dt_ept_form"].SetDataSource(ds.Tables[0]);

                // Export the report to a PDF stream
                Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);

                // Set the response headers for downloading the PDF
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=New_enrolment_form.pdf");
                Response.AddHeader("Content-Length", pdfStream.Length.ToString());

                // Write the PDF stream to the response output stream
                pdfStream.CopyTo(Response.OutputStream);
                Response.Flush();
                Response.End();

                // Close and dispose of the report document
                rpt.Close();
                rpt.Dispose();
            }
        }
        catch (Exception ex)
        {
            // Handle exceptions, if any
            rpt.Close();
            rpt.Dispose();
            // Log the exception or show a user-friendly message
        }
        finally
        {
            // Ensure resources are released
            rpt.Close();
            rpt.Dispose();
        }
    }

}