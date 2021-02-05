using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Reminder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void ListView1_OnItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            var yourLabel = (Label)e.Item.FindControl("rEventLabel");
            if (yourLabel.Text == "Appointment")
            {
                HtmlGenericControl cardControl = (HtmlGenericControl) e.Item.FindControl("divColor");
                cardControl.Attributes.Add("style", "background-color: #333");
            }
            else
            {
                HtmlGenericControl cardControl = (HtmlGenericControl)e.Item.FindControl("divColor");
                cardControl.Attributes.Add("style", "background-color: #8BC34A");
            }
        }
    }
}