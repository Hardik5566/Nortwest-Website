using System;
using System.Web;
using System.Web.UI;

public partial class Orientation_Master : System.Web.UI.MasterPage
{
    private const string ValidAccessKey = "eyrdfnmxeiojsnsdfaadw";

    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                string k = Request.QueryString["k"];

                if (k == ValidAccessKey)
                {
                    Session["key"] = k;
                }
                else if (Session["key"] != null && Session["key"].ToString() == ValidAccessKey)
                {
                    // Session already has valid access - allow navigation without query string
                }
                else
                {
                    ShowInvalidCredentialAlert();
                    return;
                }

                img_profile_master.ImageUrl = "~/image/user_default.png";
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    private void ShowInvalidCredentialAlert()
    {
        Response.Clear();
        Response.ContentType = "text/html";
        Response.Write("<!DOCTYPE html><html><head><title>Access Denied</title></head><body>");
        Response.Write("<script type=\"text/javascript\">alert('Invalid credential details.');</script>");
        Response.Write("</body></html>");
        Response.End();
    }
}
