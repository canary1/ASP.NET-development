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

public partial class title : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["用户名"] != null)
        {
            btnlogin.Visible = false;
            HttpCookie Mycookie = new HttpCookie("Mycookie");
            Mycookie.Value = Server.HtmlEncode("用户登录");
            Response.AppendCookie(Mycookie);
            HttpCookie Getcookie = Request.Cookies["Mycookie"];
            Label2.Text = Session["用户名"].ToString() + ",欢迎您！";

        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        Server.Transfer("login.aspx");
    }
    protected void btnshop_Click(object sender, EventArgs e)
    {
        if (Session["用户名"] == null)
        {
            Response.Write("<script>alert(\"请登录！\");</script>");
            Server.Transfer("login.aspx");
        }
        else
            Server.Transfer("shop.aspx");
    }
    protected void btnremove_Click(object sender, EventArgs e)
    {
        Session.Timeout = 90;
        Session.Abandon();
        Response.Write("你已注销退出！");
        Server.Transfer("login.aspx");
    }
    protected void btnbookmall_Click(object sender, EventArgs e)
    {
        Server.Transfer("bookmall.aspx");
    }
    protected void btnmain_Click(object sender, EventArgs e)
    {
        Server.Transfer("main.aspx");
    }

    protected void btnorder_Click(object sender, EventArgs e)
    {
        if (Session["用户名"] == null)
        {
            Response.Write("<script>alert(\"请登录！\");</script>");
            Server.Transfer("login.aspx");
        }
        else
            Server.Transfer("orders.aspx");
    }
}
