<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户注册</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family: 仿宋_GB2312; font-size: x-large; width:100%; height:57px; background-color: #C2E394; border: thin solid #808080; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px; background-image: url('image/title.jpg'); background-repeat: no-repeat; float:right; text-align: right; line-height: 50px; vertical-align: middle;">
            <asp:LinkButton ID="LinkButton2" runat="server" Font-Names="仿宋_GB2312" Font-Size="Medium" Font-Underline="False" Width="100px" Font-Overline="False" ForeColor="#333333">返回首页</asp:LinkButton>
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Names="仿宋_GB2312" Font-Size="Medium" Font-Underline="False" Width="100px" Font-Overline="False" ForeColor="#333333">用户登录</asp:LinkButton>
    </div>
        <table style="background-position: right center;  width:90%; background-image: url('image/register.jpg'); background-repeat: no-repeat; margin-top:10px;margin-right:45px">
        <tr style="height:200px">
            <td colspan="3"></td>
        </tr>
        <tr style="height:45px">
            <td style="width:65%;" rowspan="10">
                <center><asp:Image ID="Image1" runat="server" ImageUrl="~/image/leftlogin.gif" /></center>
            </td>
            <td style="width:70px"><asp:Label ID="lable_user" runat="server" Text="用户名 " Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
            <td><asp:TextBox ID="text_user" runat="server" Width="145px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="用户名不能为空" ControlToValidate="text_user"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="height:45px">
            <td><asp:Label ID="lable_passwd1" runat="server" Text="密码  " Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
            <td><asp:TextBox ID="text_passwd1" runat="server" TextMode="Password" Width="145px"></asp:TextBox></td>
        </tr>
        <tr style="height:45px">
            <td><asp:Label ID="lable_passwd2" runat="server" Text="确认密码" Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
            <td><asp:TextBox ID="text_passwd2" runat="server" TextMode="Password" Width="145px"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密码输入不一致" ControlToCompare="text_passwd1" ControlToValidate="text_passwd2" CultureInvariantValues="True"></asp:CompareValidator></td>
        </tr>
        <tr style="height:45px">
            <td><asp:Label ID="label_truename" runat="server" Text="真实姓名" Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
            <td><asp:TextBox ID="text_truename" runat="server" Width="145px"></asp:TextBox></td>
        </tr>
        <tr style="height:45px">
            <td><asp:Label ID="lable_birth" runat="server" Text="生日  " Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
            <td><asp:TextBox ID="text_birth" runat="server" Width="145px"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="生日格式必须为****/**/**" ControlToValidate="text_birth" MaximumValue="2015/10/13" MinimumValue="1900/1/1" Type="Date"></asp:RangeValidator></td>
        </tr>
        <tr style="height:45px">
            <td ><asp:Label ID="lable_phone" runat="server" Text="  电话  " Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
            <td ><asp:TextBox ID="text_phone" runat="server" Width="145px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="电话号码格式不正确" ControlToValidate="text_phone" ValidationExpression="\d{11}"></asp:RegularExpressionValidator></td>
        </tr>
        <tr style="height:45px">
            <td><asp:Label ID="lable_address" runat="server" Text="地址  " Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
            <td><asp:TextBox ID="text_address" runat="server" Width="145px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="必须填写" ControlToValidate="text_address"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="height:45px">
            <td><asp:Label ID="label_zip" runat="server" Text="邮编" Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
            <td><asp:TextBox ID="text_zip" runat="server" Width="145px"></asp:TextBox></td>
        </tr>
        <tr style="height:45px">
            <td><asp:Label ID="lable_hobby" runat="server" Text="爱好  " Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
            <td><asp:TextBox ID="text_hobby" runat="server" Width="145px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="text_hobby" ErrorMessage="爱好不能为空"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="height:45px">

            <td colspan="2" style="padding: 0px 50px 0px 100px" >
                <asp:ImageButton ID="btnregister" runat="server" 
                    ImageUrl="~/image/registerbutton.jpg" OnClick="btnregister_Click" /></td>
        </tr>
        <tr style="height:100px">
            <td colspan="3"></td>
        </tr>
        </table>
    </form>
</body>
</html>
