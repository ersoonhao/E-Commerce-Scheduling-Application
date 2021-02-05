using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustQuotation : System.Web.UI.Page
{
    private string building;
    string rooms, description, imageUrl;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SubmitBTN_OnClick(object sender, EventArgs e)
    {
          //check if fileuploader has file
        if (fileuploader.HasFile)
        {
            string extension = System.IO.Path.GetExtension(fileuploader.FileName);
            if (extension == ".jpg")
            {
                //get folder path
                string path = Server.MapPath("Uploads/floorplan/");
                string imagename = System.IO.Path.GetFileName(fileuploader.FileName);
                fileuploader.SaveAs(path + imagename);
                // insert into database

                building = BuildingTB.Text;
                rooms = RoomTB.Text;
                description = DescriptionTB.Text;
                SendEmail();

                MsgBox("Submitted Successfully!");
            }
            else
            {

            }

        }
    }

    public void SendEmail()
    {
        //try
        //{
        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient();
        SmtpServer.Host = "Smtp.gmail.com";
        mail.From = new MailAddress("impressiondesignfirm@gmail.com");
        mail.To.Add("impressiondesignfirm@gmail.com");
        mail.Subject = "Quotation";

        mail.IsBodyHtml = true;
        string htmlBody = PopulateBody((string)Session["sEmail"], building, rooms, description);
        mail.Body = htmlBody;

        SmtpServer.Port = 587;
        SmtpServer.Credentials = new System.Net.NetworkCredential("impressiondesignfirm@gmail.com", "reGOpQ==22858");
        SmtpServer.EnableSsl = true;

        SmtpServer.Send(mail);
        //}
        //catch (Exception ex)
        //{
        //    Console.WriteLine(ex.ToString());
        //}


    }

    private string PopulateBody(string email, string building, string rooms, string description)
    {
        string body = string.Empty;
        body = @"<!DOCTYPE html>
<html xmlns=""http://www.w3.org/1999/xhtml"">
<head>
    <title></title>
</head>

<body>
<span style=""font-family: Arial; font-size: 10pt"">
    <br />
        <b>Quotation</b>,<br /><br />
        Reply to: {Email}
        Building type: {Building}
        <br />
        Rooms {Rooms}
        <br />
        Description:{Description}
        <br />
        Location: 845 Geylang Road # 03-07 
        <br />
        Tanjong Katong Complex Singapore 400845
        <br />
        <br />
        Best Regards,

    </span>
</body>
</html>
                    ";
        body = body.Replace("{Email}", email);
        body = body.Replace("{Building}", building);
        body = body.Replace("{Rooms}", rooms);
        body = body.Replace("{Description}", description);
        Debug.WriteLine(body);
        return body;
    }
    public void MsgBox(String msg)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Message Box", "<script language='javascript'>alert(' " + msg + "')</script>");
    }
}