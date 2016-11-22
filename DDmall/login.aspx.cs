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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ViewState["login"] = Request.UrlReferrer.ToString(); 
           
        
    }
    protected void btnmain_Click(object sender, EventArgs e)
    {

        Server.Transfer("main.aspx");
    }
    protected void btnregister_Click(object sender, EventArgs e)
    {
        Server.Transfer("register.aspx");
    }
    protected void btnlogin_Click(object sender, ImageClickEventArgs e)
    {
       
        string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        SqlCommand sqlcommand = new SqlCommand();
        sqlcommand.Connection = sqlconn;
        sqlconn.Open();
        //sqlcommand.CommandText = "select * from users where username=" + TextBox1.Text.ToString() + " and password=" + TextBox2.Text.ToString();
        sqlcommand.CommandText = "select * from users where username=@username and psword=@password";
        sqlcommand.Parameters.AddWithValue("@username", TextBox1.Text);
        sqlcommand.Parameters.AddWithValue("@password", TextBox2.Text);

        SqlDataReader sqldatareader = sqlcommand.ExecuteReader();
        if (sqldatareader.HasRows)
        {
           
            Session["用户名"] = TextBox1.Text;
            Response.Redirect(ViewState["login"].ToString());
           // Server.Transfer("main.aspx");
        }
        else
        {
            Label3.Text = "用户名或密码输入错误！";

        }

        sqlcommand = null;
        sqlconn.Close();
        sqlconn = null;
        
    }
}
