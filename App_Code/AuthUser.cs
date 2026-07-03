using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for AuthUser
/// </summary>
public class AuthUser : System.Web.Services.Protocols.SoapHeader
{

    public string UserName { get; set; }
    public string Password { get; set; }
    public string Token { get; set; }

    public bool IsValid()
    {
        bool result = false;
        if (UserName == "Admin" && Password == "123" && Token == "College")
        {
            result = true;
        }
        return result;
    }

}