<%@ Page Title="书籍详细信息" Language="C#" MasterPageFile="~/title.master" AutoEventWireup="true" CodeFile="items.aspx.cs" Inherits="items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" width:300px; float:left">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="bookid" DataSourceID="Sqlformview" EnableModelValidation="True">
            <ItemTemplate>
                <table style="border: thick solid #18E492; font-family: 微软雅黑; font-size: medium; text-align: left; word-spacing: 10em; padding: 10px; position: absolute; height: 300px; top: 100px; left: 150px; width:400px;" cellpadding="5">
                    <tr>
                         <td rowspan="6" style="width:100px; height:300px; margin-right:20px;padding-right:20px">
                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl='<%# Eval("bookimage", "~/image/{0}") %>' Text='<%# Eval("bookimage") %>'></asp:HyperLink>
                        </td>
                        <td style="height:50px"></td>
                    </tr>
                    <tr>
                       
                        <td><asp:Label ID="booknameLabel" runat="server" Text='<%# Bind("bookname") %>' /></td>
                    </tr>
                    <tr>
                        <td style="width:150px">作者：<asp:Label ID="writerLabel" runat="server" Text='<%# Bind("writer") %>' /></td>
                    </tr>
                    <tr>
                        <td> 单价：￥<asp:Label ID="unitpriceLabel" runat="server" Text='<%# Eval("unitprice") %>' />元</td>
                    </tr>
                    <tr>
                        <td>所属类别:<asp:Label ID="categoryLabel" runat="server" Text='<%# Bind("category") %>' /></td>
                    </tr>
                    <tr>
                        <td>书籍简介:<asp:Label ID="introductionLabel" runat="server" Text='<%# Bind("introduction") %>' /></td>
                    </tr>
                    <tr>
                        <td style="height: 50px" align="right">
                            <asp:ImageButton ID="btnshop" runat="server" ImageUrl="~/image/addshopbutton.jpg" onclick="btnshop_Click" />
                            
                        </td>
                        <td><asp:ImageButton ID="btnmenu" runat="server" ImageUrl="~/image/orderbutton.jpg" OnClick="btnmenu_Click" /></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="Sqlformview" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Books] WHERE ([bookid] = @bookid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="bookid" QueryStringField="no" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
       </div> 
    <div id="mydiv" runat="server" style=" float:right;margin-right:400px; margin-top: 100px;">
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
                <tr>
                    <td colspan="2" style="border: thin dashed #18E492; text-align: center" class="auto-style1" >
                        <asp:ImageButton ID="submit" runat="server" Text="Button" onclick="submit_Click" ImageUrl="~/image/submitbutton.jpg" />
                        
                    </td>
                </tr>
            </table>
       </div>
</asp:Content>



