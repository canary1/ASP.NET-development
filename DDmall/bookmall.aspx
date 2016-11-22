<%@ Page Title="叮当商城" Language="C#" MasterPageFile="~/title.master" AutoEventWireup="true" CodeFile="bookmall.aspx.cs" Inherits="bookmall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" CellPadding="0" Height="200px"
        DataKeyField="bookid" DataSourceID="SqlDataSource1"  Font-Names="微软雅黑"  RepeatColumns="3" RepeatDirection="Horizontal">
        <ItemTemplate>
            <table style="margin:30px">
                <tr>
                    <td rowspan="3" style="width:50px;height:80px">
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl='<%# Eval("bookimage", "~/image/{0}") %>' NavigateUrl='<%# Eval("bookid", "items.aspx?no={0}") %>' Text='<%# Eval("bookimage") %>'></asp:HyperLink>
                    </td>
                    <td style="width:200px"><h4>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("bookid", "items.aspx?no={0}") %>' Text='<%# Eval("bookname") %>' Font-Names="微软雅黑" ForeColor="#333333"></asp:HyperLink>
                </tr>
                <tr>
                     <td><asp:Label ID="writerLabel" runat="server" Text='<%# Eval("writer") %>' />
                         
                     </td>
                </tr>
                <tr>
                     <td> 单价：￥<asp:Label ID="unitpriceLabel" runat="server" Text='<%# Eval("unitprice") %>' />元</td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Books]"></asp:SqlDataSource>
</asp:Content>

