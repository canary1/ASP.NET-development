<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>用户登录</title>
    <style type="text/css">
        .auto-style1 {
            height: 150px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" >
    <div style="font-family: 仿宋_GB2312; font-size: x-large; width:100%; height:57px; background-color: #C2E394; border: thin solid #808080; padding: 0px 0px 0px 0px; margin: 0px 0px 50px 0px; background-image: url('image/title.jpg'); background-repeat: no-repeat; float:right; text-align: right; line-height: 50px; vertical-align: middle;">
            <asp:LinkButton ID="btnmain" runat="server" Font-Names="仿宋_GB2312"  
                Font-Size="Medium" Font-Underline="False" Width="100px" Font-Overline="False" 
                ForeColor="#333333" onclick="btnmain_Click">返回首页</asp:LinkButton>
            <asp:LinkButton ID="btnregister" runat="server" Font-Names="仿宋_GB2312" 
                Font-Size="Medium" Font-Underline="False" Width="100px" Font-Overline="False" 
                ForeColor="#333333" onclick="btnregister_Click">还未注册</asp:LinkButton>
    </div>
    <table style="background-position: right center;  width:90%; background-image: url('image/login.jpg'); background-repeat: no-repeat; margin-top:10px;margin-right:50px">
        <tr>
            <td class="auto-style1" >
            </td>
            <td  class="auto-style1" >
            </td>
            <td  class="auto-style1" 
                style="font-family: 微软雅黑; font-size: large; vertical-align: bottom">
                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr style="height:50px" >
            <td style="width:65%;" rowspan="3" >
                <center><asp:Image ID="Image1" runat="server" ImageUrl="~/image/leftlogin.gif" /></center>
            </td>
            <td >
                <center> <asp:Label ID="Label1" runat="server" Text="用户名" Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></center>
             </td>
             <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
             </td>
            
        </tr>
        <tr style="height:50px">
            
            <td >
                <center><asp:Label ID="Label2" runat="server" Text="密码" Font-Names="微软雅黑" 
                    Font-Size="Medium"></asp:Label></center>
              </td>
              <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
              </td>
        </tr>
         <tr style="height:100px">
           
            <td  colspan="2">
               <center><asp:ImageButton ID="btnlogin" runat="server" 
                       ImageUrl="image/loginbutton.jpg" ImageAlign="AbsMiddle" 
                       onclick="btnlogin_Click" />
                <asp:ImageButton ID="btnzhuce" runat="server" 
                       ImageUrl="image/registerbutton.jpg" ImageAlign="AbsMiddle" /></center>
              </td>
              <td>
                  
              </td>
        </tr>
        <tr style="height:100px">
            <td colspan="3"></td>
        </tr>
    </table>
   
    </form>
</body>
</html>
