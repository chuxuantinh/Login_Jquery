using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        

    }
    [System.Web.Services.WebMethod]
    public static string CheckLogin(string userName, string passWord)
    {
        string returnValue = string.Empty;
        try
        {
            if (userName == "aamir" && passWord == "hasan")
            {
                returnValue = "1";
            }
            else if (userName == "admin" && passWord == "123456")
            {
                returnValue = "2";
            }else if (userName == "hasan" && passWord == "aamir")
            {
                returnValue = "1";
            }
            else if (userName == "admin" && passWord == "admin")
            {
                returnValue = "server down,Try Again";
            }
            else 
            {
                returnValue = "0";
            }
        }
        catch (Exception ee)
        {
           
            
            // returnValue = "error" + ee.Message;
        }
        return returnValue;

    }
}
