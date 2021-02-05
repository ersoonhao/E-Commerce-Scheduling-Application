using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class EmpManageProject2 : System.Web.UI.Page
{
    private string description;
    string task, time, date;
    private string projName;

    readonly SqlConnection _mDb = new SqlConnection
    {
        ConnectionString =
        "Data Source=mmzwzgz169.database.windows.net;Initial Catalog=impressiondesign_db;User ID=ImpressionDB2;Password=FypHuat2016"
    };

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["sManageProjects"] = Request.QueryString["ProjectID"];
    }

    protected void DoneBTN_OnClick(object sender, EventArgs e)
    {

           var header = (Button)sender;
        var row = (GridViewRow)header.NamingContainer;
        string task = row.Cells[1].Text;

        _mDb.Open();
        const string UpdateAvailability =
        "UPDATE myProjectDetails SET pdStatus = @status WHERE pdProjectID = @PID AND pdTask = @task";
        var cmd4 = new SqlCommand(UpdateAvailability, _mDb);
        cmd4.Parameters.AddWithValue("@status", "Completed");
        cmd4.Parameters.AddWithValue("@PID", Request.QueryString["ProjectID"]);
        cmd4.Parameters.AddWithValue("@task", task);
        cmd4.ExecuteNonQuery();
        _mDb.Close();

        GridView1.DataBind();
    }

    protected void RevertBTN_OnClick(object sender, EventArgs e)
    {
        var header = (Button)sender;
        var row = (GridViewRow)header.NamingContainer;
        string task = row.Cells[1].Text;

        _mDb.Open();
        const string UpdateAvailability =
        "UPDATE myProjectDetails SET pdStatus = @status WHERE pdProjectID = @PID AND pdTask = @task";
        var cmd4 = new SqlCommand(UpdateAvailability, _mDb);
        cmd4.Parameters.AddWithValue("@status", "Ongoing");
        cmd4.Parameters.AddWithValue("@PID", Request.QueryString["ProjectID"]);
        cmd4.Parameters.AddWithValue("@task", task);
        cmd4.ExecuteNonQuery();
        _mDb.Close();

        GridView1.DataBind();
    }

    protected void GridView1_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType.Equals(DataControlRowType.DataRow))
        {
            if (e.Row.Cells[2].Text == "Completed")
            {
                {
                    e.Row.Cells[2].ForeColor = Color.LimeGreen;

                    Button btnDone = (Button)e.Row.FindControl("DoneBTN");
                    btnDone.Visible = false;

                    Button btnRevert = (Button)e.Row.FindControl("RevertBTN");
                    btnRevert.Visible = true;
                }
            }
            if (e.Row.Cells[2].Text == "Ongoing")
            {
                {
                    Button btnDone = (Button)e.Row.FindControl("DoneBTN");
                    btnDone.Visible = true;

                    Button btnRevert = (Button)e.Row.FindControl("RevertBTN");
                    btnRevert.Visible = false;
                }
            }
        }
    }



    protected void Button2_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("EmpManageProject1.aspx");
    }

    protected void Button1_OnClick(object sender, EventArgs e)
    {
        description = DescriptionTB.Text;
        task = TaskTB.Text;
        time = TimeTB.Text;
        date = DateTB.Text;
        var ph = new ProjectHandler();
        ph.CreateProjectDetails(Request.QueryString["ProjectID"], task, description, time, date);
        TaskTB.Text = "";
        DescriptionTB.Text = "";
        GridView1.DataBind();
        projName = GetName();
        AddReminder();
    }

    public string GetName()
    {
        _mDb.Open();
        const string query =
            "SELECT * FROM myProjects WHERE ProjectID = @projectID";

        var cmd = new SqlCommand(query, _mDb);
        cmd.Parameters.AddWithValue("@projectID", Request.QueryString["ProjectID"]);
        var rdr = cmd.ExecuteReader();
        rdr.Read();
        string ProjID = (string)rdr["pProjectName"];

        _mDb.Close();

        return ProjID;

    }

    public void AddReminder()
    {
        _mDb.Open();
        const string UpdateAvailability =
        "INSERT INTO myReminders(rDate, rEvent, rProject, rTime, rStatus, rEmployee) VALUES(@date, @event, @project, @time, @status, @employee)";
        var cmd4 = new SqlCommand(UpdateAvailability, _mDb);
        cmd4.Parameters.AddWithValue("@date", date);
        cmd4.Parameters.AddWithValue("@event", "Project Milestone");
        cmd4.Parameters.AddWithValue("@project", projName);
        cmd4.Parameters.AddWithValue("@time", time);
        cmd4.Parameters.AddWithValue("@status", "Remind Me");
        cmd4.Parameters.AddWithValue("@employee", (string)Session["sName"]);
        cmd4.ExecuteNonQuery();
        _mDb.Close();
    }

    protected void InsertButton_OnClick(object sender, EventArgs e)
    {
        throw new NotImplementedException();
    }
}