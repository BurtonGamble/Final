using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Classes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }

        if (Session["objP"] != null)
        {
            Label1.Text = "You are currently logged in as '" + ((Person)Session["objP"]).LoginName + "'.";
        }
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
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM [vClasses]";

            //3. Process the Results
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Label1.Text += " < b>" + cmd.CommandText.ToString() + "</b><br /><br />";
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