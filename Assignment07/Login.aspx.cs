using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

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
            Label1.Text = "You are currently logged in as '" + ((Person)Session["objP"]).LoginName + "'.";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(tbUserName.Text) && !string.IsNullOrWhiteSpace(tbPassword.Text))
        {
            // Try to Log in
            int StdId = TryLogin(tbUserName.Text, tbPassword.Text);

            if (StdId != -1)
            {
                // Store Stuff in Session/Cookie thing
                Session["objP"] = new Person(tbUserName.Text, StdId);
                Session.Timeout = 30;
                Label1.Text = "You are currently logged in as '" + ((Person)Session["objP"]).LoginName + "'.";
                Response.Redirect("MyClasses.aspx");
            }
        }
    }

    private int TryLogin(string name, string pass)
    {
        //bool LoginSuccessful = false;
        int ReturnedId = -1;

        OleDbConnection conn = new OleDbConnection();
        OleDbCommand cmd = new OleDbCommand();
        try
        {   //1. Make a Connection
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AdvWebProjectConnectionString"].ConnectionString;
            conn.Open();

            //2. Issue a Command
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = @"pSelLoginIdByLoginAndPassword";

            // Create the input paramenters, set the properites and add to command.
            OleDbParameter inNameParam = new OleDbParameter();
            inNameParam.OleDbType = OleDbType.VarChar;
            inNameParam.ParameterName = "@StudentLogin";
            inNameParam.Direction = ParameterDirection.Input;
            inNameParam.Value = name;
            cmd.Parameters.Add(inNameParam);

            OleDbParameter inPassParam = new OleDbParameter();
            inPassParam.OleDbType = OleDbType.VarChar;
            inPassParam.ParameterName = "@StudentPassword";
            inPassParam.Direction = ParameterDirection.Input;
            inPassParam.Value = pass;
            cmd.Parameters.Add(inPassParam);

            // Create the return paramenter, set the properites and add to command).
            OleDbParameter retParam = new OleDbParameter();
            retParam.OleDbType = OleDbType.Integer;
            retParam.ParameterName = "@StudentId";
            retParam.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(retParam);

            cmd.ExecuteNonQuery();

            //3. Process the Results
            ReturnedId = (int)cmd.Parameters["@StudentId"].Value;
            Label1.Text = "Request Submitted Successfully.\n Student ID: " + ReturnedId.ToString();
        }
        catch (Exception ex)
        {
            Label1.Text += "<b>" + cmd.CommandText.ToString() + "</b><br /><br />";
            Label1.Text += ex.ToString();
        }
        finally
        {
            conn.Close();
        }

        return ReturnedId;
    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}