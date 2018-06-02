using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

public partial class LoginRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = new OleDbConnection();
        OleDbCommand cmd = new OleDbCommand();
        try
        {   //1. Make a Connection
            string strOledbConnection = ConfigurationManager.ConnectionStrings["AdvWebProjectConnectionString"].ConnectionString;
            conn.ConnectionString = strOledbConnection;
            conn.Open();

            //2. Issue a Command
            cmd.Connection = conn;
            cmd.CommandText = "pInsLogins";
            cmd.CommandType = CommandType.StoredProcedure;

            OleDbParameter strName = cmd.Parameters.Add("@Name", OleDbType.VarChar, 50);
            OleDbParameter strEmail = cmd.Parameters.Add("@Email", OleDbType.VarChar, 50);
            OleDbParameter strHandle = cmd.Parameters.Add("@Handle", OleDbType.VarChar, 50);
            OleDbParameter strReason = cmd.Parameters.Add("@Reason", OleDbType.VarChar, 50);
            strName.Direction = ParameterDirection.Input;
            strEmail.Direction = ParameterDirection.Input;
            strHandle.Direction = ParameterDirection.Input;
            strReason.Direction = ParameterDirection.Input;

            strName.Value = tbName.Text;
            strEmail.Value = tbEmail.Text;
            strHandle.Value = tbHandle.Text;
            strReason.Value = tbReasons.Text;

            cmd.ExecuteNonQuery();

            //3. Process the Results
            Label1.Text += "Request Submitted Successfully.";
        }
        catch (Exception ex)
        {
            Label1.Text += "<b>" + cmd.CommandText.ToString() + "</b><br /><br />";
            Label1.Text += ex.ToString();
        }
        finally { conn.Close(); } //4. Run clean up code
    }
}