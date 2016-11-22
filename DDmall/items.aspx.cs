using System;
using System.Collections;
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


public partial class items : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        mydiv.Style.Add("display", "none");
    }
    protected void btnshop_Click(object sender, ImageClickEventArgs e)
    {

        if (Session["用户名"] == null)
        {
            Response.Write("<script>alert(\"请登录！\");</script>");
            Server.Transfer("login.aspx");
        }
        else
        {
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlconn.Open();
            sqlcommand.CommandText = "select bookname,Convert(nvarchar(50),unitprice) as unitprice from Books where bookid=@bookid";
            sqlcommand.Parameters.AddWithValue("@bookid", Request.QueryString["no"]);
            SqlDataReader sqldatareader = sqlcommand.ExecuteReader();
            while (sqldatareader.Read())
            {
                Label3.Text = sqldatareader.GetString(0);
                Label1.Text = sqldatareader.GetString(1);
                mydiv.Style.Add("display", "block");
                Session["id"] = "shop";
            }

            sqlcommand = null;
            sqlconn.Close();
            sqlconn = null;
           
            
        }
    }
    protected void submit_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["id"]=="shop")
        {
            string today = DateTime.Now.ToString("yyyy-MM-dd");
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlcommand.CommandText = "insert into shops(username,bookid,shopdate,amount)values(@username,@bookid,@shopdate,@amount)";
            sqlcommand.Parameters.AddWithValue("@bookid", Request.QueryString["no"]);
            sqlcommand.Parameters.AddWithValue("@amount", TextBox1.Text);
            sqlcommand.Parameters.AddWithValue("@shopdate", today);
            sqlcommand.Parameters.AddWithValue("@username", Session["用户名"].ToString());
            try
            {
                sqlconn.Open();
                sqlcommand.ExecuteNonQuery();
                Response.Write("<script>alert(\"添加购物车成功！\");</script>");
                mydiv.Style.Add("display", "none");
            }
            finally
            {
                sqlcommand = null;
                sqlconn.Close();
                sqlconn = null;
            }
        }
        else if(Session["id"]=="order")
        {
            string today = DateTime.Now.ToString("yyyy-MM-dd");
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlcommand.CommandText = "insert into orders(bookid,username,orderdate,quantity)values(@bookid,@username,@orderdate,@quantity)";
            sqlcommand.Parameters.AddWithValue("@bookid", Request.QueryString["no"]);
            sqlcommand.Parameters.AddWithValue("@username", Session["用户名"].ToString());
            sqlcommand.Parameters.AddWithValue("@orderdate", today);
            sqlcommand.Parameters.AddWithValue("@quantity", TextBox1.Text);
            try
            {
                sqlconn.Open();
                sqlcommand.ExecuteNonQuery();
                Response.Write("<script>alert(\"订单添加成功！\");</script>");
                mydiv.Style.Add("display", "none");
            }
            finally
            {
                sqlcommand = null;
                sqlconn.Close();
                sqlconn = null;
            }
        }
    }
    protected void btnmenu_Click(object sender, ImageClickEventArgs e)
    {
         if (Session["用户名"] == null)
        {
            Response.Write("<script>alert(\"请登录！\");</script>");
            Server.Transfer("login.aspx");
        }
        else
        {
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlconn.Open();
            sqlcommand.CommandText = "select bookname,Convert(nvarchar(50),unitprice) as unitprice from Books where bookid=@bookid";
            sqlcommand.Parameters.AddWithValue("@bookid", Request.QueryString["no"]);
            SqlDataReader sqldatareader = sqlcommand.ExecuteReader();
            while (sqldatareader.Read())
            {
                Label3.Text = sqldatareader.GetString(0);
                Label1.Text = sqldatareader.GetString(1);
                Session["id"] = "order";
                mydiv.Style.Add("display", "block");
            }

            sqlcommand = null;
            sqlconn.Close();
            sqlconn = null;

           
        }
    }


}