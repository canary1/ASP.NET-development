using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnregister_Click(object sender, ImageClickEventArgs e)
    {
        string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        SqlCommand sqlcommand = new SqlCommand();
        sqlcommand.Connection = sqlconn;
        sqlcommand.CommandText = "insert into users(username,psword,truename,birthdate,phone,address,zip,hobby)values(@username,@psword,@truename,@birthdate,@phone,@address,@zip,@hobby)";
        sqlcommand.Parameters.AddWithValue("@username", text_user.Text);
        sqlcommand.Parameters.AddWithValue("@psword", text_passwd1.Text);
        sqlcommand.Parameters.AddWithValue("@truename", text_truename.Text);
        sqlcommand.Parameters.AddWithValue("@birthdate", text_birth.Text);
        sqlcommand.Parameters.AddWithValue("@phone", text_phone.Text);
        sqlcommand.Parameters.AddWithValue("@address", text_address.Text);
        sqlcommand.Parameters.AddWithValue("@zip", text_zip.Text);
        sqlcommand.Parameters.AddWithValue("@hobby", text_hobby.Text);
        try
        {
            sqlconn.Open();
            sqlcommand.ExecuteNonQuery();
            Response.Write("<script>alert(\"注册成功！\");</script>");
            Server.Transfer("login.aspx");
        }
        finally
        {
            sqlcommand = null;
            sqlconn.Close();
            sqlconn = null;
        }
    }
}