using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductHandler
/// </summary>
public class ProductHandler
{
    readonly SqlConnection _mDb = new SqlConnection
    {
        ConnectionString =
        "Data Source=mmzwzgz169.database.windows.net;Initial Catalog=impressiondesign_db;User ID=ImpressionDB2;Password=FypHuat2016"
    };

    public void CreateProducts(string name, string price, string description, int qty, string image)
    {
        _mDb.Open();
        const string query =
            "INSERT INTO myProducts(pName, pPrice, pDescription, pQty, pImage) VALUES(@name, @price, @description, @qty, @image)";
        var cmd = new SqlCommand(query, _mDb);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@price", price);
        cmd.Parameters.AddWithValue("@description", description);
        cmd.Parameters.AddWithValue("@qty", qty);
        cmd.Parameters.AddWithValue("@image", image);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }

	public ProductHandler()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void UpdateName(string name, string prodId)
    {
        _mDb.Open();
        const string addProduct =
        "UPDATE myProducts SET pName=@name " + "WHERE(ProductID=@prodID)";
        var cmd = new SqlCommand(addProduct, _mDb);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@prodID", prodId);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }

    public void UpdatePrice(int price, string prodId)
    {
        _mDb.Open();
        const string addProduct =
        "UPDATE myProducts SET pPrice = @price " + "WHERE(ProductID=@prodID)";
        var cmd = new SqlCommand(addProduct, _mDb);
        cmd.Parameters.AddWithValue("@price", price);
        cmd.Parameters.AddWithValue("@prodID", prodId);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }

    public void UpdateDescription(string description, string prodId)
    {
        _mDb.Open();
        const string addProduct =
        "UPDATE myProducts SET pDescription = @description " + "WHERE(ProductID=@prodID)";
        var cmd = new SqlCommand(addProduct, _mDb);
        cmd.Parameters.AddWithValue("@description", description);
        cmd.Parameters.AddWithValue("@prodID", prodId);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }

    public void UpdateQty(int qty, string prodId)
    {
        _mDb.Open();
        const string addProduct =
        "UPDATE myProducts SET pQty = @qty " + "WHERE(ProductID=@prodID)";
        var cmd = new SqlCommand(addProduct, _mDb);
        cmd.Parameters.AddWithValue("@qty", qty);
        cmd.Parameters.AddWithValue("@prodID", prodId);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }

    public void UpdateImg(string img, string prodId)
    {
        _mDb.Open();
        const string addProduct =
        "UPDATE myProducts SET pImage = @img " + "WHERE(ProductID=@prodID)";
        var cmd = new SqlCommand(addProduct, _mDb);
        cmd.Parameters.AddWithValue("@img", img);
        cmd.Parameters.AddWithValue("@prodID", prodId);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }
}