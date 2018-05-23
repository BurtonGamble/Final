using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Classes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //BindListView();
        }
    }

    private void BindListView()
    {
        OleDbConnection conn = new OleDbConnection();
        OleDbCommand cmd = new OleDbCommand();
        try
        {   //1. Make a Connection
            string connStr = ConfigurationManager.ConnectionStrings["MyConnString"].ConnectionString;
            conn.ConnectionString = connStr;
            conn.Open();

            //2. Issue a Command
            cmd.Connection = conn;
            cmd.CommandText = "pSelCategories";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.ExecuteNonQuery();

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
}