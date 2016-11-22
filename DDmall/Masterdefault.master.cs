using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Masterdefault : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["用户名"] != null)
        {
            LinkButton1.Visible = false;
            HttpCookie Mycookie = new HttpCookie("Mycookie");
            Mycookie.Value = Server.HtmlEncode("用户登录");
            Response.AppendCookie(Mycookie);
            HttpCookie Getcookie = Request.Cookies["Mycookie"];
            Label4.Text = Session["用户名"].ToString() + ",欢迎您！";

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
   {
       Server.Transfer("login.aspx");
   }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Server.Transfer("registe.aspx");

    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Server.Transfer("default2.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Server.Transfer("default.aspx");
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Server.Transfer("cart.aspx");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Server.Transfer("login.aspx");
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Server.Transfer("hlep.aspx");

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["用户名"] == null)
        {
            Response.Write("<script>alert(\"请登录！\");</script>");
            Server.Transfer("login.aspx");
        }
        else
            Server.Transfer("cart.aspx");
    }
}

