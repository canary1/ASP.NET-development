<%@ Page Language="C#" AutoEventWireup="true" CodeFile="books.aspx.cs" Inherits="books" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台操作</title>
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div style="border: medium solid #666666; float:left;margin-top:20px; margin-right: 10px; margin-left: 10px;">
             <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
             <asp:Button ID="login" runat="server" Text="登陆" Width="80px" BackColor="#99FF33" Font-Italic="False" Font-Names="华文仿宋" Font-Size="Medium" ForeColor="#333333" OnClick="login_Click" />
             
        <asp:TreeView ID="TreeView1" runat="server" Height="300px" Width="150px" Font-Names="华文仿宋" Font-Size="Medium" ForeColor="#333333" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True">
            <Nodes>
                <asp:TreeNode Text="后台管理" Value="后台管理">
                    <asp:TreeNode Text="书籍管理" Value="书籍管理">
                        <asp:TreeNode Text="产品管理" Value="产品管理"></asp:TreeNode>
                        <asp:TreeNode Text="产品增加" Value="产品增加"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Text="订单管理" Value="订单管理">
                        <asp:TreeNode Text="订单处理" Value="订单处理"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Text="用户管理" Value="用户管理">
                        <asp:TreeNode Text="管理员管理" Value="管理员管理"></asp:TreeNode>
                        <asp:TreeNode Text="用户查看" Value="用户查看"></asp:TreeNode>
                    </asp:TreeNode>
                </asp:TreeNode>
            </Nodes>
        </asp:TreeView>
    </div>
    <div style="border: medium solid #666666; float:left; margin-top: 20px; margin-right: 10px; margin-left: 10px; text-align: center; vertical-align: middle; font-family: 微软雅黑; font-size: medium;" id="bookmanage" runat="server">
        <asp:Button ID="btnadd" runat="server" Text="新增" OnClick="btnadd_Click" Height="30px" Width="80px" />
        <asp:Button ID="btnedit" runat="server" Text="编辑" OnClick="btnedit_Click" Height="30px" Width="80px" />
        <asp:Button ID="btndelete" runat="server" Text="删除" OnClick="btndelete_Click" Height="30px" Width="80px" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="bookid" DataSourceID="SqlDataSource1" EnableModelValidation="True" Width="800px" Height="500px" OnSelectedIndexChanging="selectchanging">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="bookid" HeaderText="书籍编号" ReadOnly="True" SortExpression="bookid" />
                <asp:BoundField DataField="bookname" HeaderText="书籍名称" SortExpression="bookname" />
                <asp:BoundField DataField="writer" HeaderText="作者" SortExpression="writer" />
                <asp:BoundField DataField="unitprice" HeaderText="单价" SortExpression="unitprice" />
                <asp:BoundField DataField="bookimage" HeaderText="图片路径" SortExpression="bookimage" />
                <asp:BoundField DataField="category" HeaderText="书籍类别" SortExpression="category" />
                <asp:BoundField DataField="introduction" HeaderText="书籍简介" SortExpression="introduction" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Books]">
        </asp:SqlDataSource>
    </div>
       <div style="float:right; margin-top: 20px; margin-right:10px; margin-left: 10px;" id="bookedit" runat="server">
           <table style="border: medium solid #808080; font-family: 微软雅黑; font-size: medium; text-align: left; vertical-align: middle">
               <tr>
                   <td colspan="2" style="font-size: larger; font-weight: bold; text-align: center">书籍信息</td>
               </tr>
               <tr>
                   <td>
                        <asp:Label ID="Label3" runat="server" Text="书籍编号："></asp:Label>
                   </td >
                   <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                   </td>
               </tr>
                <tr>
                   <td>
                        <asp:Label ID="Label2" runat="server" Text="书籍名称："></asp:Label>
                   </td >
                   <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td>
                        <asp:Label ID="Label4" runat="server" Text="书记作者："></asp:Label>
                   </td >
                   <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td>
                        <asp:Label ID="Label5" runat="server" Text="书籍单价："></asp:Label>
                   </td >
                   <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>元
                   </td>
               </tr>
               <tr>
                   <td>
                        <asp:Label ID="Label6" runat="server" Text="书籍图片："></asp:Label>
                   </td >
                   <td>
                       <asp:FileUpload ID="FileUpload1" runat="server" Width="150px" />
                   </td>
               </tr>
               <tr>
                   <td>
                        <asp:Label ID="Label7" runat="server" Text="书籍类别："></asp:Label>
                   </td >
                   <td>
                       <asp:DropDownList ID="DropDownList1" runat="server" Width="80px" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="category" DataValueField="category"></asp:DropDownList>
                       <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [category] FROM [Books]"></asp:SqlDataSource>
                   </td>
               </tr>
               <tr>
                   <td>
                        <asp:Label ID="Label8" runat="server" Text="书籍简介："></asp:Label>
                   </td >
                   <td>
                        <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine"></asp:TextBox>
                   </td>
               </tr>
              <tr>
                   <td colspan="2" style="text-align: center" class="auto-style1" >
                       <asp:Button ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" />
                       <asp:Button ID="Button2" runat="server" Text="取消" OnClick="Button2_Click" />
                   </td>
               </tr>
           </table>
       </div>
         <div style="border: medium solid #666666; float:left; margin-top: 20px; margin-right: 10px; margin-left: 10px; text-align: center; vertical-align: middle; font-family: 微软雅黑; font-size: medium;" id="orders" runat="server">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="orderid" DataSourceID="SqlDataSource2" EnableModelValidation="True" Width="800px" Height="500px" OnSelectedIndexChanging="selectchanging1" AllowSorting="True" OnSorting="ordersort">
            <Columns>
                <asp:BoundField DataField="orderid" HeaderText="订单编号" ReadOnly="True" SortExpression="orderid" InsertVisible="False" />
                <asp:BoundField DataField="username" HeaderText="用户名" SortExpression="username" />
                <asp:BoundField DataField="orderdate" HeaderText="订单日期" SortExpression="orderdate" />
                <asp:BoundField DataField="quantity" HeaderText="数量" SortExpression="quantity" />
                <asp:BoundField DataField="bookname" HeaderText="书籍名称" SortExpression="bookname" />
                <asp:BoundField DataField="unitprice" HeaderText="单价" SortExpression="unitprice" />
                <asp:BoundField DataField="amount" HeaderText="总价" ReadOnly="True" SortExpression="amount" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Books] WHERE [bookid] = @original_bookid AND (([bookname] = @original_bookname) OR ([bookname] IS NULL AND @original_bookname IS NULL)) AND (([writer] = @original_writer) OR ([writer] IS NULL AND @original_writer IS NULL)) AND (([unitprice] = @original_unitprice) OR ([unitprice] IS NULL AND @original_unitprice IS NULL)) AND (([bookimage] = @original_bookimage) OR ([bookimage] IS NULL AND @original_bookimage IS NULL)) AND (([category] = @original_category) OR ([category] IS NULL AND @original_category IS NULL)) AND (([introduction] = @original_introduction) OR ([introduction] IS NULL AND @original_introduction IS NULL))" InsertCommand="INSERT INTO [Books] ([bookid], [bookname], [writer], [unitprice], [bookimage], [category], [introduction]) VALUES (@bookid, @bookname, @writer, @unitprice, @bookimage, @category, @introduction)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [orderid],[username],[orderdate],[quantity],[bookname],[unitprice],CAST((quantity)*(unitprice)AS DECIMAL(15,2)) AS [amount] FROM [Orders] AS [a] JOIN [Books] AS [b] ON [a].[bookid]=[b].[bookid] ORDER BY [orderdate]" UpdateCommand="UPDATE [Books] SET [bookname] = @bookname, [writer] = @writer, [unitprice] = @unitprice, [bookimage] = @bookimage, [category] = @category, [introduction] = @introduction WHERE [bookid] = @original_bookid AND (([bookname] = @original_bookname) OR ([bookname] IS NULL AND @original_bookname IS NULL)) AND (([writer] = @original_writer) OR ([writer] IS NULL AND @original_writer IS NULL)) AND (([unitprice] = @original_unitprice) OR ([unitprice] IS NULL AND @original_unitprice IS NULL)) AND (([bookimage] = @original_bookimage) OR ([bookimage] IS NULL AND @original_bookimage IS NULL)) AND (([category] = @original_category) OR ([category] IS NULL AND @original_category IS NULL)) AND (([introduction] = @original_introduction) OR ([introduction] IS NULL AND @original_introduction IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_bookid" Type="String" />
                <asp:Parameter Name="original_bookname" Type="String" />
                <asp:Parameter Name="original_writer" Type="String" />
                <asp:Parameter Name="original_unitprice" Type="Decimal" />
                <asp:Parameter Name="original_bookimage" Type="String" />
                <asp:Parameter Name="original_category" Type="String" />
                <asp:Parameter Name="original_introduction" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="bookid" Type="String" />
                <asp:Parameter Name="bookname" Type="String" />
                <asp:Parameter Name="writer" Type="String" />
                <asp:Parameter Name="unitprice" Type="Decimal" />
                <asp:Parameter Name="bookimage" Type="String" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="introduction" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="bookname" Type="String" />
                <asp:Parameter Name="writer" Type="String" />
                <asp:Parameter Name="unitprice" Type="Decimal" />
                <asp:Parameter Name="bookimage" Type="String" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="introduction" Type="String" />
                <asp:Parameter Name="original_bookid" Type="String" />
                <asp:Parameter Name="original_bookname" Type="String" />
                <asp:Parameter Name="original_writer" Type="String" />
                <asp:Parameter Name="original_unitprice" Type="Decimal" />
                <asp:Parameter Name="original_bookimage" Type="String" />
                <asp:Parameter Name="original_category" Type="String" />
                <asp:Parameter Name="original_introduction" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
        <div style="border: medium solid #666666; float:left; margin-top: 20px; margin-right: 10px; margin-left: 10px; text-align: center; vertical-align: middle; font-family: 微软雅黑; font-size: medium;" id="admingvw" runat="server">
        <asp:Button ID="edituser" runat="server" Text="信息修改" Height="30px" Width="80px" OnClick="edituser_Click" />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="username" DataSourceID="SqlDataSource3" EnableModelValidation="True" Width="800px" Height="500px" OnSelectedIndexChanging="selectchanging2">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="username" HeaderText="用户名" ReadOnly="True" SortExpression="username" />
                <asp:BoundField DataField="truename" HeaderText="真实姓名" SortExpression="truename" />
                <asp:BoundField DataField="birthdate" HeaderText="用户生日" SortExpression="birthdate" />
                <asp:BoundField DataField="phone" HeaderText="电话号码" SortExpression="phone" />
                <asp:BoundField DataField="address" HeaderText="用户地址" SortExpression="address" />
                <asp:BoundField DataField="zip" HeaderText="邮政编码" SortExpression="zip" />
                <asp:BoundField DataField="hobby" HeaderText="用户爱好" SortExpression="hobby" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [username] = @original_username AND (([psword] = @original_psword) OR ([psword] IS NULL AND @original_psword IS NULL)) AND (([truename] = @original_truename) OR ([truename] IS NULL AND @original_truename IS NULL)) AND (([birthdate] = @original_birthdate) OR ([birthdate] IS NULL AND @original_birthdate IS NULL)) AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([zip] = @original_zip) OR ([zip] IS NULL AND @original_zip IS NULL)) AND (([hobby] = @original_hobby) OR ([hobby] IS NULL AND @original_hobby IS NULL)) AND (([manager] = @original_manager) OR ([manager] IS NULL AND @original_manager IS NULL))" InsertCommand="INSERT INTO [Users] ([username], [psword], [truename], [birthdate], [phone], [address], [zip], [hobby], [manager]) VALUES (@username, @psword, @truename, @birthdate, @phone, @address, @zip, @hobby, @manager)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Users] WHERE ([username] = @username)" UpdateCommand="UPDATE [Users] SET [psword] = @psword, [truename] = @truename, [birthdate] = @birthdate, [phone] = @phone, [address] = @address, [zip] = @zip, [hobby] = @hobby, [manager] = @manager WHERE [username] = @original_username AND (([psword] = @original_psword) OR ([psword] IS NULL AND @original_psword IS NULL)) AND (([truename] = @original_truename) OR ([truename] IS NULL AND @original_truename IS NULL)) AND (([birthdate] = @original_birthdate) OR ([birthdate] IS NULL AND @original_birthdate IS NULL)) AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([zip] = @original_zip) OR ([zip] IS NULL AND @original_zip IS NULL)) AND (([hobby] = @original_hobby) OR ([hobby] IS NULL AND @original_hobby IS NULL)) AND (([manager] = @original_manager) OR ([manager] IS NULL AND @original_manager IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_username" Type="String" />
                <asp:Parameter Name="original_psword" Type="String" />
                <asp:Parameter Name="original_truename" Type="String" />
                <asp:Parameter Name="original_birthdate" DbType="Date" />
                <asp:Parameter Name="original_phone" Type="String" />
                <asp:Parameter Name="original_address" Type="String" />
                <asp:Parameter Name="original_zip" Type="String" />
                <asp:Parameter Name="original_hobby" Type="String" />
                <asp:Parameter Name="original_manager" Type="Boolean" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="psword" Type="String" />
                <asp:Parameter Name="truename" Type="String" />
                <asp:Parameter Name="birthdate" DbType="Date" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="zip" Type="String" />
                <asp:Parameter Name="hobby" Type="String" />
                <asp:Parameter Name="manager" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="admin" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="psword" Type="String" />
                <asp:Parameter Name="truename" Type="String" />
                <asp:Parameter Name="birthdate" DbType="Date" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="zip" Type="String" />
                <asp:Parameter Name="hobby" Type="String" />
                <asp:Parameter Name="manager" Type="Boolean" />
                <asp:Parameter Name="original_username" Type="String" />
                <asp:Parameter Name="original_psword" Type="String" />
                <asp:Parameter Name="original_truename" Type="String" />
                <asp:Parameter DbType="Date" Name="original_birthdate" />
                <asp:Parameter Name="original_phone" Type="String" />
                <asp:Parameter Name="original_address" Type="String" />
                <asp:Parameter Name="original_zip" Type="String" />
                <asp:Parameter Name="original_hobby" Type="String" />
                <asp:Parameter Name="original_manager" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
       <div style="float:right; margin-top: 20px; margin-right:10px; margin-left: 10px;" id="admintxt" runat="server">
           <table style="border: medium solid #808080; font-family: 微软雅黑; font-size: medium; text-align: left; vertical-align: middle">
               <tr>
                   <td colspan="2" style="font-size: larger; font-weight: bold; text-align: center">管理员信息</td>
               </tr>
                <tr >
                    <td style="width:70px"><asp:Label ID="lable_user" runat="server" Text="用户名 " Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
                    <td><asp:TextBox ID="text_user" runat="server" Width="145px"></asp:TextBox>
                    </td>
                </tr>
                <tr >
                    <td><asp:Label ID="lable_passwd1" runat="server" Text="密码  " Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
                    <td><asp:TextBox ID="text_passwd1" runat="server" TextMode="Password" Width="145px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lable_passwd2" runat="server" Text="确认密码" Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
                    <td><asp:TextBox ID="text_passwd2" runat="server" TextMode="Password" Width="145px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="label_truename" runat="server" Text="真实姓名" Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
                    <td><asp:TextBox ID="text_truename" runat="server" Width="145px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lable_birth" runat="server" Text="生日  " Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
                    <td><asp:TextBox ID="text_birth" runat="server" Width="145px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td ><asp:Label ID="lable_phone" runat="server" Text="  电话  " Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
                    <td ><asp:TextBox ID="text_phone" runat="server" Width="145px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lable_address" runat="server" Text="地址  " Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
                    <td><asp:TextBox ID="text_address" runat="server" Width="145px"></asp:TextBox>
                    </td>
                </tr>
                <tr >
                    <td><asp:Label ID="label_zip" runat="server" Text="邮编" Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
                    <td><asp:TextBox ID="text_zip" runat="server" Width="145px"></asp:TextBox></td>
                </tr>
                <tr >
                    <td><asp:Label ID="lable_hobby" runat="server" Text="爱好  " Font-Names="微软雅黑"  Font-Size="Medium"></asp:Label></td>
                    <td><asp:TextBox ID="text_hobby" runat="server" Width="145px"></asp:TextBox>
                    </td>
                </tr>
                <tr >
                    <td colspan="2" style="text-align:center" >
                        <asp:Button ID="Button3" runat="server" Text="确认" OnClick="Button3_Click" />
                        </td>
                </tr>
           </table>
        </div>
        <div style="border: medium solid #666666; float:left; margin-top: 20px; margin-right: 10px; margin-left: 10px; text-align: center; vertical-align: middle; font-family: 微软雅黑; font-size: medium;" id="user" runat="server">
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="username" DataSourceID="SqlDataSource4" EnableModelValidation="True" Width="800px" Height="500px" OnSelectedIndexChanging="selectchanging2" AllowSorting="True" OnSorting="usersort">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="用户姓名" ReadOnly="True" SortExpression="username" />
                <asp:BoundField DataField="truename" HeaderText="真实姓名" SortExpression="truename" />
                <asp:BoundField DataField="birthdate" HeaderText="用户生日" SortExpression="birthdate" />
                <asp:BoundField DataField="phone" HeaderText="用户电话" SortExpression="phone" />
                <asp:BoundField DataField="address" HeaderText="用户地址" SortExpression="address" />
                <asp:BoundField DataField="zip" HeaderText="邮政编码" SortExpression="zip" />
                <asp:BoundField DataField="hobby" HeaderText="爱好" SortExpression="hobby" />
                <asp:CheckBoxField DataField="manager" HeaderText="是否管理员" SortExpression="manager" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Users]">
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
