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

public partial class books : System.Web.UI.Page
{
    string r = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        bookmanage.Style.Add("display", "none");
        bookedit.Style.Add("display", "none");
        orders.Style.Add("display", "none");
        admingvw.Style.Add("display", "none");
        admintxt.Style.Add("display", "none");
        user.Style.Add("display", "none");
        if (Session["admin"] != null )
        {
            TreeView1.Visible = true;
            login.Visible = false;
            HttpCookie Mycookie = new HttpCookie("Mycookie");
            Mycookie.Value = Server.HtmlEncode("用户登录");
            Response.AppendCookie(Mycookie);
            HttpCookie Getcookie = Request.Cookies["Mycookie"];
            Label1.Text = Session["admin"].ToString() + ",欢迎您！";
        }
        else
        {
            TreeView1.Visible = false;

        }
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {

        string key = GridView1.SelectedDataKey.Value.ToString();
        string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        SqlCommand sqlcommand = new SqlCommand();
        sqlcommand.Connection = sqlconn;
        sqlcommand.CommandText = "delete from books where bookid=@bookid";
        sqlcommand.Parameters.AddWithValue("@bookid",key);
        try
        {
            sqlconn.Open();
            sqlcommand.ExecuteNonQuery();
            Response.Write("<script>alert(\"删除成功！\");</script>");
            Server.Transfer("books.aspx");
             bookmanage.Style.Add("display", "block");
           
        }
        finally
        {
            sqlcommand = null;
            sqlconn.Close();
            sqlconn = null;
           
        }
    }
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        if (TreeView1.SelectedNode.Text == "书籍管理" || TreeView1.SelectedNode.Text == "产品管理" || TreeView1.SelectedNode.Text == "产品增加")
        {
            bookmanage.Style.Add("display", "block");
            orders.Style.Add("display", "none");
        }
        else if (TreeView1.SelectedNode.Text == "订单管理" || TreeView1.SelectedNode.Text == "订单处理")
        {
            bookmanage.Style.Add("display", "none");
            orders.Style.Add("display", "block");
        }
        else if (TreeView1.SelectedNode.Text == "管理员管理")
        {
            admingvw.Style.Add("display", "block");
        }
        else if (TreeView1.SelectedNode.Text == "用户查看")
        {
            user.Style.Add("display", "block");
        }
    }
    protected void login_Click(object sender, EventArgs e)
    {
        Server.Transfer("adminlogin.aspx");
    }
    protected void selectchanging(object sender, GridViewSelectEventArgs e)
    {
        bookmanage.Style.Add("display", "block");
    }
    protected void btnedit_Click(object sender, EventArgs e)
    {
        bookedit.Style.Add("display", "block");
        bookmanage.Style.Add("display", "block");
        string key = GridView1.SelectedDataKey.Value.ToString();
        string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        SqlCommand sqlcommand = new SqlCommand();
        sqlcommand.Connection = sqlconn;
         sqlconn.Open();
         sqlcommand.CommandText = "select *,Convert(nvarchar(50),unitprice) as unitprice  from books where bookid=@bookid";
        sqlcommand.Parameters.AddWithValue("@bookid", key);
        SqlDataReader sqldatareader = sqlcommand.ExecuteReader();
       
        while (sqldatareader.Read())
        {
            TextBox1.Text = sqldatareader.GetString(1);
            TextBox2.Text = sqldatareader.GetString(0);
            TextBox3.Text = sqldatareader.GetString(2);
            TextBox4.Text = sqldatareader.GetString(7);
            DropDownList1.SelectedValue = sqldatareader.GetString(5);
            TextBox7.Text = sqldatareader.GetString(6);
            TextBox2.ReadOnly = true;
            Session["r"] = "编辑记录";
           
        };
        sqlcommand = null;
        sqlconn.Close();
        sqlconn = null;

    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        bookedit.Style.Add("display", "block");
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox7.Text = "";
        Session["r"] = "新增记录";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["r"] == "编辑记录")
        {
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlcommand.CommandText = "update books set bookid=@bookid,bookname=@bookname,writer=@writer,unitprice=@unitprice,bookimage=@bookimage,category=@category,introduction=@introduction where bookid=@bookid";
            sqlcommand.Parameters.AddWithValue("@bookid", TextBox2.Text);
            sqlcommand.Parameters.AddWithValue("@bookname", TextBox1.Text);
            sqlcommand.Parameters.AddWithValue("@writer", TextBox3.Text);
            sqlcommand.Parameters.AddWithValue("@unitprice", TextBox4.Text);
            sqlcommand.Parameters.AddWithValue("@bookimage", FileUpload1.ToString());
            sqlcommand.Parameters.AddWithValue("@category", DropDownList1.Text);
            sqlcommand.Parameters.AddWithValue("@introduction", TextBox7.Text);
            try
            {
                sqlconn.Open();
                Response.Write("<script>alert(\"数据更新成功！\");</script>");
                Server.Transfer("books.aspx");
                bookmanage.Style.Add("display", "block");
            }
            finally
            {
                sqlcommand = null;
                sqlconn.Close();
                sqlconn = null;
            }
        }
        else if (Session["r"] == "新增记录")
        {
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlcommand.CommandText = "insert into books(bookid,bookname,writer,unitprice,bookimage,category,introduction)values(@bookid,@bookname,@writer,@unitprice,@bookimage,@category,@introduction)";
            sqlcommand.Parameters.AddWithValue("@bookid", TextBox2.Text);
            sqlcommand.Parameters.AddWithValue("@bookname", TextBox1.Text);
            sqlcommand.Parameters.AddWithValue("@writer", TextBox3.Text);
            sqlcommand.Parameters.AddWithValue("@unitprice", TextBox4.Text);
            sqlcommand.Parameters.AddWithValue("@bookimage", FileUpload1.ToString());
            sqlcommand.Parameters.AddWithValue("@category", DropDownList1.Text);
            sqlcommand.Parameters.AddWithValue("@introduction", TextBox7.Text);
            try
            {
                sqlconn.Open();
                Response.Write("<script>alert(\"数据新增成功！\");</script>");
                Server.Transfer("books.aspx");
                bookmanage.Style.Add("display", "block");
            }
            finally
            {
                sqlcommand = null;
                sqlconn.Close();
                sqlconn = null;
            }
        }
    }
    protected void edituser_Click(object sender, EventArgs e)
    {
        admingvw.Style.Add("display", "block");
        admintxt.Style.Add("display", "block");
        string key = GridView3.SelectedDataKey.Value.ToString();
        string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        SqlCommand sqlcommand = new SqlCommand();
        sqlcommand.Connection = sqlconn;
        sqlconn.Open();
        sqlcommand.CommandText = "select *,Convert(nvarchar(50),birthdate) as birthdate  from users where username=@username";
        sqlcommand.Parameters.AddWithValue("@username", key);
        SqlDataReader sqldatareader = sqlcommand.ExecuteReader();
        while (sqldatareader.Read())
        {
            text_user.Text = sqldatareader.GetString(0);
            text_passwd1.Text = sqldatareader.GetString(1);
            text_truename.Text = sqldatareader.GetString(2);
            text_birth.Text = sqldatareader.GetString(9);
            text_phone.Text = sqldatareader.GetString(4);
            text_address.Text = sqldatareader.GetString(5);
            text_zip.Text = sqldatareader.GetString(6);
            text_hobby.Text = sqldatareader.GetString(7);
            text_user.ReadOnly = true;
        };
        sqlcommand = null;
        sqlconn.Close();
        sqlconn = null;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        SqlCommand sqlcommand = new SqlCommand();
        sqlcommand.Connection = sqlconn;
        sqlcommand.CommandText = "update users set username=@username,psword=@psword,truename=@psword,birthdate=@birthdate,phone=@phone,address=@address,zip=@zip,hobby=@hobby where bookid=@bookid";
        sqlcommand.Parameters.AddWithValue("@username", text_user.Text);
        sqlcommand.Parameters.AddWithValue("@psword", text_passwd1.Text);
        sqlcommand.Parameters.AddWithValue("@psword", text_truename.Text);
        sqlcommand.Parameters.AddWithValue("@birthdate", text_birth.Text);
        sqlcommand.Parameters.AddWithValue("@phone", text_phone.Text);
        sqlcommand.Parameters.AddWithValue("@address", text_address.Text);
        sqlcommand.Parameters.AddWithValue("@zip", text_zip.Text);
        sqlcommand.Parameters.AddWithValue("@hobby", text_hobby.Text);
        try
        {
            sqlconn.Open();
            Response.Write("<script>alert(\"数据更新成功！\");</script>");
            Server.Transfer("books.aspx");
            admingvw.Style.Add("display", "block");
        }
        finally
        {
            sqlcommand = null;
            sqlconn.Close();
            sqlconn = null;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        bookedit.Style.Add("display", "none");
    }
    protected void selectchanging1(object sender, GridViewSelectEventArgs e)
    {
        orders.Style.Add("display", "block");
    }
    protected void selectchanging2(object sender, GridViewSelectEventArgs e)
    {
        admingvw.Style.Add("display", "block");
    }
    protected void ordersort(object sender, GridViewSortEventArgs e)
    {
        orders.Style.Add("display", "block");
    }
    protected void usersort(object sender, GridViewSortEventArgs e)
    {
        user.Style.Add("display", "block");
    }
}