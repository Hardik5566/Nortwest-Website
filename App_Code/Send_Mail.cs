using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Send_Mail
/// </summary>
public class Send_Mail
{
    public Send_Mail()
    {
        //
        // TODO: Add constructor logic here
        //


    }




    public static string SendMail(string to, string subject, string mailBody, Attachment attachmentStream, string signatureData, string stu_photo,string cc = "")
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("noreply@nortwest.edu.au");
            // mail.Bcc.Add("krupali@nortwest.edu.au");
            //mail.Bcc.Add("hardikvaghasiya5566@gmail.com");

            foreach (var address in to.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                mail.To.Add(address.Trim());
            }

            foreach (var address in cc.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                mail.CC.Add(address.Trim());
            }

            mail.Subject = subject;
            mail.Body = mailBody;
            mail.IsBodyHtml = true;

            if (attachmentStream != null)
            {
                mail.Attachments.Add(attachmentStream);
            }

            if (!string.IsNullOrEmpty(signatureData) && File.Exists(signatureData))
            {
                byte[] signBytes = File.ReadAllBytes(signatureData);
                string signBase64 = Convert.ToBase64String(signBytes);
                MemoryStream signStream = new MemoryStream(signBytes);
                Attachment signAttachment = new Attachment(signStream, "Signature.jpg");
                mail.Attachments.Add(signAttachment);
            }

            // Add photo attachment
            if (!string.IsNullOrEmpty(stu_photo) && File.Exists(stu_photo))
            {
                Attachment student_photo = new Attachment(stu_photo);
                mail.Attachments.Add(student_photo);
            }

            if (!string.IsNullOrEmpty(stu_photo) && File.Exists(stu_photo))
            {
                Attachment student_photo = new Attachment(stu_photo);
                mail.Attachments.Add(student_photo);
            }

            // Add attachment to the mail
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com"; // Or Your SMTP Server Address
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("noreply@nortwest.edu.au", "mqea slfe nvfv xwpt"); // Replace with your sender email and password

            smtp.EnableSsl = true;

            smtp.Send(mail);

