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

public partial class Application_For_Deferment : System.Web.UI.Page
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
            DataSet ds = BAL_Forms.dis_application_for_deferment_form(txt_from_date.Text, txt_to_date.Text);
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


                DataSet ds = BAL_Forms.sel_application_for_deferment_form(id);
                if (ds.Tables.Count > 0)
                {


                    ds.Tables[0].Rows[0]["student_signature"] = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["student_signature"];

                    rpt.Load(Server.MapPath("~/RPT/RPT_Application_For_Deferement.rpt"));

                    rpt.Database.Tables["dt_application_for_deferment"].SetDataSource(ds.Tables[0]);

                    Stream ach_stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat);

                    string subject = "Application For Deferement (" + ds.Tables[0].Rows[0]["student_name"].ToString() + ")";
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


    public void view_sales_invoice(string invoice_id)
    {
        //DataSet ds = BAL_Sales.view_sales_bill(invoice_id);
        //if (ds.Tables.Count > 0)
        //{
        //    list_invoice_detail.DataSource = ds.Tables[0];
        //    list_invoice_detail.DataBind();

        //    grid_item.DataSource = ds.Tables[1];
        //    grid_item.DataBind();

        //    list_total.DataSource = ds.Tables[0];
        //    list_total.DataBind();

        //    btn_edit_invoice.HRef = "new_Sales_Invoice.aspx?iid=" + invoice_id;
        //    btn_gst_bill.HRef = "dwn/sales_invoice.aspx?id=" + invoice_id;
        //    btn_non_gst_bill.HRef = "dwn/sales_invoice_non_gst.aspx?id=" + invoice_id;
        //    btn_ins_cmp_bill.HRef = "dwn/sales_invoice.aspx?id=" + invoice_id + "&ins=true";

        //    //btn_edit_invoice.HRef = "Mec_Jobcard_Close.aspx?id=" + invoice_id;
        //    bind_thermal_print(invoice_id);

        //}

        //ScriptManager.RegisterStartupScript(this, GetType(), "modal_invoice", "modal_invoice();", true);
    }

    public void bind_thermal_print(string invoice_id)
    {
        try
        {
            //DataSet ds = BAL_Sales.view_sales_bill(invoice_id);
            //if (ds.Tables.Count > 0)
            //{
            //    list_thermal_item.DataSource = ds.Tables[1];
            //    list_thermal_item.DataBind();

            //    list_thermal_total.DataSource = ds.Tables[0];
            //    list_thermal_total.DataBind();

            //    list_thermal_cust_detail.DataSource = ds.Tables[0];
            //    list_thermal_cust_detail.DataBind();
            //}
        }
        catch (Exception)
        {

            throw;
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