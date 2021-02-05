using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Net.Mail;
using System.ServiceModel.Channels;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class EmpViewAppointments : System.Web.UI.Page
{
    private string name;
    string time, date, employee, email;

    readonly SqlConnection _mDb = new SqlConnection
    {
        ConnectionString =
        "Data Source=mmzwzgz169.database.windows.net;Initial Catalog=impressiondesign_db;User ID=ImpressionDB2;Password=FypHuat2016"
    };


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ApproveBTN_OnClick(object sender, EventArgs e)
    {
        // find other controls:
        var header = (Button)sender;
        var item = (ListViewItem)header.NamingContainer;
        var nameLBL = (HtmlGenericControl)item.FindControl("nameTB");
        var timeLBL = (Label)item.FindControl("bTimeLabel");
        var dateLBL = (Label)item.FindControl("bDateLabel");
        var emailLBL = (Label)item.FindControl("bEmailLabel");
        var employeeLBL = (Label)item.FindControl("bEmployeeLabel");

        name = nameLBL.InnerHtml;
        time = timeLBL.Text;
        date = dateLBL.Text;
        email = emailLBL.Text;
        employee = employeeLBL.Text;
        Debug.WriteLine(name);

        SendEmail();
        UpdateChanges();
        AddReminder();
            
    }

    private string PopulateBody(string name, string date, string time, string employee)
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
        Hello <b>{Name}</b>,<br /><br />
        My name is {Employee} and I'm your assigned designer for the upcoming appointment. The appointment details are as follows.
        <br />
        Date: {Date}
        <br />
        <br />
        Time: {Time}
        <br />
        <br />
        Location: 845 Geylang Road # 03-07 
        <br />
        Tanjong Katong Complex Singapore 400845
        <br />
        <br />
        Best Regards,
        <br />
        {EmployeeName}
        <br/>
        Impression Firm
    </span>
</body>
</html>
                    ";
        body = body.Replace("{Employee}", employee);
        body = body.Replace("{Name}", name);
        body = body.Replace("{Date}", date);
        body = body.Replace("{Time}", time);
        body = body.Replace("{EmployeeName}", employee);
        Debug.WriteLine(body);
        return body;
    }

    public void SendEmail()
    {
        //try
        //{
        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

        mail.From = new MailAddress("impressiondesignfirm@gmail.com");
        mail.To.Add(email);
        mail.Subject = "Appointment Booking";

        mail.IsBodyHtml = true;
        string htmlBody = PopulateBody(name, date, time, (string)Session["sName"]);
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

    public void UpdateChanges()
    {
        _mDb.Open();
        const string UpdateAvailability =
        "UPDATE myBookings SET bStatus = @status, bReminder = @reminder WHERE bDate = @date AND bTime = @time";
        var cmd4 = new SqlCommand(UpdateAvailability, _mDb);
        cmd4.Parameters.AddWithValue("@status", "Pending");
        cmd4.Parameters.AddWithValue("@reminder", "Unscanned");
        cmd4.Parameters.AddWithValue("@date", date);
        cmd4.Parameters.AddWithValue("@time", time);
        cmd4.ExecuteNonQuery();
        _mDb.Close();
    }

    public void RejectAppt()
    {
        _mDb.Open();
        const string UpdateAvailability =
        "UPDATE myBookings SET bStatus = @status, bReminder = @reminder WHERE bDate = @date AND bTime = @time";
        var cmd4 = new SqlCommand(UpdateAvailability, _mDb);
        cmd4.Parameters.AddWithValue("@status", "Pending");
        cmd4.Parameters.AddWithValue("@reminder", "Unscanned");
        cmd4.Parameters.AddWithValue("@date", date);
        cmd4.Parameters.AddWithValue("@time", time);
        cmd4.ExecuteNonQuery();
        _mDb.Close();
    }

    public void AddReminder()
    {
        _mDb.Open();
        const string UpdateAvailability =
        "INSERT INTO myReminders(rDate, rEvent, rProject, rTime, rStatus, rEmployee) VALUES(@date, @event, @project, @time, @status, @employee)";
        var cmd4 = new SqlCommand(UpdateAvailability, _mDb);
        cmd4.Parameters.AddWithValue("@date", date);
        cmd4.Parameters.AddWithValue("@event", "Appointment");
        cmd4.Parameters.AddWithValue("@project", name);
        cmd4.Parameters.AddWithValue("@time", time);
        cmd4.Parameters.AddWithValue("@status", "Remind Me");
        cmd4.Parameters.AddWithValue("@employee", (string)Session["sName"]);
        cmd4.ExecuteNonQuery();
        _mDb.Close();
    }

    protected void RejectBTN_OnClick(object sender, EventArgs e)
    {
        // find other controls:
        var header = (Button)sender;
        var item = (ListViewItem)header.NamingContainer;
        var nameLBL = (HtmlGenericControl)item.FindControl("nameTB");
        var timeLBL = (Label)item.FindControl("bTimeLabel");
        var dateLBL = (Label)item.FindControl("bDateLabel");
        var emailLBL = (Label)item.FindControl("bEmailLabel");
        var employeeLBL = (Label)item.FindControl("bEmployeeLabel");

        name = nameLBL.InnerHtml;
        time = timeLBL.Text;
        date = dateLBL.Text;
        email = emailLBL.Text;
        employee = employeeLBL.Text;
        Debug.WriteLine(name);

        SendEmail2();
        RejectAppt();
        ListView1.DataBind();
    }

    public void SendEmail2()
    {
        //try
        //{
        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

        mail.From = new MailAddress("impressiondesignfirm@gmail.com");
        mail.To.Add(email);
        mail.Subject = "Appointment Booking";

        mail.IsBodyHtml = true;
        string htmlBody = PopulateBody2(name, date, time, (string)Session["sName"]);
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

    private string PopulateBody2(string name, string date, string time, string employee)
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
        Hello <b>{Name}</b>,<br /><br />
        My name is {Employee} and I am not available for an appointment on the following date:
        <br />
        Date: {Date}
        <br />
        <br />
        Time: {Time}
        <br />
        <br />
        Location: 845 Geylang Road # 03-07 
        <br />
        Tanjong Katong Complex Singapore 400845
        <br />
        <br />
        Best Regards,
        <br />
        {EmployeeName}
        <br/>
        Impression Firm
    </span>
</body>
</html>
                    ";
        body = body.Replace("{Employee}", employee);
        body = body.Replace("{Name}", name);
        body = body.Replace("{Date}", date);
        body = body.Replace("{Time}", time);
        body = body.Replace("{EmployeeName}", employee);
        Debug.WriteLine(body);
        return body;
    }
}