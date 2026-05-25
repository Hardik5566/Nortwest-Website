using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

public partial class RPT_Bulk_Sleep_Print : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ExportBulkBooths(2, 38, 50);
        }
    }




    public void ExportBulkBooths(int app_id, int startBooth, int endBooth)
    {
        ReportDocument rd = new ReportDocument();
        string connString = "Data Source=103.190.26.167,8081; Initial Catalog=db_bjp_rajkot_corporation; Max Pool Size=2000; User ID=bjp_rajkot_corporation; Password=Hardik@5566;Connect Timeout=300;";

        // બધો ડેટા સ્ટોર કરવા માટે એક મેઈન ડેટાસેટ
        DataSet dsMain = new DataSet();

        try
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
                for (int booth_no = startBooth; booth_no <= endBooth; booth_no++)
                {
                    SqlCommand cmd = new SqlCommand("print_booth_wise_bulk_receipt_sp", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@app_id", app_id);
                    cmd.Parameters.AddWithValue("@part_no", booth_no);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet dsTemp = new DataSet();
                    da.Fill(dsTemp, "dt_bulk_sleep");

                    // ટેમ્પરરી ડેટાસેટમાંથી ડેટા મેઈન ડેટાસેટમાં મર્જ (Merge) કરવો
                    dsMain.Merge(dsTemp);
                }
            }

            // જો ડેટા મળ્યો હોય તો જ રિપોર્ટ લોડ કરવો
            if (dsMain.Tables.Count > 0 && dsMain.Tables[0].Rows.Count > 0)
            {
                string reportPath = Server.MapPath("~/RPT/RPT_Bulk_Sleep.rpt");
                rd.Load(reportPath);
                rd.SetDataSource(dsMain);

                string fileName = "Booths_" + startBooth + "_to_" + endBooth + ".pdf";
                rd.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, fileName);
            }
            else
            {
                Response.Write("કોઈ ડેટા મળ્યો નથી.");
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.Message);
        }
        finally
        {
            rd.Close();
            rd.Dispose();
        }
    }

    //public void ExportToPDF(int app_id, int booth_no)
    //{
    //    ReportDocument rd = new ReportDocument();
    //    string connString = "Data Source=103.190.26.167,8081; Initial Catalog=db_bjp_rajkot_corporation; Max Pool Size=2000; User ID=bjp_rajkot_corporation; Password=Hardik@5566;Connect Timeout=300;";

    //    try
    //    {
    //        using (SqlConnection con = new SqlConnection(connString))
    //        {
    //            // 1. સ્ટોર્ડ પ્રોસિજર રન કરીને ડેટા મેળવો
    //            SqlCommand cmd = new SqlCommand("print_booth_wise_bulk_receipt_sp", con);
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.Parameters.AddWithValue("@app_id", app_id);
    //            cmd.Parameters.AddWithValue("@part_no", booth_no);

    //            SqlDataAdapter da = new SqlDataAdapter(cmd);
    //            DataSet ds = new DataSet();
    //            da.Fill(ds, "dt_bulk_sleep"); // "dtVoterList" એ તમારા .xsd ડેટાસેટના ટેબલનું નામ હોવું જોઈએ

    //            // 2. રિપોર્ટ લોડ કરો
    //            string reportPath = Server.MapPath("~/RPT/RPT_Bulk_Sleep.rpt");
    //            rd.Load(reportPath);

    //            // 3. રિપોર્ટમાં ડેટાસોર્સ સેટ કરો
    //            rd.SetDataSource(ds);

    //            // 4. PDF એક્સપોર્ટ સેટિંગ્સ
    //            string fileName = "Booth_" + booth_no + "_Receipts.pdf";

    //            // ડાયરેક્ટ બ્રાઉઝરમાં ડાઉનલોડ કરાવવા માટે:
    //            rd.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, fileName);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write("Error: " + ex.Message);
    //    }
    //    finally
    //    {
    //        // મેમરી ક્લીનઅપ (ખાસ જરૂરી)
    //        rd.Close();
    //        rd.Dispose();
    //    }
    //}
}