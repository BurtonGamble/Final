using System;
using System.Web.UI;
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
            objParamName.Direction = System.Data.ParameterDirection.Input;
            objParamName.DbType = System.Data.DbType.String;
            objParamName.ParameterName = "@Name";
            objParamName.Value = tbName.Text;
            cmd.Parameters.Add(objParamName);

            //@EmailAddress,
            OleDbParameter objParamEmailAddress = new OleDbParameter();
            objParamEmailAddress.Direction = System.Data.ParameterDirection.Input;
            objParamEmailAddress.DbType = System.Data.DbType.String;
            objParamEmailAddress.ParameterName = "@EmailAddress";
            objParamEmailAddress.Value = tbEmail.Text;
            cmd.Parameters.Add(objParamEmailAddress);

            //@LoginName,
            OleDbParameter objParamLoginName = new OleDbParameter();
            objParamLoginName.Direction = System.Data.ParameterDirection.Input;
            objParamLoginName.DbType = System.Data.DbType.String;
            objParamLoginName.ParameterName = "@LoginName";
            objParamLoginName.Value = tbHandle.Text;
            cmd.Parameters.Add(objParamLoginName);

            //@NewOrReactivate,
            OleDbParameter objParamNewOrReactivate = new OleDbParameter();
            objParamNewOrReactivate.Direction = System.Data.ParameterDirection.Input;
            objParamNewOrReactivate.DbType = System.Data.DbType.String;
            objParamNewOrReactivate.ParameterName = "@NewOrReactivate";
            objParamNewOrReactivate.Value = (RadioButtonNew.Checked == true ? "New" : "Reactivate");
            cmd.Parameters.Add(objParamNewOrReactivate);

            //@ReasonForAccess,
            OleDbParameter objParamReasonForAccess = new OleDbParameter();
            objParamReasonForAccess.Direction = System.Data.ParameterDirection.Input;
            objParamReasonForAccess.DbType = System.Data.DbType.String;
            objParamReasonForAccess.ParameterName = "@ReasonForAccess";
            objParamReasonForAccess.Value = tbReasons.Text;
            cmd.Parameters.Add(objParamReasonForAccess);

            //@DateNeededBy
            OleDbParameter objParamDateNeededBy = new OleDbParameter();
            objParamDateNeededBy.Direction = System.Data.ParameterDirection.Input;
            objParamDateNeededBy.DbType = System.Data.DbType.String;
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
}