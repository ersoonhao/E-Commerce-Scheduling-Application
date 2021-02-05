using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CustomerHandler
/// </summary>
public class CustomerHandler
{
    readonly SqlConnection _mDb = new SqlConnection
    {
        ConnectionString =
        "Data Source=mmzwzgz169.database.windows.net;Initial Catalog=impressiondesign_db;User ID=ImpressionDB2;Password=FypHuat2016"
    };

	public CustomerHandler()
	{

	}

    public void UpdateName(string name, string username)
    {
        _mDb.Open();
        const string addProduct =
        "UPDATE myCustomers SET cName=@name " + "WHERE(cUsername=@username)";
        var cmd = new SqlCommand(addProduct,_mDb);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }

    public void UpdateMobile(string mobile, string username)
    {
        _mDb.Open();
        const string addProduct =
         "UPDATE myCustomers SET cMobile=@mobile " + "WHERE(cUsername=@username)";
        var cmd = new SqlCommand(addProduct, _mDb);
        cmd.Parameters.AddWithValue("@mobile", mobile);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }

    public void UpdateEmail(string email, string username)
    {
        _mDb.Open();
        const string addProduct =
        "UPDATE myCustomers SET cEmail=@email " + "WHERE(cUsername=@username)";
        var cmd = new SqlCommand(addProduct, _mDb);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }

    public void UpdateAddress(string address, string username)
    {
        _mDb.Open();
        const string addProduct =
        "UPDATE myCustomers SET cAddress=@address " + "WHERE(cUsername=@username)";
        var cmd = new SqlCommand(addProduct, _mDb);
        cmd.Parameters.AddWithValue("@address", address);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }
}