using System;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

public class BAL_OrientationAccess
{
    private const string DefaultSecret = "Nortwest-Orientation-Secret-ChangeMe";
    private const string QueryParamName = "k";

    public static string GetSiteBaseUrl()
    {
        string baseUrl = ConfigurationManager.ConnectionStrings["server_url"].ConnectionString;
        if (string.IsNullOrWhiteSpace(baseUrl))
        {
            baseUrl = "https://nortwest.edu.au/";
        }

        return baseUrl.TrimEnd('/');
    }

    public static DateTime GetOrientationDate()
    {
        try
        {
            TimeZoneInfo tz = TimeZoneInfo.FindSystemTimeZoneById("AUS Eastern Standard Time");
            return TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, tz).Date;
        }
        catch
        {
            return DateTime.Now.Date;
        }
    }

    public static string GetDailyKey(DateTime? date)
    {
        DateTime keyDate = date ?? GetOrientationDate();
        string secret = ConfigurationManager.AppSettings["OrientationAccessSecret"];
        if (string.IsNullOrWhiteSpace(secret))
        {
            secret = DefaultSecret;
        }

        string payload = secret + "|" + keyDate.ToString("yyyyMMdd");

        using (SHA256 sha = SHA256.Create())
        {
            byte[] hash = sha.ComputeHash(Encoding.UTF8.GetBytes(payload));
            StringBuilder sb = new StringBuilder(16);
            for (int i = 0; i < 8; i++)
            {
                sb.Append(hash[i].ToString("x2"));
            }
            return sb.ToString();
        }
    }

    public static string BuildAccessUrl(string key)
    {
        return GetSiteBaseUrl() + "/Student_Orientation_Access.aspx?" + QueryParamName + "=" + key;
    }

    public static string GetValidUntilDisplay()
    {
        DateTime orientationDate = GetOrientationDate();
        DateTime validUntil = orientationDate.AddDays(1);
        return validUntil.ToString("dd MMM yyyy") + " (midnight Sydney time)";
    }

    public static bool IsValidKey(string key)
    {
        if (string.IsNullOrWhiteSpace(key))
        {
            return false;
        }

        string provided = key.Trim();
        string todayKey = GetDailyKey(GetOrientationDate());

        return string.Equals(provided, todayKey, StringComparison.OrdinalIgnoreCase);
    }

    public static string GetInvalidMessage()
    {
        return "This orientation link is invalid or has expired. Please scan today's QR code provided by the college.";
    }
}
