using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Send_Mail.SendMail("english@nortwest.edu.au", "Check Mail Error", "This is mail error check", null, "", "");
    }
}