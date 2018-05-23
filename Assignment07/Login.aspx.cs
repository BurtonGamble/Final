using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["objP"] == null)
        {
            Label1.Text = "You are not currently logged in.";
        }
        else
        {
            Label1.Text = "You are currently logged in as '" + ((Person)Session["objP"]).FirstName + "'.";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(tbUserName.Text) && !string.IsNullOrWhiteSpace(tbPassword.Text))
        {
            Session["objP"] = new Person(tbUserName.Text, tbPassword.Text);
            string viewStateData = ((Person)Session["objP"]).FirstName;
            viewStateData += "," + ((Person)Session["objP"]).LastName;
            Session["objP"] = new Person(tbUserName.Text, tbPassword.Text);

            Label1.Text = "You are currently logged in as '" + ((Person)Session["objP"]).FirstName + "'.";

            Response.Redirect("MyClasses.aspx");
        }
    }
}