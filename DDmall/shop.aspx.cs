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

public partial class shop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        mydiv.Style.Add("display", "none");
    }
    protected void selectchanging(object sender, GridViewSelectEventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        mydiv.Style.Add("display", "block");
        bookshop.Style.Add("display", "block");
        string key = GridView1.SelectedDataKey.Value.ToString();
        string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        SqlCommand sqlcommand = new SqlCommand();
        sqlcommand.Connection = sqlconn;
        sqlconn.Open();
        sqlcommand.CommandText = "select bookname,Convert(nvarchar(50),unitprice) as unitprice from Books where bookid=@bookid";
        sqlcommand.Parameters.AddWithValue("@bookid", key);
        SqlDataReader sqldatareader = sqlcommand.ExecuteReader();
        while (sqldatareader.Read())
        {
            Label3.Text = sqldatareader.GetString(0);
            Label1.Text = sqldatareader.GetString(1);
            
        };
        sqlcommand = null;
        sqlconn.Close();
        sqlconn = null;
    }
    protected void submit_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script>alert(\"请输入数量！\");</script>");
            TextBox1.Focus();
        }
        else
        {
            string key = GridView1.SelectedDataKey.Value.ToString();
            string today = DateTime.Now.ToString("yyyy-MM-dd");
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlcommand.CommandText = "insert into orders(bookid,username,orderdate,quantity)values(@bookid,@username,@orderdate,@quantity)";
            sqlcommand.Parameters.AddWithValue("@bookid", key);
            sqlcommand.Parameters.AddWithValue("@username", Session["用户名"].ToString());
            sqlcommand.Parameters.AddWithValue("@orderdate", today);
            sqlcommand.Parameters.AddWithValue("@quantity", TextBox1.Text);
            try
            {
                sqlconn.Open();
                sqlcommand.ExecuteNonQuery();
                Response.Write("<script>alert(\"订购成功！\");</script>");
                Server.Transfer("orders.aspx");
            }
            finally
            {
                sqlcommand = null;
                sqlconn.Close();
                sqlconn = null;
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string key = GridView1.SelectedDataKey.Value.ToString();
        string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        SqlCommand sqlcommand = new SqlCommand();
        sqlcommand.Connection = sqlconn;
        sqlcommand.CommandText = "delete from shops where bookid=@bookid and username=@username";
        sqlcommand.Parameters.AddWithValue("@bookid", key);
        sqlcommand.Parameters.AddWithValue("@username", Session["用户名"].ToString());
        try
        {
            sqlconn.Open();
            sqlcommand.ExecuteNonQuery();
            Response.Write("<script>alert(\"删除成功！\");</script>");
            Server.Transfer("shop.aspx");
            bookshop.Style.Add("display", "block");

        }
        finally
        {
            sqlcommand = null;
            sqlconn.Close();
            sqlconn = null;

        }
    }
}