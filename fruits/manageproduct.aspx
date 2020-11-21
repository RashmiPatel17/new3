<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="manageproduct.aspx.cs" Inherits="fruits.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">
        <td>

      
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="productid" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="productid" HeaderText="productid" InsertVisible="False" ReadOnly="True" SortExpression="productid" />
        <asp:BoundField DataField="productname" HeaderText="productname" SortExpression="productname" />
        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
        <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
      <%--  <asp:BoundField DataField="available" HeaderText="available" SortExpression="available" />
        <asp:BoundField DataField="soldout" HeaderText="soldout" SortExpression="soldout" />
      --%> <%-- <asp:ImageField DataImageUrlField="productimage" HeaderImageUrl="productimage" ControlStyle-Width="200px" ControlStyle-Height="200px">
        </asp:ImageField>--%>

    </Columns>
    <FooterStyle BackColor="White" ForeColor="#000066" />
    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
    <RowStyle ForeColor="#000066" />
    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#007DBB" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#00547E" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:rashmi %>" DeleteCommand="DELETE FROM [fruitaddproduct] WHERE [productid] = @original_productid AND [productname] = @original_productname AND [price] = @original_price AND [description] = @original_description AND [quantity] = @original_quantity " InsertCommand="INSERT INTO [fruitaddproduct] ([productname],[price], [description], [quantity]) VALUES (@productname, @price, @description, @quantity)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [fruitaddproduct]" UpdateCommand="UPDATE [fruitaddproduct] SET [productname] = @productname, [price] = @price, [description] = @description, [quantity] = @quantity WHERE [productid] = @original_productid AND [productname] = @original_productname AND [price] = @original_price AND [description] = @original_description AND [quantity] = @original_quantity " ProviderName="<%$ ConnectionStrings:rashmi.ProviderName %>">
    <DeleteParameters>
        <asp:Parameter Name="original_productid" Type="Int32" />
        <asp:Parameter Name="original_productname" Type="String" />
       <%-- <asp:Parameter Name="original_productimage" Type="String" />--%>
        <asp:Parameter Name="original_price" Type="Int32" />
        <asp:Parameter Name="original_description" Type="String" />
        <asp:Parameter Name="original_quantity" Type="String" />
        <%--<asp:Parameter Name="original_available" Type="String" />
        <asp:Parameter Name="original_soldout" Type="String" />--%>
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="productname" Type="String" />
        <%--<asp:Parameter Name="productimage" Type="String" />
   --%>     <asp:Parameter Name="price" Type="Int32" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="quantity" Type="String" />
       <%-- <asp:Parameter Name="available" Type="String" />
        <asp:Parameter Name="soldout" Type="String" />
    --%>
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="productname" Type="String" />
       <%-- <asp:Parameter Name="productimage" Type="String" />
 --%>       <asp:Parameter Name="price" Type="Int32" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="quantity" Type="String" />
        <asp:Parameter Name="available" Type="String" />
        <asp:Parameter Name="soldout" Type="String" />
        <asp:Parameter Name="original_productid" Type="Int32" />
        <asp:Parameter Name="original_productname" Type="String" />
<%--        <asp:Parameter Name="original_productimage" Type="String" />
 --%>       <asp:Parameter Name="original_price" Type="Int32" />
        <asp:Parameter Name="original_description" Type="String" />
        <asp:Parameter Name="original_quantity" Type="String" />
        <%--<asp:Parameter Name="original_available" Type="String" />
        <asp:Parameter Name="original_soldout" Type="String" />
    --%></UpdateParameters>
</asp:SqlDataSource>
     </td>
    </table>
</asp:Content>
