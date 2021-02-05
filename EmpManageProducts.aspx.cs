using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class EmpManageProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void EditBTN_OnClick(object sender, EventArgs e)
    {
        // find other controls:
        var header = (Button)sender;
        var item = (ListViewItem)header.NamingContainer;
        var productID = (Label)item.FindControl("ProductIDLabel");
        string prodID = productID.Text;
        Response.Redirect("EditProducts.aspx?ProductID=" + prodID);
    }
}