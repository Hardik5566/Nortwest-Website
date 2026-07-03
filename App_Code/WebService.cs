using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    string result = "{\"Success\":\"1\",\"result\":";
    string fail_result = "{\"Success\":\"0\"}";
    string server_url = ConfigurationManager.ConnectionStrings["server_url"].ToString();
    public AuthUser User;

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [SoapHeader("User", Required = true)]
    [WebMethod]
    public string ins_lln_exam_result(string exam_id, string std_id, string result)
    {
        if (User != null)
        {
            if (User.IsValid())
            {

                DataSet ds = BAL_Forms.ins_lln_exam_result(exam_id,std_id, result);
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        result += JsonConvert.SerializeObject(ds.Tables[0]) + "}";
                    }
                    else
                    {
                        result = fail_result;
                    }
                }
                else
                {
                    result = fail_result;
                }
            }
            else
            {
                return "Invalid User";
            }
        }
        else
        {
            return "Please Provide User Detail";
        }
        return result;
    }

}
