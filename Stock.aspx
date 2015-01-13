<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="PoultrySystem.Stock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Stock Information</h1>
    <asp:Button ID="Button1" runat="server" Text="View All" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text=" Individual " />
    <br />
    Grower Name:<asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="GrowerName" DataValueField="GrowerID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Visible="False">
        <asp:ListItem Selected="True">Select</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT [GrowerID], [GrowerName] FROM [tblGrower]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" BorderStyle="Solid" AllowPaging="True" PageSize="30" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="#CCFF99" />
        <Columns> 
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text="Label" BackColor="Red"></asp:Label>
            </ItemTemplate>

        </asp:TemplateField>           

        </Columns>
    </asp:GridView>
     <asp:GridView ID="GridView2" runat="server" BorderStyle="Solid" AllowPaging="True" PageSize="30" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Visible="False">
        <AlternatingRowStyle BackColor="#CCFF99" />
        <Columns> 
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text="Label" BackColor="Red"></asp:Label>
            </ItemTemplate>

        </asp:TemplateField>
            

        </Columns>
    </asp:GridView>
</asp:Content>
