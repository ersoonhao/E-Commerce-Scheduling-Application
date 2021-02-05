using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for QuotationHandler
/// </summary>
public class QuotationHandler
{
    readonly SqlConnection _mDb = new SqlConnection
    {
        ConnectionString =
        "Data Source=mmzwzgz169.database.windows.net;Initial Catalog=impressiondesign_db;User ID=ImpressionDB2;Password=FypHuat2016"
    };

    //public void CreateQuotation(string building, string room, string description, string image)
    //{
    //    _mDb.Open();
    //    const string query =
    //        "INSERT INTO myQuotations(qApartment, qRooms, qDescription, qEmail) VALUES(@name, @price, @description, @qty, @image)";
    //    var cmd = new SqlCommand(query, _mDb);
    //    cmd.Parameters.AddWithValue("@name", name);
    //    cmd.Parameters.AddWithValue("@price", price);
    //    cmd.Parameters.AddWithValue("@description", description);
    //    cmd.Parameters.AddWithValue("@qty", qty);
    //    cmd.Parameters.AddWithValue("@image", image);
    //    cmd.ExecuteNonQuery();
    //    _mDb.Close();
    //}
}