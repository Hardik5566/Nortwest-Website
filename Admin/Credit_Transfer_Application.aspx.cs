using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Credit_Transfer_Application : System.Web.UI.Page
{
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
            DataSet ds = BAL_Forms.dis_credit_transfer_application(txt_from_date.Text, txt_to_date.Text);
            if (ds.Tables.Count > 0)
            {
                grid_data.DataSource = ds.Tables[0];
                grid_data.DataBind();
            }
        }
        catch (Exception)
        {

            throw;
        }
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

    protected void grid_data_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        download_gst_report(id);
    }
}