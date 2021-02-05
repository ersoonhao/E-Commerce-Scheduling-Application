using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.ServiceModel.Channels;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmpCreateProject2 : System.Web.UI.Page
{
    private string description;
    string task, time, date;

    readonly SqlConnection _mDb = new SqlConnection
    {
        ConnectionString =
        "Data Source=mmzwzgz169.database.windows.net;Initial Catalog=impressiondesign_db;User ID=ImpressionDB2;Password=FypHuat2016"
    };

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_OnClick(object sender, EventArgs e)
    {
        description = DescriptionTB.Text;
        task = TaskTB.Text;
        time = TimeTB.Text;
        date = DateTB.Text;
        var ph = new ProjectHandler();
        ph.CreateProjectDetails((string)Session["sBookingID"], task, description, time, date);
        TaskTB.Text = "";
        DescriptionTB.Text = "";
        GridView1.DataBind();
        AddReminder();
    }

    protected void GridView1_OnPreRender(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count > 0)
        {
            //This replaces <td> with <th> and adds the scope attribute
            GridView1.UseAccessibleHeader = true;

            //This will add the <thead> and <tbody> elements
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

            //This adds the <tfoot> element. 
            //Remove if you don't have a footer row
            GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
        }
    }

    protected void Button2_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("EmpManageProject");
    }


    

    public void AddReminder()
    {
        _mDb.Open();
        const string UpdateAvailability =
        "INSERT INTO myReminders(rDate, rEvent, rProject, rTime, rStatus, rEmployee) VALUES(@date, @event, @project, @time, @status, @employee)";
        var cmd4 = new SqlCommand(UpdateAvailability, _mDb);
        cmd4.Parameters.AddWithValue("@date", date);
        cmd4.Parameters.AddWithValue("@event", "Project Milestone");
        cmd4.Parameters.AddWithValue("@project", (string)Session["sProject"]);
        cmd4.Parameters.AddWithValue("@time", time);
        cmd4.Parameters.AddWithValue("@status", "Remind Me");
        cmd4.Parameters.AddWithValue("@employee", (string)Session["sName"]);
        cmd4.ExecuteNonQuery();
        _mDb.Close();
    }
}