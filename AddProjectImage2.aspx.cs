using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddProjectImage2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void UploadBTN_OnClick(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {

            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + fileName);

            string imageUrl = "Uploads/" + fileName;
            string description = DescriptionTB.Text;

            var ph = new ProjectHandler();
            ph.CreateProjectPost((string)Session["sManageProjects"], imageUrl, description);

            Image1.Src = imageUrl;
        }
        else
        {
            Debug.WriteLine("THere is no file");
        }
    }

    protected void Button1_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("CustProject2.aspx?ProjectID=" + (string)Session["sManageProjects"]);
    }
}