using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LoginHandler
/// </summary>
public class LoginHandler
{
    readonly SqlConnection _mDb = new SqlConnection
    {
        ConnectionString =
        "Data Source=mmzwzgz169.database.windows.net;Initial Catalog=impressiondesign_db;User ID=ImpressionDB2;Password=FypHuat2016"
    };

	public LoginHandler()
	{
		
	}

    public bool CheckLogin(string username, string password)
    {
        bool LoginFlag = false;
        _mDb.Open();

        const string login = "SELECT * FROM myCustomers WHERE @username = cUsername AND @password = cPassword";
        var cmd = new SqlCommand(login, _mDb);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@password", password);
        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            LoginFlag = true;
            rdr.Read();
            
        }
        _mDb.Close();
        return LoginFlag;
    }
    public bool CheckMaster(string username, string password)
    {
        bool LoginFlag = false;
        _mDb.Open();

        const string login = "SELECT * FROM myAdmin WHERE @username = aUsername AND @password = aPassword";
        var cmd = new SqlCommand(login, _mDb);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@password", password);
        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            LoginFlag = true;
            rdr.Read();
        }
        _mDb.Close();
        return LoginFlag;

    }
    public bool CheckAdmin(string username, string password)
    {
        bool LoginFlag = false;
        _mDb.Open();

        const string login = "SELECT * FROM myEmployees WHERE @username = eUsername AND @password = ePassword";
        var cmd = new SqlCommand(login, _mDb);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@password", password);
        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            LoginFlag = true;
            rdr.Read();
        }
        _mDb.Close();
        return LoginFlag;
    }
    
   
}