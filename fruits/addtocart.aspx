<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addtocart.aspx.cs" Inherits="fruits.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
            font-size: large;
            background-color: #CCFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/fruitproduct.aspx">Continue Shooping</asp:HyperLink>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/fruitproduct.aspx">Add to Cart?</asp:HyperLink>
    <br />
    <br />
   <%--   <p>your cart is empty</p>--%>

    <br />
    <br />
    <br />
    <br />

    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Height="278px" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True" Width="890px">
        <Columns>
            <asp:BoundField DataField="sno" HeaderText="S.No" />
            <asp:BoundField DataField="productid" HeaderText="Product id" />
            <asp:ImageField DataImageUrlField="productimage" HeaderText="Product Image" ControlStyle-Height="200px" ControlStyle-Width="200px">
            </asp:ImageField>
            <asp:BoundField DataField="productname" HeaderText="Product name" />
            <asp:BoundField DataField="description" HeaderText="Description" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="totalprice" HeaderText="Total Price" />
            <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" Height="40px" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    
    <br />
    <strong>
    <asp:Button ID="Button1" runat="server" CssClass="auto-style1" Height="46px" OnClick="Button1_Click" Text="Buy" Width="141px" />
    </strong>



  
</asp:Content>
