using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChatService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    public class OfferRequest
    {
        public string student_id;
        public string passport;
        public string dob; // dd/MM/yyyy
    }

    public class OfferResponse
    {
        public bool success;
        public string link;
        public string message;
    }

    [WebMethod]
    public static OfferResponse ValidateOfferLetter(OfferRequest data)
    {
        try
        {
            // ---------- BASIC VALIDATION ----------
            if (data == null ||
                string.IsNullOrWhiteSpace(data.student_id) ||
                string.IsNullOrWhiteSpace(data.passport) ||
                string.IsNullOrWhiteSpace(data.dob))
            {
                return new OfferResponse
                {
                    success = false,
                    message = "Invalid request data."
                };
            }

            // ---------- DOB PARSE ----------
            DateTime dob;
            if (!DateTime.TryParseExact(
                    data.dob,
                    "dd/MM/yyyy",
                    CultureInfo.InvariantCulture,
                    DateTimeStyles.None,
                    out dob))
            {
                return new OfferResponse
                {
                    success = false,
                    message = "Invalid date of birth format."
                };
            }

            // ---------- DATABASE CHECK (SAMPLE LOGIC) ----------
            // TODO: Replace this with real SQL validation

            bool isValidStudent =
                data.student_id == "STU123" &&
                data.passport.ToUpper() == "P1234567" &&
                dob == new DateTime(2000, 5, 10);

            if (isValidStudent)
            {
                return new OfferResponse
                {
                    success = true,
                    link = "https://nortwest.edu.au/offerletters/" + data.student_id + ".pdf",
                    message = "Verification successful."
                };
            }

            return new OfferResponse
            {
                success = false,
                message = "Verification failed. Details do not match."
            };
        }
        catch (Exception ex)
        {
            return new OfferResponse
            {
                success = false,
                message = "Server error: " + ex.Message
            };
        }
    }
}
