using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustAppointment : System.Web.UI.Page
{

    readonly SqlConnection _mDb = new SqlConnection
    {
        ConnectionString =
        "Data Source=mmzwzgz169.database.windows.net;Initial Catalog=impressiondesign_db;User ID=ImpressionDB2;Password=FypHuat2016"
    };

    List<string> timeslotList = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            GridView1.DataBind();
        }
    }
    protected void CheckDateBTN_Click(object sender, EventArgs e)
    {
        string date = DateTB.Text;
        //Initialize booking handler
        BookingHandler bh = new BookingHandler();
        bool BookingFlag;
        BookingFlag = bh.CheckBookings(date);

        //If date doesn't exist in table
        if (!BookingFlag)
        {
            //Create bookings with time
            //Add timeslots
            timeslotList.Add("9:00AM - 11:00AM");
            timeslotList.Add("11:00AM - 1:00PM");
            timeslotList.Add("1:00AM - 3:00PM");
            timeslotList.Add("3:00AM - 5:00PM");

            int timeslotCount = timeslotList.Count;

            //Populate table with timeslots
            for (int i = 0; i < timeslotCount; i++)
            {
                bh.AddDates(date, timeslotList[i]);
            }

            //Populate Gridview with timings
            _mDb.Open();
            const string query =
                "SELECT bDate, bTime, bStatus FROM myBookingDates WHERE @date = bDate";
            var cmd = new SqlCommand(query, _mDb);
            cmd.Parameters.AddWithValue("@date", date);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            _mDb.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView1.UseAccessibleHeader = true;
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

            //Bound Dropdown list
            _mDb.Open();
            const string query2 =
                "SELECT bTime FROM myBookingDates WHERE @date = bDate AND @status = bStatus";
            var cmd2 = new SqlCommand(query2, _mDb);
            cmd2.Parameters.AddWithValue("@date", date);
            cmd2.Parameters.AddWithValue("@status", "Available");
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            _mDb.Close();
            TimeDDL.DataSource = dt2;
            TimeDDL.DataBind();
            TimeDDL.DataTextField = "bTime";
            TimeDDL.DataValueField = "bTime";
            TimeDDL.DataBind();
        }
        else
        {
            _mDb.Open();
            const string query =
                "SELECT bDate, bTime, bStatus FROM myBookingDates WHERE @date = bDate";
            var cmd = new SqlCommand(query, _mDb);
            cmd.Parameters.AddWithValue("@date", date);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            _mDb.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView1.UseAccessibleHeader = true;
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

            //Bound Dropdown list
            _mDb.Open();
            const string query2 =
                "SELECT bTime FROM myBookingDates WHERE @date = bDate AND @status = bStatus";
            var cmd2 = new SqlCommand(query2, _mDb);
            cmd2.Parameters.AddWithValue("@date", date);
            cmd2.Parameters.AddWithValue("@status", "Available");
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            _mDb.Close();
            TimeDDL.DataSource = dt2;
            TimeDDL.DataBind();
            TimeDDL.DataTextField = "bTime";
            TimeDDL.DataValueField = "bTime";
            TimeDDL.DataBind();
        }

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = "Date";
        }
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[1].Text = "Timeslot";
        }
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[2].Text = "Status";
        }
    }
    protected void SubmitBTN_Click(object sender, EventArgs e)
    {
        string timeslot = TimeDDL.SelectedItem.Text;
        string message = MessageTB.Text;
        string date = DateTB.Text;
        string employee;

        if (EmployeeDDL.SelectedIndex == 0)
        {

            //Randomize Count
            _mDb.Open();
            const string RANDOMIZE_ID =
            "SELECT COUNT(eName) AS Expr1 FROM myEmployees";
            var cmd2 = new SqlCommand(RANDOMIZE_ID, _mDb);
            var rdr = cmd2.ExecuteReader();
            rdr.Read();
            int Count = (int)rdr["Expr1"];
            _mDb.Close();

            Random r = new Random();
            int RandomNumber = r.Next(1, Count);

            //Get Randomized Employee
            _mDb.Open();
            const string RANDOMIZE_EMPLOYEES =
            "SELECT * FROM myEmployees WHERE EmployeeId = @empId";
            var cmd3 = new SqlCommand(RANDOMIZE_EMPLOYEES, _mDb);
            cmd3.Parameters.AddWithValue("@empId", RandomNumber);
            var rdr3 = cmd3.ExecuteReader();
            rdr3.Read();
            employee = (string)rdr3["eName"];
            _mDb.Close();

            
        }
        else
        {
            employee = EmployeeDDL.SelectedItem.Text;
        }

        //Confirm bookings
        _mDb.Open();
        const string addProduct =
        "INSERT INTO myBookings(bDate, bTime, bName, bUsername, bMessage, bEmail, bEmployee, bStatus) VALUES(@date, @time, @name, @username, @message, @email, @employee, @status)";
        var cmd = new SqlCommand(addProduct, _mDb);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@time", timeslot);
        cmd.Parameters.AddWithValue("@name", (string)Session["sName"]);
        cmd.Parameters.AddWithValue("@username", (string)Session["sUsername"]);
        cmd.Parameters.AddWithValue("@message", message);
        cmd.Parameters.AddWithValue("@email", (string)Session["sEmail"]);
        cmd.Parameters.AddWithValue("@employee", employee);
        cmd.Parameters.AddWithValue("@status", "Available");
        cmd.ExecuteNonQuery();
        _mDb.Close();

        //Change Status in unavailable
        _mDb.Open();
        const string UpdateAvailability =
        "UPDATE myBookingDates SET bStatus = @status WHERE bDate = @date AND bTime = @time";
        var cmd4 = new SqlCommand(UpdateAvailability, _mDb);
        cmd4.Parameters.AddWithValue("@status", "Unavailable");
        cmd4.Parameters.AddWithValue("@date", date);
        cmd4.Parameters.AddWithValue("@time", timeslot);
        cmd4.ExecuteNonQuery();
        _mDb.Close();

        MsgBox("Submitted Successfully!");

    }
    public void MsgBox(String msg)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Message Box", "<script language='javascript'>alert(' " + msg + "')</script>");
    }
}