using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Configuration;

public partial class Admin_Student_Orientation_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_data();
        }
    }

    public void bind_data()
    {
        DataSet ds = BAL_Forms.dis_student_orientation_list();
        if (ds != null && ds.Tables.Count > 0)
        {
            grid_data.DataSource = ds.Tables[0];
            grid_data.DataBind();
        }
    }

    protected void grid_data_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btn_enrolment")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = BAL_Forms.sel_new_vet_orientation_form(id);

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                // Set file paths
                ds.Tables[0].Rows[0]["signature"] = Server.MapPath("~/assets/img/sign/") + ds.Tables[0].Rows[0]["signature"];
                ds.Tables[0].Rows[0]["student_photo"] = Server.MapPath("~/assets/img/document/") + ds.Tables[0].Rows[0]["student_photo"];

                ReportDocument rpt = new ReportDocument();
                try
                {
                    rpt.Load(Server.MapPath("~/RPT/RPT_vet_orientation_form.rpt"));
                    rpt.Database.Tables["dt_ver_orientation"].SetDataSource(ds.Tables[0]);

                    string studentName = ds.Tables[0].Rows[0]["student_full_name"].ToString();
                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-Disposition", "attachment; filename=Enrolment_" + studentName + ".pdf");

                    using (Stream pdfStream = rpt.ExportToStream(ExportFormatType.PortableDocFormat))
                    {
                        pdfStream.CopyTo(Response.OutputStream);
                    }
                    Response.Flush();
                    Response.End();
                }
                catch (Exception ex) { /* Log error */ }
                finally { rpt.Close(); rpt.Dispose(); }
            }
        }

        else if (e.CommandName == "btn_courseentry")
        {

            string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();

            string id = e.CommandArgument.ToString();
            if (id != "" && id != null)
            {



                ReportDocument rpt = new ReportDocument();
                try
                {
                    DataSet ds = BAL_Forms.print_course_entry_form(e.CommandArgument.ToString());

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
        }
    }

    [WebMethod]
    public static StudentDocumentResponse GetStudentDocuments(string docId)
    {
        if (string.IsNullOrWhiteSpace(docId))
        {
            return new StudentDocumentResponse
            {
                success = false,
                message = "Invalid document id."
            };
        }

        DataSet ds = BAL_Forms.sel_stu_document(docId);
        if (ds == null || ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
        {
            return new StudentDocumentResponse
            {
                success = false,
                message = "No document record found."
            };
        }

        DataRow row = ds.Tables[0].Rows[0];
        string studentId = Convert.ToString(row["std_id"]);
        string files = Convert.ToString(row["files"]);
        string downloadBaseUrl = VirtualPathUtility.ToAbsolute("~/assets/img/student_documents/");

        return new StudentDocumentResponse
        {
            success = true,
            studentId = studentId,
            files = BuildDocumentFileList(files, downloadBaseUrl)
        };
    }

    private static List<StudentDocumentFile> BuildDocumentFileList(string files, string downloadBaseUrl)
    {
        List<StudentDocumentFile> documentFiles = new List<StudentDocumentFile>();

        if (string.IsNullOrWhiteSpace(files))
        {
            return documentFiles;
        }

        string[] fileNames = files.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
        HashSet<string> addedFiles = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        foreach (string fileName in fileNames)
        {
            string trimmedFileName = fileName.Trim();
            if (string.IsNullOrWhiteSpace(trimmedFileName) || !addedFiles.Add(trimmedFileName))
            {
                continue;
            }

            string extension = Path.GetExtension(trimmedFileName).ToLowerInvariant();
            string fileIcon = "bi-file-earmark";
            string fileIconClass = "other";

            if (extension == ".pdf")
            {
                fileIcon = "bi-file-earmark-pdf";
                fileIconClass = "pdf";
            }
            else if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
            {
                fileIcon = "bi-file-earmark-image";
                fileIconClass = "image";
            }

            documentFiles.Add(new StudentDocumentFile
            {
                fileName = trimmedFileName,
                downloadUrl = downloadBaseUrl + trimmedFileName,
                fileIcon = fileIcon,
                fileIconClass = fileIconClass
            });
        }

        return documentFiles;
    }
}

public class StudentDocumentResponse
{
    public bool success { get; set; }
    public string message { get; set; }
    public string studentId { get; set; }
    public List<StudentDocumentFile> files { get; set; }
}

public class StudentDocumentFile
{
    public string fileName { get; set; }
    public string downloadUrl { get; set; }
    public string fileIcon { get; set; }
    public string fileIconClass { get; set; }
}