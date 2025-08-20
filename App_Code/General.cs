using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for General
/// </summary>
public class General
{
    public General()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static DataTable get_full_sem(string sem)
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[] { new DataColumn("sem") });

        for (int i = 1; i <= Convert.ToInt16(sem); i++)
        {
            dt.Rows.Add(i);
        }
        return dt;
    }


    public static string rename_file_name(string file_name)
    {

        if (file_name != "")
        {
            string ext = Path.GetExtension(file_name);
            file_name = Path.GetFileNameWithoutExtension(file_name);

            file_name = DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + System.Text.RegularExpressions.Regex.Replace(file_name, @"[^0-9a-zA-Z]+", "") + ext;
        }

        return file_name;
    }

    public static string save_file_from_base64(string file_name, string base64, string save_path)
    {
        string name = "";

        if (file_name != "")
        {

            string ext = Path.GetExtension(file_name);
            file_name = Path.GetFileNameWithoutExtension(file_name);

            file_name = DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + System.Text.RegularExpressions.Regex.Replace(file_name, @"[^0-9a-zA-Z]+", "") + ext;



            byte[] bytes = Convert.FromBase64String(base64);

            string path = save_path + file_name;
            File.WriteAllBytes(path, bytes);

            name = file_name;

        }

        return name;
    }

    public static byte[] convert_image_to_byte(string image_path)
    {
        Image img = Image.FromFile(image_path);

        //ImageConverter Class convert Image object to Byte array.
        byte[] bytes = (byte[])(new ImageConverter()).ConvertTo(img, typeof(byte[]));

        return bytes;
    }

    public static DataTable get_page_rights(string page_title)
    {
        DataTable dt = (DataTable)HttpContext.Current.Session["rights"];

        DataRow[] dr = dt.Select("page_title='" + page_title + "'");

        DataTable dt_rights = new DataTable();
        if (dr.Length > 0)
        {
            dt_rights = dr.CopyToDataTable();
        }

        return dt_rights;
    }

    public static void ReduceImageSize(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var image = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = (int)(image.Width * scaleFactor);
            var newHeight = (int)(image.Height * scaleFactor);
            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(image, imageRectangle);
            thumbnailImg.Save(targetPath, image.RawFormat);
        }
    }

    public static string generat_otp()
    {
        Random generator = new Random();
        String r = generator.Next(0, 1000000).ToString("D6");

        return r;
    }

    public static bool IsDate(string date)
    {
        string[] formats = {
                               "dd MMM, yyyy hh:mm tt",
                               "dd MMM, yyyy",
                               "dd MMM yyyy",
                               "dd-MM-yyyy hh:mm:ss",
                               "dd-MM-yyyy",
                               "MM/dd/yyyy hh:mm:ss tt",
                               "MM/dd/yyyy hh:mm:ss",
                               "MM/dd/yyyy",
                               "yyyy-MM"
                           };


        DateTime dateValue;

        bool isdate = DateTime.TryParseExact(date, formats, new CultureInfo("en-US"), DateTimeStyles.None, out dateValue);

        return isdate;
    }

    public static bool IsDateTime(string text)
    {
        DateTime dateTime;
        bool isDateTime = false;

        // Check for empty string.
        if (string.IsNullOrEmpty(text))
        {
            return false;
        }

        isDateTime = DateTime.TryParse(text, out dateTime);

        return isDateTime;
    }
}