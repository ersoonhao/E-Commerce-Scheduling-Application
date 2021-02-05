using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class EmpCreateProject : System.Web.UI.Page
{
    private string project;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
  

    protected void GridView1_PreRender1(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count > 0)
        {
            //This replaces <td> with <th> and adds the scope attribute
            GridView1.UseAccessibleHeader = true;

            //This will add the <thead> and <tbody> elements
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

            //This adds the <tfoot> element. 
            //Remove if you don't have a footer row
            GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
        }
    }

 

    protected void CreateBTN_OnClick(object sender, EventArgs e)
    {
        project = ProjectTB.Text;

        Session["sProject"] = project;

        var button = (Button)sender;
        var row = (GridViewRow)button.NamingContainer;
        string name = row.Cells[0].Text;
        string username = row.Cells[1].Text;
        string email = row.Cells[2].Text;
        string status = row.Cells[3].Text;
       

        Debug.WriteLine(name, username);

        var ph = new ProjectHandler();
        ph.CreateProject(name, username, email, (string)Session["sName"], project);
        int niga = ph.GetID();
        Session["sBookingID"] = niga.ToString();
        Response.Redirect("EmpCreateProject2.aspx");
    }

  
}