using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookingHandler
/// </summary>
public class BookingHandler
{
    readonly SqlConnection _mDb = new SqlConnection
    {
        ConnectionString =
        "Data Source=mmzwzgz169.database.windows.net;Initial Catalog=impressiondesign_db;User ID=ImpressionDB2;Password=FypHuat2016"
    };
    public string GetCategory(string serviceID)
    {
        string category = "";
        _mDb.Open();

        const string login = "SELECT * FROM myServices WHERE @serviceId = ServiceID";
        var cmd = new SqlCommand(login, _mDb);
        cmd.Parameters.AddWithValue("@serviceId", serviceID);

        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            category = (string)rdr["sCategory"];
        }
        _mDb.Close();
        return category;
    }

    public decimal GetPrice(string serviceID)
    {
        decimal category = 0;
        _mDb.Open();

        const string login = "SELECT * FROM myServices WHERE @serviceId = ServiceID";
        var cmd = new SqlCommand(login, _mDb);
        cmd.Parameters.AddWithValue("@serviceId", serviceID);

        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            category = (decimal)rdr["sPrice"];
        }
        _mDb.Close();
        return category;
    }


    public string GetImage(string serviceID)
    {
        string category = "";
        _mDb.Open();

        const string login = "SELECT * FROM myServices WHERE @serviceId = ServiceID";
        var cmd = new SqlCommand(login, _mDb);
        cmd.Parameters.AddWithValue("@serviceId", serviceID);

        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            category = (string)rdr["sImage"];
        }
        _mDb.Close();
        return category;
    }

    public string GetDescription(string serviceID)
    {
        string category = "";
        _mDb.Open();

        const string login = "SELECT * FROM myServices WHERE @serviceId = ServiceID";
        var cmd = new SqlCommand(login, _mDb);
        cmd.Parameters.AddWithValue("@serviceId", serviceID);

        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            category = (string)rdr["sDescription"];
        }
        _mDb.Close();
        return category;
    }

    public bool CheckBookings(string date)
    {
        bool BookingFlag = false;
        _mDb.Open();
        const string query =
            "SELECT * FROM myBookingDates WHERE @date = bDate";
        var cmd = new SqlCommand(query, _mDb);
        cmd.Parameters.AddWithValue("@date", date);

        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            BookingFlag = true;
        }
        _mDb.Close();
        return BookingFlag;

    }

    public void DeleteBooking(int BookingId)
    {
          _mDb.Open();
        const string query =
            "INSERT INTO myBookings WHERE myBookingID = @original_myBookingID)";
        var cmd = new SqlCommand(query, _mDb);
        cmd.Parameters.AddWithValue("@original_myBookingID", BookingId);
        cmd.ExecuteNonQuery();
        _mDb.Close();

       
    }

    public string GetServiceName(string serviceId)
    {
        string serviceName = "";
        _mDb.Open();
        const string query =
            "SELECT sName FROM myServices WHERE @serviceId = ServiceID";
        var cmd = new SqlCommand(query, _mDb);
        cmd.Parameters.AddWithValue("@serviceId", serviceId);

        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            serviceName = (string)rdr["sName"];
        }
        _mDb.Close();
        return serviceName;

    }


    public string GetEmployeeName(string employeeID)
    {
        string employeeName = "";
        _mDb.Open();
        const string query =
            "SELECT eName FROM myEmployees WHERE @employeeId = EmployeeID";
        var cmd = new SqlCommand(query, _mDb);
        cmd.Parameters.AddWithValue("@employeeId", employeeID);

        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            employeeName = (string)rdr["eName"];
        }
        _mDb.Close();
        return employeeName;

    }

    public void AddDates(string date, string time)
    {

        _mDb.Open();
        const string query =
            "INSERT INTO myBookingDates(bDate, bTime, bStatus) VALUES(@date, @time, @status)";
        var cmd = new SqlCommand(query, _mDb);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@time", time);
        cmd.Parameters.AddWithValue("@status", "Available");
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }

    //public void SendOrders(string custName, string custMobile, string custEmail, string servName, string servPrice, string empName, string date, string time)
    //{

    //    _mDb.Open();
    //    const string query =
    //        "INSERT INTO mySentBookings(bCustomerName, bCustomerMobile, bCustomerEmail, bServiceName, bServicePrice, bEmployeeName, bDate, bTime) VALUES(@customerName,@customerMobile, @customerEmail, @serviceName, @servicePrice, @employeeName, @date, @time)";
    //    var cmd = new SqlCommand(query, _mDb);
    //    cmd.Parameters.AddWithValue("@customerName", custName);
    //    cmd.Parameters.AddWithValue("@customerMobile", custMobile);
    //    cmd.Parameters.AddWithValue("@customerEmail", custEmail);
    //    cmd.Parameters.AddWithValue("@serviceName", servName);
    //    cmd.Parameters.AddWithValue("@servicePrice", servPrice);
    //    cmd.Parameters.AddWithValue("@employeeName", empName);
    //    cmd.Parameters.AddWithValue("@date", date);
    //    cmd.Parameters.AddWithValue("@time", time);

    //    cmd.ExecuteNonQuery();
    //    _mDb.Close();
    //}

    //public void UpdateAvailability(string empName, string serviceId, string time)
    //{
    //     _mDb.Open();
    //    const string query =
    //        "UPDATE myBookingDates SET bStatus = @status WHERE bName = @name AND bServiceID = @serviceId AND @time = bTime";
    //    var cmd = new SqlCommand(query, _mDb);
    //    cmd.Parameters.AddWithValue("@status", "Unavailable");
    //    cmd.Parameters.AddWithValue("@name", empName);
    //    cmd.Parameters.AddWithValue("@serviceId", serviceId);
    //    cmd.Parameters.AddWithValue("@time", time);

    //    cmd.ExecuteNonQuery();
    //    _mDb.Close();
    //}

    public void CancelBooking(string name, string time, string date, string employee)
    {
        _mDb.Open();
        const string query =
            "DELETE myBookings WHERE bName = @name AND bDate = @date AND bEmployee = @employee";
        var cmd = new SqlCommand(query, _mDb);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@employee", employee);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }

    //public void ApproveBooking(string name, string time, string date, string employee)
    //{

    //}
}