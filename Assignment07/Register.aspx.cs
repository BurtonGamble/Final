using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["objP"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            Label1.Text = ((Person)Session["objP"]).LastName + ", " + ((Person)Session["objP"]).FirstName;
        }

        ListItem temp = new ListItem();

        temp.Text = "Category List";
        CategoryDropDownList.Items.Add(temp);

        temp.Text = "Class List";
        ClassDropDownList.Items.Add(temp);
    }

    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        Label1.Text = "Registered!";
    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}