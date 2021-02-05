using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;

public partial class EditProducts : System.Web.UI.Page
{
    private string prodId;
    string name, description, price, qty, img;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            
        }
        try
        {
            DetailsViewRow row0 = DetailsView1.Rows[0];
            prodId = row0.Cells[1].Text;

            DetailsViewRow row1 = DetailsView1.Rows[1];
            name = row1.Cells[1].Text;

            DetailsViewRow row2 = DetailsView1.Rows[2];
            price = row2.Cells[1].Text;

            DetailsViewRow row3 = DetailsView1.Rows[3];
            description = row3.Cells[1].Text;

            DetailsViewRow row4 = DetailsView1.Rows[4];
            img = row4.Cells[1].Text;

            DetailsViewRow row5 = DetailsView1.Rows[5];
            qty = row5.Cells[1].Text;
        }
        catch (Exception exception)
        {
            Response.Redirect("EmpManageProducts.aspx");
        }

        nameLBL.InnerHtml = name;
        priceLBL.InnerHtml = "$"+ price;
        descriptionLBL.InnerHtml = description;
        qtyLBL.InnerHtml = "Quantity: " + qty;
        img1.Src = img;

        NameTB.Attributes.Add("placeholder", name);
        PriceTB.Attributes.Add("placeholder", price);
        DescriptionTB.Attributes.Add("placeholder", description);
        QtyTB.Attributes.Add("placeholder", qty);

    }

    protected void SubmitBTN_OnClick(object sender, EventArgs e)
    {
        var ph = new ProductHandler();
        
        if (!NameTB.Text.IsNullOrWhiteSpace())
        {
            ph.UpdateName(NameTB.Text, prodId);
        }

        if (!PriceTB.Text.IsNullOrWhiteSpace())
        {
            ph.UpdatePrice(int.Parse(PriceTB.Text), prodId);
        }

        if (!DescriptionTB.Text.IsNullOrWhiteSpace())
        {
            ph.UpdateDescription(DescriptionTB.Text, prodId);
        }

        if (!QtyTB.Text.IsNullOrWhiteSpace())
        {
            ph.UpdateQty(int.Parse(QtyTB.Text), prodId);
        }

        if (FileUpload1.HasFile)
        {
            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + fileName);

            string imageUrl = "Uploads/" + fileName;

            ph.UpdateImg(imageUrl, prodId);
        }

        DetailsView1.DataBind();

        DetailsViewRow row0 = DetailsView1.Rows[0];
        prodId = row0.Cells[1].Text;

        DetailsViewRow row1 = DetailsView1.Rows[1];
        name = row1.Cells[1].Text;

        DetailsViewRow row2 = DetailsView1.Rows[2];
        price = row2.Cells[1].Text;

        DetailsViewRow row3 = DetailsView1.Rows[3];
        description = row3.Cells[1].Text;

        DetailsViewRow row4 = DetailsView1.Rows[4];
        img = row4.Cells[1].Text;

        DetailsViewRow row5 = DetailsView1.Rows[5];
        qty = row5.Cells[1].Text;

        nameLBL.InnerHtml = name;
        priceLBL.InnerHtml = "$" + price;
        descriptionLBL.InnerHtml = description;
        qtyLBL.InnerHtml = "Quantity: " + qty;
        img1.Src = img;

        NameTB.Attributes.Add("placeholder", name);
        PriceTB.Attributes.Add("placeholder", price);
        DescriptionTB.Attributes.Add("placeholder", description);
        QtyTB.Attributes.Add("placeholder", qty);
    }

    protected void Button1_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("EmpManageProducts.aspx");
    }
}