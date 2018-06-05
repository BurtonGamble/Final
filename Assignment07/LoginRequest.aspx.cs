using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

public partial class LoginRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            Calendar1.SelectedDate = DateTime.Today;
        }

        if (Session["objP"] != null)
        {
            Label1.Text = "You are currently logged in as '" + ((Person)Session["objP"]).LoginName + "'.";
        }
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
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = @"pInsLoginRequests";

            //@Name ,
            OleDbParameter objParamName = new OleDbParameter();
            objParamName.Direction = ParameterDirection.Input;
            objParamName.DbType = DbType.String;
            objParamName.ParameterName = "@Name";
            objParamName.Value = tbName.Text;
            cmd.Parameters.Add(objParamName);

            //@EmailAddress,
            OleDbParameter objParamEmailAddress = new OleDbParameter();
            objParamEmailAddress.Direction = ParameterDirection.Input;
            objParamEmailAddress.DbType = DbType.String;
            objParamEmailAddress.ParameterName = "@EmailAddress";
            objParamEmailAddress.Value = tbEmail.Text;
            cmd.Parameters.Add(objParamEmailAddress);

            //@LoginName,
            OleDbParameter objParamLoginName = new OleDbParameter();
            objParamLoginName.Direction = ParameterDirection.Input;
            objParamLoginName.DbType = DbType.String;
            objParamLoginName.ParameterName = "@LoginName";
            objParamLoginName.Value = tbHandle.Text;
            cmd.Parameters.Add(objParamLoginName);

            //@NewOrReactivate,
            OleDbParameter objParamNewOrReactivate = new OleDbParameter();
            objParamNewOrReactivate.Direction = ParameterDirection.Input;
            objParamNewOrReactivate.DbType = DbType.String;
            objParamNewOrReactivate.ParameterName = "@NewOrReactivate";
            objParamNewOrReactivate.Value = (RadioButtonNew.Checked == true ? "New" : "Reactivate");
            cmd.Parameters.Add(objParamNewOrReactivate);

            //@ReasonForAccess,
            OleDbParameter objParamReasonForAccess = new OleDbParameter();
            objParamReasonForAccess.Direction = ParameterDirection.Input;
            objParamReasonForAccess.DbType = DbType.String;
            objParamReasonForAccess.ParameterName = "@ReasonForAccess";
            objParamReasonForAccess.Value = tbReasons.Text;
            cmd.Parameters.Add(objParamReasonForAccess);

            //@DateNeededBy
            OleDbParameter objParamDateNeededBy = new OleDbParameter();
            objParamDateNeededBy.Direction = ParameterDirection.Input;
            objParamDateNeededBy.DbType = DbType.DateTime;
            objParamDateNeededBy.ParameterName = "@DateNeededBy";
            objParamDateNeededBy.Value = Calendar1.SelectedDate.ToShortDateString();
            cmd.Parameters.Add(objParamDateNeededBy);

            int RowsAffected = cmd.ExecuteNonQuery();

            //3. Process the Results
            Label1.Text += "Request Submitted Successfully.";
        }
        catch (Exception ex)
        {
            Response.Write(cmd);
            Label1.Text += "<br /><br /><b>" + cmd.CommandText.ToString() + "</b><br /><br />";
            Label1.Text += ex.ToString();
        }
        finally  //4. Run clean up code
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