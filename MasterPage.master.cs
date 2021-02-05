using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if ((bool)Session["sLogin"])
            {
                nameLBL.InnerHtml = (string)Session["sName"];
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        catch (Exception exception)
        {
            Session["sLogin"] = false;
            Response.Redirect("Login.aspx");
        }
    }
}
