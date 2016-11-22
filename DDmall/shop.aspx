<%@ Page Title="我的购物车" Language="C#" MasterPageFile="~/title.master" AutoEventWireup="true" CodeFile="shop.aspx.cs" Inherits="shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div  id="bookshop" runat="server" style ="float:left;margin-top:50px;margin-left:100px; text-align: left; vertical-align: middle;">
        <asp:Button ID="Button1" runat="server" Text="提交订单" Width="100px" Height="30px" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="删除书籍" Width="100px" Height="30px" OnClick="Button2_Click" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Sqlformview1" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanging="selectchanging" DataKeyNames="bookid" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:HyperLinkField DataNavigateUrlFields="bookid" DataNavigateUrlFormatString="items.aspx?no={0}" DataTextField="bookname"  DataTextFormatString="&#183;{0}" HeaderText="书籍名称" />
            <asp:BoundField DataField="shopdate" HeaderText="日期" SortExpression="shopdate" />
            <asp:BoundField DataField="amount" HeaderText="数量" SortExpression="amount" />
            <asp:BoundField DataField="unitprice" HeaderText="数量" SortExpression="unitprice" />
            <asp:BoundField DataField="sum" HeaderText="总价" SortExpression="sum" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
    <asp:SqlDataSource ID="Sqlformview1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [a].[bookid],[bookname],[shopdate],[amount] ,[unitprice],CAST([amount]*[unitprice] AS DECIMAL(6,2)) AS SUM FROM [shops] AS [a] JOIN [Books] AS [b] ON [a].[bookid]=[b].[bookid] WHERE ([username]=@username)
">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="用户名" />
        </SelectParameters>
    </asp:SqlDataSource>
        </div>
    <div id="mydiv" runat="server" style=" float:right;margin-right:400px; margin-top: 100px; ">
            <table style =" float:right; height:200px; width:300px;border: medium double #18E492;font-family: 微软雅黑; font-size: medium; ">
                <tr style="height:50px; font-family: 微软雅黑; font-size: larger; font-weight: bold; text-align: center; background-color: #99FF99;">
                    <td colspan="2" class="auto-style1">订购信息</td>
                </tr>
                <tr style="height:40px;">
                    <td style="border: thin dashed #18E492; text-align: center" >书籍名称：</td>
                    <td style="border: thin dashed #18E492; text-align: left">
                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr style="height:40px;">
                    <td style="border: thin dashed #18E492; text-align: center">单价：</td>
                    <td style="border: thin dashed #18E492; text-align: left">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr style="height:40px;">
                    <td style="border: thin dashed #18E492; text-align: center">数量：</td>
                    <td style="border: thin dashed #18E492; text-align: left">
                        <asp:TextBox ID="TextBox1" runat="server" Width="50px"></asp:TextBox>本
                    </td>
                </tr>
                <tr style="height:50px;">
                    <td colspan="2" style="border: thin dashed #18E492; text-align: center" >
                        <asp:ImageButton ID="submit" runat="server" Text="Button" onclick="submit_Click" ImageUrl="~/image/submitbutton.jpg" />
                        
                    </td>
                </tr>
            </table>
       </div>
</asp:Content>

