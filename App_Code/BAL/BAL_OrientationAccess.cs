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

    public static string GetAccessKeyFromRequest(string key, string fallbackKey)
    {
        if (!string.IsNullOrWhiteSpace(key))
        {
            return key.Trim();
        }

        if (!string.IsNullOrWhiteSpace(fallbackKey))
        {
            return fallbackKey.Trim();
        }

        return null;
    }

    public static string TryGetReturnUrl(string status, string key, string expectedStatus)
    {
        return TryGetReturnUrl(status, key, expectedStatus, null);
    }

    public static string TryGetReturnUrl(string status, string key, string expectedStatus, string result)
    {
        if (string.IsNullOrWhiteSpace(status) || string.IsNullOrWhiteSpace(key))
        {
            return null;
        }

        if (!string.Equals(status.Trim(), expectedStatus, StringComparison.OrdinalIgnoreCase))
        {
            return null;
        }

        string url = "Student_Orientation_Access.aspx?k=" + Uri.EscapeDataString(key.Trim())
            + "&status=" + Uri.EscapeDataString(status.Trim());

        if (!string.IsNullOrWhiteSpace(result))
        {
            url += "&result=" + Uri.EscapeDataString(result.Trim());
        }

        return url;
    }

    public static string GetSuccessTitle(string status)
    {
        if (string.Equals(status, "orientation", StringComparison.OrdinalIgnoreCase))
        {
            return "Orientation Form Submitted";
        }

        if (string.Equals(status, "courseentry", StringComparison.OrdinalIgnoreCase))
        {
            return "Course Entry Form Submitted";
        }

        if (string.Equals(status, "lln", StringComparison.OrdinalIgnoreCase))
        {
            return "LLN Test Completed";
        }

        if (string.Equals(status, "upload", StringComparison.OrdinalIgnoreCase))
        {
            return "Documents Uploaded";
        }

        return "Success!";
    }

    public static string GetSuccessMessage(string status)
    {
        if (string.Equals(status, "orientation", StringComparison.OrdinalIgnoreCase))
        {
            return "Orientation form successfully submitted.";
        }

        if (string.Equals(status, "courseentry", StringComparison.OrdinalIgnoreCase))
        {
            return "Course entry interview form successfully submitted.";
        }
        if (string.Equals(status, "lln", StringComparison.OrdinalIgnoreCase))
        {
            return "LLN Exam successfully submitted.";
        }

        if (string.Equals(status, "upload", StringComparison.OrdinalIgnoreCase))
        {
            return "Your supporting documents have been uploaded successfully.";
        }

        return null;
    }
}
