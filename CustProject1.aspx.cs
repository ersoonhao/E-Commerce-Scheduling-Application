using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustProject1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ApproveBTN_OnClick(object sender, EventArgs e)
    {
        // find other controls:
        var header = (Button)sender;
        var item = (ListViewItem)header.NamingContainer;
        var projID = (Label)item.FindControl("ProjectIDLabel");
        string pID = projID.Text;

        Response.Redirect("CustProject2.aspx?ProjectID=" + pID);
    }
}