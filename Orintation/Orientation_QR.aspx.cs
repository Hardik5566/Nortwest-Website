using System;
using System.Web.UI;

public partial class Orintation_Orientation_QR : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string dailyKey = BAL_OrientationAccess.GetDailyKey(null);
            string accessUrl = BAL_OrientationAccess.BuildAccessUrl(dailyKey);

            hdnAccessUrl.Value = accessUrl;
            litExpiresAt.Text = BAL_OrientationAccess.GetValidUntilDisplay();
            imgQrCode.ImageUrl = BuildQrImageUrl(accessUrl);
            imgQrCode.AlternateText = "Student Orientation QR Code";
        }
    }

    private string BuildQrImageUrl(string accessUrl)
    {
        return "https://api.qrserver.com/v1/create-qr-code/?size=320x320&margin=12&data=" + Server.UrlEncode(accessUrl);
    }
}
