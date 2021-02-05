using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ReminderHandler
/// </summary>
public class ReminderHandler
{
    readonly SqlConnection _mDb = new SqlConnection
    {
        ConnectionString =
        "Data Source=mmzwzgz169.database.windows.net;Initial Catalog=impressiondesign_db;User ID=ImpressionDB2;Password=FypHuat2016"
    };

	//Appointment Reminders
    public bool ApptScan(string employee)
    {
        bool ApptScan = false;
        
        _mDb.Open();
        const string selectString = "SELECT * FROM myBookings WHERE bEmployee = @employee AND bReminder = @reminder";
        var cmd = new SqlCommand(selectString, _mDb);
        cmd.Parameters.AddWithValue("@employee", employee);
        cmd.Parameters.AddWithValue("@reminder", "Unscanned");
        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            ApptScan = true;

        }
        _mDb.Close();
        return ApptScan;
    }

    public int ApptCount(string employee)
    {
        int count = 0;
        _mDb.Open();
        const string selectString = "SELECT COUNT(bDate) AS Expr1 FROM myBookings WHERE bEmployee = @employee AND bReminder = @reminder";
        var cmd = new SqlCommand(selectString, _mDb);
        cmd.Parameters.AddWithValue("@employee", employee);
        cmd.Parameters.AddWithValue("@reminder", "Unscanned");
        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            count = (int)rdr["Expr1"];

        }
        _mDb.Close();
        return count;
    }

    public string GetApptDate(string employee)
    {
        string date = "";
        _mDb.Open();
        const string selectString = "SELECT bDate FROM myBookings WHERE bEmployee = @employee AND bReminder = @reminder";
        var cmd = new SqlCommand(selectString, _mDb);
        cmd.Parameters.AddWithValue("@employee", employee);
        cmd.Parameters.AddWithValue("@reminder", "Unscanned");
        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            date = (string)rdr["bDate"];

        }
        _mDb.Close();
        return date;
    }
}