            return "Email sent successfully!";
        }
        catch (Exception ex)
        {
            return "Error sending email: " + ex.Message;
        }
    }

    public static string SendEPTMail(string to, string subject, string mailBody, Attachment attachmentStream, Attachment audio, string stu_photo)
    {
        try
        {
            MailMessage mail = new MailMessage();

            mail.From = new MailAddress("noreply@nortwest.edu.au");
            // mail.Bcc.Add("krupali@nortwest.edu.au"); mail.To.Add(to);

            mail.Subject = subject;
            mail.Body = mailBody;
            mail.IsBodyHtml = true;

            mail.Attachments.Add(attachmentStream);
            mail.Attachments.Add(audio);



            // Add photo attachment
            if (!string.IsNullOrEmpty(stu_photo) && File.Exists(stu_photo))
            {
                Attachment student_photo = new Attachment(stu_photo);
                mail.Attachments.Add(student_photo);
            }

            if (!string.IsNullOrEmpty(stu_photo) && File.Exists(stu_photo))
            {
                Attachment student_photo = new Attachment(stu_photo);
                mail.Attachments.Add(student_photo);
            }

            // Add attachment to the mail
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com"; // Or Your SMTP Server Address
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("noreply@nortwest.edu.au", "mqea slfe nvfv xwpt"); // Replace with your sender email and password

            smtp.EnableSsl = true;

            smtp.Send(mail);

            return "Email sent successfully!";
        }
        catch (Exception ex)
        {
            return "Error sending email: " + ex.Message;
        }
    }

    public static string MailWithouAttachment(string to, string subject, string mailBody, string signatureData, string stu_sign)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("noreply@nortwest.edu.au");
            //mail.Bcc.Add("krupali@nortwest.edu.au");

            //mail.Bcc.Add("hardikvaghasiya5566@gmail.com");

            mail.To.Add(to);

            mail.Subject = subject;
            mail.Body = mailBody;
            mail.IsBodyHtml = true;

            // Add attachment to the mail

            if (!string.IsNullOrEmpty(signatureData) && File.Exists(signatureData))
            {
                Attachment Document = new Attachment(signatureData);
                mail.Attachments.Add(Document);
            }


            if (!string.IsNullOrEmpty(stu_sign) && File.Exists(stu_sign))
            {
                Attachment student_sign = new Attachment(stu_sign);
                mail.Attachments.Add(student_sign);
            }

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com"; // Or Your SMTP Server Address
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("noreply@nortwest.edu.au", "mqea slfe nvfv xwpt"); // Replace with your sender email and password

            smtp.EnableSsl = true;

            smtp.Send(mail);

            return "Email sent successfully!";
        }
        catch (Exception ex)
        {
            return "Error sending email: " + ex.Message;
        }
    }


    public static string SendGTEMail(string to, string subject, string mailBody, Attachment attachmentStream, string signatureData, string refuse_visa_aus, string breach_visa_condition, string score_sheet)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("noreply@nortwest.edu.au");
            //mail.Bcc.Add("krupali@nortwest.edu.au");
            //mail.Bcc.Add("hardikvaghasiya5566@gmail.com");
            mail.To.Add(to);

            mail.Subject = subject;
            mail.Body = mailBody;
            mail.IsBodyHtml = true;

            mail.Attachments.Add(attachmentStream);

            //if (!string.IsNullOrEmpty(signatureData) && File.Exists(signatureData))
            //{
            //    byte[] signBytes = File.ReadAllBytes(signatureData);
            //    string signBase64 = Convert.ToBase64String(signBytes);
            //    MemoryStream signStream = new MemoryStream(signBytes);
            //    Attachment signAttachment = new Attachment(signStream, "Signature.jpg");
            //    mail.Attachments.Add(signAttachment);
            //}

            // Add photo attachment


            if (!string.IsNullOrEmpty(refuse_visa_aus) && File.Exists(refuse_visa_aus))
            {
                Attachment RefuseVisa = new Attachment(refuse_visa_aus);
                mail.Attachments.Add(RefuseVisa);
            }

            if (!string.IsNullOrEmpty(breach_visa_condition) && File.Exists(breach_visa_condition))
            {
                Attachment BreachVisa = new Attachment(breach_visa_condition);
                mail.Attachments.Add(BreachVisa);
            }

            if (!string.IsNullOrEmpty(score_sheet) && File.Exists(score_sheet))
            {
                Attachment ScoreSheet = new Attachment(score_sheet);
                mail.Attachments.Add(ScoreSheet);
            }

            // Add attachment to the mail
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com"; // Or Your SMTP Server Address
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("noreply@nortwest.edu.au", "mqea slfe nvfv xwpt"); // Replace with your sender email and password

            smtp.EnableSsl = true;

            smtp.Send(mail);

            return "Email sent successfully!";
        }
        catch (Exception ex)
        {
            return "Error sending email: " + ex.Message;
        }
    }
    public static string SendMail_new_vet(string to, string cc, string subject, string mailBody, Attachment attachmentStream, string signatureData, string stu_photo)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("noreply@nortwest.edu.au");

            //mail.Bcc.Add("vaghasiyaprit799@gmail.com");

            //mail.Bcc.Add("hardikvaghasiya5566@gmail.com");

            foreach (var address in to.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                mail.To.Add(address.Trim());
            }

            foreach (var address in cc.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                mail.CC.Add(address.Trim());
            }

            mail.Subject = subject;
            mail.Body = mailBody;
            mail.IsBodyHtml = true;

            if (attachmentStream != null)
            {
                mail.Attachments.Add(attachmentStream);
            }

            if (!string.IsNullOrEmpty(signatureData) && File.Exists(signatureData))
            {
                byte[] signBytes = File.ReadAllBytes(signatureData);
                string signBase64 = Convert.ToBase64String(signBytes);
                MemoryStream signStream = new MemoryStream(signBytes);
                Attachment signAttachment = new Attachment(signStream, "Signature.jpg");
                mail.Attachments.Add(signAttachment);
            }

            // Add photo attachment
            if (!string.IsNullOrEmpty(stu_photo) && File.Exists(stu_photo))
            {
                Attachment student_photo = new Attachment(stu_photo);
                mail.Attachments.Add(student_photo);
            }

            if (!string.IsNullOrEmpty(stu_photo) && File.Exists(stu_photo))
            {
                Attachment student_photo = new Attachment(stu_photo);
                mail.Attachments.Add(student_photo);
            }

            // Add attachment to the mail
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com"; // Or Your SMTP Server Address
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("noreply@nortwest.edu.au", "mqea slfe nvfv xwpt"); // Replace with your sender email and password

            smtp.EnableSsl = true;

            smtp.Send(mail);

            return "Email sent successfully!";
        }
        catch (Exception ex)
        {
            return "Error sending email: " + ex.Message;
        }
    }
    public static string send_course_entry(string to, string subject, string mailBody, Attachment attachmentStream, string signatureData, string refuse_visa_aus, string breach_visa_condition, string score_sheet)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("noreply@nortwest.edu.au");
            mail.CC.Add("orientation@nortwest.edu.au");
            //mail.Bcc.Add("vaghasiyaprit799@gmail.com");
            //mail.Bcc.Add("hardikvaghasiya5566@gmail.com");
            mail.To.Add(to);

            mail.Subject = subject;
            mail.Body = mailBody;
            mail.IsBodyHtml = true;

            mail.Attachments.Add(attachmentStream);

            //if (!string.IsNullOrEmpty(signatureData) && File.Exists(signatureData))
            //{
            //    byte[] signBytes = File.ReadAllBytes(signatureData);
            //    string signBase64 = Convert.ToBase64String(signBytes);
            //    MemoryStream signStream = new MemoryStream(signBytes);
            //    Attachment signAttachment = new Attachment(signStream, "Signature.jpg");
            //    mail.Attachments.Add(signAttachment);
            //}

            // Add photo attachment


            if (!string.IsNullOrEmpty(refuse_visa_aus) && File.Exists(refuse_visa_aus))
            {
                Attachment RefuseVisa = new Attachment(refuse_visa_aus);
                mail.Attachments.Add(RefuseVisa);
            }

            if (!string.IsNullOrEmpty(breach_visa_condition) && File.Exists(breach_visa_condition))
            {
                Attachment BreachVisa = new Attachment(breach_visa_condition);
                mail.Attachments.Add(BreachVisa);
            }

            if (!string.IsNullOrEmpty(score_sheet) && File.Exists(score_sheet))
            {
                Attachment ScoreSheet = new Attachment(score_sheet);
                mail.Attachments.Add(ScoreSheet);
            }

            // Add attachment to the mail
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com"; // Or Your SMTP Server Address
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("noreply@nortwest.edu.au", "mqea slfe nvfv xwpt"); // Replace with your sender email and password

            smtp.EnableSsl = true;

            smtp.Send(mail);

            return "Email sent successfully!";
        }
        catch (Exception ex)
        {
            return "Error sending email: " + ex.Message;
        }
    }
}
