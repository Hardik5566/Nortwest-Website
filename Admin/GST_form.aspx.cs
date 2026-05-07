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

public partial class GST : System.Web.UI.Page
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
            DataSet ds = BAL_Forms.dis_gst_form(txt_from_date.Text, txt_to_date.Text);
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
            DataSet ds = BAL_Forms.sel_gst_form(id);
            if (ds.Tables.Count > 0)
            {
                // Fix signature path
                ds.Tables[0].Rows[0]["signature_img"] = Server.MapPath("~/assets/img/sign/")
                    + ds.Tables[0].Rows[0]["signature_img"];

                // Load main report
                rpt.Load(Server.MapPath("~/RPT/RPT_GST_Form.rpt"));

                // Set datasource for main report
                rpt.Database.Tables["dt_gst_form"].SetDataSource(ds.Tables[0]);
                rpt.Database.Tables["dt_job_gst"].SetDataSource(ds.Tables[1]);
                rpt.Database.Tables["dt_visa_gst"].SetDataSource(ds.Tables[2]);
                rpt.Database.Tables["dt_education_gst"].SetDataSource(ds.Tables[3]);

                //// Bind subreports
                //rpt.Subreports["RPT_job_his_gst.rpt"].SetDataSource(ds.Tables[1]);
                //rpt.Subreports["RPT_visa_gst.rpt"].SetDataSource(ds.Tables[2]);
                //rpt.Subreports["RPT_education_gst.rpt"].SetDataSource(ds.Tables[3]);

                // Export to PDF stream
                string fileName = "GST_Form_" + ds.Tables[0].Rows[0]["student_name"].ToString() + ".pdf";
                Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);
                pdfStream.Seek(0, SeekOrigin.Begin);

                // Send PDF to browser for download
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
                byte[] buffer = new byte[pdfStream.Length];
                pdfStream.Read(buffer, 0, buffer.Length);
                Response.BinaryWrite(buffer);
                Response.Flush();
                Response.End();
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