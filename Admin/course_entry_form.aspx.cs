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

public partial class course_entry_form : System.Web.UI.Page
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
            DataSet ds = BAL_Forms.dis_course_entry_form(txt_from_date.Text, txt_to_date.Text);
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
                download_gst_form(id);
            }

        }
        catch (Exception)
        {

            throw;
        }



    }
    public void download_gst_form(string id)
    {

        string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();


        ReportDocument rpt = new ReportDocument();
        try
        {
            DataSet ds = BAL_Forms.print_course_entry_form(id);

            if (ds.Tables.Count > 0)
            {
                // Fixing paths for Crystal Report fields
                ds.Tables[0].Rows[0]["signature"] = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["signature"];

                string ack_cv = Server.MapPath("image/student_doc/") + ds.Tables[0].Rows[0]["updated_cv"];
                string ack_transcript = Server.MapPath("image/student_doc/") + ds.Tables[0].Rows[0]["transcripts"];

                rpt.Load(Server.MapPath("~/RPT/interview_form1.rpt"));
                rpt.Database.Tables["ds_interview_form"].SetDataSource(ds.Tables[0]);

                string name = ds.Tables[0].Rows[0]["name"].ToString();

                // Export report to stream
                using (Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat))
                {
                    byte[] pdfBytes = new byte[pdfStream.Length];
                    pdfStream.Read(pdfBytes, 0, pdfBytes.Length);

                    // Send PDF to browser for download
                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=" + name + ".pdf");
                    Response.BinaryWrite(pdfBytes);
                    Response.Flush();
                    Response.End();
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
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
}