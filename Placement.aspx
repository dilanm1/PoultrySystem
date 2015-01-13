<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Placement.aspx.cs" Inherits="PoultrySystem.Placement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
      
        /*/*.auto-style1 {*/
          
      
      
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/sunny/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            var icons = {
                header: "ui-icon-circle-arrow-e",
                activeHeader: "ui-icon-circle-arrow-s"
            };
            $("#accordion").accordion({
                icons: icons
            });
            $("#toggle").button().click(function () {
                if ($("#accordion").accordion("option", "icons")) {
                    $("#accordion").accordion("option", "icons", null);
                } else {
                    $("#accordion").accordion("option", "icons", icons);
                }
            });
        });
    </script>
   
   <ul id="accordion" style="width: 1200px">
              <li>
                   <div>
                      Adams</div>
                  <ul><li>
                      <asp:GridView ID="ConsumptionGrid" runat="server" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="SqlDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnRowDataBound="ConsumptionGrid_RowDataBound" OnSelectedIndexChanged="ConsumptionGrid_SelectedIndexChanged"
                          >
                          <AlternatingRowStyle BackColor="PaleGoldenrod" />
                          <Columns>
                              <asp:BoundField DataField="HouseNumber" HeaderText="House Number" SortExpression="HouseNumber" >
                              <HeaderStyle Width="200px" HorizontalAlign="Center" />
                              <ItemStyle Width="200px" HorizontalAlign="Center" />
                              </asp:BoundField>
                              <asp:BoundField DataField="HouseSize" HeaderText="Size" SortExpression="HouseSize" >
                              <HeaderStyle Width="150px" HorizontalAlign="Center" />
                              <ItemStyle Width="150px" HorizontalAlign="Left" />
                              </asp:BoundField>
                              <asp:BoundField DataField="StockLevel" HeaderText="Stock Level" SortExpression="StockLevel" >
                              <HeaderStyle Width="200px" />
                              <ItemStyle Width="200px" />
                              </asp:BoundField>
                              <asp:TemplateField HeaderText="Status">
                                  <ItemTemplate>
                                      <asp:Label ID="Label1" runat="server"></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle HorizontalAlign="Center" />
                                  <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="100px" BorderStyle="Solid" BorderWidth="1px" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Placement">
                                  <ItemTemplate>
                                      <asp:TextBox ID="TextBox2" runat="server" TextMode="Number" Width="150px"></asp:TextBox>
                                  </ItemTemplate>
                                  <HeaderStyle HorizontalAlign="Right" Width="200px" />
                                  <ItemStyle HorizontalAlign="Right" Width="200px" />
                              </asp:TemplateField>
                              <asp:ButtonField ButtonType="Button" CommandName="Update" Text="Place" />
                          </Columns>
                          <EmptyDataTemplate>
                              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                          </EmptyDataTemplate>
                          <FooterStyle BackColor="Tan" />
                          <HeaderStyle BackColor="Tan" Font-Bold="True" />
                          <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                          <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                          <SortedAscendingCellStyle BackColor="#FAFAE7" />
                          <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                          <SortedDescendingCellStyle BackColor="#E1DB9C" />
                          <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT tblGrower.GrowerName, tblHouse.HouseNumber, tblHouse.HouseSize, tblHouse.StockLevel FROM tblGrower INNER JOIN tblHouse ON tblGrower.GrowerID = tblHouse.GrowerID WHERE (tblGrower.GrowerID = 7)"></asp:SqlDataSource>
                      </li>
                  </ul>
              </li>
              <li>
                  <div>
                      Capper</div>
                  <ul><li>
                      <asp:GridView ID="ConsumerGrid" runat="server" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="SqlDataSource2" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                         >
                          <AlternatingRowStyle BackColor="PaleGoldenrod" />
                          <Columns>
                              <asp:BoundField DataField="HouseNumber" HeaderText="House Number" SortExpression="HouseNumber" >
                              <ItemStyle Width="200px" />
                              </asp:BoundField>
                              <asp:BoundField DataField="HouseSize" HeaderText="House Size" SortExpression="HouseSize" >
                              <ItemStyle Width="300px" />
                              </asp:BoundField>
                              <asp:BoundField DataField="StockLevel" HeaderText="Stock Level" SortExpression="StockLevel" >
                              <ItemStyle Width="300px" />
                              </asp:BoundField>
                          </Columns>
                          <FooterStyle BackColor="Tan" />
                          <HeaderStyle BackColor="Tan" Font-Bold="True" />
                          <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                          <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                          <SortedAscendingCellStyle BackColor="#FAFAE7" />
                          <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                          <SortedDescendingCellStyle BackColor="#E1DB9C" />
                          <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT tblGrower.GrowerName, tblHouse.HouseNumber, tblHouse.HouseSize, tblHouse.StockLevel FROM tblGrower INNER JOIN tblHouse ON tblGrower.GrowerID = tblHouse.GrowerID WHERE (tblGrower.GrowerID = 11)"></asp:SqlDataSource>
                      </li>
                  </ul>
              </li>
                <li>
                   <div>
                      Evans</div>        
                       <ul><li>
                      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="SqlDataSource1"
                          >
                          <Columns>
                              <asp:BoundField DataField="HouseNumber" HeaderText="HouseNumber" SortExpression="HouseNumber" />
                              <asp:BoundField DataField="HouseSize" HeaderText="HouseSize" SortExpression="HouseSize" />
                              <asp:BoundField DataField="StockLevel" HeaderText="StockLevel" SortExpression="StockLevel" />
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT tblGrower.GrowerName, tblHouse.HouseNumber, tblHouse.HouseSize, tblHouse.StockLevel FROM tblGrower INNER JOIN tblHouse ON tblGrower.GrowerID = tblHouse.GrowerID WHERE (tblGrower.GrowerID = 3)"></asp:SqlDataSource>
                      </li>
                  </ul>
              </li>
                <li>
                   <div>
                      Gwynne</div>
                  <ul><li>
                      <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="SqlDataSource1"
                          >
                          <Columns>
                              <asp:BoundField DataField="HouseNumber" HeaderText="HouseNumber" SortExpression="HouseNumber" />
                              <asp:BoundField DataField="HouseSize" HeaderText="HouseSize" SortExpression="HouseSize" />
                              <asp:BoundField DataField="StockLevel" HeaderText="StockLevel" SortExpression="StockLevel" />
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT tblGrower.GrowerName, tblHouse.HouseNumber, tblHouse.HouseSize, tblHouse.StockLevel FROM tblGrower INNER JOIN tblHouse ON tblGrower.GrowerID = tblHouse.GrowerID WHERE (tblGrower.GrowerID = 14)"></asp:SqlDataSource>
                      </li>
                  </ul>
              </li>
                <li>
                   <div>
                      Heath</div>
                  <ul><li>
                      <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="SqlDataSource1"
                          >
                          <Columns>
                              <asp:BoundField DataField="HouseNumber" HeaderText="HouseNumber" SortExpression="HouseNumber" />
                              <asp:BoundField DataField="HouseSize" HeaderText="HouseSize" SortExpression="HouseSize" />
                              <asp:BoundField DataField="StockLevel" HeaderText="StockLevel" SortExpression="StockLevel" />
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT tblGrower.GrowerName, tblHouse.HouseNumber, tblHouse.HouseSize, tblHouse.StockLevel FROM tblGrower INNER JOIN tblHouse ON tblGrower.GrowerID = tblHouse.GrowerID WHERE (tblGrower.GrowerID = 8)"></asp:SqlDataSource>
                      </li>
                  </ul>
              </li>
                <li>
                   <div>
                      Hillditch
                   </div>
                  <ul><li>
                      <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="SqlDataSource1"
                          >
                          <Columns>
                              <asp:BoundField DataField="HouseNumber" HeaderText="HouseNumber" SortExpression="HouseNumber" />
                              <asp:BoundField DataField="HouseSize" HeaderText="HouseSize" SortExpression="HouseSize" />
                              <asp:BoundField DataField="StockLevel" HeaderText="StockLevel" SortExpression="StockLevel" />
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT tblGrower.GrowerName, tblHouse.HouseNumber, tblHouse.HouseSize, tblHouse.StockLevel FROM tblGrower INNER JOIN tblHouse ON tblGrower.GrowerID = tblHouse.GrowerID WHERE (tblGrower.GrowerID = 13)"></asp:SqlDataSource>
                      </li>
                  </ul>
              </li>
                <li>
                   <div>
                      Home</div>
                  <ul><li>
                      <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="SqlDataSource1"
                          >
                          <Columns>
                              <asp:BoundField DataField="HouseNumber" HeaderText="HouseNumber" SortExpression="HouseNumber" />
                              <asp:BoundField DataField="HouseSize" HeaderText="HouseSize" SortExpression="HouseSize" />
                              <asp:BoundField DataField="StockLevel" HeaderText="StockLevel" SortExpression="StockLevel" />
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT tblGrower.GrowerName, tblHouse.HouseNumber, tblHouse.HouseSize, tblHouse.StockLevel FROM tblGrower INNER JOIN tblHouse ON tblGrower.GrowerID = tblHouse.GrowerID WHERE (tblGrower.GrowerID = 15)"></asp:SqlDataSource>
                      </li>
                  </ul>
              </li>
                <li>
                   <div>
                      Jones</div>
                  <ul><li>
                      <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="SqlDataSource1"
                          >
                          <Columns>
                              <asp:BoundField DataField="HouseNumber" HeaderText="HouseNumber" SortExpression="HouseNumber" />
                              <asp:BoundField DataField="HouseSize" HeaderText="HouseSize" SortExpression="HouseSize" />
                              <asp:BoundField DataField="StockLevel" HeaderText="StockLevel" SortExpression="StockLevel" />
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT tblGrower.GrowerName, tblHouse.HouseNumber, tblHouse.HouseSize, tblHouse.StockLevel FROM tblGrower INNER JOIN tblHouse ON tblGrower.GrowerID = tblHouse.GrowerID WHERE (tblGrower.GrowerID = 6)"></asp:SqlDataSource>
                      </li>
                  </ul>
              </li>
          </ul>
  
  
    <%--    <asp:ListView ID="ListView1" runat="server"  ShowHeader="False" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC; width:10px;">
                    <asp:Label ID="_____Label" runat="server" Text='<%# Eval("[-----]") %>' Width="10px" Font-Size="10px" />
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">-----:
                    <asp:TextBox ID="_____TextBox" runat="server" Text='<%# Bind("[-----]") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">-----:
                    <asp:TextBox ID="_____TextBox" runat="server" Text='<%# Bind("[-----]") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000; width:10px;">
                    <asp:Label ID="_____Label" runat="server"  Text='<%# Eval("[-----]") %>' Width="10px" Font-Size="10px" />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </table>
                <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">-----:
                    <asp:Label ID="_____Label" runat="server" Text='<%# Eval("[-----]") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT StockLevel/1000 AS [-----] FROM tblHouse"></asp:SqlDataSource>--%>

</asp:Panel>
       <div>
	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="true"
	onrowdatabound="GridView1_RowDataBound"  onrowcreated="GridView1_RowCreated">
		<Columns>
		  <asp:BoundField DataField="Date" HeaderText="Date" />
		  <asp:BoundField DataField="GrowerName" HeaderText="Grower" />
		  <asp:BoundField DataField="HouseNumber" HeaderText="House" />
         
		  <asp:TemplateField HeaderText="Quantity" ItemStyle-HorizontalAlign="Right">
			 <ItemTemplate>
				<asp:Label ID="lblqty" runat="server" Text='<%# Eval("Amount") %>' />
			 </ItemTemplate>
			 <FooterTemplate>
				<div style="text-align: right;">
				<asp:Label ID="lblTotalqty" runat="server"  Font-Bold=true  />
				</div>
			 </FooterTemplate>
		  </asp:TemplateField>
		</Columns>
	</asp:GridView>
	</div>
</asp:Content>
