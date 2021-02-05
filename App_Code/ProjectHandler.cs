using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Microsoft.Owin.Security;

/// <summary>
/// Summary description for ProjectHandler
/// </summary>
public class ProjectHandler
{
    readonly SqlConnection _mDb = new SqlConnection
    {
        ConnectionString =
        "Data Source=mmzwzgz169.database.windows.net;Initial Catalog=impressiondesign_db;User ID=ImpressionDB2;Password=FypHuat2016"
    };

    public ProjectHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void CreateProject(string name, string username, string email, string employee, string project)
    {
        _mDb.Open();
        const string query =
            "INSERT INTO myProjects(pCustName, pCustUsername, pCustEmail, pEmployee, pProjectName, pProjectStatus) VALUES(@name, @username, @email, @employee, @project, @status)";
        var cmd = new SqlCommand(query, _mDb);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@employee", employee);
        cmd.Parameters.AddWithValue("@project", project);
        cmd.Parameters.AddWithValue("@status", "Ongoing");
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }

    public int GetID()
    {
        _mDb.Open();
        const string query =
            "SELECT TOP 1 ProjectID FROM myProjects ORDER BY ProjectID DESC";

        var cmd = new SqlCommand(query, _mDb);
        var rdr = cmd.ExecuteReader();
        rdr.Read();
        int ProjID = (int) rdr["ProjectID"];
       
        _mDb.Close();

        return ProjID;
       
    }

    

    public void CreateProjectDetails(string projID, string task, string description, string time, string date)
    {
        _mDb.Open();
        const string query =
            "INSERT INTO myProjectDetails (pdProjectID, pdTask, pdDescription, pdStatus, pdTime, pdDate) VALUES(@id, @task, @description, @status, @time, @date)";
        var cmd = new SqlCommand(query, _mDb);
        cmd.Parameters.AddWithValue("@id", projID);
        cmd.Parameters.AddWithValue("@task", task);
        cmd.Parameters.AddWithValue("@description", description);
        cmd.Parameters.AddWithValue("@status", "Ongoing");
        cmd.Parameters.AddWithValue("@time", time);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }

    public void CreateProjectPost(string ProjID, string image, string description)
    {
        _mDb.Open();
        const string query =
            "INSERT INTO myProjectImages(pdProjectID, pdImage, pdDescription) VALUES(@id, @image, @description)";
        var cmd = new SqlCommand(query, _mDb);
        cmd.Parameters.AddWithValue("@id", ProjID);
        cmd.Parameters.AddWithValue("@image", image);
        cmd.Parameters.AddWithValue("@description", description);
        cmd.ExecuteNonQuery();
        _mDb.Close();
    }
}