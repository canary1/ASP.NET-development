<%@ Page Title="叮当书城" Language="C#" MasterPageFile="~/title.master" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding: 10px; border: medium solid #333333; width:900px; margin-top: 0px;  margin-left: 225px;">
    <div style="padding: 0px 5px 5px 5px; border: thin solid #C0C0C0; margin: 50px 20px 10px 10px;  float:left">
        <asp:menu id="Menu1" runat="server" backcolor="#00FF99" width="150px" height="250px"
            dynamichorizontaloffset="10" font-names="方正姚体" font-size="Large"
            forecolor="White" staticsubmenuindent="5px">
        <StaticMenuStyle BackColor="#00FF99" />
        <StaticSelectedStyle ForeColor="Red" />
        <StaticMenuItemStyle HorizontalPadding="15px" VerticalPadding="10px" />
        <DynamicHoverStyle BorderColor="White" Font-Underline="True" />
        <DynamicMenuStyle BackColor="#99FFCC" />
        <DynamicSelectedStyle ForeColor="#FF3300" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="5px" />
        <StaticHoverStyle BackColor="#99FFCC" BorderColor="White" 
            Font-Underline="True" />
        <Items>
            <asp:MenuItem Text="小说" Value="小说" NavigateUrl="~/bookmall.aspx">
                <asp:MenuItem Text="平凡的世界" Value="平凡的世界"></asp:MenuItem>
                <asp:MenuItem Text="盗墓笔记" Value="盗墓笔记"></asp:MenuItem>
                <asp:MenuItem Text="狼图腾" Value="狼图腾"></asp:MenuItem>
                <asp:MenuItem Text="我这辈子有你" Value="我这辈子有你"></asp:MenuItem>
                <asp:MenuItem Text="边城" Value="边城"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="教育类" Value="教育类" NavigateUrl="~/bookmall.aspx">
                <asp:MenuItem Text="经济学原理" Value="经济学原理"></asp:MenuItem>
                <asp:MenuItem Text="JAVA编程思想" Value="JAVA编程思想"></asp:MenuItem>
                <asp:MenuItem Text="管理学" Value="管理学"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="童书类" Value="童书类" NavigateUrl="~/bookmall.aspx">
                <asp:MenuItem Text="笑猫日记" Value="笑猫日记"></asp:MenuItem>
                <asp:MenuItem Text="字的童话" Value="字的童话"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="生活类" Value="生活类" NavigateUrl="~/bookmall.aspx">
                <asp:MenuItem Text="跟巴黎名媛学到的事" Value="跟巴黎名媛学到的事"></asp:MenuItem>
                <asp:MenuItem Text="塔莎的世界" Value="塔莎的世界"></asp:MenuItem>
                <asp:MenuItem Text="塔莎的公园" Value="塔莎的公园"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="教辅类" Value="教辅类" NavigateUrl="~/bookmall.aspx">
                <asp:MenuItem Text="城南旧事" Value="城南旧事"></asp:MenuItem>
                <asp:MenuItem Text="小学生优秀作文辅导大全" Value="小学生优秀作文辅导大全"></asp:MenuItem>
                <asp:MenuItem Text="稻草人" Value="稻草人"></asp:MenuItem>
                <asp:MenuItem Text="繁星春水" Value="繁星春水"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="科技类" Value="科技类" NavigateUrl="~/bookmall.aspx">
                <asp:MenuItem Text="时间简史" Value="时间简史"></asp:MenuItem>
                <asp:MenuItem Text="星级穿越" Value="星级穿越"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="其它类" Value="其它类" NavigateUrl="~/bookmall.aspx">
                <asp:MenuItem Text="你要好好爱自己" Value="你要好好爱自己"></asp:MenuItem>
                <asp:MenuItem Text="从你的全世界路过" Value="从你的全世界路过"></asp:MenuItem>
            </asp:MenuItem>
        </Items>
    </asp:menu>   
   
</div>
    <div style="padding: 5px; border: thin solid #C0C0C0; width:400px; float:left; margin-top:50px">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
             <ContentTemplate>
                 <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                 </asp:Timer>
                 <asp:Image ID="Image1" runat="server" ImageUrl="image/1.jpg" BorderColor="#666666" BorderStyle="Inset" BorderWidth="1px" />
             </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div style="padding: 5px; border: thin solid #C0C0C0; float:right; margin-right:50px; margin-top:50px; ">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True" DataKeyNames="bookid" CellPadding="4" BorderColor="#00FF99" BorderStyle="Solid" BorderWidth="5px" Font-Names="微软雅黑" Font-Size="Medium" ForeColor="#333333" Height="300px" HorizontalAlign="Left" Width="200px">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="bookid" DataNavigateUrlFormatString="items.aspx?no={0}" DataTextField="bookname" DataTextFormatString="&#183;{0}" HeaderText="销量排行榜" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 5 [a].[bookid], [bookname] FROM [Orders] AS [a] JOIN [Books] AS [b] ON [a].[bookid]=[b].[bookid] ORDER BY [quantity] DESC
"></asp:SqlDataSource>
    </div>
        <div style="border: thin solid #C0C0C0; font-family: 微软雅黑; font-size: medium; text-align: center; vertical-align: middle;float:left;width:880px">
            <a href="http://www.baidu.com" style="font-family: 微软雅黑; font-size: medium; color: #333333">百度一下</a>
            <asp:label runat="server" text="｜" ></asp:label>
            <a href="http://www.hao123.com" style="font-family: 微软雅黑; font-size: medium; color: #333333">网址大全</a>
            <asp:label runat="server" text="｜"></asp:label>
            <a href="http://www.hao123.com/mail" style="font-family: 微软雅黑; font-size: medium; color: #333333">邮箱登陆</a>
            <asp:label runat="server" text="｜"></asp:label>
            <a href="main.aspx" style="font-family: 微软雅黑; font-size: medium; color: #333333">叮当书城</a>
            <br />
            <asp:label runat="server" text="@版权所有，盗版必究  联系方式：15715739019" ForeColor="#333333" Height="30px" Font-Size="Smaller"></asp:label>
        </div>
        
    </div>
</asp:Content>

