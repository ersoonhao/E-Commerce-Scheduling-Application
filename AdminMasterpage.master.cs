using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMasterpage : System.Web.UI.MasterPage
{
    List<string> DateList = new List<string>();
    private List<string> EmailList = new List<string>();
    private List<string> TimeList = new List<string>();
    private List<DateTime> EmpDateList = new List<DateTime>();
    private int _rowCount;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Login Handler
        try
        {
            if ((bool) Session["sLogin"])
            {
                nameLBL.InnerHtml = (string) Session["sName"];
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        catch (Exception exception)
        {
            Session["sLogin"] = false;
            Response.Redirect("Login.aspx");
        }
       // //Appointment Reminder Handler
       //  _rowCount = GridView1.Rows.Count;
       // var rh = new ReminderHandler();
        
       // for (int i = 0; i < _rowCount; i++)
       //{
       //    DateList.Add(GridView1.Rows[i].Cells[1].Text);
       //    //EmailList.Add(GridView1.Rows[i].Cells[3].Text);
       //    //TimeList.Add(GridView1.Rows[i].Cells[2].Text);
       // }

       // DateTime today = DateTime.Today;
       // string date = today.ToString("yyyy-MM-dd");
       // Debug.WriteLine(date);

       // for (int i = 0; i <= DateList.Count; i++)
       // {
       //     EmpDateList.Add(DateTime.Parse(DateList[i]));
       // }
       // DateTime currentTime = DateTime.Parse(date);

       // for (int i = 0; i <= DateList.Count; i++)
       // {
       //     TimeSpan = 
       // }

  
        
    }
}
