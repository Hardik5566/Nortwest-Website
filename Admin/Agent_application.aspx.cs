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

public partial class Agent_application : System.Web.UI.Page
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
            DataSet ds = BAL_Forms.dis_agent_application(txt_from_date.Text, txt_to_date.Text);
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
    public void download_gst_report(string id)
    {
        ReportDocument rpt = new ReportDocument();
        try
        {
            DataSet ds2 = BAL_Forms.sel_agent_application(id);
            if (ds2.Tables.Count > 0)
            {
                // ✅ Fix signature path
                ds2.Tables[0].Rows[0]["signature"] = Server.MapPath("~/assets/img/sign/")
                                   + ds2.Tables[0].Rows[0]["signature"];

                // ✅ Load Crystal Report
                rpt.Load(Server.MapPath("~/RPT/RPT_Application_Form_Nort.rpt"));

                // ✅ Bind data tables
                rpt.Database.Tables["dt_app_form"].SetDataSource(ds2.Tables[0]);
                rpt.Database.Tables["dt_employed_agents_names"].SetDataSource(ds2.Tables[1]);
                rpt.Database.Tables["dt_staff"].SetDataSource(ds2.Tables[2]);
                rpt.Database.Tables["dt_service_fee"].SetDataSource(ds2.Tables[3]);
                rpt.Database.Tables["dt_staff_update_plan"].SetDataSource(ds2.Tables[4]);
                rpt.Database.Tables["dt_agent_association_details"].SetDataSource(ds2.Tables[5]);
                rpt.Database.Tables["dt_institution_detail"].SetDataSource(ds2.Tables[6]);

                using (Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat))
                {
                    byte[] pdfBytes = new byte[pdfStream.Length];
                    pdfStream.Read(pdfBytes, 0, pdfBytes.Length);

                    // ✅ Send file to browser for download
                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.ContentType = "application/pdf";
                    HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=GST_Form.pdf");
                    HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    HttpContext.Current.Response.BinaryWrite(pdfBytes);
                    HttpContext.Current.Response.End();
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
    protected void grid_form_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        download_gst_report(id);
    }
}