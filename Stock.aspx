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
    <asp:Label ID="Label2" runat="server" Text="Grower Name:" Visible="False"></asp:Label><asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="GrowerName" DataValueField="GrowerID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Visible="False">
    <asp:ListItem Selected="True">Select</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT [GrowerID], [GrowerName] FROM [tblGrower]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="30" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" HorizontalAlign="Center" OnPageIndexChanged="GridView1_PageIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging" Width="700px" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns> 
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
               <%-- <asp:Label ID="Label1" runat="server" Text="Label" BackColor="Red"></asp:Label>--%>
            </ItemTemplate>

            <HeaderStyle BorderStyle="Solid" BorderWidth="1px" />
            <ItemStyle BorderStyle="Solid" BorderWidth="1px" />

        </asp:TemplateField>           

        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle ForeColor="DarkSlateBlue" HorizontalAlign="Center" BackColor="PaleGoldenrod" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
     <asp:GridView ID="GridView2" runat="server" AllowPaging="True" PageSize="30" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Visible="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" HorizontalAlign="Center" Width="700px" ForeColor="Black" GridLines="None" OnRowDataBound="GridView2_RowDataBound">
         <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns> 
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
               <%-- <asp:Label ID="Label1" runat="server" Text="Label" BackColor="Red"></asp:Label>--%>
            </ItemTemplate>

            <ControlStyle BorderStyle="Solid" BorderWidth="1px" />
            <HeaderStyle BorderStyle="Solid" BorderWidth="1px" />
            <ItemStyle BorderStyle="Solid" BorderWidth="1px" />

        </asp:TemplateField>
            

        </Columns>
         <FooterStyle BackColor="Tan" />
         <HeaderStyle BackColor="Tan" Font-Bold="True" />
         <PagerStyle ForeColor="DarkSlateBlue" HorizontalAlign="Center" BackColor="PaleGoldenrod" />
         <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
         <SortedAscendingCellStyle BackColor="#FAFAE7" />
         <SortedAscendingHeaderStyle BackColor="#DAC09E" />
         <SortedDescendingCellStyle BackColor="#E1DB9C" />
         <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
</asp:Content>
