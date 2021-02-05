using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RegisterHandler
/// </summary>
public class RegisterHandler
{
    readonly SqlConnection _mDb = new SqlConnection
    {
        ConnectionString =
        "Data Source=mmzwzgz169.database.windows.net;Initial Catalog=impressiondesign_db;User ID=ImpressionDB2;Password=FypHuat2016"
    };
	public RegisterHandler()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void Register(string name, string username, string password, string email, string mobile)
    {
        _mDb.Open();
        const string addProduct =
        "INSERT INTO myCustomers(cName, cUsername, cPassword, cEmail, cMobile) VALUES(@name, @username, @password, @email, @mobile)";
        var cmd = new SqlCommand(addProduct, _mDb);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@password", password);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@mobile", mobile);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }
}