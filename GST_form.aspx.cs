using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class GST_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // For chkFunding CheckBoxList
            foreach (ListItem item in chkFunding.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }

            // For chkEvidence CheckBoxList
            foreach (ListItem item in chkEvidence.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }
            foreach (ListItem item in rbl_highschool.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }
            foreach (ListItem item in rbl_university.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }
            foreach (ListItem item in rblEmployed.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }
            foreach (ListItem item in rblExperience.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }
            foreach (ListItem item in rblGap.Items)
            {
                item.Attributes.CssStyle.Add("margin-right", "15px"); // spacing
            }

        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string visa_type = hdnVisaType.Value;
        string visa_from_date = hdnVisaFrom.Value;
        string visa_expiry_date = hdnVisaExpiry.Value;

        // Collect job values (filled by your JS)
        string job_titles = hdnJobTitle.Value;
        string job_salaries = hdnJobSalary.Value;
        string job_start_date = hdnJobStart.Value;
        string job_end_date = hdnJobEnd.Value;
        string job_current = hdnJobCurrent.Value;

        // Employment
        string has_employee = rblEmployed.SelectedValue;             // "Yes"/"No"
        string currently_employed = txt_employed_reason.Text;

        // Highschool / University
        string complete_highschool = rbl_highschool.SelectedValue;   // "complete"/"incomplete"
        string highschool = txt_highschool_year.Text;
        string complete_university = rbl_university.SelectedValue;
        string university = txt_university_year.Text;

        // Education (hidden fields set by JS)
        string education_qualificaton = hdnQualification.Value;
        string level_of_study = hdnStudy.Value;
        string study_year = hdnCompletion.Value;

        // Plan to fund (join selected chkFunding)
        var sbPlan = new System.Text.StringBuilder();
        foreach (System.Web.UI.WebControls.ListItem li in chkFunding.Items)
        {
            if (li.Selected)
            {
                if (sbPlan.Length > 0) sbPlan.Append("|");
                sbPlan.Append(li.Value);
            }
        }
        string plan_to_fund = sbPlan.ToString();

        // Financial evidence (join selected chkEvidence)
        var sbFin = new System.Text.StringBuilder();
        foreach (System.Web.UI.WebControls.ListItem li in chkEvidence.Items)
        {
            if (li.Selected)
            {
                if (sbFin.Length > 0) sbFin.Append("|");
                sbFin.Append(li.Value);
            }
        }
        string financial_evidance = sbFin.ToString();

        // Course experience / gaps
        string has_course_exp = rblExperience.SelectedValue;
        string course_experience = txtExperience.Text;
        string has_study_gap = rblGap.SelectedValue;
        string study_gap = txtGap.Text;

        // Career plan & ties
        string reason_for_australia = txtReasonAustralia.Text;
        string career_goals_australia = txtCareerGoals.Text;
        string home_country_ties = txtHomeCountryTies.Text;
        string australia_family_ties = txtAustraliaFamilyTies.Text;
        string post_study_plan = txtFuturePlans.Text;
        string other_relevant_info = txtOtherInfo.Text;

        // Student & signature
        string student_name = txt_s_name.Text;
        string sign_date = txt_sign_date.Text; // keep as string per your method signature
        string signature_img = hdnSignature.Value;


        // Call the DAL method (no checks)
        DataSet ds = BAL_Forms.ins_GST_Form(
            visa_type,
            visa_from_date,
            visa_expiry_date,
            job_titles,
            job_salaries,
            job_start_date,
            job_end_date,
            job_current,
            currently_employed,
            highschool,
            university,
            education_qualificaton,
            level_of_study,
            study_year,
            plan_to_fund,
            txtFunds.Text,
            financial_evidance,
            has_course_exp,
            course_experience,
            has_study_gap,
            study_gap,
            reason_for_australia,
            career_goals_australia,
            home_country_ties,
            australia_family_ties,
            post_study_plan,
            other_relevant_info,
            student_name,
            sign_date,
            signature_img,
            "1",
            has_employee,
            complete_highschool,
            complete_university
        );

        // Immediately redirect (no validation or result checking)
        Response.Redirect("Success.aspx");
    }

    public string SaveSignature()
    {
        // Retrieve the base64 signature from the hidden field
        string base64Signature = hdnSignature.Value;
        string signName = "";

        if (!string.IsNullOrEmpty(base64Signature))
        {
            try
            {
                // Define the folder path to save the signature
                string folderPath = Server.MapPath("~/assets/img/sign/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath); // Create folder if it doesn't exist
                }

                // Generate a unique file name
                string fileName = "Signature_" + DateTime.Now.Ticks + ".jpg"; // Save as JPG
                string filePath = Path.Combine(folderPath, fileName);

                // Remove the base64 prefix and convert to byte array
                byte[] signatureBytes = Convert.FromBase64String(base64Signature.Replace("data:image/png;base64,", ""));

                // Create and save the image
                using (MemoryStream ms = new MemoryStream(signatureBytes))
                {
                    using (System.Drawing.Image signatureImage = System.Drawing.Image.FromStream(ms))
                    {
                        // Create a bitmap with white background
                        using (Bitmap bitmap = new Bitmap(signatureImage.Width, signatureImage.Height))
                        {
                            using (Graphics g = Graphics.FromImage(bitmap))
                            {
                                g.Clear(Color.White); // Set background to white
                                g.DrawImage(signatureImage, 0, 0); // Draw signature image

                                // Save the bitmap as a JPG file
                                bitmap.Save(filePath, System.Drawing.Imaging.ImageFormat.Jpeg);
                            }
                        }
                    }
                }

                signName = fileName; // Set the file name to return
            }
            catch (Exception ex)
            {
                // Log the error (replace with a proper logging mechanism)
                Response.Write("Error: " + ex.Message);
            }
        }
        else
        {
            // Handle the case where the signature is empty
            Response.Write("Signature data is missing.");
        }

        return signName; // Return the saved file name or an empty string
    }

}