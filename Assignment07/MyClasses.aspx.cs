using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

public partial class MyClasses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["objP"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            BindData();
            Label1.Text = "You are currently logged in as '" + ((Person)Session["objP"]).LoginName + "'.";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }

    private void BindData()
    {
        DataTable dt = new DataTable();
        OleDbConnection conn = new OleDbConnection();
        OleDbCommand cmd = new OleDbCommand();
        try
        {   //1. Make a Connection
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AdvWebProjectConnectionString"].ConnectionString;
            conn.Open();

            //2. Issue a Command
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = @"pSelClassesByStudentId";

            // Create the input paramenter, set the properites and add to command).
            OleDbParameter LoginId = new OleDbParameter();
            LoginId.OleDbType = OleDbType.Integer;
            LoginId.ParameterName = "@StudentId";
            LoginId.Direction = ParameterDirection.Input;
            LoginId.Value = ((Person)Session["objP"]).StudentId;
            cmd.Parameters.Add(LoginId);

            cmd.ExecuteNonQuery();

            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            //3. Process the Results
            Label1.Text += "Request Submitted Successfully.";
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
    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}