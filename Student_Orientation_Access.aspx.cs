using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

public partial class Student_Orientation_Access : Page
{
    private const int MaxFileSizeMb = 5;
    private static readonly string[] AllowedExtensions = { ".pdf", ".jpg", ".jpeg", ".png" };

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string key = Request.QueryString["k"];
            if (string.IsNullOrWhiteSpace(key))
            {
                key = Request.QueryString["key"];
            }

            if (BAL_OrientationAccess.IsValidKey(key))
            {
                pnlOrientation.Visible = true;
                pnlExpired.Visible = false;
                ViewState["AccessGranted"] = true;
                return;
            }

            pnlOrientation.Visible = false;
            pnlExpired.Visible = true;
            litExpiredMessage.Text = BAL_OrientationAccess.GetInvalidMessage();
            ViewState["AccessGranted"] = false;
            return;
        }

        bool accessGranted = ViewState["AccessGranted"] != null && (bool)ViewState["AccessGranted"];
        pnlOrientation.Visible = accessGranted;
        pnlExpired.Visible = !accessGranted;
    }

    protected void btnUploadSubmit_Click(object sender, EventArgs e)
    {
        string studentId = txt_std_id.Text.Trim();

        if (string.IsNullOrWhiteSpace(studentId))
        {
            ShowUploadMessage("Please enter your student ID.");
            return;
        }

        if (!fuDocument.HasFile)
        {
            ShowUploadMessage("Please select at least one document to upload.");
            return;
        }

        List<string> savedFiles = new List<string>();
        string saveFolder = Server.MapPath("~/assets/img/student_documents/");

        if (!Directory.Exists(saveFolder))
        {
            Directory.CreateDirectory(saveFolder);
        }

        try
        {
            foreach (HttpPostedFile postedFile in fuDocument.PostedFiles)
            {
                if (postedFile == null || postedFile.ContentLength == 0)
                {
                    continue;
                }

                string extension = Path.GetExtension(postedFile.FileName).ToLowerInvariant();
                if (!AllowedExtensions.Contains(extension))
                {
                    ShowUploadMessage("Only PDF, JPG, and PNG files are allowed.");
                    return;
                }

                if (postedFile.ContentLength > MaxFileSizeMb * 1024 * 1024)
                {
                    ShowUploadMessage("Each file must be 5 MB or less.");
                    return;
                }

                string originalName = Path.GetFileName(postedFile.FileName);
                string safeOriginalName = GetSafeFileName(originalName);
                string fileName = Path.GetFileNameWithoutExtension(safeOriginalName).Replace(" ", "_");
                string timeStamp = DateTime.Now.ToString("yyyyMMddHHmmssfff");
                string uniqueFileName = fileName + "_" + timeStamp + extension;

                string fullPath = Path.Combine(saveFolder, uniqueFileName);
                postedFile.SaveAs(fullPath);
                savedFiles.Add(uniqueFileName);
            }

            if (savedFiles.Count == 0)
            {
                ShowUploadMessage("Please select at least one document to upload.");
                return;
            }

            string filesValue = string.Join(",", savedFiles);
            DataSet ds = BAL_Forms.ins_student_document(studentId, filesValue, "1");

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                txt_std_id.Text = string.Empty;
                ShowUploadMessage("Documents uploaded successfully.", true);
                return;
            }

            ShowUploadMessage("Unable to save document details. Please try again.");
        }
        catch (Exception ex)
        {
            ShowUploadMessage("Upload failed: " + ex.Message);
        }
    }

    private static string GetSafeFileName(string fileName)
    {
        string safeName = Path.GetFileName(fileName);
        return Regex.Replace(safeName, @"[^\w\.\-]", "_");
    }

    private void ShowUploadMessage(string message, bool isSuccess = false)
    {
        string script = isSuccess
            ? "setTimeout(function(){ $('#uploadDocModal').modal('hide'); alert('" + HttpUtility.JavaScriptStringEncode(message) + "'); }, 100);"
            : "alert('" + HttpUtility.JavaScriptStringEncode(message) + "');";

        Page.ClientScript.RegisterStartupScript(GetType(), Guid.NewGuid().ToString(), script, true);
    }
}
