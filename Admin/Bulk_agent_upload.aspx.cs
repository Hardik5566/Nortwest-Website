using ExcelDataReader;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

public partial class Admin_Bulk_agent_upload : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_data();
        }
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (!flu_file.HasFile) return;

        string ext = Path.GetExtension(flu_file.FileName).ToLower();
        if (ext != ".xls" && ext != ".xlsx") return;

        try
        {
            string fileName = DateTime.Now.ToString("yyyyMMdd_HHmmss") + "_" + Path.GetFileNameWithoutExtension(flu_file.FileName) + ext;
            string filePath = Server.MapPath("~/Uploads/") + fileName;
            flu_file.SaveAs(filePath);

            using (FileStream stream = new FileStream(filePath, FileMode.Open, FileAccess.Read))
            using (IExcelDataReader reader = ExcelReaderFactory.CreateReader(stream))
            {
                DataTable dtExcel = reader.AsDataSet(new ExcelDataSetConfiguration
                {
                    ConfigureDataTable = _ => new ExcelDataTableConfiguration { UseHeaderRow = true }
                }).Tables[0];

                DataTable dtTVP = new DataTable();
                dtTVP.Columns.Add("agency_name", typeof(string));
                dtTVP.Columns.Add("business_name", typeof(string));
                dtTVP.Columns.Add("contact_number", typeof(string));

                foreach (DataRow row in dtExcel.Rows)
                {
                    dtTVP.Rows.Add(
                        row[0] != null ? row[0].ToString().Trim() : "",   // First column → agency_name
                        row[1] != null ? row[1].ToString().Trim() : "",   // Second column → business_name
                        row[2] != null ? row[2].ToString().Trim() : ""    // Third column → contact_number
                    );
                }


                DataSet ds = Bal_agents.ins_tbl_agents(dtTVP, "1");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ShowMessage("Agents added successfully", MessageType.Success);
                    bind_data();
                }
                else
                {
                    ShowMessage("Agents Not added successfully", MessageType.Warning);
                }
            }


        }
        catch (Exception ex)
        {
            ShowMessage("Error: " + ex.Message, MessageType.Error);
        }
    }

    public void bind_data()
    {
        DataSet ds = Bal_agents.dis_tbl_agents();
        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            grid_show_student.DataSource = ds.Tables[0];
            grid_show_student.DataBind();
        }
        else
        {
            grid_show_student.DataSource = null;
            grid_show_student.DataBind();
        }
    }

    private DataTable FilterSelectedColumns(DataTable dt)
    {
        string[] selectedColumns = { "agency_name", "business_name", "contact_number" };
        DataTable filteredTable = new DataTable();

        foreach (string col in selectedColumns)
        {
            if (dt.Columns.Contains(col))
            {
                filteredTable.Columns.Add(col, typeof(string));
            }
        }

        foreach (DataRow row in dt.Rows)
        {
            DataRow newRow = filteredTable.NewRow();
            foreach (string col in selectedColumns)
            {
                if (dt.Columns.Contains(col))
                {
                    newRow[col] = row[col] == null || row[col] == DBNull.Value ? "" : row[col].ToString().Trim();
                }
            }
            filteredTable.Rows.Add(newRow);
        }

        return filteredTable;
    }

    public DataTable NormalizeColumnsToString(DataTable dt)
    {
        DataTable normalized = new DataTable();

        foreach (DataColumn col in dt.Columns)
        {
            normalized.Columns.Add(col.ColumnName, typeof(string));
        }

        foreach (DataRow row in dt.Rows)
        {
            DataRow newRow = normalized.NewRow();
            foreach (DataColumn col in dt.Columns)
            {
                newRow[col.ColumnName] = row[col] == null || row[col] == DBNull.Value ? "" : row[col].ToString().Trim();
            }
            normalized.Rows.Add(newRow);
        }

        return normalized;
    }
}
