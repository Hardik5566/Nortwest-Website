using System;
using System.Web.UI;

public partial class Student_Orientation_Access : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }

        string key = Request.QueryString["k"];
        if (string.IsNullOrWhiteSpace(key))
        {
            key = Request.QueryString["key"];
        }

        if (BAL_OrientationAccess.IsValidKey(key))
        {
            pnlOrientation.Visible = true;
            pnlExpired.Visible = false;
            return;
        }

        pnlOrientation.Visible = false;
        pnlExpired.Visible = true;
        litExpiredMessage.Text = BAL_OrientationAccess.GetInvalidMessage();
    }
}
