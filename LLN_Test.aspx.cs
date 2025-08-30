using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LLN_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Register script to open the modal
        //string script = "$('#modal_lln_test').modal('show');";
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", script, true);






    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            CreateLearner();
        }
        catch (Exception)
        {

            throw;
        }
    }

    private void CreateLearner()
    {
        ServicePointManager.Expect100Continue = true;
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;


        using (var client = new HttpClient())
        {
            string url = "https://api.lln.training/api/nortwest/v1/learners";

            // Set headers
            client.DefaultRequestHeaders.Clear();
            client.DefaultRequestHeaders.Add("Authorization", "ROBOT-V1-KEY apikey=\"674e25d6-8bc0-4e8a-b90e-e593d7cedb6d\"");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            //// JSON body
            //var learnerJson = @"{
            //    ""learnerId"": ""HR0001"",
            //    ""nameFirst"": ""Hardik"",
            //    ""nameLast"": ""API TEST2"",
            //    ""email"": ""hardikvaghasiya5566@gmail.com"",
            //    ""testLevel"": ""acsf3"",
            //    ""courseName"": ""1"",
            //    ""List"": """",
            //    ""includeCourseReady"": true,
            //    ""noInvite"": false
            //}";

            var learnerObj = new
            {
                learnerId = txt_stu_id.Text,
                nameFirst = txt_given_name.Text,
                nameLast = txt_family_name.Text,
                email = txt_email.Text,
                testLevel = "acsf3",
                courseName = "",
                List = "",
                includeCourseReady = true,
                noInvite = false
            };

            string learnerJson = new JavaScriptSerializer().Serialize(learnerObj);

            var content = new StringContent(learnerJson, Encoding.UTF8, "application/json");

            // Send POST request synchronously
            HttpResponseMessage response = client.PostAsync(url, content).Result;

            // Get response
            string result = response.Content.ReadAsStringAsync().Result;

            if (response.IsSuccessStatusCode)
            {

                ScriptManager.RegisterStartupScript(
            this,
            this.GetType(),
            "Pop",
            "setTimeout(function(){ $('#modal_lln_test').modal('show'); }, 200);",
            true
        );
            }
            else
            {
                lblMessage.Text = "Error: " + response.StatusCode + " - " + result;
            }

            txt_stu_id.Text = "";
            txt_family_name.Text = "";
            txt_given_name.Text = "";
            txt_email.Text = "";
        }
    }
}