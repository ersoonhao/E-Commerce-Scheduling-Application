using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SubmitBTN_OnClick(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {

            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + fileName);

            string name = NameTB.Text;
            string price = PriceTB.Text;
            string description = DescriptionTB.Text;
            string qty = QtyTB.Text;
            int IntQty = int.Parse(qty);
            string imageUrl = "Uploads/" + fileName;


            var ph = new ProductHandler();
            ph.CreateProducts(name, price, description, IntQty, imageUrl);

            Response.Redirect("EmpManageProducts.aspx");

        }
        else
        {
            Debug.WriteLine("THere is no file");
        }

    }
}